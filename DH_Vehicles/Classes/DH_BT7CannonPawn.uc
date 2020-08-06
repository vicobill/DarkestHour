//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2019
//==============================================================================

class DH_BT7CannonPawn extends DHSovietCannonPawn;

defaultproperties
{
    //Gun Class
    GunClass=class'DH_Vehicles.DH_BT7Cannon'

    //Driver's positions and anims
    DriverPositions(0)=(ViewLocation=(X=8,Y=-8,Z=5),ViewFOV=30,PositionMesh=Mesh'DH_BT7_anm.BT7_turret_int',ViewPitchUpLimit=6000,ViewPitchDownLimit=64500,ViewPositiveYawLimit=19000,ViewNegativeYawLimit=-20000,bDrawOverlays=true,bExposed=false)
    DriverPositions(1)=(ViewLocation=(X=8.5,Y=47,Z=3),PositionMesh=Mesh'DH_BT7_anm.BT7_turret_int',ViewPitchUpLimit=10,ViewPitchDownLimit=65535,ViewPositiveYawLimit=65536,ViewNegativeYawLimit=-65536)
    DriverPositions(2)=(ViewLocation=(X=8.5,Y=-12,Z=3),PositionMesh=Mesh'DH_BT7_anm.BT7_turret_int',DriverTransitionAnim=VPanther_driver_close,TransitionUpAnim=com_open,ViewPitchUpLimit=10,ViewPitchDownLimit=65535,ViewPositiveYawLimit=65536,ViewNegativeYawLimit=-65536)
    DriverPositions(3)=(PositionMesh=Mesh'DH_BT7_anm.BT7_turret_int',DriverTransitionAnim=VPanther_driver_open,TransitionDownAnim=com_close,ViewPitchUpLimit=5000,ViewPitchDownLimit=62000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bDrawOverlays=false,bExposed=true)
    DriverPositions(4)=(ViewFOV=12.0,PositionMesh=Mesh'DH_BT7_anm.BT7_turret_int',DriverTransitionAnim="stand_idleiron_binoc",ViewPitchUpLimit=5000,ViewPitchDownLimit=62000,ViewPositiveYawLimit=6000,ViewNegativeYawLimit=-10000,bDrawOverlays=true,bExposed=true)

    DrivePos=(X=10.0,Y=3.0,Z=-10.0)
    DriveAnim="VPanther_driver_idle_close"
    bLockCameraDuringTransition=true

    UnbuttonedPositionIndex=3
    BinocPositionIndex=4

    bManualTraverseOnly=true

    //Gunsight
    GunsightOverlay=Texture'DH_VehicleOptics_tex.Soviet.45mmATGun_sight_background'
    CannonScopeCenter=Texture'Vehicle_Optic.Scopes.T3476_sight_mover'
    GunsightSize=0.5// 15 degrees visible FOV at 2.5x magnification (PP-1 sight)
    ScopeCenterPositionX=0.035
    ScopeCenterScaleX=2.2
    ScopeCenterScaleY=2.0
    DestroyedGunsightOverlay=Texture'DH_VehicleOpticsDestroyed_tex.German.PZ4_sight_destroyed'

    //HUD
    AmmoShellTexture=Texture'InterfaceArt_ahz_tex.Tank_Hud.45mmShell' // TODO: get new ammo icons made so the "X" text matches the position of the ammo count
    AmmoShellReloadTexture=Texture'InterfaceArt_ahz_tex.Tank_Hud.45mmShell_reload'
}
