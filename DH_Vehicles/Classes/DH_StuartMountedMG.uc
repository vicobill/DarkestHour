//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_StuartMountedMG extends DHVehicleMG;

defaultproperties
{
    ReloadSound=sound'Vehicle_reloads.Reloads.MG34_ReloadHidden'
    NumMags=6
    FireAttachBone="mg_yaw"
    FireEffectOffset=(X=5.0)
    TracerProjectileClass=class'DH_30CalVehicleTracerBullet'
    TracerFrequency=5
    hudAltAmmoIcon=texture'InterfaceArt_tex.HUD.mg42_ammo'
    YawBone="mg_yaw"
    PitchBone="mg_yaw"
    PitchUpLimit=15000
    PitchDownLimit=45000
    CustomPitchUpLimit=3000
    CustomPitchDownLimit=63000
    WeaponFireAttachmentBone="mg_yaw"
    WeaponFireOffset=8.0
    bInstantFire=false
    Spread=0.002
    FireInterval=0.12
    FireSoundClass=SoundGroup'DH_AlliedVehicleSounds2.3Cal.V30cal_loop01'
    FireEndSound=SoundGroup'DH_AlliedVehicleSounds2.3Cal.V30cal_end01'
    ProjectileClass=class'DH_Vehicles.DH_30CalVehicleBullet'
    ShakeRotMag=(X=20.0,Y=20.0,Z=20.0)
    ShakeOffsetMag=(X=0.01,Y=0.01,Z=0.01)
    MaxPositiveYaw=3500
    MaxNegativeYaw=-8000
    bLimitYaw=true
    InitialPrimaryAmmo=200
    Mesh=SkeletalMesh'DH_ShermanM4A1_anm.Sherman_MG'
    SoundVolume=150
}
