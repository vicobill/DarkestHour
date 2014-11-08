//===================================================================
// DH_PantherGTank_CamoTwo
//===================================================================
class DH_PantherGTank_CamoTwo extends DH_PantherGTank;

static function StaticPrecache(LevelInfo L)
{
    Super.StaticPrecache(L);

    L.AddPrecacheMaterial(Material'DH_VehiclesGE_tex.ext_vehicles.PantherG_body_camo2');
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(Material'DH_VehiclesGE_tex.ext_vehicles.PantherG_body_camo2');

    Super.UpdatePrecacheMaterials();
}

defaultproperties
{
     PassengerWeapons(0)=(WeaponPawnClass=Class'DH_Vehicles.DH_PantherGCannonPawn_CamoTwo')
     DestroyedVehicleMesh=StaticMesh'DH_German_vehicles_stc.PantherG.PantherG_Destroyed2'
     Skins(0)=Texture'DH_VehiclesGE_tex.ext_vehicles.PantherG_body_camo2'
     SchurzenTexture=texture'DH_VehiclesGE_tex.ext_vehicles.PantherG_armor_camo2'
}
