//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DHBullet_ArmorPiercing extends DHAntiVehicleProjectile
    abstract;

// From ROBullet & DHBullet:
const   MinPenetrateVelocity = 163;

var     class<ROHitEffect>  ImpactEffect;
var     class<ROBulletWhiz> WhizSoundEffect;
var     class<DamageType>   MyVehicleDamage;

var     int             WhizType;
var     float           VehiclePenetrateSoundVolume;
var     float           VehicleDeflectSoundVolume;

// Tracers
var     class<Emitter>  TracerEffectClass;
var     Emitter         TracerEffect;
var     StaticMesh      DeflectedMesh;
var     float           TracerPullback;

// Modified to set tracer properties if this is a tracer bullet (from DHBullet)
simulated function PostNetBeginPlay()
{
    super.PostNetBeginPlay();

    if (bHasTracer && Level.NetMode != NM_DedicatedServer)
    {
        SetDrawType(DT_StaticMesh);
        bOrientToVelocity = true;

        if (Level.bDropDetail)
        {
            bDynamicLight = false;
        }
        else
        {
            bDynamicLight = true;
            LightType = LT_Steady;
        }

        LightBrightness = 90.0;
        LightRadius = 10.0;
        LightHue = 45;
        LightSaturation = 128;
        AmbientGlow = 254;
        LightCone = 16;

        TracerEffect = Spawn(TracerEffectClass, self,, (Location + Normal(Velocity) * TracerPullback));
    }
}

// From DHBullet, to use DHCollisionMeshActor handling that is specific to a bullet
simulated singular function Touch(Actor Other)
{
    local vector HitLocation, HitNormal;

    // Added bBlockHitPointTraces check here, so can avoid it at start of ProcessTouch(), meaning owner of col mesh gets handled properly in PT (it will have bBlockHitPointTraces=false)
    if (Other != none && (Other.bProjTarget || Other.bBlockActors) && Other.bBlockHitPointTraces)
    {
        // Collision static mesh actor handling
        if (Other.IsA('DHCollisionMeshActor'))
        {
            // If col mesh is set not to stop a bullet then we exit, doing nothing
            if (DHCollisionMeshActor(Other).bWontStopBullet)
            {
                return;
            }

            // If col mesh represents a vehicle, which would normally get a HitWall event instead of Touch, we call HitWall on the vehicle & exit
            if (Other.Owner.IsA('ROVehicle'))
            {
                // Trace the col mesh to get an accurate HitLocation, as the projectile has often travelled further by the time this event gets called
                // A false return means we successfully traced the col mesh, so we change the projectile's location (as we can't pass HitLocation to HitWall)
                if (!Other.TraceThisActor(HitLocation, HitNormal, Location, Location - 2.0 * Velocity, GetCollisionExtent()))
                {
                    SetLocation(HitLocation);
                }

                HitWall(HitNormal, Other.Owner);

                return;
            }

            // Switch hit Other to be the col mesh's owner & proceed as if we'd hit that actor
            Other = Other.Owner;
        }

        LastTouched = Other;

        if (Velocity == vect(0.0, 0.0, 0.0) || Other.IsA('Mover'))
        {
            ProcessTouch(Other, Location);
            LastTouched = none;
        }
        else
        {
            if (Other.TraceThisActor(HitLocation, HitNormal, Location, Location - 2.0 * Velocity, GetCollisionExtent()))
            {
                HitLocation = Location;
            }

            ProcessTouch(Other, HitLocation);
            LastTouched = none;

            if (Role < ROLE_Authority && Other.Role == ROLE_Authority && Pawn(Other) != none)
            {
                ClientSideTouch(Other, HitLocation);
            }
        }
    }
}

