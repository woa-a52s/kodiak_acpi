//
// Device hardware buttons
//

Device (BTNS)
{
    Name(_HID, "ACPI0011")

    Alias(\_SB.PSUB, _SUB)

    Name(_UID, 0)

    Method(_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // Power button?
            GpioInt(Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {7}

            // Volume Up button?
            GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {198}

            // Volume Down button?
            GpioInt(Edge, ActiveBoth, Exclusive, PullDown, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {6}
        })
        Return (RBUF)
    }

    Name (_DSD, Package (2)
    {
        ToUUID ("fa6bd625-9ce8-470d-a2c7-b3ca36c4282e"),
        Package()
        {
            Package (5) {0, 1, 0, 1, 0x0D}, // Portable Device Control Application Collection
            Package (5) {1, 0, 1, 1, 0x81},  // Sleep
            Package (5) {1, 1, 1, 0x0C, 0xE9},  // Volume Increment
            Package (5) {1, 0x02, 1, 0x0C, 0xEA}  // Volume Decrement
        }
    })
}
