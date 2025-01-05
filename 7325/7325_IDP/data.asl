//
// data.asl: This file contains the Data Drivers
// ACPI device definitions, configuration and look-up tables.
//

//
// Rmnetbridge
//
Device (RMNT)
{
    Name (_HID, "QCOM0A95")
    Alias (\_SB.PSUB, _SUB)
}

//
// Modembridge Driver
//
Device (MBRG)
{
    Name (_HID, "QCOM0A07")
    Alias (\_SB.PSUB, _SUB)
}

//
// Remote AT Command Processor Driver
//
Device (RMAT)
{
    Name (_HID, "QCOM0A08")
    Alias (\_SB.PSUB, _SUB)
}

//
// dplbridge
//
Device (DPLB)
{
    Name (_HID, "QCOM0A70")
    Alias (\_SB.PSUB, _SUB)
}

//
// ccid
//
Device (CCID)
{
    Name (_HID, "QCOM0AA2")
    Alias (\_SB.PSUB, _SUB)
}

//
// dsby
//
Device (DSBY)
{
    Name (_HID, "QCOM06CD")
    Alias (\_SB.PSUB, _SUB)
}

//
// Rmnetbridge Scope
//
Scope (\_SB.RMNT)
{
    Method (_STA)
    {
        Return (0x0F)
    }
}

//
// Modembridge Scope
//
Scope (\_SB.MBRG)
{
    Method (_STA)
    {
        Return (0x0F)
    }
}

//
// Remote AT Command Processor Scope
//
Scope (\_SB.RMAT)
{
    Method (_STA)
    {
        Return (0x0F)
    }
}

//
// dplbridge Scope
//
Scope (\_SB.DPLB)
{
    Method (_STA)
    {
        Return (0x0F)
    }
}

//
// ccid Scope
//
Scope (\_SB.CCID)
{
    Method (_STA)
    {
        Return (0x0F)
    }
}

//
// dsby Scope
//
Scope (\_SB.DSBY)
{
    Method (_STA)
    {
        Return (0)
    }
}
