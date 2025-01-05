//
// WPSS WLAN
//
Device (QWLN)
{
    Name (_ADR, 0)
    Name (_DEP, Package (0x03)
    {
        \_SB.PEP0,
        \_SB.MMU0,
        \_SB.IPC0
    })

    Name (_PRW, Package () {0, 0})  // wakeable from S0
    Name (_S0W, 3)                  // S0 should put device in D2 for wake
    Name (_S4W, 3)                  // all other Sx (just in case) should also wake from D2
    Name (_PRR, Package (0x1) { \_SB.WPSS.QWLN.WRST }) // Power resource reference for device reset and recovery.

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Shared memory
            Memory32Fixed (ReadWrite, 0x17A10040, 0x00000010)
            Memory32Fixed (ReadWrite, 0x80C00000, 0x00C00000)

            // CE interrupts
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {800} // CE0  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {801} // CE1  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {802} // CE2  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {803} // CE3  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {804} // CE4  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {805} // CE5  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {806} // CE6  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {807} // CE7  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {808} // CE8  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {809} // CE9  interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {810} // CE10 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {811} // CE11 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {812} // CE12 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {813} // CE13 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {814} // CE14 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {815} // CE15 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {816} // CE16 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {817} // CE17 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {818} // CE18 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {819} // CE19 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {820} // CE20 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {821} // CE21 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {822} // CE22 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {823} // CE23 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {824} // CE24 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {825} // CE25 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {826} // CE26 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {827} // CE27 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, ExclusiveAndWake, , , ) {828} // CE28 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {829} // CE29 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {830} // CE30 interrupt
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive       , , , ) {831} // CE31 interrupt
        })
        Return (RBUF)
    }

    PowerResource (WRST, 0x5, 0x0)
    {
        //
        // Dummy _ON, _OFF, and _STA methods. All power resources must have these
        // three defined.
        //
        Method (_STA)
        {
            Return (0x0F)
        }

        Method (_ON, 0, NotSerialized) {}
        Method (_OFF, 0, NotSerialized) {}
        Method (_RST, 0, NotSerialized) {}
    }
}
