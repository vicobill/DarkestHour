//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2016
//==============================================================================

class DH_USOfficer506101st extends DH_US_506PIR;

defaultproperties
{
    bIsArtilleryOfficer=true
    MyName="Artillery Officer"
    AltName="Artillery Officer"
    Article="an "
    PluralName="Artillery Officers"
    PrimaryWeapons(0)=(Item=class'DH_Weapons.DH_M1CarbineWeapon',AssociatedAttachment=class'DH_Weapons.DH_M1CarbineAmmoPouch')
    SecondaryWeapons(0)=(Item=class'DH_Weapons.DH_ColtM1911Weapon')
    GivenItems(0)="DH_Equipment.DHBinocularsItem"
    Headgear(0)=class'DH_USPlayers.DH_AmericanHelmet506101stOfficera'
    Headgear(1)=class'DH_USPlayers.DH_AmericanHelmet506101stOfficerb'
    Limit=1
}