// From DHBullet
simulated function ProcessTouch(Actor Other, vector HitLocation)
{
    local DHPawn       HitPawn;
    local Actor        InstigatorPlayer, A;
    local array<Actor> SavedColMeshes;
    local vector       PawnHitLocation, TempHitLocation, HitNormal, X, Y, Z;
    local bool         bPenetratedVehicle;
    local float        BulletDistance, V;
    local array<int>   HitPoints;
    local int          i;

    if (SavedTouchActor == Other) // immediate exit to prevent recurring touches on same actor
    {
        return;
    }

    SavedTouchActor = Other;

    // Checks are normally run to make sure we haven't hit Instigator or its Base or Owner, which is mainly to stop player hitting his own bullet whip attachment
    // But the whip attachment now retains its collision if player in a vehicle is exposed, so we also need to check on a player in a VehicleWeaponPawn
    // A VehicleWeaponPawn will be the Instigator, so in that case we record InstigatorPlayer as its 'Driver' & use that in place of Instigator
    if (VehicleWeaponPawn(Instigator) != none && VehicleWeaponPawn(Instigator).Driver != none)
    {
        InstigatorPlayer = VehicleWeaponPawn(Instigator).Driver;
    }
    else
    {
        InstigatorPlayer = Instigator;
    }

    // Exit without doing anything if we hit something we don't want to count a hit on
    // Using InstigatorPlayer instead of Instigator, except for a check on "Other.Owner == Instigator", which stops a VehicleWeapon from somehow shooting itself
    // Note that bBlockHitPointTraces removed here & instead checked in Touch() event, so an actor owning a collision mesh actor gets handled properly
    if (Other == none || Other == InstigatorPlayer || Other.Base == InstigatorPlayer || Other.Owner == InstigatorPlayer || Other.Owner == Instigator
        || Other.bDeleteMe || (Other.IsA('Projectile') && !Other.bProjTarget))
    {
        return;
    }

    // Handle hit on a vehicle weapon
    if (Other.IsA('ROVehicleWeapon'))
    {
        bPenetratedVehicle = !HasDeflected() && PenetrateVehicleWeapon(ROVehicleWeapon(Other));

        PlayVehicleHitEffects(bPenetratedVehicle, HitLocation, Normal(-Velocity));

        // Exit if failed to penetrate, destroying bullet unless it's a tracer deflection
        if (!bPenetratedVehicle)
        {
            // Tracer deflects unless bullet speed is very low (approx 12 m/s)
            // Added the trace to get a HitNormal, so ricochet is at correct angle (from shell's DeflectWithoutNormal function)
            if (Level.NetMode != NM_DedicatedServer && bHasTracer && VSizeSquared(Velocity) > 500000.0)
            {
                Trace(HitLocation, HitNormal, HitLocation + Normal(Velocity) * 50.0, HitLocation - Normal(Velocity) * 50.0, true);
                DHDeflect(HitLocation, HitNormal, Other);
            }
            else
            {
                Destroy();
            }

            return;
        }

        SavedHitActor = Pawn(Other.Base);
    }

    // Get the bullet's speed
    if (!HasDeflected())
    {
        V = VSize(Velocity);
    }

    // Get the axes, based on bullet's direction
    if (V >= 25.0 || HasDeflected())
    {
        GetAxes(rotator(Velocity), X, Y, Z);
    }
    // But if bullet collides right after launch it won't have any velocity yet, so give it the default speed & use its rotation to get axes
    else
    {
        V = default.Speed;
        GetAxes(Rotation, X, Y, Z);
    }

    // We hit the bullet whip attachment around a player pawn
    if (ROBulletWhipAttachment(Other) != none)
    {
        if ((Other.Base != none && Other.Base.bDeleteMe) || InstigatorPlayer == none)
        {
            return;
        }

        // Set WhizType for possible bullet snap sound
        if (!HasDeflected())
        {
            // If bullet collides immediately after launch, it has no location (or so it would appear, go figure) - let's check against the firer's location instead
            if (OrigLoc == vect(0.0, 0.0, 0.0) && Instigator != none)
            {
                OrigLoc = Instigator.Location;
            }

            BulletDistance = class'DHLib'.static.UnrealToMeters(VSize(HitLocation - OrigLoc)); // calculate distance travelled by bullet in metres

            // If it's friendly fire at close range, we won't suppress, so send a different WhizType in the HitPointTrace
            if (BulletDistance < 10.0 && InstigatorController != none && DHPawn(Other.Base) != none && InstigatorController.SameTeamAs(DHPawn(Other.Base).Controller))
            {
                WhizType = 3;
            }
            // Bullets only "snap" after a certain distance in reality, same goes here
            else if (BulletDistance < 20.0 && WhizType == 1)
            {
                WhizType = 2;
            }
        }

        // Trace to see if bullet path will actually hit one of the player pawn's various body hit points
        // Use the InstigatorPlayer to do the trace, as that makes HitPointTrace work better because it ignores the InstigatorPlayer & its own bullet whip attachment
        // Temporarily make InstigatorPlayer use same bUseCollisionStaticMesh setting as projectile (normally means switching to true), meaning trace uses col meshes on vehicles
        InstigatorPlayer.bUseCollisionStaticMesh = bUseCollisionStaticMesh;

        // Maximum of 3 traces - but we only ever repeat the trace if we hit an invalid col mesh actor, which is very rare, so nearly always only 1 trace will be done
        for (i = 0; i < 3; ++i)
        {
            A = InstigatorPlayer.HitPointTrace(TempHitLocation, HitNormal, HitLocation + (65535.0 * X), HitPoints, HitLocation,, WhizType);

            // We're primarily interested if we hit a player, but also need to check if hit an invalid collision mesh that doesn't stop bullets (as would need to repeat trace)
            if (DHPawn(A) != none || (DHCollisionMeshActor(A) != none && DHCollisionMeshActor(A).bWontStopBullet))
            {
                // Make sure hit actor isn't further away than furthest possible point of bullet whip attachment (don't count as valid hit, just let bullet continue)
                if (VSizeSquared(TempHitLocation - HitLocation) <= 360000.0) // 360k is whip's diameter (600 UU) squared
                {
                    // We hit a player, so record it
                    if (DHPawn(A) != none)
                    {
                        HitPawn = DHPawn(A);
                        PawnHitLocation = TempHitLocation;
                    }
                    // Otherwise, must have hit an invalid collision mesh, so we temporarily disable its collision & re-run the trace
                    // Matt: this is a hack, but I can't think of another solution - the disabled collision is only for a split second & it seems harmless & effective
                    else
                    {
                        SavedColMeshes[SavedColMeshes.Length] = A; // save reference to col mesh so we can re-enable its collision after tracing
                        A.SetCollision(false, A.bBlockActors);
                        continue; // re-run the trace
                    }
                }
            }

            break; // generally we're going to exit the for loop after the 1st pass, except in the rare event where we hit an invalid col mesh
        }

        // Reset any temporarily disabled collision mesh collision, now we've finished tracing
        for (i = 0; i < SavedColMeshes.Length; ++i)
        {
            SavedColMeshes[i].SetCollision(true, SavedColMeshes[i].bBlockActors);
        }

        // HitPointTrace says we hit a player, but we need to verify that as HitPointTrace is unreliable & often passes through a blocking vehicle, hitting a shielded player
        if (HitPawn != none)
        {
            // Trace along path from where we hit player's whip attachment to where we traced a hit on player, checking if any blocking actor is in the way
            foreach InstigatorPlayer.TraceActors(class'Actor', A, TempHitLocation, HitNormal, PawnHitLocation, HitLocation)
            {
                // We hit a blocking actor, so now check if it's a valid 'stopper'
                if ((A.bBlockActors || A.bWorldGeometry) && A.bBlockHitPointTraces)
                {
                    // If hit collision mesh actor, we switch hit actor to col mesh's owner & proceed as if we'd hit that actor
                    if (A.IsA('DHCollisionMeshActor'))
                    {
                        // But if col mesh doesn't stop bullets, we ignore it & continue the trace iteration
                        if (DHCollisionMeshActor(A).bWontStopBullet)
                        {
                            continue;
                        }

                        A = A.Owner;
                    }

                    // A blocking actor is in the way, so we didn't really hit the player (but ignore anything ProcessTouch would normally ignore)
                    if (A != InstigatorPlayer && A.Base != InstigatorPlayer && A.Owner != InstigatorPlayer && A.Owner != Instigator
                        && !A.bDeleteMe && !(Other.IsA('Projectile') && !Other.bProjTarget) && A != HitPawn)
                    {
                        HitPawn = none;
                        break;
                    }
                }
            }
        }

        // Reset InstigatorPlayer collision properties & reset WhizType for next collision
        InstigatorPlayer.bUseCollisionStaticMesh = InstigatorPlayer.default.bUseCollisionStaticMesh;
        WhizType = default.WhizType;

        // Bullet won't hit the player, so we'll exit now
        if (HitPawn == none)
        {
            return;
        }
    }

    // Do any damage
    if (!HasDeflected() && Role == ROLE_Authority && V > (MinPenetrateVelocity * ScaleFactor))
    {
        UpdateInstigator();

        // Damage a player pawn
        if (HitPawn != none)
        {
            if (!HitPawn.bDeleteMe)
            {
                HitPawn.ProcessLocationalDamage(Damage - 20.0 * (1.0 - V / default.Speed), Instigator, PawnHitLocation, MomentumTransfer * X, MyDamageType, HitPoints);
            }
        }
        // Damage something else
        else
        {
            Other.TakeDamage(Damage - 20.0 * (1.0 - V / default.Speed), Instigator, HitLocation, MomentumTransfer * X, MyDamageType);
        }
    }

    // The only way a tracer will deflect is off a vehicle weapon, which is handled above & results in exiting function early, so we can always destroy the bullet here
    Destroy();
}

