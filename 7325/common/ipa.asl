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
    Name (_UID, 0)

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            // IPA_PHYSICAL_ADDRESS, IPA_MEM_SIZE
            Memory32Fixed (ReadWrite, 0x01E40000, 0x00060000)
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {686}
            Memory32Fixed (ReadWrite, 0x01E00000, 0x00030000)
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {464}
        })
    }

    Device (NTAD)
    {
        Name (_ADR, 1)
    }
}

Scope (\_SB.IPA)
{
    Method (_STA)
    {
        Return (0x0F)
    }
}
