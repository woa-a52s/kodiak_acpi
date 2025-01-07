//
// UFS Controller
//
Device (UFS0)
{
    Name (_HID, "QCOM24A5")
    Alias (\_SB.PSUB, _SUB)
    Alias (\_SB.EMUL, EMUL)
    Name (_UID, 0)
    Name (_CCA, 0)
    Name (_DEP, Package()
    {
        \_SB.PEP0
    })

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // UFS register address space
            Memory32Fixed (ReadWrite, 0x1D84000, 0x1C000)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {297}
        })
        Return (RBUF)
    }

    // UFS Device
    Device (DEV0)
    {
        Method (_ADR)
        {
            Return (8)
        }

        // Non-removable
        Method (_RMV)
        {
            Return (0)
        }
    }
}
