//
// This file contains the Audio Drivers
// ACPI device definitions, configuration and look-up tables.
//

//
//ADCM
//
Device (ADCM)
{

    // Address object for acpi device enumerated device (ADCM) on parent device bus
    // Used to identify multiple child if present
    Name (_ADR, 1)

    Name (_DEP, Package()
    {
        \_SB.MMU0,
        \_SB.IMM0
    })

    // _STA: Status
    Method (_STA)
    {
        Return (0x0F)
    }

    // Child Method lists immediate child of ADCM - That is AUDD (Codec Driver)
    Method (CHLD)
    {
        Return (Package()
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
        Name (_ADR, 0)

        // _STA: Status
        Method (_STA)
        {
            Return (0x0F)
        }

        Method (_CRS, 0, NotSerialized)
        {
            Name (RBUF, ResourceTemplate ()
            {
                GpioIo (Exclusive, PullNone, 0, 1600, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, ,) {83}
                GpioIo (Exclusive, PullNone, 0, 1600, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, ,) {62}
                GpioIo (Exclusive, PullNone, 0, 1600, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, ,) {63}
                GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0, "\\_SB.GIO0", 0, ResourceConsumer, , ) {256}

                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {528}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {187}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {202}
            })
            Return (RBUF)
        }
        Method (CHLD)
        {

            Name (CH, Package()
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
            Method (_STA)
            {
                Return (0x0F)
            }
            // Address object for acpi device enumerated device (QCRT) on parent device bus
            // Used to identify multiple child if present
            // Since, QCRT is first child of AUCD, we have assigned slot-0
            Name (_ADR, 0)
        } // Miniport Device Configurations end
    } // AUCD Driver Configurations end
} // end Device (ADCM)
