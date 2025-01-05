//===========================================================================
//                           <audio_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by audio drivers.
//
//===========================================================================



Scope(\_SB_.PEP0)
{

    // AUDIO
    Method(APMD)
    {
        Return(APCC)
    }

    Name(APCC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.ADSP.ADCM.AUCD.QCRT",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0
                Package()
                {
                    "FSTATE",
                    0x0 // f0 statepackage()
                }
            },
            Package()
            {
                "DSTATE",
                0x0, // d0 statepackage()
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_xo",
                        0x80
                    }
                }
            },
            Package()
            {
                "DSTATE",
                0x1, // d1 statepackage()
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_xo",
                        0
                    }
                }
            },
            Package()
            {
                "DSTATE",
                0x2, // d2 statepackage()
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_xo",
                        0
                    }
                }
            }
        }
    })
}
