//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2018
//==============================================================================

class DHSpawnPoint_Parachute extends DHSpawnPointBase;

function OnPawnSpawned(Pawn P)
{
    local DHPawn DHP;

    DHP = DHPawn(P);

    if (DHP != none)
    {
        DHP.GiveChute();
    }

    super.OnPawnSpawned(P);
}

simulated function string GetMapStyleName()
{
    return "DHParatroopersButtonStyle";
}

defaultproperties
{
    SpawnLocationOffset=(Z=10000)
    SpawnRadius=1024.0
}
