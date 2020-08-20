//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DH_RKKA_GreatcoatGreyAssaultEarly extends DHSOVAssaultRoles;

defaultproperties
{

    RolePawns(0)=(PawnClass=class'DH_SovietPlayers.DH_SovietGreatcoatGreyEarlyPawn',Weight=1.0)
    Headgear(0)=class'DH_SovietPlayers.DH_SovietHelmet'
    SleeveTexture=Texture'DHSovietCharactersTex.RussianSleeves.DH_RussianCoatGreySleeves'

    PrimaryWeapons(0)=(Item=class'DH_Weapons.DH_PPD40Weapon',AssociatedAttachment=class'ROInventory.ROPPSh41AmmoPouch')
    PrimaryWeapons(1)=(Item=class'DH_Weapons.DH_PPSH41Weapon',AssociatedAttachment=class'ROInventory.ROPPSh41AmmoPouch')
}