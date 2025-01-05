//
// SLIMbus controller
//
Device (SLM1)
{
    Name (_ADR, 0)
    Name (_CCA, 0)

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // SLIMbus register address space
            Memory32Fixed (ReadWrite, 0x03AC0000, 0x0002C000)

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {195}
        })
        Return (RBUF)
    }
}

Include("audio_bus.asl")
