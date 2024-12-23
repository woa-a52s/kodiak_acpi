//
// This file contains the Power Management IC (PMIC)
// ACPI device definitions, configuration and look-up tables.
//

//
// PMIC Battery Miniclass Driver
//
Device (PMBM) {
    Name (_HID, "QCOM0A2A")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)
    {
        \_SB.PMGK
    })

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, Buffer (0x02) {0x79, 0x00})
        Return (RBUF)
    }
}

//
//FGBCL Driver
//
Device (BCL1) {
    Name (_HID, "QCOM0A77")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)
    {
        \_SB.PMIC
    })

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
            GpioInt (Edge, ActiveLow, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0108}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0109}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x010A}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x010B}
            GpioInt (Edge, ActiveLow, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0160}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0161}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0162}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0163}
        })
        Return (RBUF)
    }

    // ACPI methods for Interrupt Name
    Method (BCLQ, 0, NotSerialized) {
        Name (CFG0, Package (0x08) {
            "PM3_BCLBIG_LVL0",
            "PM3_BCLBIG_LVL1",
            "PM3_BCLBIG_LVL2",
            "PM3_BCLBIG_BAN",
            "PM4_BCLBIG_LVL0",
            "PM4_BCLBIG_LVL1",
            "PM4_BCLBIG_LVL2",
            "PM4_BCLBIG_BAN"
        })
        Return (CFG0)
    }
}
