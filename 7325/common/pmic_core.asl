//
// This file contains common Power Management IC (PMIC) ACPI device definitions
//

//
//PMIC KMDF
//
Device (PMIC)
{
    Name (_DEP, Package (One)
    {
        \_SB.SPMI
    })
    Name (_HID, "QCOM0A2B")
    Name (_CID, "PNP0CA3")
    Alias (\_SB.PSUB, _SUB)

    Method (PMCF, 0, NotSerialized) {
        Name (CFG0, Package (0x0B) {
            // PMIC Info
            0x0A, // Number of PMICs, must match the number of info packages
            Package (0x02) {Zero, 0x10},
            Package (0x02) {One, 0x10},
            Package (0x02) {0x02, 0x10},
            Package (0x02) {0x03, 0x10},
            Package (0x02) {0x04, 0x10},
            Package (0x02) {0x10, 0x10},
            Package (0x02) {0x10, 0x10},
            Package (0x02) {0x10, 0x10},
            Package (0x02) {0x10, 0x10},
            Package (0x02) {0x10, 0x10}
        })
        Return (CFG0)
    }
}

//
// PMIC LEICA Device
//
Device (PML0)
{
    Name (_HID, "QCOM0AD3")
    Name (_DEP, Package (0x02) {
        \_SB.I2C2,
        \_SB.PM01
    })

    Method (_STA)
    {
        Return (0xB) // Device is installable, functional & should not be visible in OSPM/Device Manager
    }

    Method (_SUB)
    {
        If (LEqual(SKUV, 0x1)) {
            Return ("SKU17280")
        }
        Return ("IDP07280")
    }

    Method (_CRS, 0x0, NotSerialized)
    {
        If (LEqual(SKUV, 0x1)) {
            Name (RBFC, ResourceTemplate()
            {
                I2cSerialBus(0x08, ControllerInitiated, 100000, AddressingMode7Bit, "\\_SB.I2C2", , , , )   // LEICA 1 CORE (slaveid 0)
                I2cSerialBus(0x09, ControllerInitiated, 100000, AddressingMode7Bit, "\\_SB.I2C2", , , , )   // LEICA 1 VREG (slaveid 1)
                I2cSerialBus(0x0C, ControllerInitiated, 100000, AddressingMode7Bit, "\\_SB.I2C2", , , , )   // LEICA 2 CORE (slaveid 0)
                I2cSerialBus(0x0D, ControllerInitiated, 100000, AddressingMode7Bit, "\\_SB.I2C2", , , , )   // LEICA 2 VREG (slaveid 1)
                GpioIo(Exclusive, PullNone, 0, 200, , "\\_SB.PM01", ,) {274}    // LEICA 1 RESET
                GpioIo(Exclusive, PullNone, 0, 200, , "\\_SB.PM01", ,) {275}    // LEICA 2 RESET
            })
            Return (RBFC)
        }
        Else {
            Name (RBUF, ResourceTemplate ()
            {
                I2cSerialBus(0x08, ControllerInitiated, 100000, AddressingMode7Bit, "\\_SB.I2C2", , , , )   // LEICA 2 CORE (slaveid 0)
                I2cSerialBus(0x09, ControllerInitiated, 100000, AddressingMode7Bit, "\\_SB.I2C2", , , , )   // LEICA 2 VREG (slaveid 1)
                GpioIo(Exclusive, PullNone, 0, 200, , "\\_SB.PM01", ,) {275}    // LEICA 2 RESET
            })
            Return (RBUF)
        }
    }
}

