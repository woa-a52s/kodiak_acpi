//
// Storage - SD card 1
//
Device (SDC1)
{
    Method (_STA, 0, NotSerialized) { Return (Zero) }

    Name (_DEP, Package (One) {\_SB.PEP0})
    Name (_HID, "QCOM24BF")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)
    Name (_CCA, Zero)

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
            // SDCC2 register address space
            Memory32Fixed (ReadWrite, 0x007C4000, 0x00001000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x000002AC,}
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
            Return (Zero)
        }
    }
    Method (_DIS, 0, NotSerialized) {}
}

//
// Storage - SD card 2
//
Device (SDC2)
{
    Name (_DEP, Package (0x02) {\_SB.PEP0, \_SB.GIO0})
    Name (_HID, "QCOM2466")
    Name (_UID, One)
    Name (_CCA, Zero)
    Alias (\_SB.PSUB, _SUB)

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate () {
            // SDCC2 register address space
            Memory32Fixed (ReadWrite, 0x08804000, 0x00001000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x000000EF,}

            // Card detect GPIO
            GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 0x1388, "\\_SB.GIO0", 0x00, ResourceConsumer, ,) {0x00C0}
            GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone, "\\_SB.GIO0", 0x00, ResourceConsumer, ,) {0x005B}
        })
        Return (RBUF)
    }

    Method (_DIS, 0, NotSerialized)
    {
        // Place holder to allow disable
    }
    Method (_STA, 0, NotSerialized)
    {
        Return (Zero)
    }
}
