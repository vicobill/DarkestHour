//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2017
//==============================================================================

class DH_ZiS3Cannon extends DHATGunCannon;

defaultproperties
{
    // Cannon mesh
    Mesh=SkeletalMesh'DH_ZiS3_76mm_anm.ZiS3_gun'
    Skins(0)=Texture'DH_Artillery_tex.ZiS3.ZiS3_76mm_M1942_01'
    Skins(1)=Shader'MilitaryAlliesSMT.Artillery.76mmShellCase2_Shine'
    CollisionStaticMesh=StaticMesh'DH_Artillery_stc.ZiS3.ZiS3_gun_collision'

    // Turret movement
    MaxPositiveYaw=4915 // 27 degrees
    MaxNegativeYaw=-4915
    YawStartConstraint=-5500.0
    YawEndConstraint=5500.0
    CustomPitchUpLimit=5097 // +28/-5 degrees (could actually elevate to 37 degrees, but reduced to stop breech sinking into ground)
    CustomPitchDownLimit=64626

    // Cannon ammo
    ProjectileClass=class'DH_Guns.DH_ZiS3CannonShellHE'
    PrimaryProjectileClass=class'DH_Guns.DH_ZiS3CannonShellHE'
    SecondaryProjectileClass=class'DH_Guns.DH_ZiS3CannonShell'
    ProjectileDescriptions(0)="HE"
    ProjectileDescriptions(1)="APBC"
    InitialPrimaryAmmo=20
    InitialSecondaryAmmo=10
    MaxPrimaryAmmo=60
    MaxSecondaryAmmo=30
    Spread=0.002
    SecondarySpread=0.0

    // Sounds
    CannonFireSound(0)=SoundGroup'Vehicle_Weapons.SU_76.76mm_fire01'
    CannonFireSound(1)=SoundGroup'Vehicle_Weapons.SU_76.76mm_fire02'
    CannonFireSound(2)=SoundGroup'Vehicle_Weapons.SU_76.76mm_fire03'
    ReloadStages(0)=(Sound=Sound'Vehicle_reloads.Reloads.SU_76_Reload_01')
    ReloadStages(1)=(Sound=Sound'Vehicle_reloads.Reloads.SU_76_Reload_02')
    ReloadStages(2)=(Sound=Sound'Vehicle_reloads.Reloads.SU_76_Reload_03')
    ReloadStages(3)=(Sound=Sound'Vehicle_reloads.Reloads.SU_76_Reload_04')

    // Cannon range settings
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
}