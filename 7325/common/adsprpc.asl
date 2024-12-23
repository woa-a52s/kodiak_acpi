//
// ADSP RPC Driver
//
Device (ARPC)
{
    Name (_DEP, Package (0x04)
    {
        \_SB.MMU0,
        \_SB.GLNK,
        \_SB.SCM0,
        \_SB.IMM0
    })
    Name (_HID, "QCOM0A5C")
    Alias (\_SB.PSUB, _SUB)
}

// ARPD AUDIO Daemon Driver
Device (ARPD)
{
    Name (_DEP, Package (0x02)
    {
        \_SB.ADSP,
        \_SB.ARPC
    })
    Name (_HID, "QCOM0A82")
    Alias (\_SB.PSUB, _SUB)
}
