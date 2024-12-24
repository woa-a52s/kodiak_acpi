Device(BAT)
{
    Name (_HID, "SM5714")
    Name (_UID, 1)
    Name (_DEP, Package(0x1)
    {
        \_SB_.I2C4
    })
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            I2CSerialBus (0x49,, 100000, AddressingMode7Bit, "\\_SB.I2C4",,,,)
            GpioInt (Level, ActiveBoth, Exclusive, PullNone, 0, "\\_SB.GIO0")
            {
                // Pin list
                0x36 // GPIO pin (gpio54)

            }
        })
        Return (RBUF)
    }
}
