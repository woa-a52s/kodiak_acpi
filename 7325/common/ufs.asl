//
// UFS Controller
//
Device (UFS0)
{
    Name (_HID, "QCOM24A5")
    Alias (\_SB.PSUB, _SUB)
    Alias (\_SB.EMUL, EMUL)
    Name (_UID, Zero)
    Name (_CCA, Zero)
    Name (_DEP, Package (One)
    {
        \_SB.PEP0
    })

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            // UFS register address space
            Memory32Fixed (ReadWrite, 0x01D84000, 0x0001C000,)
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x00000129,}
        })
        Return (RBUF)
    }

    // UFS Device
    Device (DEV0)
    {
        Method (_ADR, 0, NotSerialized)
        {
            Return (0x08)
        }

        // Non-removable
        Method (_RMV, 0, NotSerialized)
        {
            Return (Zero)
        }
    }
}
