//
// This file contains the Audio Drivers
// ACPI device definitions, configuration and look-up tables.
//

//
//ADCM
//
Device (ADCM)
{
    Alias (\_SB.PSUB, _SUB)

    // Address object for acpi device enumerated device (ADCM) on parent device bus
    // Used to identify multiple child if present
    Name (_ADR, One)

    Name (_DEP, Package (0x02)
    {
        \_SB.MMU0,
        \_SB.IMM0
    })

    // _STA: Status
    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    // Child Method lists immediate child of ADCM - That is AUDD (Codec Driver)
    Method (CHLD, 0, NotSerialized)
    {
        Return (Package (One)
        {
            // Syntax: Name of Parent Device (ADCM)\\HID value (HID_XXX) of AUDD driver
            "ADCM\\QCOM0AC1"
        })
    }

    // AUCD Driver Configurations

    Device (AUCD)
    {
        // Address object for acpi device enumerated device (AUCD) on parent device bus
        // Used to identify multiple child if present
        Name (_ADR, Zero)
        Alias (\_SB.PSUB, _SUB)

        // _STA: Status
        Method (_STA, 0, NotSerialized)
        {
            Return (0x0F)
        }

        Method (_CRS, 0, NotSerialized)
        {
            Name (RBUF, ResourceTemplate ()
            {
                GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone, "\\_SB.GIO0", 0x00, ResourceConsumer, ,) {0x0053}
                GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone, "\\_SB.GIO0", 0x00, ResourceConsumer, ,) {0x003E}
                GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone, "\\_SB.GIO0", 0x00, ResourceConsumer, ,) {0x003F}
                GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000, "\\_SB.GIO0", 0x00, ResourceConsumer, , ) {0x0100}

                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000210,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000BB,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000CA,}
            })
            Return (RBUF)
        }
        Method (CHLD, 0, NotSerialized)
        {

            Name (CH, Package (One)
            {
                // Syntax: Name of Parent Device (AUCD)\\HID value (HID_XXX) of QCOM0A29 driver
                "AUCD\\QCOM0A29"
            })
            Return (CH)
        }

        // Miniport Device Configurations
        Device (QCRT)
        {
            // _STA: Status
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
            // Address object for acpi device enumerated device (QCRT) on parent device bus
            // Used to identify multiple child if present
            // Since, QCRT is first child of AUCD, we have assigned slot-0
            Name (_ADR, Zero)
        } // Miniport Device Configurations end
    } // AUCD Driver Configurations end
} // end Device (ADCM)
