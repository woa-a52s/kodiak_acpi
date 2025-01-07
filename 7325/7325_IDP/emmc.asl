//
// Storage - EMMC Driver
//
Device (SDC1)
{
    Method (_STA)
    {
        Return (0)
    }

    Name (_DEP, Package (0x1) {\_SB.PEP0})
    Name (_HID, "QCOM24BF")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
    Name (_CCA, 0)

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            // SDCC1 register address space
            Memory32Fixed (ReadWrite, 0x7C4000, 0x00001000)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {684}
        })
        Return (RBUF)
    }

    Device (EMMC) {
        Method (_ADR, 0, NotSerialized)
        {
            Return (0x08)
        }
        Method (_RMV, 0, NotSerialized)
        {
            Return (0)
        }
    }
    Method (_DIS, 0, NotSerialized) {}
}
