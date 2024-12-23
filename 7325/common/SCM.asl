//
// Secure Channel Manager (SCM) Driver
//
Device (SCM0)
{
    Name (_HID, "QCOM04DD")
    Name (_DEP, Package (One) {\_SB.PEP0})
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)
}

Device (TLOG)
{
    Name (_HID, "QCOM0AE3")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)
}

//
// TrEE Driver
//
Device (TREE)
{
    Name (_HID, "QCOM04DE")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveLow, Exclusive, PullUp, 0x0000, "\\_SB.GIO0", 0x00, ResourceConsumer, , ) {0x0088}
            Memory32Fixed (ReadWrite, 0xDEADBEEF, 0xBEEFDEAD, _Y00)
        })

        CreateDWordField (RBUF, \_SB.TREE._CRS._Y00._BAS, TGCA)
        CreateDWordField (RBUF, \_SB.TREE._CRS._Y00._LEN, TGCL)
        TGCA = \_SB.TCMA
        TGCL = \_SB.TCML
        Return (RBUF)
    }
}