// From DHBullet
simulated function HitWall(vector HitNormal, Actor Wall)
{
    local ROVehicle HitVehicle;
    local bool      bPenetratedVehicle;

    // Hit SavedHitActor that we've already hit & recorded
    if (SavedHitActor != none && SavedHitActor == Wall)
    {
        if (bHasTracer)
        {
            // Deflect off wall unless bullet speed is very low (approx 12 m/s)
            if (Level.NetMode != NM_DedicatedServer && VSizeSquared(Velocity) > 500000.0)
            {
                DHDeflect(Location, HitNormal, Wall);
            }
            // Otherwise destroy if tracer has already deflected & this 'bullet' is now just a client visual effect
            else if (HasDeflected())
            {
                bBounce = false;
                Destroy();
            }
        }

        return;
    }

    SavedHitActor = Pawn(Wall);
    HitVehicle = ROVehicle(Wall);

    // Handle hit on a vehicle
    if (HitVehicle != none)
    {
        bPenetratedVehicle = !HasDeflected() && PenetrateVehicle(HitVehicle);

        PlayVehicleHitEffects(bPenetratedVehicle, Location, HitNormal);
    }
    // Spawn the bullet hit effect on anything other than a vehicle
    else if (Level.NetMode != NM_DedicatedServer && ImpactEffect != none)
    {
        Spawn(ImpactEffect,,, Location, rotator(-HitNormal));
    }

    if (!HasDeflected() && (HitVehicle == none || bPenetratedVehicle))
    {
        // Do any damage
        if (Role == ROLE_Authority)
        {
            UpdateInstigator();

            // Have to use special damage for vehicles, otherwise it doesn't register for some reason
            if (ROVehicle(Wall) != none)
            {
                Wall.TakeDamage(Damage - (20.0 * (1.0 - VSize(Velocity) / default.Speed)), Instigator, Location, MomentumTransfer * Normal(Velocity), MyVehicleDamage);
            }
            else if (Mover(Wall) != none || RODestroyableStaticMesh(Wall) != none || Vehicle(Wall) != none || ROVehicleWeapon(Wall) != none)
            {
                Wall.TakeDamage(Damage - (20.0 * (1.0 - VSize(Velocity) / default.Speed)), Instigator, Location, MomentumTransfer * Normal(Velocity), MyDamageType);
            }

            MakeNoise(1.0);
        }

        super(ROBallisticProjectile).HitWall(HitNormal, Wall); // is debug only
    }

    // Don't want to destroy the bullet if its going through something like glass
    if (RODestroyableStaticMesh(Wall) != none && RODestroyableStaticMesh(Wall).bWontStopBullets)
    {
        return;
    }

    // Finally destroy this bullet, or maybe deflect if is tracer
    if (bHasTracer)
    {
        // Deflect off wall unless penetrated vehicle or bullet speed is very low (approx 12 m/s)
        if (Level.NetMode != NM_DedicatedServer && !bPenetratedVehicle && VSizeSquared(Velocity) > 500000.0)
        {
            DHDeflect(Location, HitNormal, Wall);
        }
        else
        {
            bBounce = false;
            Destroy();
        }
    }
    else
    {
        Destroy();
    }
}

