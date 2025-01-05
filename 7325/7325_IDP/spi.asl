//
// SPI14
//
Device (SP14)
{
    Name (_HID, "QCOM0A0E")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 14)
    Name (_DEP, Package() {\_SB.PEP0, \_SB.QGP1, \_SB.MMU0})
    Name (_CCA, 0)
    Name (_STR, Unicode ("QUP_1_SE_5"))

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00A94000, 0x00004000)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {390}
        })
        Return (RBUF)
    }
}
