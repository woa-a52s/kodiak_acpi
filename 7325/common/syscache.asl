//
// System Cache Driver
//
Device (LLC)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.PEP0
    })
    Name (_HID, "QCOM0A83")
    Alias (\_SB.PSUB, _SUB)
    Alias (\_SB.SVMJ, _HRV)

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x09600000, 0x50000)
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {298}
        })
    }
}
