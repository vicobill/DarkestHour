//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2019
//==============================================================================

class DH_T3476_43Cannon extends DHVehicleCannon;

defaultproperties
{
    // Turret mesh
    Mesh=SkeletalMesh'DH_T34_2_anm.T34m43_turret_ext'
    Skins(0)=Texture'DH_T34_2_tex.Vehicles.T3476_M42_green'
    //Skins(1)=Texture'allies_vehicles_tex.int_vehicles.T3476_int'
    bUseHighDetailOverlayIndex=false

    //HighDetailOverlay=shader'allies_vehicles_tex.int_vehicles.t3476_int_s'
    CollisionStaticMesh=StaticMesh'DH_Soviet_vehicles_stc.T34-76_turret_col'

    // Turret armor (model 1942)
    FrontArmorFactor=5.3
    LeftArmorFactor=5.3
    RightArmorFactor=5.3
    RearArmorFactor=5.3
    FrontArmorSlope=30.0
    LeftArmorSlope=25.0
    RightArmorSlope=25.0
    RearArmorSlope=20.0
    FrontLeftAngle=341.0
    FrontRightAngle=19.0
    RearRightAngle=162.0
    RearLeftAngle=198.0

    // Turret movement
    ManualRotationsPerSecond=0.029
    PoweredRotationsPerSecond=0.0833 // 30 degrees/sec
    CustomPitchUpLimit=5461 // +30/-5 degrees
    CustomPitchDownLimit=64626

    // Cannon ammo
    ProjectileClass=class'DH_Vehicles.DH_T3476CannonShell'
    PrimaryProjectileClass=class'DH_Vehicles.DH_T3476CannonShell'
    SecondaryProjectileClass=class'DH_Vehicles.DH_T3476CannonShellHE'
    ProjectileDescriptions(0)="APBC"

    nProjectileDescriptions(0)="BR-350B" // standard mid-late war APBC shell
    nProjectileDescriptions(1)="OF-350"
	

    InitialPrimaryAmmo=25
    InitialSecondaryAmmo=25
    MaxPrimaryAmmo=27
    MaxSecondaryAmmo=50
    SecondarySpread=0.002
	
	TertiaryProjectileClass=class'DH_Vehicles.DH_T3476CannonShellAPCR'
	InitialTertiaryAmmo=4
	MaxTertiaryAmmo=6
    nProjectileDescriptions(2)="BR-350P"
    ProjectileDescriptions(2)="APCR"

    // Coaxial MG ammo
    AltFireProjectileClass=class'DH_Weapons.DH_DP28Bullet'
    InitialAltAmmo=60
    NumMGMags=15
    AltFireInterval=0.1
    TracerProjectileClass=class'DH_Weapons.DH_DP28TracerBullet'
    TracerFrequency=5
    HudAltAmmoIcon=Texture'InterfaceArt_tex.HUD.dp27_ammo'

    // Weapon fire
    WeaponFireOffset=71.9
    AddedPitch=230
    AltFireOffset=(X=-81.0,Y=12.5,Z=1.5)

    // Sounds
    CannonFireSound(0)=Sound'Vehicle_Weapons.T34_76.76mm_fire01'
    CannonFireSound(1)=Sound'Vehicle_Weapons.T34_76.76mm_fire02'
    CannonFireSound(2)=Sound'Vehicle_Weapons.T34_76.76mm_fire03'
    AltFireSoundClass=Sound'DH_WeaponSounds.dt_fire_loop'
    AltFireEndSound=Sound'DH_WeaponSounds.dt.dt_fire_end'
    ReloadStages(0)=(Sound=Sound'Vehicle_reloads.Reloads.Pz_IV_F2_Reload_01')
    ReloadStages(1)=(Sound=Sound'Vehicle_reloads.Reloads.Pz_IV_F2_Reload_02')
    ReloadStages(2)=(Sound=Sound'Vehicle_reloads.Reloads.Pz_IV_F2_Reload_03')
    ReloadStages(3)=(Sound=Sound'Vehicle_reloads.Reloads.Pz_IV_F2_Reload_04')
    AltReloadStages(0)=(Sound=Sound'Inf_Weapons_Foley.dt.DT_reloadempty01_000',Duration=1.76)
    AltReloadStages(1)=(Sound=Sound'Inf_Weapons_Foley.dt.DT_reloadempty02_052',Duration=2.29,HUDProportion=0.65)
    AltReloadStages(2)=(Sound=Sound'Inf_Weapons_Foley.dt.DT_reloadempty03_121',Duration=2.35)
    AltReloadStages(3)=(Sound=Sound'Inf_Weapons_Foley.dt.DT_reloadempty04_191',Duration=3.2,HUDProportion=0.35)

    // Cannon range settings
    RangeSettings(0)=0
    RangeSettings(1)=200
    RangeSettings(2)=400
    RangeSettings(3)=600
    RangeSettings(4)=800
    RangeSettings(5)=1000
    RangeSettings(6)=1200
    RangeSettings(7)=1400
    RangeSettings(8)=1600
    RangeSettings(9)=1800
    RangeSettings(10)=2000
    RangeSettings(11)=2200
    RangeSettings(12)=2400
    RangeSettings(13)=2600
    RangeSettings(14)=2800
    RangeSettings(15)=3000
    RangeSettings(16)=3200
    RangeSettings(17)=3400
    RangeSettings(18)=3600
    RangeSettings(19)=3800
    RangeSettings(20)=4000
    RangeSettings(21)=4200
    RangeSettings(22)=4400
    RangeSettings(23)=4600
    RangeSettings(24)=4800
    RangeSettings(25)=5000
}