//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_AT57CannonPawn extends DHATGunCannonPawn;

defaultproperties
{
    OverlayCenterSize=0.542
    CannonScopeOverlay=texture'DH_Artillery_Tex.ATGun_Hud.57mmGun_sight_background'
    BinocsOverlay=texture'DH_VehicleOptics_tex.Allied.BINOC_overlay_7x50Allied'
    BinocPositionIndex=2
    WeaponFov=24.0
    AmmoShellTexture=texture'InterfaceArt_tex.Tank_Hud.Panzer3shell'
    AmmoShellReloadTexture=texture'InterfaceArt_tex.Tank_Hud.Panzer3shell_reload'
    DriverPositions(0)=(ViewLocation=(X=20.0,Y=-12.0,Z=10.0),ViewFOV=24.0,PositionMesh=SkeletalMesh'DH_6PounderGun_anm.6pounder_turret',TransitionUpAnim="com_open",DriverTransitionAnim="crouch_idle_binoc",ViewPitchUpLimit=2731,ViewPitchDownLimit=64626,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-6000,bDrawOverlays=true,bExposed=true)
    DriverPositions(1)=(ViewFOV=90.0,PositionMesh=SkeletalMesh'DH_6PounderGun_anm.6pounder_turret',TransitionDownAnim="com_close",DriverTransitionAnim="stand_idlehip_binoc",ViewPitchUpLimit=6000,ViewPitchDownLimit=63500,ViewPositiveYawLimit=20000,ViewNegativeYawLimit=-20000,bExposed=true)
    DriverPositions(2)=(ViewFOV=12.0,PositionMesh=SkeletalMesh'DH_6PounderGun_anm.6pounder_turret',DriverTransitionAnim="stand_idleiron_binoc",ViewPitchUpLimit=6000,ViewPitchDownLimit=63500,ViewPositiveYawLimit=20000,ViewNegativeYawLimit=-20000,bDrawOverlays=true,bExposed=true)
    GunClass=class'DH_Guns.DH_AT57Cannon'
    CameraBone="Gun"
    DrivePos=(Z=-32.0)
    DriveAnim="crouch_idle_binoc"
    EntryRadius=200.0
    SoundVolume=130
}
