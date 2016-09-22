//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2016
//==============================================================================

class DH_RKKA_StandardEngineer extends DH_RKKA_Standard;

defaultproperties
{
    MyName="Combat Engineer"
    AltName="Saper"
    Article="a "
    PluralName="Combat Engineers"
    PrimaryWeapons(0)=(Item=class'DH_Weapons.DH_M38Weapon',Amount=15,AssociatedAttachment=class'ROInventory.ROMN9130AmmoPouch')
    Grenades(0)=(Item=class'DH_Weapons.DH_F1GrenadeWeapon',Amount=2)
    Grenades(1)=(Item=class'DH_Weapons.DH_RDG1GrenadeWeapon',Amount=1)
    GivenItems(0)="DH_Weapons.DH_SatchelCharge10lb10sWeapon"
    Headgear(0)=class'DH_SovietPlayers.DH_SovietSidecap'
    Headgear(1)=class'DH_SovietPlayers.DH_SovietSidecap'
    Headgear(2)=class'DH_SovietPlayers.DH_SovietSidecap'
    Limit=2
}
