//===========================================================================
//                           <audio_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by audio drivers.
//
//===========================================================================



Scope(\_SB_.PEP0)
{

    // AUDIO
    Method(APMD, 0x0, NotSerialized)
    {
        Return(APCC)
    }

    Name(APCC,
    Package(0x1)
    {
        Package(0x6)
        {
            "DEVICE",
            "\\_SB.ADSP.ADCM.AUCD.QCRT",
            Package(0x3)
            {
                "COMPONENT",
                Zero, // Component 0
                Package(0x2)
                {
                    "FSTATE",
                    Zero // f0 statepackage()
                }
            },
            Package(0x3)
            {
                "DSTATE",
                Zero, // d0 statepackage()
                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3)
                    {
                        One,
                        "/arc/client/rail_xo",
                        0x80
                    }
                }
            },
            Package(0x3)
            {
                "DSTATE",
                One, // d1 statepackage()
                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3)
                    {
                        One,
                        "/arc/client/rail_xo",
                        Zero
                    }
                }
            },
            Package(0x3)
            {
                "DSTATE",
                0x2, // d2 statepackage()
                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3)
                    {
                        One,
                        "/arc/client/rail_xo",
                        Zero
                    }
                }
            }
        }
    })
}
