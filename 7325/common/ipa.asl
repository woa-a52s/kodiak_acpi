//
// This file contains the Bus Access Modules (BAM)
// ACPI device definitions and pipe configurations
//

//
//  Device Map:
//    IPA
//
//  List of Devices

Device (IPA)
{
    Name (_DEP, Package (0x06)
    {
        \_SB.PEP0,
        \_SB.RPEN,
        \_SB.TREE,
        \_SB.MMU0,
        \_SB.GLNK,
        \_SB.IPC0
    })
    Name (_HID, "QCOM0A6A")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            // IPA_PHYSICAL_ADDRESS, IPA_MEM_SIZE
            Memory32Fixed (ReadWrite, 0x01E40000, 0x00060000,)

            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002AE,}

            Memory32Fixed (ReadWrite, 0x01E00000, 0x00030000,)

            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001D0,}
        })
    }

    Device (NTAD)
    {
        Name (_ADR, One)
    }
}

Scope (\_SB.IPA)
{
    Method (_STA, 0, NotSerialized)
    {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}
