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
    Name (_UID, 0x1B)

    Method (_STA)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Memory32Fixed (ReadWrite, 0x0AC40000, 0x00001000, )
            Memory32Fixed (ReadWrite, 0x0AC9F000, 0x00008000, )
            Memory32Fixed (ReadWrite, 0x0AC4A000, 0x00001000, )
            Memory32Fixed (ReadWrite, 0x0AC4B000, 0x00001000, )

            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) { 0x000001EC, }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) { 0x0000012F, }
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) { 0x000001EB, }
        })

        Return (RBUF)
    }
}

//
// Primary Rear Camera (IMX???)
//
Device (CAMS)
{
    Name (_DEP, Package (One)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0A26")
    Name (_UID, 0x15)
    Alias (\_SB.PSUB, _SUB)

    // Return 0x0 to disable CAMS sensor
    Method (_STA)
    {
        Return (0x0F)
    }

    // PEP Proxy Support
    Name (PGID, Buffer (0x0A) {"\\_SB.CAMS"})           // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, Zero, STAT)                  // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 0x02, DVAL)                  // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 0x18, 0xA0, DEID)                // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0, NotSerialized) { Return (0x03) }   // S1 => D3
    Method (_S2D, 0, NotSerialized) { Return (0x03) }   // S2 => D3
    Method (_S3D, 0, NotSerialized) { Return (0x03) }   // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = Zero
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }
}

//
// Primary Front Camera (IMX???)
//
Device (CAMF)
{
    Name (_DEP, Package (One)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0A06")
    Name (_UID, 0x1A)

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
    Name (PGID, Buffer (0x0A) {"\\_SB.CAMF"})           // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, Zero, STAT)                  // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 0x02, DVAL)                  // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 0x18, 0xA0, DEID)                // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0, NotSerialized) { Return (0x03) }   // S1 => D3
    Method (_S2D, 0, NotSerialized) { Return (0x03) }   // S2 => D3
    Method (_S3D, 0, NotSerialized) { Return (0x03) }   // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = Zero
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }
}

//
// Auxiliary sensor (OV????, ????)
//
Device (CAMI)
{
    Name (_DEP, Package (One)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0A99")
    Name (_UID, 0x1C)

    Method (_SUB, 0, NotSerialized)
    {
        Return ("IDP07280")
    }

    // Return 0x0 to disable CAMI sensor
    Method (_STA)
    {
        If ((\_SB.SKUV == One))
        {
            Return (Zero)
        }
        Else
        {
            Return (0x0F)
        }
    }

    // PEP Proxy Support
    Name (PGID, Buffer (0x0A) {"\\_SB.CAMI"})           // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, Zero, STAT)                  // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 0x02, DVAL)                  // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 0x18, 0xA0, DEID)                // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0, NotSerialized) { Return (0x03) }   // S1 => D3
    Method (_S2D, 0, NotSerialized) { Return (0x03) }   // S2 => D3
    Method (_S3D, 0, NotSerialized) { Return (0x03) }   // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = Zero
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
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
    Name (_DEP, Package (One)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0ACE")
    Name (_UID, 0x1D)
    Alias (\_SB.PSUB, _SUB)

    // Return 0x0 to disable CAMT sensor
    Method (_STA)
    {
        Return (0x0F)
    }

    // PEP Proxy Support
    Name (PGID, Buffer (0x0A) {"\\_SB.CAMT"})           // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, Zero, STAT)                  // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 0x02, DVAL)                  // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 0x18, 0xA0, DEID)                // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0, NotSerialized) { Return (0x03) }   // S1 => D3
    Method (_S2D, 0, NotSerialized) { Return (0x03) }   // S2 => D3
    Method (_S3D, 0, NotSerialized) { Return (0x03) }   // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = Zero
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
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
    Name (_DEP, Package (One)
    {
        \_SB.MPCS
    })

    Name (_HID, "QCOM0ACF")
    Name (_UID, 0x1E)
    Alias (\_SB.PSUB, _SUB)

    // Return 0x0 to disable CAMU sensor
    Method (_STA)
    {
        Return (0x0F)
    }

    // PEP Proxy Support
    Name (PGID, Buffer (0x0A) {"\\_SB.CAMU"})           // Device ID buffer - PGID (Pep given ID)

    Name (DBUF, Buffer (DBFL){})                        // Device ID buffer - PGID (Pep given ID)
    CreateByteField (DBUF, Zero, STAT)                  // STATUS 1 BYTE
                                                        // HIDDEN 1 BYTE (SIZE)
    CreateByteField (DBUF, 0x02, DVAL)                  // Packet value, 1 BYTES Device Status
    CreateField (DBUF, 0x18, 0xA0, DEID)                // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0, NotSerialized) { Return (0x03) }   // S1 => D3
    Method (_S2D, 0, NotSerialized) { Return (0x03) }   // S2 => D3
    Method (_S3D, 0, NotSerialized) { Return (0x03) }   // S3 => D3

    Method (_PS0, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = Zero
        DEID = PGID
        If (\_SB.ABD.AVBL)
        {
            \_SB.PEP0.FLD0 = DBUF
        }
    }

    Method (_PS3, 0, NotSerialized)
    {
        DEID = Buffer (ESNL){}
        DVAL = 0x03
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
    Name (_DEP, Package (One)
    {
        \_SB.CAMP
    })

    Name (_HID, "QCOM0A27")
    Name (_UID, 0x19)

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