// Modified to run penetration calculations on a vehicle cannon (e.g. turret), but damage any other vehicle weapon automatically
simulated function bool PenetrateVehicleWeapon(VehicleWeapon VW)
{
    return DHVehicleCannon(VW) == none || DHVehicleCannon(VW).DHShouldPenetrate(self, Location, Normal(Velocity), GetPenetration(LaunchLocation - Location));
}

// Modified to run penetration calculations on an armored vehicle, but damage any other vehicle automatically
simulated function bool PenetrateVehicle(ROVehicle V)
{
    return DHArmoredVehicle(V) == none || DHArmoredVehicle(V).DHShouldPenetrate(self, Location, Normal(Velocity), GetPenetration(LaunchLocation - Location));
}

// From DHBullet
simulated function PlayVehicleHitEffects(bool bPenetrated, vector HitLocation, vector HitNormal)
{
    if (Level.NetMode != NM_DedicatedServer)
    {
        if (bPenetrated)
        {
            PlaySound(VehicleHitSound, SLOT_None, VehiclePenetrateSoundVolume, false, 100.0);

            if (EffectIsRelevant(Location, false) && ShellHitVehicleEffectClass != none)
            {
                Spawn(ShellHitVehicleEffectClass, ,, HitLocation, rotator(-HitNormal));
            }
        }
        else
        {
            PlaySound(VehicleDeflectSound, SLOT_None, VehicleDeflectSoundVolume, false, 100.0);

            if (EffectIsRelevant(Location, false) && ShellDeflectEffectClass != none)
            {
                Spawn(ShellDeflectEffectClass,,, HitLocation, rotator(-HitNormal));
            }
        }
    }
}

