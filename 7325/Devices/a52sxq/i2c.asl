//
// I2C14 device
//
Device (IC14)
{
    Name (_HID, "QCOM0A10")
    Alias(\_SB.PSUB, _SUB)
    Name (_UID, 0x0e)
    Name (_DEP, Package()
    {
        \_SB_.PEP0,
        \_SB_.QGP1,
        \_SB_.MMU0
    })
    Name (_CCA, 0)
    Name (_STR, Unicode ("QUP_1_SE_5"))
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00a94000, 0x00004000)
            Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {0x186} // i2c node "interrupts = <0x00 0x166 0x04>;" 0x166 + 0x20 = 0x186
        })
        Return (RBUF)
    }
}
