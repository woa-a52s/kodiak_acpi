//
// TLMM controller.
//
Device (GIO0)
{
    Name (_HID, "QCOM0A0C")
    Name (_UID, 0)
    Alias (\_SB.PSUB, _SUB)

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            // TLMM register address space
            Memory32Fixed (ReadWrite, 0x0F100000, 0x00300000)

            // Summary Interrupt shared by all banks
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared   , , , ) {240}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared   , , , ) {240}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared   , , , ) {240}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared   , , , ) {558}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared   , , , ) {552}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {645}
        })
        Return (RBUF)
    }

    // ACPI method to return Num pins
    Method (OFNI, 0, NotSerialized) {
        Name (RBUF, Buffer ()
        {
                0xAF,   // 0: TOTAL_GPIO_PINS
                0x00    // 1: TOTAL_GPIO_PINS
        })
        Return (RBUF)
    }

    Name (GABL, 0)
    Method(_REG, 0x2, NotSerialized)
    {
        If(LEqual(Arg0, 0x8))
        {
            Store(Arg1, GABL)
        }
    }

    // ACPI event-based notification method for detecting HDMI hot plug-in event
    Method (_AEI, 0, NotSerialized)
    {
        Name (RBF0, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveHigh, Exclusive, PullDown, 500, "\\_SB.GIO0", 0, ResourceConsumer, ,) {3}
        })
        Return (RBF0)
    }

    Method (_EBD, 0, NotSerialized) {
        Notify (\_SB.GPU0, 0x92)
    }

    Method (_DSM, 4, NotSerialized) {
        If ((Arg0 == ToUUID ("4f248f40-d5e2-499f-834c-27758ea1cd3f") )) {
            While (One) {
                Name (_T_0, Zero)
                _T_0 = Arg2
                If ((_T_0 == Zero)) {
                    Return (Buffer (One) {0x03})
                }
                ElseIf ((_T_0 == One)) {
                    Return (Package (One) {0x0100})
                }
                Else {
                    BreakPoint
                }
                Break
            }
        }
        Else {
            Return (Buffer (One) {0x00})
        }
    }
}
