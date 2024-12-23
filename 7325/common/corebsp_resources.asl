//===========================================================================
//                           <corebsp_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by core BSP drivers.
//
//===========================================================================


Scope(\_SB_.PEP0)
{

    Method(MPMD, 0x0, NotSerialized)
    {
        Return(MPCC)
    }

    Name(MPCC, Package(0x0)
    {
    })
}

Scope(\_SB_.PEP0)
{
    Method(OPMD, 0x0, NotSerialized)
    {
        Return(OPCC)
    }

    Name(OPCC, Package(0x0)
    {
    })
}

Scope(\_SB_.PEP0)
{
    Method(LPMD, 0x0, NotSerialized)
    {
        Return(LPCC)
    }

    Name(LPCC, Package(0x5)
    {
        Package(0x7)
        {
            "DEVICE",
            "\\_SB.URS0",
            Package(0x5)
            {
                "COMPONENT",
                Zero,
                Package(0x2) {"FSTATE", Zero},
                Package(0x2) {"PSTATE", Zero},
                Package(0x2) {"PSTATE", One}
            },
            Package(0x2) {"DSTATE", Zero},
            Package(0x2) {"DSTATE", One},
            Package(0x2) {"DSTATE", 0x2},
            Package(0x2) {"DSTATE", 0x3}
        },

        //USB SS/HS1 core (Host Stack)
        Package(0x8)
        {
            "DEVICE",
            "\\_SB.URS0.USB0",
            Package(0x4)
            {
                "COMPONENT",
                Zero, // Component 0.
                Package(0x2) { "FSTATE", Zero },
                Package(0x2) { "PSTATE", Zero }
            },
            Package(0x13)
            {
                "DSTATE",
                Zero,
                Package(0x2)
                {
                    // L01C
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x1b7740,                   // Voltage V : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x7,                        // SW Power Mode
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    // L01B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0xdea80,                    // Voltage V : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x7,                        // SW Power Mode
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    // L02B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x2ee000,                   // Voltage V : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x7,                        // SW Power Mode
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    // L06B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x124f80,                   // Voltage V : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x7,                        // SW Power Mode
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    // L10C
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0xd6d80,                    // Voltage V : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x7,                        // SW Power Mode
                        Zero                        // Head Room
                    }
                },

                // Enable gcc_usb30_prim_gdsc power domain
                Package(0x2)
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package(0x2)
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        One                         // 1==Enable
                    }
                },

                // Now Enable all the clocks

                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_sleep_clk", One}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_pipe_clk", One}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_aggre_usb3_prim_axi_clk", 0x8, 0xc8, 0x9}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_cfg_noc_usb3_prim_axi_clk", 0x8, 0xc8, 0x9}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_usb30_prim_master_clk", 0x8, 0xc8, 0x9}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_usb30_prim_mock_utmi_clk", 0x8, 0x4b00, 0x7}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_usb3_prim_phy_aux_clk", 0x8, 0x4b00, 0x7}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_usb3_prim_phy_com_aux_clk", 0x8, 0x4b00, 0x7}},

                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3) {One, "/arc/client/rail_cx", 0x100}
                },

                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,                        // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        0x28000000,                 // IB=5Gbps
                        0x28000000                  // AB=5Gbps
                    }
                },

                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB3_0",
                        0xbebc200,
                        Zero
                    }
                }
            },
            Package(0x13)
            {
                "DSTATE",
                One,

                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_pipe_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_aggre_usb3_prim_axi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_cfg_noc_usb3_prim_axi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_usb30_prim_master_clk", 0x3, 0x2580, 0x5}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_master_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_mock_utmi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_aux_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_com_aux_clk", 0x2}},

                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,                        // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        Zero,                       // IB=0 MBps
                        Zero                        // AB=0 MBps
                    }
                },

                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,                        // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        Zero,                       // IB=0 MBps
                        Zero                        // AB=0 MBps
                    }
                },

                Package(0x2)
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package(0x2)
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        One                         // 1==Enable
                    }
                },

                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3) {One, "/arc/client/rail_cx", Zero}
                },

                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L01C
                    Package(0x6)
                    {
                        // L01C
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x1b7740,                   // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L01B
                    Package(0x6)
                    {
                        // L01B
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0xdea80,                    // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package(0x6)
                    {
                        // L02B
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x2ee000,                   // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L06B
                    Package(0x6)
                    {
                        // L06B
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x124f80,                   // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L10C
                    Package(0x6)
                    {
                        // L10C
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0xd6d80,                    // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                }
            },
            Package(0x13)
            {
                "DSTATE",
                0x2,

                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_pipe_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_usb30_prim_master_clk", 0x3, 0x927c00, One}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_master_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_aggre_usb3_prim_axi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_cfg_noc_usb3_prim_axi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_mock_utmi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_aux_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_com_aux_clk", 0x2}},

                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,                        // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        Zero,                       // IB=0 MBps
                        Zero                        // AB=0 MBps
                    }
                },
                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,                        // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        Zero,                       // IB=0 MBps
                        Zero                        // AB=0 MBps
                    }
                },

                Package(0x2)
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package(0x2)
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        One                         // 1==Enable
                    }
                },

                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3) { One, "/arc/client/rail_cx", Zero}
                },

                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L01C
                    Package(0x6)
                    {
                        // L01C
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x1b7740,                   // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L01B
                    Package(0x6)
                    {
                        // L01B
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0xdea80,                    // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package(0x6)
                    {
                        // L02B
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x2ee000,                   // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package(0x6)
                    {
                        // L06B
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0x124f80,                   // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package(0x6)
                    {
                        // L10C
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        One,                        // Voltage Regulator type = LDO
                        0xd6d80,                    // Voltage         : microvolts ( V )
                        One,                        // SW Enable = Enable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                }

            },
            Package(0x14)
            {
                "DSTATE",
                0x3,

                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_sleep_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_pipe_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_aggre_usb3_prim_axi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_cfg_noc_usb3_prim_axi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x4) {"gcc_usb30_prim_master_clk", 0x3, 0x927c00, One}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_master_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb30_prim_mock_utmi_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_aux_clk", 0x2}},
                Package(0x2) {"CLOCK", Package(0x2) {"gcc_usb3_prim_phy_com_aux_clk", 0x2}},

                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,                        // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        Zero,                       // IB=0 MBps
                        Zero                        // AB=0 MBps
                    }
                },
                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,                        // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        Zero,                       // IB=0 MBps
                        Zero                        // AB=0 MBps
                    }
                },

                Package(0x2)
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package(0x2)
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        0x2                         // 2==Disable
                    }
                },

                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3) { One, "/arc/client/rail_cx", Zero}

                },

                Package(0x2)
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package(0x6)                    // Vote for L02B
                    {
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        One,                        // Voltage Regulator type 1 = LDO
                        Zero,                       // Voltage = 0 V
                        Zero,                       // SW Enable = Disable
                        0x4,                        // SW Power Mode =
                        Zero                        // Head Room
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO1_B",
                        One,
                        Zero,
                        Zero,
                        0x4,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        One,
                        Zero,
                        Zero,
                        0x4,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,
                        Zero,
                        Zero,
                        0x4,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,
                        Zero,
                        Zero,
                        0x4,
                        Zero
                    }
                }
            },
            Package(0x2)
            {
                "ABANDON_DSTATE",
                0x3
            }
        },
        Package(0x8)
        {
            "DEVICE",
            "\\_SB.USB0",
            Package(0x4)
            {
                "COMPONENT",
                Zero,
                Package(0x2)
                {
                    "FSTATE",
                    Zero
                },
                Package(0x2)
                {
                    "PSTATE",
                    Zero
                }
            },
            Package(0x13)
            {
                "DSTATE",
                Zero,
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        One,
                        0x1b7740,
                        One,
                        0x7,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO1_B",
                        One,
                        0xdea80,
                        One,
                        0x7,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        One,
                        0x2ee000,
                        One,
                        0x7,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,
                        0x124f80,
                        One,
                        0x7,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,
                        0xd6d80,
                        One,
                        0x7,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "FOOTSWITCH",
                    Package(0x2)
                    {
                        "gcc_usb30_prim_gdsc",
                        One
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x2)
                    {
                        "gcc_usb30_prim_sleep_clk",
                        One
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x2)
                    {
                        "gcc_usb3_prim_phy_pipe_clk",
                        One
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x4)
                    {
                        "gcc_aggre_usb3_prim_axi_clk",
                        0x8,
                        0xc8,
                        0x9
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x4)
                    {
                        "gcc_cfg_noc_usb3_prim_axi_clk",
                        0x8,
                        0xc8,
                        0x9
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_master_clk",
            0x8,
            0xc8,
            0x9
            }
                },
                Package(0x2)
                {
                    "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_mock_utmi_clk",
            0x8,
            0x4b00,
            0x7
            }
                },
                Package(0x2)
                {
                    "CLOCK",
            Package(0x4)
            {
                "gcc_usb3_prim_phy_aux_clk",
            0x8,
            0x4b00,
            0x7
            }
                },
                Package(0x2)
                {
                    "CLOCK",
            Package(0x4)
            {
                "gcc_usb3_prim_phy_com_aux_clk",
            0x8,
            0x4b00,
            0x7
            }
                },
                Package(0x2)
                {
                    "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            0x100
            }
                },
                Package(0x2)
                {
                    "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB3_0",
            "ICBID_SLAVE_EBI1",
            0x28000000,
            0x28000000
            }
                },
                Package(0x2)
                {
                    "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB3_0",
            0xbebc200,
            Zero
            }
                }
            },
            Package(0x13)
            {
                "DSTATE",
            One,
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_pipe_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_aggre_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_cfg_noc_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_master_clk",
            0x3,
            0x2580,
            0x5
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_master_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_mock_utmi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_com_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB3_0",
            "ICBID_SLAVE_EBI1",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB3_0",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_prim_gdsc",
            One
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            0x1b7740,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_B",
            One,
            0xdea80,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            0x2ee000,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO6_B",
            One,
            0x124f80,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            0xd6d80,
            One,
            0x4,
            Zero
            }
            }
            },
            Package(0x13)
            {
                "DSTATE",
            0x2,
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_pipe_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_master_clk",
            0x3,
            0x927c00,
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_master_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_aggre_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_cfg_noc_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_mock_utmi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_com_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB3_0",
            "ICBID_SLAVE_EBI1",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB3_0",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_prim_gdsc",
            One
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            0x1b7740,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_B",
            One,
            0xdea80,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            0x2ee000,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO6_B",
            One,
            0x124f80,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            0xd6d80,
            One,
            0x4,
            Zero
            }
            }
            },
            Package(0x14)
            {
                "DSTATE",
            0x3,
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_sleep_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_pipe_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_aggre_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_cfg_noc_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_master_clk",
            0x3,
            0x927c00,
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_master_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_mock_utmi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_com_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB3_0",
            "ICBID_SLAVE_EBI1",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB3_0",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_prim_gdsc",
            0x2
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_B",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO6_B",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            }
            },
            Package(0x2)
            {
                "ABANDON_DSTATE",
            0x3
            }
        },
        Package(0x8)
        {
            "DEVICE",
            "\\_SB.URS0.UFN0",
            Package(0x4)
            {
                "COMPONENT",
            Zero,
            Package(0x2)
            {
                "FSTATE",
            Zero
            },
            Package(0x2)
            {
                "PSTATE",
            Zero
            }
            },
            Package(0x13)
            {
                "DSTATE",
            Zero,
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            0x1b7740,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_B",
            One,
            0xdea80,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            0x2ee000,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO6_B",
            One,
            0x124f80,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            0xd6d80,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_prim_gdsc",
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_sleep_clk",
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_pipe_clk",
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_aggre_usb3_prim_axi_clk",
            0x8,
            0xc8,
            0x9
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_cfg_noc_usb3_prim_axi_clk",
            0x8,
            0xc8,
            0x9
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_master_clk",
            0x8,
            0xc8,
            0x9
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_mock_utmi_clk",
            0x8,
            0x4b00,
            0x7
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb3_prim_phy_aux_clk",
            0x8,
            0x4b00,
            0x7
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb3_prim_phy_com_aux_clk",
            0x8,
            0x4b00,
            0x7
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            0x100
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB3_0",
            "ICBID_SLAVE_EBI1",
            0x28000000,
            0x28000000
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB3_0",
            0xbebc200,
            Zero
            }
            }
            },
            Package(0x2)
            {
                "DSTATE",
            One
            },
            Package(0x13)
            {
                "DSTATE",
            0x2,
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_pipe_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_master_clk",
            0x3,
            0x927c00,
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_master_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_aggre_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_cfg_noc_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_mock_utmi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_com_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB3_0",
            "ICBID_SLAVE_EBI1",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB3_0",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_prim_gdsc",
            One
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            0x1b7740,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_B",
            One,
            0xdea80,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            0x2ee000,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO6_B",
            One,
            0x124f80,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            0xd6d80,
            One,
            0x4,
            Zero
            }
            }
            },
            Package(0x14)
            {
                "DSTATE",
            0x3,
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_sleep_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_pipe_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_aggre_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_cfg_noc_usb3_prim_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_prim_master_clk",
            0x3,
            0x927c00,
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_master_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_prim_mock_utmi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb3_prim_phy_com_aux_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB3_0",
            "ICBID_SLAVE_EBI1",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB3_0",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_prim_gdsc",
            0x2
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_B",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO6_B",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            Zero,
            Zero,
            0x4,
            Zero
            }
            }
            },
            Package(0x2)
            {
                "ABANDON_DSTATE",
            0x3
            }
        },
        Package(0x8)
        {
            "DEVICE",
            "\\_SB.USB1",
            Package(0x4)
            {
                "COMPONENT",
            Zero,
            Package(0x2)
            {
                "FSTATE",
            Zero
            },
            Package(0x2)
            {
                "PSTATE",
            Zero
            }
            },
            Package(0xe)
            {
                "DSTATE",
            Zero,
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            0x1b7740,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            0xd6d80,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            0x2ee000,
            One,
            0x7,
            Zero
            }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_sec_gdsc",
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_sec_sleep_clk",
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_aggre_usb3_sec_axi_clk",
            0x8,
            0x78,
            0x9
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_cfg_noc_usb3_sec_axi_clk",
            0x8,
            0x78,
            0x9
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_sec_master_clk",
            0x8,
            0x78,
            0x9
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_sec_mock_utmi_clk",
            0x8,
            0x4b00,
            0x7
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB2",
            "ICBID_SLAVE_EBI1",
            0x3938700,
            0x3938700
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB2",
            0xbebc200,
            Zero
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            0x100
            }
            }
            },
            Package(0xe)
            {
                "DSTATE",
            One,
            Package(0x2)
            {
                "FOOTSWITCH",
            Package(0x2)
            {
                "gcc_usb30_sec_gdsc",
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_sec_master_clk",
            0x3,
            0x2580,
            0x5
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_sec_master_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_cfg_noc_usb3_sec_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_aggre_usb3_sec_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_sec_mock_utmi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_APPSS_PROC",
            "ICBID_SLAVE_USB2",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "BUSARB",
            Package(0x5)
            {
                0x3,
            "ICBID_MASTER_USB2",
            "ICBID_SLAVE_EBI1",
            Zero,
            Zero
            }
            },
            Package(0x2)
            {
                "NPARESOURCE",
            Package(0x3)
            {
                One,
            "/arc/client/rail_cx",
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO1_C",
            One,
            0x1b7740,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO10_C",
            One,
            0xd6d80,
            One,
            0x4,
            Zero
            }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
            Package(0x6)
            {
                "PPP_RESOURCE_ID_LDO2_B",
            One,
            0x2ee000,
            One,
            0x4,
            Zero
            }
            }
            },
            Package(0xe)
            {
                "DSTATE",
            0x2,
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_aggre_usb3_sec_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_cfg_noc_usb3_sec_axi_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x4)
            {
                "gcc_usb30_sec_master_clk",
            0x3,
            0x927c00,
            One
            }
            },
            Package(0x2)
            {
                "CLOCK",
            Package(0x2)
            {
                "gcc_usb30_sec_master_clk",
            0x2
            }
            },
            Package(0x2)
            {
                "CLOCK",
                Package(0x2)
                {
                    "gcc_usb30_sec_mock_utmi_clk",
                    0x2
                }
            },
            Package(0x2)
            {
                "BUSARB",
                Package(0x5)
                {
                    0x3,
                    "ICBID_MASTER_APPSS_PROC",
                    "ICBID_SLAVE_USB2",
                    Zero,
                    Zero
                }
            },
            Package(0x2)
            {
                "BUSARB",
                Package(0x5)
                {
                    0x3,
                    "ICBID_MASTER_USB2",
                    "ICBID_SLAVE_EBI1",
                    Zero,
                    Zero
                }
            },
            Package(0x2)
            {
                "FOOTSWITCH",
                Package(0x2)
                {
                    "gcc_usb30_sec_gdsc",
                    One
                }
            },
            Package(0x2)
            {
                "NPARESOURCE",
                Package(0x3)
                {
                    One,
                    "/arc/client/rail_cx",
                    Zero
                }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
                Package(0x6)
                {
                    "PPP_RESOURCE_ID_LDO1_C",
                    One,
                    0x1b7740,
                    One,
                    0x4,
                    Zero
                }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
                Package(0x6)
                {
                    "PPP_RESOURCE_ID_LDO10_C",
                    One,
                    0xd6d80,
                    One,
                    0x4,
                    Zero
                }
            },
            Package(0x2)
            {
                "PMICVREGVOTE",
                Package(0x6)
                {
                    "PPP_RESOURCE_ID_LDO2_B",
                    One,
                    0x2ee000,
                    One,
                    0x4,
                    Zero
                }
            }
            },
            Package(0xf)
            {
                "DSTATE",
                0x3,
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x2)
                    {
                        "gcc_usb30_sec_sleep_clk",
                        0x2
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x2)
                    {
                        "gcc_aggre_usb3_sec_axi_clk",
                        0x2
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x2)
                    {
                        "gcc_cfg_noc_usb3_sec_axi_clk",
                        0x2
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x4)
                    {
                        "gcc_usb30_sec_master_clk",
                        0x3,
                        0x927c00,
                        One
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x2)
                    {
                        "gcc_usb30_sec_master_clk",
                        0x2
                    }
                },
                Package(0x2)
                {
                    "CLOCK",
                    Package(0x2)
                    {
                        "gcc_usb30_sec_mock_utmi_clk",
                        0x2
                    }
                },
                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB2",
                        Zero,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "BUSARB",
                    Package(0x5)
                    {
                        0x3,
                        "ICBID_MASTER_USB2",
                        "ICBID_SLAVE_EBI1",
                        Zero,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "FOOTSWITCH",
                    Package(0x2)
                    {
                        "gcc_usb30_sec_gdsc",
                        0x2
                    }
                },
                Package(0x2)
                {
                    "NPARESOURCE",
                    Package(0x3)
                    {
                        One,
                        "/arc/client/rail_cx",
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        One,
                        Zero,
                        Zero,
                        0x4,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,
                        Zero,
                        Zero,
                        0x4,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "PMICVREGVOTE",
                    Package(0x6)
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        One,
                        Zero,
                        Zero,
                        0x4,
                        Zero
                    }
                }
            },
            Package(0x2)
            {
                "ABANDON_DSTATE",
                0x3
            }
        }
    })
}

