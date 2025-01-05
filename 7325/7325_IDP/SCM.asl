//
// Secure Channel Manager (SCM) Driver
//
Device (SCM0)
{
    Name (_HID, "QCOM04DD")
    Name (_DEP, Package (0x1) {\_SB.PEP0})
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
}

Device (TLOG)
{
    Name (_HID, "QCOM0AE3")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
}

//
// TrEE Driver
//
Device (TREE)
{
    Name (_HID, "QCOM04DE")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveLow, Exclusive, PullUp, 0, "\\_SB.GIO0", 0, ResourceConsumer, , ) {136}
            Memory32Fixed (ReadWrite, 0xDEADBEEF, 0xBEEFDEAD, _Y00)
        })

        // Copy ACPI globals for Address for this subsystem into above package for use in driver
        CreateDWordField (RBUF, \_SB.TREE._CRS._Y00._BAS, TGCA)
        CreateDWordField (RBUF, \_SB.TREE._CRS._Y00._LEN, TGCL)
        TGCA = \_SB.TCMA
        TGCL = \_SB.TCML
        Return (RBUF)
    }
}
