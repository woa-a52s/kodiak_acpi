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

    // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
    // derive a unique "Connector ID". The other fields are not really important.
    Name(_PLD, Package()
    {
        Buffer()
        {
            0x82,                      // Revision 2, ignore color.
            0x00, 0x00, 0x00,          // Color (ignored).
            0x00, 0x00, 0x00, 0x00,    // Width and height.
            0x04,
            0x1c,
            0x00, 0x00,
            0x00, 0x00, 0x00, 0x00,    // Not ejectable.
            0xff, 0xff, 0xff, 0xff     // Vert. and horiz. offsets not supplied.
        }
    })
}
