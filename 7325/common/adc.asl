/*============================================================================
 FILE:         adc.asl                                                       *

 OVERVIEW:     This file contains the board-specific configuration info for
 ADC1 - qcadc analog-to-digital converter (ADC): ACPI device
 definitions, common settings, etc.

 DEPENDENCIES: None

 ============================================================================*/

/*----------------------------------------------------------------------------
 * QCADC
 * -------------------------------------------------------------------------*/

Device(ADC1)
{
    /*----------------------------------------------------------------------------
     * Dependencies
     * -------------------------------------------------------------------------*/
    Name(_DEP, Package (0x02)
    {
        \_SB.SPMI,
        \_SB.PMIC
    })

    /*----------------------------------------------------------------------------
     * HID
     * -------------------------------------------------------------------------*/
    Name(_HID, "QCOM0A11")
    Name(_UID, 0)
    Alias(\_SB.PSUB, _SUB)

    /*----------------------------------------------------------------------------
     * ADC Resources
     * -------------------------------------------------------------------------*/
    Method(_CRS)
    {
        /*
         * Interrupts
         */
        Name(INTB, ResourceTemplate ()
        {

            GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, , RawDataBuffer (0x01){0x02}) {0x0020}
            GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, , RawDataBuffer (0x01){0x02}) {0x0028}
        })

        /*
         * SPMI peripherals
         */
        Name(NAM, Buffer () {"\\_SB.SPMI"})

        // VAdc
        Name(VUSR, Buffer ()
        {
            0x8E,       // SPB Descriptor
            0x13, 0x00, // Length including NAM above
            0x01,       // +0x00 SPB Descriptor Revision
            0x00,       // +0x01 Resource Source Index
            0xC1,       // +0x02 Bus type - vendor defined values are in the range 0xc0-0xff
            0x02,       // +0x03 Consumer + controller initiated
            0x00, 0x31, // +0x04 Type specific flags . Slave id, Upper8 bit address
            0x01,       // +0x06 Type specific revision
            0x00, 0x00  // +0x07 type specific data length
        })

        // VAdc TM
        Name(VBTM, Buffer ()
        {
            0x8E,       // SPB Descriptor
            0x13, 0x00, // Length including NAM above
            0x01,       // +0x00 SPB Descriptor Revision
            0x00,       // +0x01 Resource Source Index
            0xC1,       // +0x02 Bus type - vendor defined values are in the range 0xc0-0xff
            0x02,       // +0x03 Consumer + controller initiated
            0x00, 0x34, // +0x04 Type specific flags . Slave id, Upper8 bit address
            0x01,       // +0x06 Type specific revision
            0x00, 0x00  // +0x07 type specific data length
        })

        Concatenate(VUSR, NAM, Local1)
        Concatenate(VBTM, NAM, Local2)
        Concatenate(Local1, Local2, Local3)
        Concatenate(Local3, INTB, Local0)

        Return (Local0)
    }
}