//
// PMIC GPIO
//
Device (PM01)
{
    Name (_HID, "QCOM0A2D")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, One)
    Name (_DEP, Package (One) {
        \_SB.PMIC
    })

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
            // QGIC Interrupt Resource
            // Register for SPMI Interrupt 513
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, ) {0x00000201,}
        })
        Return (RBUF)
    }

    // _DSM method to mark PM01's ActiveBoth interrupts
    Method(_DSM, 0x4, NotSerialized) {
        // DSM UUID
        switch(ToBuffer(Arg0))
        {
            // ACPI DSM UUID for GPIO
            case(ToUUID("4F248F40-D5E2-499F-834C-27758EA1CD3F"))
            {
                // DSM Function
                switch(ToInteger(Arg2))
                {
                    // Function 0: Return supported functions, based on revision
                    case(0)
                    {
                        // revision 0: function 0 & 1 are supported.
                        return (Buffer() {0x3})
                    }

                    // Function 1: For emulated ActiveBoth controllers, returns
                    //             a package of controller-relative pin numbers.
                    //             Each corresponding pin will have an initial
                    //             polarity of ActiveHigh.
                    case(1)
                    {
                        // Marks pins KPDPWR_ON, RESIN_ON to be ActiveHigh.
                        Return (Package() {0x7, 0x6})
                    }

                    default
                    {
                        // Functions 2+: not supported
                    }
                }
            }

            default
            {
                // No other GUIDs supported
                Return(Buffer(One) { 0x00 })
            }
        }
    }
}

//
// PMIC Apps Driver
//
Device (PMAP) {
    Name (_HID, "QCOM0A2C")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x03) {
        \_SB.PMIC,
        \_SB.ABD,
        \_SB.SCM0
    })
    //PMAP is dependent on ABD for operation region access

    // Get pseudo SPB controller port which is used to handle the ACPI operation region access
    Method (GEPT, 0, NotSerialized) {
        Name (BUFF, Buffer (0x04){})
        CreateByteField (BUFF, Zero, STAT)
        CreateWordField (BUFF, 0x02, DATA)
        DATA = 0x02
        Return (DATA)
    }

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, Buffer (0x02) {0x79, 0x00})
        Return (RBUF)
    }
}

//
// PMIC Apps Real Time Clock (RTC)
//
Device (PRTC) {
    Name (_HID, "ACPI000E")
    Name (_DEP, Package (One) {"\\_SB.PMAP"})       // PRTC is dependent on PMAP which implements the RTC Functions

    // Get the capabilities of the time and alarm device
    Method (_GCP, 0, NotSerialized)
    {
        Return (0x04)
    }

    Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
    {
        Connection (I2cSerialBus (0x0002, ControllerInitiated, 0x00000000, AddressingMode7Bit, "\\_SB.ABD", 0x00, ResourceConsumer, ,)),
        AccessAs (BufferAcc, AttribRawBytes (0x18)),
        FLD0,   192
    }

    Method (_GRT, 0, NotSerialized) // Get the Real time
    {
        Name (BUFF, Buffer (0x1A){})            // 18 bytes STAT(1), SIZE(1), Time(16)
        CreateField (BUFF, 0x10, 0x80, TME1)    // Create the TIME Field - For the time
        CreateField (BUFF, 0x90, 0x20, ACT1)    // Create the AC TIMER Field
        CreateField (BUFF, 0xB0, 0x20, ACW1)    // Create the AC Wake Alarm Status Field
        BUFF = FLD0
        Return (TME1)
    }

    Method (_SRT, 1, NotSerialized) // Set the Real time
    {
        Name (BUFF, Buffer (0x32){})            // 18 bytes STAT(1), SIZE(1), Time(16)
        CreateByteField (BUFF, Zero, STAT)      // Create the STAT Field
        CreateField (BUFF, 0x10, 0x80, TME1)    // Create the TIME Field - For the time
        CreateField (BUFF, 0x90, 0x20, ACT1)    // Create the AC TIMER Field
        CreateField (BUFF, 0xB0, 0x20, ACW1)    // Create the AC Wake Alarm Status Field
        ACT1 = Zero
        TME1 = Arg0
        ACW1 = Zero
        BUFF = FLD0 = BUFF                      // Write the transaction to the Psuedo I2C Port

        // Return the status
        If ((STAT != Zero)) {
            Return (One) // Call to OpRegion failed
        }
        Return (Zero) // success
    }
}
