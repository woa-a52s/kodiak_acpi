//
// Device hardware buttons
//

Device (BTNS)
{
    Name (_HID, "ACPI0011")

    Alias (\_SB.PSUB, _SUB)

    Name (_UID, Zero)

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Power button?
            GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0007}

            // Volume Up button?
            GpioInt (Edge, ActiveBoth, Exclusive, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x00C6}

            // Volume Down button?
            GpioInt (Edge, ActiveBoth, Exclusive, PullDown, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0006}
        })
        Return (RBUF)
    }

    Name (_DSD, Package (0x02)
    {
        ToUUID ("fa6bd625-9ce8-470d-a2c7-b3ca36c4282e"),
        Package (0x04)
        {
            Package (0x05) {Zero, One, Zero, One, 0x0D}, // Portable Device Control Application Collection
            Package (0x05) {One, Zero, One, One, 0x81},  // Sleep
            Package (0x05) {One, One, One, 0x0C, 0xE9},  // Volume Increment
            Package (0x05) {One, 0x02, One, 0x0C, 0xEA}  // Volume Decrement
        }
    })
}
