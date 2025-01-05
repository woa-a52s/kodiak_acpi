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

    Method (_STA)
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

    Method (_STA)
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

    Method (_STA)
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

    Method (_STA)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {518}
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
    Name (_CCA, 0)
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
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {296}
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

    Method (_STA)
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
    Name (_DEP, Package (0x1)
    {
        \_SB.GLNK
    })

    Method (_STA)
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

    Method (_STA)
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

    Method (_STA)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {610}
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

    Method (_STA)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {619}
        })
        Return (RBUF)
    }

    Include("wcnss_wlan.asl")

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
    Name (_DEP, Package (0x01)
    {
        \_SB.IPC0
    })

    Method (_STA)
    {
        Return (0x0F)
    }
}

Include("qcsk.asl")

Include("plat_win_mproc.asl") // Platform specific data
