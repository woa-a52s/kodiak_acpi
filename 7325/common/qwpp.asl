//
// QWPP device
//

Device (QWPP)
{
    Name (_DEP, Package () {\_SB.PEP0})

    Name (_HID, "QCOM0A79")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)

    Method (_STA)
    {
        Return (0xB) // Loaded, but hidden
    }

    Method (_CRS, 0, NotSerialized)
    {
        Return
        (
            ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x09000000, 0x600000)
                Memory32Fixed (ReadWrite, 0x09680000, 0x70000)
            }
        )
    }
}
