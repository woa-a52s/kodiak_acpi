//
// Core-BSP MPROC Drivers (IPC Router & GLINK)
//

//
// IPC Router
//
Device (IPC0)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.GLNK
    })
    Name (_HID, "QCOM0A0D")
    Alias (\_SB.PSUB, _SUB)
}

//
// GLINK
//
Device (GLNK)
{
    Name (_DEP, Package (0x02)
    {
        \_SB.IPCC,
        \_SB.RPEN
    })
    Name (_HID, "QCOM0A84")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
}
