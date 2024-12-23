//===========================================================================
//                           <Qdss.asl>
// DESCRIPTION
//   This file contans the resources needed by qdss driver.
//
//===========================================================================

//
// QDSS device
//
Device (QDSS)
{
    Name (_DEP, Package (0x02) {\_SB.PEP0, \_SB.MMU0})
    Name (_HID, "QCOM0A56")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)

    Method (_STA, 0, NotSerialized) { Return (0x0B) }

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            // Software uses QDSSETRIRQCTRL to set a byte count threshold for a counter that counts
            // the number of bytes of trace data the ETR has moved on its AXI interface. When the
            // threshold is reached an IRQ is fired.
            // reference : http://ipcatalog.qualcomm.com/irqs/chip/53/map/438
            //qdss_etrbytecnt_irq = SYS_apssQgicSPI[270] = 302
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000012E,} // The ETR byte counter interrupt
            Memory32Fixed (ReadWrite, 0x06000000, 0x0004A000,) // The QDSS_QDSS address space
            Memory32Fixed (ReadWrite, 0x16000000, 0x01000000,) // The QDSS_STM address
            Memory32Fixed (ReadWrite, 0x07000000, 0x00A00000,) // The QDSS_CPU address space.
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000043,} // L3 fault interrupt
        })
    }
}
