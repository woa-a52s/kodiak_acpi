//
// Storage - SD card
//
Device (SDC2)
{
    Name (_DEP, Package (0x02) {\_SB.PEP0, \_SB.GIO0})
    Name (_HID, "QCOM2466")
    Name (_UID, 1)
    Name (_CCA, 0)
    Alias (\_SB.PSUB, _SUB)

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            // SDCC2 register address space
            Memory32Fixed (ReadWrite, 0x8804000, 0x00001000)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {239}

            // Card detect GPIO
            GpioInt (Edge, ActiveBoth, SharedAndWake, PullUp, 5000, "\\_SB.GIO0", 0, ResourceConsumer, ,) {192}
            GpioIo (Shared, PullUp, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, ,) {91}
        })
        Return (RBUF)
    }

    Method (_DIS)
    {
        // Place holder to allow disable
    }
    Method (_STA)
    {
        Return (0)
    }
}
