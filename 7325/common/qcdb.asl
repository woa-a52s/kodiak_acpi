//
// Qualcomm DIAG Bridge
//
Device (QCDB)
{
    Name (_HID, "QCOM06DE")

    Method (_SUB)
    {
        Return ("AGN00000")
    }
    Method (_STA)
    {
        Return (0xF)
    }
}
