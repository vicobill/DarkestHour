//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DH_BritishAntiTankOx_Bucks extends DHCWAntiTankRoles;

defaultproperties
{
    RolePawns(0)=(PawnClass=class'DH_BritishPlayers.DH_BritishAirbornePawn',Weight=1.0)
    Headgear(0)=class'DH_BritishPlayers.DH_BritishParaHelmetOne'
    Headgear(1)=class'DH_BritishPlayers.DH_BritishParaHelmetTwo'
    Headgear(2)=class'DH_BritishPlayers.DH_BritishAirborneBeretOx_Bucks'
    SleeveTexture=Texture'DHBritishCharactersTex.Sleeves.Brit_Para_sleeves'

    SecondaryWeapons(0)=(Item=class'DH_Weapons.DH_EnfieldNo2Weapon')
}
