//
// This file contains the sensor ACPI device definitions.
//


// Qualcomm Sensor Collection
Device (SEN2)
{
    Name (_DEP, Package (0x03)
    {
        \_SB.IPC0, // IPC Router used by QMI
        \_SB.ADSP, // ADSP loads the sensors image
        \_SB.ARPC  // Dependency on FastRPC
    })
    Name (_HID, "QCOM0A93")
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "QCOM0A67")

    Name (_PLD, Package (One)
    {
        Buffer (0x14)
        {
            0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x04, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0xFF, 0xFF, 0xFF, 0xFF
        }
    })
}