Scope (\_SB.PEP0)
{
    Method (BPMD, 0, NotSerialized)
    {
        If ((STOR == One))
        {
            If ((PUS3 == One))
            {
                Return (CPCC) /* \_SB_.PEP0.CPCC */
            }
            Else
            {
                Return (BPCC) /* \_SB_.PEP0.BPCC */
            }
        }
        ElseIf ((STOR == 0x02))
        {
            Return (DPCC) /* \_SB_.PEP0.DPCC */
        }
        Else
        {
            Return (FPCC) /* \_SB_.PEP0.FPCC */
        }
    }

    Method (SDMD, 0, NotSerialized)
    {
        Return (SDCC) /* \_SB_.PEP0.SDCC */
    }

    Name (BPCC, Package (One)
    {
        Package (0x07)
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package (0x07)
            {
                "COMPONENT",
                Zero,
                Package (0x05)
                {
                    "FSTATE",
                    Zero,
                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            Zero,
                            Zero
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            One,
                            Zero
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            0x02,
                            Zero
                        }
                    }
                },

                Package (0x05)
                {
                    "FSTATE",
                    One,
                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            0x02,
                            One
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            One,
                            One
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            Zero,
                            One
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    Zero,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "FOOTSWITCH",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_gdsc",
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "FOOTSWITCH",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_gdsc",
                                0x02
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    One,
                    Package (0x0D)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_ufs_phy_axi_clk",
                                0x08,
                                0x11E1A300,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_ufs_phy_unipro_core_clk",
                                0x08,
                                0x11E1A300,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x03)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                0x09,
                                0x12
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                0x03,
                                0x11E1A300,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_aggre_ufs_phy_axi_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ahb_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_phy_aux_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_tx_symbol_0_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_0_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_1_clk",
                                One
                            }
                        }
                    },

                    Package (0x0B)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_aggre_ufs_phy_axi_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ahb_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_phy_aux_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_tx_symbol_0_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_0_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_1_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_unipro_core_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_axi_clk",
                                0x02
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    0x02,
                    Package (0x04)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_UFS_MEM",
                                "ICBID_SLAVE_EBI1",
                                0x47868C00,
                                0x47868C00
                            }
                        },

                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_APPSS_PROC",
                                "ICBID_SLAVE_UFS_MEM_CFG",
                                0x11D260C0,
                                Zero
                            }
                        }
                    },

                    Package (0x04)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_APPSS_PROC",
                                "ICBID_SLAVE_UFS_MEM_CFG",
                                Zero,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_UFS_MEM",
                                "ICBID_SLAVE_EBI1",
                                Zero,
                                Zero
                            }
                        }
                    }
                }
            },

            Package (0x0A)
            {
                "DSTATE",
                Zero,
                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        One,
                        0x002C4FC0,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        One,
                        0x00124F80,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,
                        0x00124F80,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,
                        0x000D6D80,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "DELAY",
                    Package (One)
                    {
                        0x23
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        Zero
                    }
                }
            },

            Package (0x09)
            {
                "DSTATE",
                0x03,
                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        One
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,
                        0x000D6D80,
                        One,
                        0x04,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        One,
                        0x00124F80,
                        One,
                        0x04,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        One,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        Zero,
                        One
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        One
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_EXCEPTION",
                Package (0x02)
                {
                    "EXECUTE_FUNCTION",
                    Package (One)
                    {
                        "ExecuteOcdEMMCExceptions"
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_DSTATE",
                Zero
            }
        }
    })
    Name (CPCC, Package (One)
    {
        Package (0x06)
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package (0x07)
            {
                "COMPONENT",
                Zero,
                Package (0x05)
                {
                    "FSTATE",
                    Zero,
                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            Zero,
                            Zero
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            One,
                            Zero
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            0x02,
                            Zero
                        }
                    }
                },

                Package (0x05)
                {
                    "FSTATE",
                    One,
                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            0x02,
                            One
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            One,
                            One
                        }
                    },

                    Package (0x02)
                    {
                        "PSTATE_ADJUST",
                        Package (0x02)
                        {
                            Zero,
                            One
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    Zero,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "FOOTSWITCH",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_gdsc",
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "FOOTSWITCH",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_gdsc",
                                0x02
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    One,
                    Package (0x0D)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_ufs_phy_axi_clk",
                                0x08,
                                0x11E1A300,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_ufs_phy_unipro_core_clk",
                                0x08,
                                0x11E1A300,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x03)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                0x09,
                                0x12
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                0x03,
                                0x11E1A300,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_aggre_ufs_phy_axi_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ahb_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_phy_aux_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_tx_symbol_0_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_0_clk",
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_1_clk",
                                One
                            }
                        }
                    },

                    Package (0x0B)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_aggre_ufs_phy_axi_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ahb_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_phy_aux_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_tx_symbol_0_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_0_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_rx_symbol_1_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_ice_core_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_unipro_core_clk",
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_ufs_phy_axi_clk",
                                0x02
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    0x02,
                    Package (0x04)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_UFS_MEM",
                                "ICBID_SLAVE_EBI1",
                                0x8F0D1800,
                                0x8F0D1800
                            }
                        },

                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_APPSS_PROC",
                                "ICBID_SLAVE_UFS_MEM_CFG",
                                0x11D260C0,
                                Zero
                            }
                        }
                    },

                    Package (0x04)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_APPSS_PROC",
                                "ICBID_SLAVE_UFS_MEM_CFG",
                                Zero,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_UFS_MEM",
                                "ICBID_SLAVE_EBI1",
                                Zero,
                                Zero
                            }
                        }
                    }
                }
            },

            Package (0x0A)
            {
                "DSTATE",
                Zero,
                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        One,
                        0x00263540,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        One,
                        0x00124F80,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,
                        0x00124F80,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,
                        0x000D6D80,
                        One,
                        0x07,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "DELAY",
                    Package (One)
                    {
                        0x23
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        Zero
                    }
                }
            },

            Package (0x09)
            {
                "DSTATE",
                0x03,
                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        One
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,
                        0x000D6D80,
                        One,
                        0x04,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        One,
                        0x00124F80,
                        One,
                        0x04,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        One,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        Zero,
                        One
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        One
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_DSTATE",
                Zero
            }
        }
    })
    Name (FPCC, Package (One)
    {
        Package (0x06)
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package (0x04)
            {
                "COMPONENT",
                Zero,
                Package (0x02)
                {
                    "FSTATE",
                    Zero
                },

                Package (0x02)
                {
                    "FSTATE",
                    One
                }
            },

            Package (0x02)
            {
                "PRELOAD_DSTATE",
                0x03
            },

            Package (0x02)
            {
                "DSTATE",
                Zero
            },

            Package (0x04)
            {
                "DSTATE",
                0x03,
                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        One,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        One,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                }
            }
        }
    })
    Name (DPCC, Package (One)
    {
        Package (0x07)
        {
            "DEVICE",
            "\\_SB.SDC1",
            Package (0x0A)
            {
                "COMPONENT",
                Zero,
                Package (0x02)
                {
                    "FSTATE",
                    Zero
                },

                Package (0x02)
                {
                    "FSTATE",
                    One
                },

                Package (0x1A)
                {
                    "PSTATE_SET",
                    Zero,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x02,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x03,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x04,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x05,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x06,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x07,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x08,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x09,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0A,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0B,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0C,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0D,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0E,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0F,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x10,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x11,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x12,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x13,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x14,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x15,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x05)
                    {
                        "PSTATE",
                        0x16,
                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO7_B",
                                One,
                                0x002D2A80,
                                One,
                                0x07,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO19_B",
                                One,
                                0x001B7740,
                                One,
                                0x07,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                0x23
                            }
                        }
                    },

                    Package (0x04)
                    {
                        "PSTATE",
                        0x17,
                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO7_B",
                                One,
                                Zero,
                                Zero,
                                Zero,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                0x23
                            }
                        }
                    }
                },

                Package (0x0A)
                {
                    "PSTATE_SET",
                    One,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x08,
                                0x00061A80,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x02,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x08,
                                0x01312D00,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x03,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x08,
                                0x017D7840,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x04,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x08,
                                0x02FAF080,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x05,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x08,
                                0x05F5E100,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x06,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x08,
                                0x0B71B000,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x07,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_apps_clk",
                                0x08,
                                0x16E36000,
                                0x02
                            }
                        }
                    }
                },

                Package (0x07)
                {
                    "PSTATE_SET",
                    0x02,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_1",
                                "ICBID_SLAVE_EBI1",
                                0x2FAF0800,
                                0x17D78400
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_1",
                                "ICBID_SLAVE_EBI1",
                                0x17D78400,
                                0x0BEBC200
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x02,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_1",
                                "ICBID_SLAVE_EBI1",
                                0x0BEBC200,
                                0x05F5E100
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x03,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_1",
                                "ICBID_SLAVE_EBI1",
                                0x02625A00,
                                0x01312D00
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x04,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_1",
                                "ICBID_SLAVE_EBI1",
                                Zero,
                                Zero
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    0x03,
                    Package (0x05)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                One,
                                0x07
                            }
                        },

                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                0x02,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                0x05,
                                0x03
                            }
                        }
                    },

                    Package (0x05)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                One,
                                0x05
                            }
                        },

                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                0x02,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                0x05,
                                One
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    0x04,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_sdcc1_ahb_clk",
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_sdcc1_ahb_clk",
                                0x02
                            }
                        }
                    }
                },

                Package (0x06)
                {
                    "PSTATE_SET",
                    0x05,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_sdcc1_ice_core_clk",
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_ice_core_clk",
                                0x08,
                                0x05F5E100,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x02,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_ice_core_clk",
                                0x08,
                                0x08F0D180,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x03,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc1_ice_core_clk",
                                0x08,
                                0x11E1A300,
                                0x02
                            }
                        }
                    }
                }
            },

            Package (0x0A)
            {
                "DSTATE",
                Zero,
                Package (0x02)
                {
                    "TLMMPORT",
                    Package (0x03)
                    {
                        0x001B3000,
                        0x0001FFFF,
                        0x1FE4
                    }
                },

                Package (0x02)
                {
                    "TLMMPORT",
                    Package (0x03)
                    {
                        0x001B3004,
                        0x0001FFFF,
                        One
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        0x07
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x05,
                        0x03
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x04,
                        Zero
                    }
                },

                Package (One)
                {
                    "PSTATE_RESTORE"
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        Zero,
                        0x16
                    }
                }
            },

            Package (0x09)
            {
                "DSTATE",
                0x03,
                Package (One)
                {
                    "PSTATE_SAVE"
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x05,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x04,
                        One
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        0x04
                    }
                },

                Package (0x02)
                {
                    "TLMMPORT",
                    Package (0x03)
                    {
                        0x001B3000,
                        0x0001FFFF,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "TLMMPORT",
                    Package (0x03)
                    {
                        0x001B3004,
                        0x0001FFFF,
                        Zero
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_EXCEPTION",
                Package (0x02)
                {
                    "EXECUTE_FUNCTION",
                    Package (One)
                    {
                        "ExecuteOcdEMMCExceptions"
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_DSTATE",
                Zero
            }
        }
    })
    Name (SDCC, Package (One)
    {
        Package (0x07)
        {
            "DEVICE",
            "\\_SB.SDC2",
            Package (0x09)
            {
                "COMPONENT",
                Zero,
                Package (0x02)
                {
                    "FSTATE",
                    Zero
                },

                Package (0x02)
                {
                    "FSTATE",
                    One
                },

                Package (0x19)
                {
                    "PSTATE_SET",
                    Zero,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x02,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x03,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x04,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x05,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x06,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x07,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x08,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x09,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0B,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0C,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0D,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0E,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x0F,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x10,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x11,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x12,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x13,
                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                One
                            }
                        }
                    },

                    Package (0x08)
                    {
                        "PSTATE",
                        0x14,
                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                One,
                                Zero,
                                Zero,
                                Zero,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                One,
                                Zero,
                                Zero,
                                Zero,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                0x23
                            }
                        },

                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                One,
                                0x002D2A80,
                                One,
                                0x07,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                One,
                                0x002D0370,
                                One,
                                0x07,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                0x23
                            }
                        }
                    },

                    Package (0x04)
                    {
                        "PSTATE",
                        0x15,
                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                One,
                                0x001B7740,
                                One,
                                0x07,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                0x23
                            }
                        }
                    },

                    Package (0x05)
                    {
                        "PSTATE",
                        0x16,
                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                One,
                                0x002D2A80,
                                One,
                                0x07,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                One,
                                0x002D0370,
                                One,
                                0x07,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                0x23
                            }
                        }
                    },

                    Package (0x05)
                    {
                        "PSTATE",
                        0x17,
                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                One,
                                Zero,
                                Zero,
                                Zero,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "PMICVREGVOTE",
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                One,
                                Zero,
                                Zero,
                                Zero,
                                Zero
                            }
                        },

                        Package (0x02)
                        {
                            "DELAY",
                            Package (One)
                            {
                                0x23
                            }
                        }
                    }
                },

                Package (0x05)
                {
                    "PSTATE_SET",
                    One,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_sdcc2_apps_clk",
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk",
                                0x08,
                                0x05F5E100,
                                0x02
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x02,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x04)
                            {
                                "gcc_sdcc2_apps_clk",
                                0x08,
                                0x0C0A4680,
                                0x02
                            }
                        }
                    }
                },

                Package (0x05)
                {
                    "PSTATE_SET",
                    0x02,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_2",
                                "ICBID_SLAVE_EBI1",
                                0x17D78400,
                                0x0BEBC200
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_2",
                                "ICBID_SLAVE_EBI1",
                                0x0BEBC200,
                                0x05F5E100
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        0x02,
                        Package (0x02)
                        {
                            "BUSARB",
                            Package (0x05)
                            {
                                0x03,
                                "ICBID_MASTER_SDCC_2",
                                "ICBID_SLAVE_EBI1",
                                Zero,
                                Zero
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    0x03,
                    Package (0x04)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                One,
                                0x02
                            }
                        },

                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                0x02,
                                Zero
                            }
                        }
                    },

                    Package (0x04)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                One,
                                One
                            }
                        },

                        Package (0x02)
                        {
                            "PSTATE_ADJUST",
                            Package (0x02)
                            {
                                0x02,
                                One
                            }
                        }
                    }
                },

                Package (0x04)
                {
                    "PSTATE_SET",
                    0x04,
                    Package (0x03)
                    {
                        "PSTATE",
                        Zero,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_sdcc2_ahb_clk",
                                One
                            }
                        }
                    },

                    Package (0x03)
                    {
                        "PSTATE",
                        One,
                        Package (0x02)
                        {
                            "CLOCK",
                            Package (0x02)
                            {
                                "gcc_sdcc2_ahb_clk",
                                0x02
                            }
                        }
                    }
                }
            },

            Package (0x07)
            {
                "DSTATE",
                Zero,
                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        Zero,
                        0x16
                    }
                },

                Package (0x02)
                {
                    "TLMMPORT",
                    Package (0x03)
                    {
                        0x001B4000,
                        0x7FFF,
                        0x1FE4
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x04,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        0x02
                    }
                }
            },

            Package (0x07)
            {
                "DSTATE",
                0x03,
                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        One,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x04,
                        One
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        0x02,
                        0x02
                    }
                },

                Package (0x02)
                {
                    "TLMMPORT",
                    Package (0x03)
                    {
                        0x001B4000,
                        0x7FFF,
                        0x0A00
                    }
                },

                Package (0x02)
                {
                    "PSTATE_ADJUST",
                    Package (0x02)
                    {
                        Zero,
                        0x17
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_EXCEPTION",
                Package (0x02)
                {
                    "EXECUTE_FUNCTION",
                    Package (One)
                    {
                        "ExecuteOcdSdCardExceptions"
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_DSTATE",
                Zero
            }
        }
    })
}
