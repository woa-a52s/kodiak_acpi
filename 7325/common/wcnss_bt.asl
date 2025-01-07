//
// This file contains ACPI definitions, configuration and look-up tables
// for Bluetooth Device
//

//
// Qualcomm FastConnect 6700 WCN6750 Bluetooth device
//
Device (BTH0)
{
    Name (_HID, "QCOM0A6B")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x03)
    {
        \_SB.PEP0,
        \_SB.PMIC,
        \_SB.UAR8   // depends on UART ACPI definition
    })
    Name (_PRW, Package (0x02)
    {
        Zero,
        Zero
    })
    Name (_S4W, 0x02)
    Name (_S0W, 0x02)
    Method (_CRS, 0, NotSerialized)
    {
        Name (PBUF, ResourceTemplate ()
        {
            UartSerialBus(
                0x0001C200,                 // ConnectionSpeed
                DataBitsEight,              // BitsPerByte         (defaults to DataBitsEight)
                StopBitsOne,                // StopBits            (defaults to StopBitsOne)
                0xC0,                       // LinesInUse
                LittleEndian,               // IsBigEndian         (defaults to LittleEndian)
                ParityTypeNone,             // Parity              (defaults to ParityTypeNone)
                FlowControlHardware,        // FlowControl         (defaults to FlowControlNone)
                0x0020,                     // ReceiveBufferSize
                0x0020,                     // TransmitBufferSize
                "\\_SB.UAR8",               // depends on UART ACPI definition
                0x00,                       // ResourceSourceIndex (defaults to 0)
                ResourceConsumer,           // ResourceUsage       (defaults to ResourceConsumer)
                ,                           // DescriptorName
                )

            GpioIo (Exclusive, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, ,) {85}
        })
        Return (PBUF)
    }
    Method (_STA)
    {
        Return (0x0F)
    }
} // End BTH0
