//
// SSM Driver
//
Device (SSM)
{
    Name (_DEP, Package (0x02)
    {
        \_SB.GLNK,
        \_SB.TREE
    })
    Name (_HID, "QCOM0A14")
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (Zero)
    }
}
