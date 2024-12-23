//
// PEP resources for WCNSS
//
Scope (\_SB.PEP0)
{
    // Wireless Connectivity Devices
    Method (EWMD, 0, NotSerialized)
    {
        Return (WBRC)
    }

    Name (WBRC,
    Package (One)
    {
        // PEP settings for Wlan iHelium
        Package (0x07)
        {
            "DEVICE",
            "\\_SB.WPSS.QWLN",

            Package (0x03)
            {
                "COMPONENT",
                Zero, // Component 0

                Package (0x02)
                {
                    "FSTATE",
                    Zero // F0 state
                }
            },

            Package (0x06)
            {
                "DSTATE",
                Zero, // D0 state

                Package (0x02)
                {
                    "NPARESOURCE",
                    Package (0x03)
                    {
                        One,
                        "/arc/client/rail_xo",
                        0x80
                    }
                },
                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS1_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        0x001C9080,                     // Voltage = 1.872 V
                        One,                            // Software Enable = Enable
                        0x06,                           // Software Power Mode = Auto
                        Zero                            // Head Room
                    }
                },
                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS7_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        0x000E86C0,                     // Voltage = 0.952 V
                        One,                            // Software Enable = Enable
                        0x06,                           // Software Power Mode = Auto
                        Zero                            // Head Room
                    }
                },
                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS8_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        0x00132A40,                     // Voltage = 1.256 V
                        One,                            // Software Enable = Enable
                        0x06,                           // Software Power Mode = Auto
                        Zero                            // Head Room
                    }
                }
            },

            Package (0x06)
            {
                "DSTATE",
                0x02, // D2 state
                Package (0x02)
                {
                    "NPARESOURCE",
                    Package (0x03)
                    {
                        One,
                        "/arc/client/rail_xo",
                        Zero
                    }
                },
                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS1_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        Zero,                           // Voltage = 0 V
                        Zero,                           // Software Enable = Disable
                        0x05,                           // Software Power Mode = LPM
                        Zero                            // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS7_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        Zero,                           // Voltage = 0 V
                        Zero,                           // Software Enable = Disable
                        0x05,                           // Software Power Mode = LPM
                        Zero                            // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS8_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        Zero,                           // Voltage = 0 V
                        Zero,                           // Software Enable = Disable
                        0x05,                           // Software Power Mode = LPM
                        Zero                            // Head Room
                    }
                }
            },

            Package (0x06)
            {
                "DSTATE",
                0x03, // D3 state
                Package (0x02)
                {
                    "NPARESOURCE",
                    Package (0x03)
                    {
                        One,
                        "/arc/client/rail_xo",
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS1_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        Zero,                           // Voltage = 0 V
                        Zero,                           // Software Enable = Disable
                        0x05,                           // Software Power Mode = LPM
                        Zero                            // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS7_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        Zero,                           // Voltage = 0 V
                        Zero,                           // Software Enable = Disable
                        0x05,                           // Software Power Mode = LPM
                        Zero                            // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_SMPS8_B",      // Resource ID
                        0x02,                           // Voltage Regulator type 2 = SMPS
                        Zero,                           // Voltage = 0 V
                        Zero,                           // Software Enable = Disable
                        0x05,                           // Software Power Mode = LPM
                        Zero                            // Head Room
                    }
                }
            },

            Package (0x02)
            {
                "ABANDON_DSTATE",
                0x02                                    // Abandon D state defined as D2
            }
        }
    }) // END WBRC
}