// Modified so tracer bullet switches to DeflectedMesh & to destroy TracerEffect if bullet speed is very low (from DHBullet)
simulated function DHDeflect(vector HitLocation, vector HitNormal, Actor Wall)
{
    if (TracerEffect != none && VSizeSquared(Velocity) < 750000.0) // approx 14 m/s
    {
        TracerEffect.Destroy();
    }

    if (StaticMesh != DeflectedMesh)
    {
        SetStaticMesh(DeflectedMesh);
    }

    super.DHDeflect(HitLocation, HitNormal, Wall);
}

// New function just to add readability to functions
simulated function bool HasDeflected()
{
    return NumDeflections > 0;
}

// From DHBullet
simulated function Landed(vector HitNormal)
{
    if (bHasTracer)
    {
        SetPhysics(PHYS_None);
        Destroy();
    }
}

// Modified as not an exploding shell
simulated function Explode(vector HitLocation, vector HitNormal)
{
    Destroy();
}

// Modified to destroy any tracer effect
simulated function Destroyed()
{
    super.Destroyed();

    if (TracerEffect != none)
    {
        TracerEffect.Destroy();
    }
}

defaultproperties
{
    WhizSoundEffect=class'DH_Effects.DHBulletWhiz'
    ImpactEffect=class'DH_Effects.DHBulletHitEffect'
    ShellHitVehicleEffectClass=class'DH_Effects.DHBulletPenetrateArmorEffect' // custom class with much smaller penetration effects than shell (PTRD uses 'TankAPHitPenetrateSmall')
    VehicleHitSound=sound'ProjectileSounds.PTRD_penetrate'
    VehiclePenetrateSoundVolume=5.5
    ShellDeflectEffectClass=class'ROEffects.ROBulletHitMetalArmorEffect'
    VehicleDeflectSound=sound'PTRD_deflect'
    VehicleDeflectSoundVolume=5.5
    ShellHitWaterEffectClass=class'ROEffects.ROBulletHitWaterEffect'

    DrawType=DT_None
    WhizType=1
    MaxSpeed=40000.0
    MomentumTransfer=100.0
    LifeSpan=5.0
    DestroyTime=0.1
    bBotNotifyIneffective=false
    MyVehicleDamage=class'ROVehicleDamageType'

    // Tracer properties (won't affect ordinary bullet):
    DrawScale=2.0
    TracerPullback=150.0
    bBounce=true
    DampenFactor=0.1
    DampenFactorParallel=0.05
}
