Device (SSVC)
{
    Name (_DEP, Package (0x02)  // _DEP: Dependencies
    {
        \_SB.IPC0,
        \_SB.QDIG
    })
    Name (_HID, "QCOM06DB")  // _HID: Hardware ID
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "ACPIQCOM06DB")  // _CID: Compatible ID
    Name (_UID, Zero)  // _UID: Unique ID
    Method (_STA, 0, NotSerialized)  // _STA: Status
    {
        Return (0x0F)
    }
}
