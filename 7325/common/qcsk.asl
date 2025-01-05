//
// QCSK Device. (Not sure in which ASL file it should belong).
//
Device (QCSK)
{
    Name (_HID, "QCOM0AAC")
    Alias (\_SB.PSUB, _SUB)

    Method (_STA)
    {
        Return (0)
    }
}
