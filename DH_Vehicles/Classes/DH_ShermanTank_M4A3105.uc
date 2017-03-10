//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2016
//==============================================================================

class DH_ShermanTank_M4A3105 extends DH_ShermanTank_M4A375W;

defaultproperties
{
    VehicleNameString="M4A3(105) Sherman"
    PassengerWeapons(0)=(WeaponPawnClass=class'DH_Vehicles.DH_ShermanCannonPawn_M4A3105')
    DestroyedVehicleMesh=StaticMesh'DH_allies_vehicles_stc3.ShermanM4A3.M4A3_105dest'
    VehicleHudImage=texture'DH_InterfaceArt_tex.Tank_Hud.Shermanm4a3e2_body'
    VehicleHudTurret=TexRotator'DH_InterfaceArt_tex.Tank_Hud.Sherman105_turret_rot'
    VehicleHudTurretLook=TexRotator'DH_InterfaceArt_tex.Tank_Hud.Sherman105_turret_look'
    SpawnOverlay(0)=material'DH_InterfaceArt_tex.Vehicles.sherman_m4a3_105'
}
