//
// This file contains the GPS ACPI device definitions.
//

//
// Qualcomm GPS driver
//
Device (GPS)
{
    Name (_DEP, Package ()
    {
        \_SB.GLNK
    })

    Name (_HID, "QCOM0A6C")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
}

Scope (\_SB.GPS)
{
    Method (_STA)
    {
        Return (0x0F)
    }
}
