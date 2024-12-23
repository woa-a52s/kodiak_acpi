//
// QWPP device
//

Device (QWPP)
{
    Name (_DEP, Package (One) {\_SB.PEP0})

    Name (_HID, "QCOM0A79")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0B) // Loaded, but hidden
    }

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x09000000, 0x00600000,)
            Memory32Fixed (ReadWrite, 0x09680000, 0x00070000,)
        })
    }
}
