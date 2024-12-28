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
    Name (_DEP, Package()
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
    Name (_DEP, Package()
    {
        \_SB.PMIC
    })

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
            GpioInt (Edge, ActiveLow, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {264}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {265}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {266}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {267}
            GpioInt (Edge, ActiveLow, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {352}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {353}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {354}
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0, "\\_SB.PM01", 0, ResourceConsumer, ,) {355}
        })
        Return (RBUF)
    }

    // ACPI methods for Interrupt Name
    Method (BCLQ) {
        Name (CFG0,
        Package() {
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
