//==============================================================================
// Darkest Hour: Europe '44-'45
// Darklight Games (c) 2008-2019
//==============================================================================

class DH_ISU152CannonShell extends DHSovietCannonShell;

defaultproperties
{
    ShellDiameter=15.2
    BallisticCoefficient=4.4
    Speed=36211.0 // 600 m/s
    MaxSpeed=36211.0
    ImpactDamage=3000
    StaticMesh=StaticMesh'WeaponPickupSM.shells.122mm_shell'

    DHPenetrationTable(0)=16.5 // 100m
    DHPenetrationTable(1)=16.0 // 250m
    DHPenetrationTable(2)=15.2 // 500m
    DHPenetrationTable(3)=14.5
    DHPenetrationTable(4)=13.7 // 1000m
    DHPenetrationTable(5)=13.0
    DHPenetrationTable(6)=12.4 // 1500m
    DHPenetrationTable(7)=11.7
    DHPenetrationTable(8)=11.1  // 2000m
    DHPenetrationTable(9)=10.0
    DHPenetrationTable(10)=9.0 // 3000m

    bOpticalAiming=true
    OpticalRanges(0)=(Range=0,RangeValue=0.411)
    OpticalRanges(1)=(Range=100,RangeValue=0.414)
    OpticalRanges(2)=(Range=200,RangeValue=0.418)
    OpticalRanges(3)=(Range=300,RangeValue=0.4205)
    OpticalRanges(4)=(Range=400,RangeValue=0.423)
    OpticalRanges(5)=(Range=500,RangeValue=0.427)
    OpticalRanges(6)=(Range=600,RangeValue=0.430)
    OpticalRanges(7)=(Range=700,RangeValue=0.434)
    OpticalRanges(8)=(Range=800,RangeValue=0.4375)
    OpticalRanges(9)=(Range=900,RangeValue=0.442)
    OpticalRanges(10)=(Range=1000,RangeValue=0.446)
    OpticalRanges(11)=(Range=1200,RangeValue=0.454)
    OpticalRanges(12)=(Range=1400,RangeValue=0.4635)
    OpticalRanges(13)=(Range=1600,RangeValue=0.4745)
    OpticalRanges(14)=(Range=1800,RangeValue=0.4875)
    OpticalRanges(15)=(Range=2000,RangeValue=0.500)
    OpticalRanges(16)=(Range=2200,RangeValue=0.513)
    OpticalRanges(17)=(Range=2400,RangeValue=0.527)
    OpticalRanges(18)=(Range=2600,RangeValue=0.542)
    OpticalRanges(19)=(Range=2800,RangeValue=0.5578)
    OpticalRanges(20)=(Range=3000,RangeValue=0.5745)
    OpticalRanges(21)=(Range=3200,RangeValue=0.592)
    OpticalRanges(22)=(Range=3400,RangeValue=0.612)
    OpticalRanges(23)=(Range=3600,RangeValue=0.629)
    OpticalRanges(24)=(Range=3800,RangeValue=0.6487)
    OpticalRanges(25)=(Range=4000,RangeValue=0.6675)
    OpticalRanges(26)=(Range=4200,RangeValue=0.6877)
    OpticalRanges(27)=(Range=4400,RangeValue=0.7064)
    OpticalRanges(28)=(Range=4600,RangeValue=0.726)
    OpticalRanges(29)=(Range=4800,RangeValue=0.7454)
    OpticalRanges(30)=(Range=5000,RangeValue=0.7657)
    OpticalRanges(31)=(Range=5200,RangeValue=0.786)
    OpticalRanges(32)=(Range=5400,RangeValue=0.805)
    OpticalRanges(33)=(Range=5600,RangeValue=0.824)
    OpticalRanges(34)=(Range=5800,RangeValue=0.843)
}
