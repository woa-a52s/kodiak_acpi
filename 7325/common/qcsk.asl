Device (QCSK)
{
    Name (_HID, "QCOM0AAC")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (Zero)
    }
}
