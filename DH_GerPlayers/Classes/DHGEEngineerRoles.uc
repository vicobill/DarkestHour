//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2019
//==============================================================================

class DHGEEngineerRoles extends DHAxisEngineerRoles
    abstract;

defaultproperties
{
    PrimaryWeapons(0)=(Item=class'DH_Weapons.DH_Kar98Weapon',AssociatedAttachment=class'ROInventory.ROKar98AmmoPouch')
    Grenades(0)=(Item=class'DH_Weapons.DH_StielGranateWeapon')
    Grenades(1)=(Item=class'DH_Equipment.DH_NebelGranate39Weapon')
    GivenItems(0)="DH_Weapons.DH_SatchelCharge10lb10sWeapon"
    GivenItems(1)="DH_Equipment.DHWireCuttersItem"
    HeadgearProbabilities(0)=0.2
    HeadgearProbabilities(1)=0.8
}
