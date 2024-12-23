//
// Qualcomm DIAG Bridge
//
Device (QCDB)
{
    Name (_HID, "QCOM06DE")
    Method (_SUB, 0, NotSerialized) { Return ("AGN00000") }

    Method (_STA, 0, NotSerialized) { Return (0x0F) }
}
