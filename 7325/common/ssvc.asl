//
// QcShutdownSvc Device (Not sure in which ASL file it should belong).
//
Device (SSVC)
{
    Name (_DEP, Package (0x02)
    {
        \_SB.IPC0, // IPC Router used by QMI, in turn depends on GLINK
        \_SB.QDIG  // Qualcomm DIAG service
    })
    Name (_HID, "QCOM06DB")
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "ACPIQCOM06DB")
    Name (_UID, 0)

    Method (_STA)
    {
        Return (0x0F)
    }
}
