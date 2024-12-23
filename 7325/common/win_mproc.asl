//
// MPROC Drivers (PIL Driver and Subsystem Drivers)
//


//
// RPE Subsystem Notifier (RPEN)
//
Device (RPEN)
{
    Name (_HID, "QCOM06E1")
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}

//
// Peripheral Image Loader (PIL) Driver
//
Device (PILC)
{
    Name (_HID, "QCOM06E0")

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}

//
// RPE Crash Dump Injector (CDI) Driver
//
Device (CDI)
{
    Name (_DEP, Package (0x02)
    {
        \_SB.PILC,
        \_SB.RPEN
    })
    Name (_HID, "QCOM0A2F")
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}

//
// ADSP Driver: load ADSP image
//
Device (ADSP)
{
    Name (_DEP, Package (0x09)
    {
        \_SB.PEP0,
        \_SB.PILC,
        \_SB.GLNK,
        \_SB.IPC0,
        \_SB.RPEN,
        \_SB.SSDD,
        \_SB.ARPC,
        \_SB.TFTP,
        \_SB.PDSR
    })
    Name (_HID, "QCOM0A1B")

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000206,}
        })
        Return (RBUF)
    }

    Include("slimbus.asl")
}

//
// AMSS Driver: Used for loading the modem binaries
//
Device (AMSS)
{
    Name (_CCA, Zero)
    Name (_DEP, Package (0x09)
    {
        \_SB.PEP0,
        \_SB.GLNK,
        \_SB.PILC,
        \_SB.RFS0,
        \_SB.RPEN,
        \_SB.SSDD,
        \_SB.IPC0,
        \_SB.TFTP,
        \_SB.PDSR
    })
    Name (_HID, "QCOM0A1C")

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000128,}
        })
        Return (RBUF)
    }
}

//
// QMI Service manager
//
Device (QSM)
{
    Name (_HID, "QCOM0A1E")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x04)
    {
        \_SB.GLNK,
        \_SB.IPC0,
        \_SB.PILC,
        \_SB.RPEN
    })

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}

//
// Subsys Dependency Device
//    Subsys devices that use QCCI should have an dependency on this
//
Device (SSDD)
{
    Name (_HID, "QCOM0A20")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)
    {
        \_SB.GLNK
    })

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}

//
// PDSR device
//
Device (PDSR)
{
    Name (_HID, "QCOM06DF")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x03)
    {
        \_SB.PEP0,
        \_SB.GLNK,
        \_SB.IPC0
    })

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}

//
// NSP0 device
//
Device (NSP0)
{
    Name (_DEP, Package (0x08)
    {
        \_SB.PEP0,
        \_SB.PILC,
        \_SB.GLNK,
        \_SB.IPC0,
        \_SB.RPEN,
        \_SB.SSDD,
        \_SB.ARPC,
        \_SB.PDSR
    })
    Name (_HID, "QCOM0AB0")
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000262,}
        })
        Return (RBUF)
    }
}

//
// Wireless Processor Subsystem Device
//
Device (WPSS)
{
    Name (_DEP, Package (0x08)
    {
        \_SB.PEP0,
        \_SB.PILC,
        \_SB.GLNK,
        \_SB.IPC0,
        \_SB.RPEN,
        \_SB.SSDD,
        \_SB.TFTP,
        \_SB.PDSR
    })
    Name (_HID, "QCOM0AE2")
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000026B,}
        })
        Return (RBUF)
    }

    Device (QWLN)
    {
        Name (_ADR, Zero)
        Name (_DEP, Package (0x03)
        {
            \_SB.PEP0,
            \_SB.MMU0,
            \_SB.IPC0
        })

        Name (_PRW, Package (0x02) {Zero, Zero})
        Name (_S0W, 0x03)
        Name (_S4W, 0x03)
        Name (_PRR, Package (One) {\_SB.WPSS.QWLN.WRST})

        Method (_CRS, 0, NotSerialized)
        {
            Name (RBUF, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite, 0x17A10040, 0x00000010,)
                Memory32Fixed (ReadWrite, 0x80C00000, 0x00C00000,)

                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000320,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000321,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000322,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000323,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000324,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000325,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000326,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000327,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000328,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000329,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000032A,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000032B,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000032C,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000032D,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000032E,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000032F,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000330,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000331,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000332,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000333,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000334,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000335,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000336,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000337,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000338,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000339,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000033A,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000033B,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, ExclusiveAndWake, ,, ) {0x0000033C,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000033D,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000033E,}
                Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000033F,}
            })
            Return (RBUF)
        }

        PowerResource (WRST, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            Method (_ON, 0, NotSerialized) {}
            Method (_OFF, 0, NotSerialized) {}
            Method (_RST, 0, NotSerialized) {}
        }
    }

    Scope (\_SB)
    {
        Device (WLTM)
        {
            Name (_HID, "QCOM0AD5")
            Name (_CID, "QCOMFFE0")
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x02)
            {
                \_SB.WPSS,
                \_SB.SBTD
            })
        }
    }
}

Device (CSW0)
{
    Name (_HID, "QCOM0AC3")
    Name (_CID, "QCOMFFE0")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x02)
    {
        \_SB.NSP0,
        \_SB.SBTD
    })
}

Device (SBTD)
{
    Name (_HID, "QCOM06E5")
    Alias (\_SB.PSUB, _SUB)
}

//
// TFTP Device
//
Device (TFTP)
{
    Name (_HID, "QCOM06DC")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One)
    {
        \_SB.IPC0
    })

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}

Include("qcsk.asl")

Include("plat_win_mproc.asl") // Platform specific data
