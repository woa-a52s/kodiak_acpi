//
// This file contains the QUPv3 ACPI device definitions.
// GPI is the interface used by buses drivers for different peripherals.
//

//
//  Device Map:
//    QGPI
//
//  List of Devices

Device (QGP0)
{
    Name (_HID, "QCOM0A88")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)
    Name (_CCA, Zero)

    Method (_CRS, 0, Serialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // QUPV3_0 address space
            Memory32Fixed (ReadWrite, 0x00904000, 0x00050000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x00000114,}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x00000115,}
        })
        Return (RBUF)
    }
}

Device (QGP1)
{
    Name (_HID, "QCOM0A88")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, One)
    Name (_CCA, Zero)

    Method (_CRS, 0, Serialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // QUPV3_1 address space
            Memory32Fixed (ReadWrite, 0x00A04000, 0x00050000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x00000137,}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x00000138,}
        })
        Return (RBUF)
    }
}