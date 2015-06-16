//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_Cromwell6PdrCannon extends DHVehicleCannon;

defaultproperties
{
    SecondarySpread=0.00175
    TertiarySpread=0.0036
    ManualRotationsPerSecond=0.029
    PoweredRotationsPerSecond=0.0625
    FrontArmorFactor=7.6
    RightArmorFactor=6.3
    LeftArmorFactor=6.3
    RearArmorFactor=5.7
    FrontLeftAngle=318.0
    FrontRightAngle=42.0
    RearRightAngle=138.0
    RearLeftAngle=222.0
    ReloadSoundOne=sound'DH_Vehicle_Reloads.Reloads.reload_01s_01'
    ReloadSoundTwo=sound'DH_Vehicle_Reloads.Reloads.reload_01s_02'
    ReloadSoundThree=sound'DH_Vehicle_Reloads.Reloads.reload_01s_03'
    ReloadSoundFour=sound'DH_Vehicle_Reloads.Reloads.reload_01s_04'
    CannonFireSound(0)=SoundGroup'DH_ArtillerySounds.ATGun.57mm_fire01'
    CannonFireSound(1)=SoundGroup'DH_ArtillerySounds.ATGun.57mm_fire02'
    CannonFireSound(2)=SoundGroup'DH_ArtillerySounds.ATGun.57mm_fire03'
    ProjectileDescriptions(0)="APCBC"
    RangeSettings(1)=100
    RangeSettings(2)=200
    RangeSettings(3)=300
    RangeSettings(4)=400
    RangeSettings(5)=500
    RangeSettings(6)=600
    RangeSettings(7)=700
    RangeSettings(8)=800
    RangeSettings(9)=900
    RangeSettings(10)=1000
    RangeSettings(11)=1100
    RangeSettings(12)=1200
    RangeSettings(13)=1300
    RangeSettings(14)=1400
    RangeSettings(15)=1500
    RangeSettings(16)=1600
    RangeSettings(17)=1700
    RangeSettings(18)=1800
    RangeSettings(19)=1900
    RangeSettings(20)=2000
    RangeSettings(21)=2200
    RangeSettings(22)=2400
    RangeSettings(23)=2600
    RangeSettings(24)=2800
    AddedPitch=50
    ReloadSound=sound'Vehicle_reloads.Reloads.DT_ReloadHidden'
    NumAltMags=6
    AltTracerProjectileClass=class'DH_BesaVehicleTracerBullet'
    AltFireTracerFrequency=5
    bUsesTracers=true
    bAltFireTracersOnly=true
    MinCommanderHitHeight=44.5;
    VehHitpoints(0)=(PointRadius=9.0,PointScale=1.0,PointBone="com_player",PointOffset=(Z=12.0))
    VehHitpoints(1)=(PointRadius=16.0,PointScale=1.0,PointBone="com_player",PointOffset=(Z=-11.0))
    hudAltAmmoIcon=texture'InterfaceArt_tex.HUD.mg42_ammo'
    YawBone="Turret"
    PitchBone="Gun"
    PitchUpLimit=15000
    PitchDownLimit=45000
    WeaponFireAttachmentBone="Gun"
    GunnerAttachmentBone="com_attachment"
    WeaponFireOffset=200.0
    AltFireOffset=(X=40.0,Y=-12.5,Z=1.0)
    bAmbientAltFireSound=true
    FireInterval=4.0
    AltFireInterval=0.092
    FireSoundVolume=512.0
    AltFireSoundClass=SoundGroup'Inf_Weapons.dt.dt_fire_loop'
    AltFireSoundScaling=3.0
    AltFireEndSound=SoundGroup'Inf_Weapons.dt.dt_fire_end'
    FireForce="Explosion05"
    ProjectileClass=class'DH_Vehicles.DH_Cromwell6PdrCannonShell'
    AltFireProjectileClass=class'DH_Vehicles.DH_BesaVehicleBullet'
    ShakeRotMag=(Z=50.0)
    ShakeRotRate=(Z=1000.0)
    ShakeRotTime=4.0
    ShakeOffsetMag=(Z=1.0)
    ShakeOffsetRate=(Z=100.0)
    ShakeOffsetTime=10.0
    AltShakeRotMag=(X=10.0,Y=10.0,Z=10.0)
    AltShakeRotRate=(X=10000.0,Y=10000.0,Z=10000.0)
    AltShakeRotTime=2.0
    AltShakeOffsetMag=(X=0.01,Y=0.01,Z=0.01)
    AltShakeOffsetRate=(X=1000.0,Y=1000.0,Z=1000.0)
    AltShakeOffsetTime=2.0
    AIInfo(0)=(bLeadTarget=true,WarnTargetPct=0.75,RefireRate=0.5)
    AIInfo(1)=(bLeadTarget=true,WarnTargetPct=0.75,RefireRate=0.015)
    CustomPitchUpLimit=3641
    CustomPitchDownLimit=64500
    BeginningIdleAnim="com_idle_close"
    InitialPrimaryAmmo=45
    InitialSecondaryAmmo=30
    InitialAltAmmo=225
    PrimaryProjectileClass=class'DH_Vehicles.DH_Cromwell6PdrCannonShell'
    SecondaryProjectileClass=class'DH_Vehicles.DH_Cromwell6PdrCannonShellHE'
    Mesh=SkeletalMesh'DH_Cromwell_anm.cromwell6pdr_turret_ext'
    Skins(0)=texture'DH_VehiclesUK_tex.ext_vehicles.Cromwell_body_ext'
    Skins(1)=texture'DH_VehiclesUK_tex.int_vehicles.Cromwell_body_int2'
    SoundVolume=130
    SoundRadius=300.0
}
