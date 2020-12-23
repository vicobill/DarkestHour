//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2020
//==============================================================================

class DHAmmoResupplyVolume extends Volume
  dependson(DHResupplyStrategy);

enum EOwningTeam
{
    OWNER_Axis,
    OWNER_Allies,
    OWNER_Neutral,
};

var()   EOwningTeam                       Team;                    // team this volume resupplies
var()   bool                              bUsesSpawnAreas;         // is activated/deactivated based on a spawn area associated with a tag
var()   DHResupplyStrategy.EResupplyType  ResupplyType;            // who this volume will resupply

var     float           UpdateTime;              // how often this thing needs to do it's business
var     bool            bActive;                 // whether this ammo resupply volume is active
var     bool            bControlledBySpawnPoint; // flags that this resupply is activated or deactivated by a spawn point, based on whether that spawn is active (set by SP)

var     class<DHResupplyStrategy>  ResupplyStrategy;

// Modified so doesn't activate if controlled by a DH spawn point, as well as if linked to an RO spawn area
function PostBeginPlay()
{
    super.PostBeginPlay();

    UpdateTime = default.UpdateTime; // force UpdateTime to be default (no overriding it in the editor)

    if (!bUsesSpawnAreas && !bControlledBySpawnPoint)
    {
        bActive = true;
    }

    if (Role == ROLE_Authority)
    {
        SetTimer(1.0, true);
    }
}

// Modified so doesn't activate if controlled by a DH spawn point, as well as if linked to an RO spawn area
function Reset()
{
    if (!bUsesSpawnAreas && !bControlledBySpawnPoint)
    {
        bActive = true;
    }
}

function Timer()
{
    local Pawn P;
    local Inventory I;
    local ROWeapon W;
    local bool bResupplied;
    local DHPawn DHP;
    local Vehicle V;
    local DHRoleInfo RI;

    if (!bActive)
    {
        return;
    }

    foreach TouchingActors(class'Pawn', P)
    {
        if ((Team != OWNER_Neutral && P.GetTeamNum() != Team) || Level.TimeSeconds - P.LastResupplyTime < UpdateTime)
        {
            continue;
        }

        ResupplyStrategy.static.HandleResupply(P, ResupplyType, Level.TimeSeconds, false);
    }
}

event Touch(Actor Other)
{
    local ROPawn P;
    local Vehicle V;

    if (!bActive)
    {
        return;
    }

    P = ROPawn(Other);
    V = Vehicle(Other);

    if (P != none)
    {
        if (Team == OWNER_Neutral ||
           (P.PlayerReplicationInfo != none && P.PlayerReplicationInfo.Team != none
           && ((P.PlayerReplicationInfo.Team.TeamIndex == AXIS_TEAM_INDEX && Team == OWNER_Axis) ||
               (P.PlayerReplicationInfo.Team.TeamIndex == ALLIES_TEAM_INDEX && Team == OWNER_Allies))))
        {
            P.bTouchingResupply = true;
        }
    }

    if (V != none)
    {
        if (Team == OWNER_Neutral ||
           ((V.GetTeamNum() == AXIS_TEAM_INDEX && Team == OWNER_Axis) ||
            (V.GetTeamNum() == ALLIES_TEAM_INDEX && Team == OWNER_Allies)))
        {
            V.EnteredResupply();
        }
    }
}

event UnTouch(Actor Other)
{
    local ROPawn P;
    local Vehicle V;

    P = ROPawn(Other);
    V = Vehicle(Other);

    if (P != none)
    {
        P.bTouchingResupply = false;
    }

    if (V != none)
    {
        V.LeftResupply();
    }
}

defaultproperties
{
    ResupplyStrategy=class'DHResupplyStrategy'
    Team=OWNER_Neutral
    ResupplyType=RT_All
    bStatic=false
}
