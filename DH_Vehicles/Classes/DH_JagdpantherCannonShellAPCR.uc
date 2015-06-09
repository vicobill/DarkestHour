//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2015
//==============================================================================

class DH_JagdpantherCannonShellAPCR extends DHCannonShellHVAP;

defaultproperties
{
    MechanicalRanges(0)=(RangeValue=24.0)
    MechanicalRanges(1)=(Range=100,RangeValue=32.0)
    MechanicalRanges(2)=(Range=200,RangeValue=40.0)
    MechanicalRanges(3)=(Range=300,RangeValue=48.0)
    MechanicalRanges(4)=(Range=400,RangeValue=54.0)
    MechanicalRanges(5)=(Range=500,RangeValue=56.0)
    MechanicalRanges(6)=(Range=600,RangeValue=62.0)
    MechanicalRanges(7)=(Range=700,RangeValue=66.0)
    MechanicalRanges(8)=(Range=800,RangeValue=70.0)
    MechanicalRanges(9)=(Range=900,RangeValue=76.0)
    MechanicalRanges(10)=(Range=1000,RangeValue=82.0)
    MechanicalRanges(11)=(Range=1100,RangeValue=86.0)
    MechanicalRanges(12)=(Range=1200,RangeValue=90.0)
    MechanicalRanges(13)=(Range=1300,RangeValue=94.0)
    MechanicalRanges(14)=(Range=1400,RangeValue=98.0)
    MechanicalRanges(15)=(Range=1500,RangeValue=102.0)
    MechanicalRanges(16)=(Range=1600,RangeValue=106.0)
    MechanicalRanges(17)=(Range=1700,RangeValue=112.0)
    MechanicalRanges(18)=(Range=1800,RangeValue=122.0)
    MechanicalRanges(19)=(Range=1900,RangeValue=128.0)
    MechanicalRanges(20)=(Range=2000,RangeValue=136.0)
    MechanicalRanges(21)=(Range=2200,RangeValue=148.0)
    MechanicalRanges(22)=(Range=2400,RangeValue=156.0)
    MechanicalRanges(23)=(Range=2600,RangeValue=176.0)
    MechanicalRanges(24)=(Range=2800,RangeValue=196.0)
    MechanicalRanges(25)=(Range=3000,RangeValue=216.0)
    MechanicalRanges(26)=(Range=3200,RangeValue=232.0)
    MechanicalRanges(27)=(Range=3400,RangeValue=256.0)
    MechanicalRanges(28)=(Range=3600,RangeValue=280.0)
    MechanicalRanges(29)=(Range=3800,RangeValue=300.0)
    MechanicalRanges(30)=(Range=4000,RangeValue=324.0)
    bMechanicalAiming=true
    DHPenetrationTable(0)=29.9
    DHPenetrationTable(1)=29.799999
    DHPenetrationTable(2)=29.6
    DHPenetrationTable(3)=27.6
    DHPenetrationTable(4)=26.9
    DHPenetrationTable(5)=24.4
    DHPenetrationTable(6)=22.1
    DHPenetrationTable(7)=21.299999
    DHPenetrationTable(8)=19.4
    DHPenetrationTable(9)=18.299999
    DHPenetrationTable(10)=17.6
    ShellDiameter=8.8
    bIsAlliedShell=false
    TracerEffect=class'DH_Effects.DH_OrangeTankShellTracer'
    ShellImpactDamage=class'DH_Vehicles.DH_JagdpantherCannonShellDamageAPCR'
    ImpactDamage=545
    BallisticCoefficient=1.527
    SpeedFudgeScale=0.4
    Speed=68198.0
    MaxSpeed=68198.0
    StaticMesh=StaticMesh'DH_Tracers.shells.German_shell'
    Tag="PzGr.40/43"
}
