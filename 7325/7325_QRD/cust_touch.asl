//
// Copyright (c) 2015-2017 Qualcomm Technologies, Inc.  All Rights Reserved.
// Qualcomm Technologies Proprietary and Confidential.
//

//
// Touch entry - Focaltech FT5652 Touchscreen Controller
//
Device (TSC1)
{
    Name (_HID, "FTTS0001")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x03)
    {
        \_SB.PEP0,
        \_SB.GIO0,
        \_SB.SP14
    })

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            SpiSerialBus(0x0000, PolarityLow, FourWireMode, 0x08, ControllerInitiated, 0x005B8D80, ClockPolarityLow, ClockPhaseFirst, "\\_SB.SP14", 0x00, ResourceConsumer, ,)
            GpioInt(Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000, "\\_SB.GIO0", 0x00, ResourceConsumer, ,) {0x0051}
        })
        Return (RBUF)
    }

    //PEP Proxy Support
    Name(PGID, Buffer(0x0A) {"\\_SB.TSC1"}) // Device ID buffer - PGID( Pep given ID )

    Name(DBUF, Buffer(DBFL) {})             // Device ID buffer - PGID( Pep given ID )
    CreateByteField(DBUF, 0x0, STAT)        // STATUS 1 BYTE
                                            // HIDDEN 1 BYTE ( SIZE )
    CreateByteField(DBUF, 2, DVAL )         // Packet value, 1 BYTES Device Status
    CreateField(DBUF, 24, 160, DEID)        // Device ID, 20 BYTES(160 Bits)

    Method (_S1D, 0, NotSerialized) { Return (3) } // S1 => D3
    Method (_S2D, 0, NotSerialized) { Return (3) } // S2 => D3
    Method (_S3D, 0, NotSerialized) { Return (3) } // S3 => D3

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
