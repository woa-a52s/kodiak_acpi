//
// This file contains the GPS ACPI device definitions.
//

//
// Qualcomm GPS driver
//
Device (GPS)
{
    Name (_DEP, Package (One)
    {
        \_SB.GLNK
    })

    Name (_HID, "QCOM0A6C")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)
}

Scope (\_SB.GPS)
{
    Method (_STA, 0, NotSerialized)
    {
        If ((SKUV == 0x04))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}
