//
//
//  Please note that not all the SE engine instances (I2C/SPI/UART) from below asl file can be used directly by icluding in the client ACPI,
//  The corresponding Access Control needs to be enabled from TZ side to get the SE/usecase working End 2 End.
//
//

//
// QUPV3_ID0_SE1
//
Device (I2C2)
{
    Name (_HID, "QCOM0A10")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x02)
    Name (_DEP, Package (0x03) { \_SB.PEP0, \_SB.QGP0, \_SB.MMU0 })
    Name (_CCA, 0)
    Name (_STR, Unicode ("QUP_0_SE_1,Shared"))

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00984000, 0x00004000)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {634}
        })
        Return (RBUF)
    }
}

//
// QUPV3_ID0_SE5  (UART Debug port)
//
Device (UARD)
{
    Name (_HID, "QCOM0A16")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x06)
    Name (_DEP, Package (0x1) { \_SB.PEP0 })
    Name (_CCA, 0)
    Name (_STR, Unicode ("QUP_0_SE_5,DBG"))

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00994000, 0x00004000)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {638}
            GpioInt (Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0", 0, ResourceConsumer, ,) {23} // UART RX
        })
        Return (RBUF)
    }
}

//
// QUPV3_ID0_SE7 (attached to BT SOC)
//
Device (UAR8)
{
    Name (_HID, "QCOM0A16")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x08)
    Name (_DEP, Package (0x1) { \_SB.PEP0 })
    Name (_CCA, 0)
    Name (_STR, Unicode ("QUP_0_SE_7,4W,BT"))

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0099C000, 0x00004000,)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {640,}
            GpioInt (Edge, ActiveLow, Exclusive, PullDown, 0, "\\_SB.GIO0", 0, ResourceConsumer, ,) {31} // UART RX
        })
        Return (RBUF)
    }

    Method (_STA)
    {
        Return (0x0B)
    }
}

//
// I2C10 - "Core I2C Bus"
//
Device (IC10)
{
    Name (_HID, "QCOM0A10")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x0A)
    Name (_DEP, Package (0x1) { \_SB.PEP0 })
    Name (_CCA, 0)
    Name (_STR, Unicode ("QUP_1_SE_1"))

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00A84000, 0x00004000)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {386}
        })
        Return (RBUF)
    }
}

//
// I2C11 - "Core I2C Bus"
//
Device (IC11)
{
    Name (_HID, "QCOM0A10")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0x0B)
    Name (_DEP, Package (0x1) { \_SB.PEP0 })
    Name (_CCA, 0)
    Name (_STR, Unicode ("QUP_1_SE_2"))

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x00A88000, 0x00004000)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {387}
        })
        Return (RBUF)
    }
}

Include("spi.asl")

Include("i2c.asl")
