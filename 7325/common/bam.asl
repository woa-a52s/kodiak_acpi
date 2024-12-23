//
// This file contains the Bus Access Modules (BAM)
// ACPI device definitions and pipe configurations
//

//
//  Device Map:
//    0x2401 - BAM
//
//  List of Devices
//    BAM1  - CRYPTO1
//    BAM5  - SLIMBUS1
//    BAME  - QDSS
//    BAMF  - USB3.0 primary
Device (BAM1)
{
    Name (_HID, "QCOM0A0A")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, One)
    Name (_CCA, Zero)
    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // CRYPTO0 register address space
            Memory32Fixed (ReadWrite, 0x01DC4000, 0x00024000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x00000130,}
        })
        Return (RBUF)
    }
}

Device (BAM5)
{
    Name (_HID, "QCOM0A0A")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x05)
    Name (_CCA, Zero)
    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // AUD_SLIMBUS register address space
            Memory32Fixed (ReadWrite, 0x03A84000, 0x00032000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x000000C4,}
        })
        Return (RBUF)
    }
}

Device (BAME)
{
    Name (_HID, "QCOM0A0A")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x0E)
    Name (_CCA, Zero)
    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // QDSS register address space
            Memory32Fixed (ReadWrite, 0x06064000, 0x00015000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x000000C7,}
        })
        Return (RBUF)
    }
}

Device (BAMF)
{
    Name (_HID, "QCOM0A0A")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x0F)
    Name (_CCA, Zero)
    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // USB30 PRI register address space
            Memory32Fixed (ReadWrite, 0x0A704000, 0x00017000,)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x000000A4,}
        })
        Return (RBUF)
    }
}
