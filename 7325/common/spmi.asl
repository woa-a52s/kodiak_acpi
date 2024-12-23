//
//SPMI driver.
//
Device (SPMI)
{
    Name (_HID, "QCOM0A0B")
    Alias (\_SB.PSUB, _SUB)
    Name (_CID, "PNP0CA2")
    Name (_UID, One)
    Name (_CCA, Zero)

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0C400000, 0x02800000,)
        })
        Return (RBUF)
    }

    Include("spmi_conf.asl")
}
