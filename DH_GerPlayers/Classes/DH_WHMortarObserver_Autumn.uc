//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DH_WHMortarObserver_Autumn extends DHGEMortarObserverRoles;

defaultproperties
{
    RolePawns(0)=(PawnClass=class'DH_GerPlayers.DH_GermanParkaHeerPawnB',Weight=2.0)
    RolePawns(1)=(PawnClass=class'DH_GerPlayers.DH_GermanSmockHeerPawn',Weight=1.0)
    SleeveTexture=Texture'DHGermanCharactersTex.GerSleeves.SplinterASleeve'
    Headgear(0)=class'DH_GerPlayers.DH_HeerHelmetCover'
    Headgear(1)=class'DH_GerPlayers.DH_HeerHelmetNoCover'
}
