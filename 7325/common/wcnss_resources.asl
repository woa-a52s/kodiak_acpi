//
// PEP resources for WCNSS
//
Scope (\_SB.PEP0)
{
    // Wireless Connectivity Devices
    Method (EWMD)
    {
        Return (WBRC)
    }

    Name (WBRC,
    Package ()
    {
        // PEP settings for Wlan WPSS
        Package()
        {
            "DEVICE",
            "\\_SB.WPSS.QWLN",

            Package()
            {
                "COMPONENT",
                0x0, // Component 0

                Package()
                {
                    "FSTATE",
                    0x0 // F0 state
                }
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state

                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_xo",
                        128
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS1_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        1872000,                        // Voltage = 1.872 V
                        1,                              // Software Enable = Enable
                        6,                              // Software Power Mode = Auto
                        0                               // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        952000,                         // Voltage = 0.952 V
                        1,                              // Software Enable = Enable
                        6,                              // Software Power Mode = Auto
                        0                               // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS8_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        1256000,                        // Voltage = 1.256 V
                        1,                              // Software Enable = Enable
                        6,                              // Software Power Mode = Auto
                        0                               // Head Room
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x02, // D2 state
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_xo",
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS1_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        0,                              // Voltage = 0 V
                        0,                              // Software Enable = Disable
                        5,                              // Software Power Mode = LPM
                        0                               // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        0,                              // Voltage = 0 V
                        0,                              // Software Enable = Disable
                        5,                              // Software Power Mode = LPM
                        0                               // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS8_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        0,                              // Voltage = 0 V
                        0,                              // Software Enable = Disable
                        5,                              // Software Power Mode = LPM
                        0                               // Head Room
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x03, // D3 state
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_xo",
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS1_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        0,                              // Voltage = 0 V
                        0,                              // Software Enable = Disable
                        5,                              // Software Power Mode = LPM
                        0                               // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS7_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        0,                              // Voltage = 0 V
                        0,                              // Software Enable = Disable
                        5,                              // Software Power Mode = LPM
                        0                               // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS8_B",      // Resource ID
                        2,                              // Voltage Regulator type 2 = SMPS
                        0,                              // Voltage = 0 V
                        0,                              // Software Enable = Disable
                        5,                              // Software Power Mode = LPM
                        0                               // Head Room
                    }
                }
            },

            Package()
            {
                "ABANDON_DSTATE",
                0x02                                    // Abandon D state defined as D2
            }
        }
    }) // END WBRC
}
