//==============================================================================
//                           <cust_camera_exasoc.asl>
// DESCRIPTION
//   This file contains resources (such as memory address, GPIOs, etc.) and
//   methods needed by camera drivers for external components like sensors,flash etc.
//   Customers can update these files for different external components
//
//==============================================================================

//
// CAMERA PLATFORM
//
Device (CAMP)
{
    Name (_DEP, Package (0x05)
    {
        \_SB.PEP0,
        \_SB.PMIC,
        \_SB.PML0,
        \_SB.ARPC,
        \_SB.NSP0
    })

    Name (_HID, "QCOM0A32")
    Name (_UID, 27)

    Method (_STA)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0AC40000, 0x00001000 )
            Memory32Fixed (ReadWrite, 0x0AC9F000, 0x00008000 )
            Memory32Fixed (ReadWrite, 0x0AC4A000, 0x00001000 )
            Memory32Fixed (ReadWrite, 0x0AC4B000, 0x00001000 )

            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) { 492 }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) { 303 }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) { 491 }
        })

        Return (RBUF)
    }
}

//
// Primary Rear Camera (IMX???)
//
Device (CAMS)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.MPCS                                       // MPCS has dependency on CAMP, which eventually ends up with PEP0 and PMIC
    })

    Name (_HID, "QCOM0A26")
    Name (_UID, 21)
    Alias (\_SB.PSUB, _SUB)

    // Return 0x0 to disable CAMS sensor
    Method (_STA)
    {
        Return (0x0F)
    }

    // PEP Proxy Support
    Name (PGID, Buffer (10) {"\\_SB.CAMS"})             // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, 0x0, STAT)                   // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 2, DVAL)                     // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 24, 160, DEID)                   // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0) { Return (3) }                     // S1 => D3
    Method (_S2D, 0) { Return (3) }                     // S2 => D3
    Method (_S3D, 0) { Return (3) }                     // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 3
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }
}

//
// Primary Front Camera (IMX476)
//
Device (CAMF)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0A06")
    Name (_UID, 26)

    Method (_SUB, 0, NotSerialized)
    {
        Return ("IDP07280")
    }

    // Return 0x0 to disable CAMF sensor
    Method (_STA)
    {
        Return (0x0F)
    }

    // PEP Proxy Support
    Name (PGID, Buffer (10) {"\\_SB.CAMF"})             // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, 0x0, STAT)                   // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 2, DVAL)                     // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 24, 160, DEID)                   // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0) { Return (3) }                     // S1 => D3
    Method (_S2D, 0) { Return (3) }                     // S2 => D3
    Method (_S3D, 0) { Return (3) }                     // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 3
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }
}

//
// Auxiliary sensor (OV7251 / OV9234)
//
Device (CAMI)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0A99")
    Name (_UID, 28)

    Method (_SUB, 0, NotSerialized)
    {
        Return ("IDP07280")
    }

    // Return 0x0 to disable CAMI sensor
    Method (_STA)
    {
        If ((\_SB.SKUV == 1))
        {
            Return (0)
        }
        Else
        {
            Return (0x0F)
        }
    }

    // PEP Proxy Support
    Name (PGID, Buffer (10) {"\\_SB.CAMI"})             // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, 0x0, STAT)                   // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 2, DVAL)                     // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 24, 160, DEID)                   // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0) { Return (3) }                     // S1 => D3
    Method (_S2D, 0) { Return (3) }                     // S2 => D3
    Method (_S3D, 0) { Return (3) }                     // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 3
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }
}

//
// ??? Sensor
//
Device (CAMT)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0ACE")
    Name (_UID, 29)
    Alias (\_SB.PSUB, _SUB)

    // Return 0x0 to disable CAMT sensor
    Method (_STA)
    {
        Return (0x0F)
    }

    // PEP Proxy Support
    Name (PGID, Buffer (10) {"\\_SB.CAMT"})             // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, 0x0, STAT)                   // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 2, DVAL)                     // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 24, 160, DEID)                   // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0) { Return (3) }                     // S1 => D3
    Method (_S2D, 0) { Return (3) }                     // S2 => D3
    Method (_S3D, 0) { Return (3) }                     // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 3
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }
}

//
// ??? Sensor
//
Device (CAMU)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0ACF")
    Name (_UID, 30)
    Alias (\_SB.PSUB, _SUB)

    // Return 0x0 to disable CAMU sensor
    Method (_STA)
    {
        Return (0x0F)
    }

    // PEP Proxy Support
    Name (PGID, Buffer (10) {"\\_SB.CAMU"})             // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, 0x0, STAT)                   // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 2, DVAL)                     // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 24, 160, DEID)                   // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0) { Return (3) }                     // S1 => D3
    Method (_S2D, 0) { Return (3) }                     // S2 => D3
    Method (_S3D, 0) { Return (3) }                     // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 3
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }
}

//
// CAMERA WHITE LED FLASH
//
Device (FLSH)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.CAMP
    })

    Name (_HID, "QCOM0A27")
    Name (_UID, 25)

    Method (_SUB, 0, NotSerialized)
    {
        Return ("IDP07280")
    }

    // Return 0x0 to disable FLSH device
    Method (_STA)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, Buffer (0x02)
        {
            0x79, 0x00
        })

        Return (RBUF)
    }
}
