//==============================================================================
//                           <cust_camera.asl>
// DESCRIPTION
//   This file contains resources (such as memory address, GPIOs, etc.) and
//   methods needed by camera drivers.
//
//==============================================================================

Include("cust_camera_exasoc.asl")

//
// CAMERA MIPI CSI
//
Device (MPCS)
{
    Name (_DEP, Package (One)
    {
        \_SB.CAMP
    })

    Name (_HID, "QCOM0A98")
    Name (_UID, 0x18)
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0ACE0000, 0x00002000,)                              // PHY 0 memory
            Memory32Fixed (ReadWrite, 0x0ACE2000, 0x00002000,)                              // PHY 1 memory
            Memory32Fixed (ReadWrite, 0x0ACE4000, 0x00002000,)                              // PHY 2 memory
            Memory32Fixed (ReadWrite, 0x0ACE6000, 0x00002000,)                              // PHY 3 memory
            Memory32Fixed (ReadWrite, 0x0ACE8000, 0x00002000,)                              // PHY 4 memory

            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001FD,}    // PHY 0 interrupt, csiphy_0_irq
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001FE,}    // PHY 1 interrupt, csiphy_0_irq
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001FF,}    // PHY 2 interrupt, csiphy_0_irq
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001E0,}    // PHY 3 interrupt, csiphy_0_irq
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000009A,}    // PHY 4 interrupt, csiphy_0_irq
        })

        Return (RBUF)
    }

    // PERF, EBUF left blank intentionally as only F state support required at this point.
    // PEP Proxy is not needed as it is there for D state support.
}

//
// JPEG ENCODER (JPGE)
//   JPEG 0: a dedicated JPEG encode instance;
//   JPEG 3: a DMA instance (for downscaling only, not for encoding).
//   Each JPEG instance is controlled indpendently; having its own set of
//   registers for control and hardware operation, and its own core clock.
//
Device (JPGE)
{
    Name (_DEP, Package (0x02)
    {
        \_SB.CAMP,
        \_SB.MMU0
    })

    Name (_HID, "QCOM0A33")
    Name (_UID, 0x17)
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0AC4E000, 0x00004000, )
            Memory32Fixed (ReadWrite, 0x0AC52000, 0x00004000, )

            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) { 0x000001FA, }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) { 0x000001FB, }
        })
        Return (RBUF)
    }
}

//
// VFE
//
Device (VFE0)
{
    Name (_DEP, Package (0x03)
    {
        \_SB.MMU0,
        \_SB.PEP0,
        \_SB.CAMP
    })

    Name (_HID, "QCOM0A25")
    Name (_UID, 0x16)
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            //
            Memory32Fixed (ReadWrite, 0x0AC00000, 0x00020000,)

            //
            Memory32Fixed (ReadWrite, 0x0AC48000, 0x00000200,)

            //
            Memory32Fixed (ReadWrite, 0x0AC48200, 0x00000200,)

            //
            Memory32Fixed (ReadWrite, 0x0AC48400, 0x00000200,)

            //
            Memory32Fixed (ReadWrite, 0x0AC48600, 0x00000200,)

            //
            Memory32Fixed (ReadWrite, 0x0AC6B000, 0x00001000,)

            //
            Memory32Fixed (ReadOnly, 0x0AC6F000, 0x00008000,)

            //
            Memory32Fixed (ReadOnly, 0x0AC87000, 0x0000A000,)
            //
            Memory32Fixed (ReadWrite, 0x0ACC4000, 0x00005000,)

            //
            Memory32Fixed (ReadWrite, 0x0ACCB000, 0x00005000,)

            // ICP FW
            Memory32Fixed (ReadWrite, 0x85C00000, 0x00500000,)


            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001ED,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001EE,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001E3,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000199,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001EF,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001F1,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001F3,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002A1,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001F5,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000188,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001FC,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001F0,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001F2,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002A0,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000001F4,}

            //
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000187,}

        })
        Return (RBUF)
    }
}
