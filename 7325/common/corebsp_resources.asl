//===========================================================================
//                           <corebsp_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by core BSP drivers.
//
//===========================================================================


Scope(\_SB_.PEP0)
{

    Method(MPMD)
    {
        Return(MPCC)
    }

    Name(MPCC, Package() {})
}

Scope(\_SB_.PEP0)
{
    Method(OPMD)
    {
        Return(OPCC)
    }

    Name(OPCC, Package() {})
}

Scope(\_SB_.PEP0)
{
    Method(LPMD)
    {
        Return(LPCC)
    }

    Name(LPCC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.URS0",
            Package()
            {
                "COMPONENT",
                0x0,
                Package() {"FSTATE", 0},
                Package() {"PSTATE", 0},
                Package() {"PSTATE", 1}
            },
            Package() {"DSTATE", 0},
            Package() {"DSTATE", 1},
            Package() {"DSTATE", 2},
            Package() {"DSTATE", 3}
        },

        //USB SS/HS1 core (Host Stack)
        Package()
        {
            "DEVICE",
            "\\_SB.URS0.USB0",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package() { "FSTATE", 0 },
                Package() { "PSTATE", 0 }
            },
            //D states
            Package()
            { // HOST D0
                "DSTATE",
                0x0,
                //Power Grid for SM7325
                Package()
                {
                    // L01C
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // Voltage 1.8V : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L01B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        912000,                     // Voltage 0.912V : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L02B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        3072000,                    // Voltage 3.072V : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L06B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1200000,                    // Voltage 1.2V : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L10C
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        880000,                     // Voltage 0.880V : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode
                        0                           // Head Room
                    }
                },

                // Enable gcc_usb30_prim_gdsc power domain
                Package()
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        1                           // 1==Enable
                    }
                },

                // Now Enable all the clocks

                Package() {"CLOCK", Package() {"gcc_usb30_prim_sleep_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 8, 19200, 7}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 8, 19200, 7}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},

                // Nominal==block vdd_min:
                Package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 256}
                },

                // Vote for max freq: BUS Arbiter Request (Type-3)
                // Instantaneous BW BytesPerSec = 671088640;
                // Arbitrated BW BytesPerSec = 671088640 (5  x 1024 X 1024 x 1024)/8
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        671088640,                  // IB=5Gbps
                        671088640                   // AB=5Gbps
                    }
                },

                // Vote for CNOC 100 MHz - 200 MB/s IB-only (AB = 0)
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                //BUS Arbiter Request (Type-3)
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        200000000,                  // IB=200 MBps
                        0                           // AB=0 MBps
                    }
                }
            },
            Package()
            { // HOST D1
                "DSTATE",  // D1 state
                0x1,

                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600, 5}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                Package()
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        1                           // 1==Enable
                    }
                },

                // enable vdd_min
                Package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 0}
                },

                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L01C
                    Package()
                    {
                        // L01C
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // Voltage 1.800V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L01B
                    Package()
                    {
                        // L01B
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        912000,                     // Voltage 0.912V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package()
                    {
                        // L02B
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        3072000,                    // Voltage 3.072V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L06B
                    Package()
                    {
                        // L06B
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1200000,                    // Voltage 1.200V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L10C
                    Package()
                    {
                        // L10C
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        880000,                     // Voltage 0.880V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                }
            },
            Package()
            { // HOST D2
                "DSTATE",
                0x2, // Slave device disconnect (host cable is still connected)

                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                        // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                       // IB=0 MBps
                        0                        // AB=0 MBps
                    }
                },

                // Enable usb30_prim_gdsc power domain
                Package()
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        1                           // 1==Enable
                    }
                },

                // enable vdd_min
                Package()
                {
                    "NPARESOURCE",
                    Package() { 1, "/arc/client/rail_cx", 0}
                },

                //Power Grid for SM7325
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L01C
                    Package()
                    {
                        // L01C
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // Voltage 1.800V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L01B
                    Package()
                    {
                        // L01B
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        912000,                     // Voltage 0.912V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package()
                    {
                        // L02B
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        3072000,                    // Voltage 3.072V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package()
                    {
                        // L06B
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1200000,                    // Voltage 1.2V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L02B
                    Package()
                    {
                        // L10C
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        880000,                     // Voltage 0.880V: microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                }

            },
            Package()
            { // HOST D3
                "DSTATE",
                0x3, // Abandon state

                Package() {"CLOCK", Package() {"gcc_usb30_prim_sleep_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                //Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                // Disable usb30_prim_gdsc power domain
                Package()
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        2                           // 2==Disable
                    }
                },

                // enable vdd_min
                Package() {"NPARESOURCE", Package() {1, "/arc/client/rail_cx", 0}},

                //Power Grid for SM7325
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L02B
                    {
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        0,                          // Voltage = 0 V
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L01B
                    {
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        0,                          // Voltage = 0 V
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L01C
                    {
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        0,                          // Voltage = 0 V
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L06B
                    {
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        0,                          // Voltage = 0 V
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L10C
                    {
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        0,                          // Voltage = 0 V
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                }
            },
            // Define Abandon State for USB0 (host) stack ie. Power State invoked when stack unloads/tears down
            Package()
            {
                "ABANDON_DSTATE",
                3                                   // Abandon D state defined as D3
            }
        }, //End USB0

        //USB Primary Core (Host Stack) Standalone
        Package()
        {
            "DEVICE",
            "\\_SB.USB0",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package() { "FSTATE", 0x0 },
                Package()
                {
                    "PSTATE",
                    0x0
                }
            },
            //D states
            Package()
            { // HOST D0
                "DSTATE",
                0x0,
                //Power Grid for SM7325
                Package()
                {
                    // L01C
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L01C
                    {
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // Voltage 1.8V        : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L01B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L01B
                    {
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        912000,                     // Voltage 0.912V        : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L02B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L02B
                    {
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        3072000,                    // Voltage 3.072V        : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L06B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L06B
                    {
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1200000,                    // Voltage 1.2V        : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L10C
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L10C
                    {
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        880000,                     // Voltage 0.880V        : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },

                // Enable usb30_prim_gdsc power domain
                Package()
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        1                           // 1 == Enable
                    }
                },

                // Now Enable all the clocks

                Package() {"CLOCK", Package() {"gcc_usb30_prim_sleep_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 8, 19200, 7}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 8, 19200, 7}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},

                // Nominal==block vdd_min:
                Package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 256}
                },

                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        671088640,                  // IB=671 MBps
                        671088640                   // AB=671 MBps
                    }
                },

                // Vote for CNOC 100 MHz - 200 MB/s IB-only (AB = 0)
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                //BUS Arbiter Request (Type-3)
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        200000000,                  // IB=200 MBps
                        0                           // AB=0 MBps
                    }
                }
            },

            Package()
            { // HOST D1
                "DSTATE", // D1 state (Suspend State - HS Suspend + SS disconnect /SS Suspend + HS disconnect/ HS + SS suspend)
                0x1,

                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600, 5}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",
                        1
                    }
                },

                // enable vdd_min
                Package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 0}
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L01C
                    Package()
                    {
                        // L01C
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // Voltage         : microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L01B
                    {
                        // L01B
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        912000,                     // Voltage 0.912V         : microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L02B
                    {
                        // L02B
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        3072000,                    // Voltage = 3.072 V
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L06B
                    {
                        // L06B
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        1200000,                    // Voltage = 1.2 V
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L06B
                    {
                        // L10C
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        880000,                     // Voltage (microvolts)
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                }
            },

            Package()
            { // HOST D2
                "DSTATE",
                0x2, // Slave device disconnect (host cable is still connected)

                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        0,                          // IB=0 Mbps
                        0                           // AB=0Mbps
                    }
                },

                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                          // IB=0 MBps
                        0                           // AB=0 MBps
                    }
                },

                // Enable usb30_prim_gdsc power domain
                Package()
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        1                           // 1 == Enable
                    }
                },

                // enable vdd_min
                Package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 0}
                },

                // Power Grid for SM7325
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L01C
                    Package()
                    {
                        // L01C
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // Voltage         : microvolts ( V )
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                        }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L01B
                    {
                        // L01B
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        912000,                     // Voltage (microvolts)
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L02B
                    {
                        // L02B
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        3072000,                    // Voltage = 3.072 V
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L06B
                    {
                        // L06B
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        1200000,                    // Voltage = 1.2 V
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L06B
                    {
                        // L10C
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        880000,                     // Voltage (microvolts)
                        1,                          // SW Enable = Enable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                }
            },

            Package()
            { // HOST D3
                "DSTATE",
                0x3, // Abandon state

                Package() {"CLOCK", Package() {"gcc_usb30_prim_sleep_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_USB3_0",      // Master
                        "ICBID_SLAVE_EBI1",         // Slave
                        0,                          // IB=0 Mbps
                        0                           // AB=0Mbps
                    }
                },

                // Remove Vote for CNOC 100 MHz
                // Required for gcc_usb_phy_cfg_ahb2phy_clk
                // BUS Arbiter Request (Type-3)
                // Vote for 0 freq
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,                          // Req Type
                        "ICBID_MASTER_APPSS_PROC",  // Master
                        "ICBID_SLAVE_USB3_0",       // Slave
                        0,                          // IB=0 Mbps
                        0                           // AB=0Mbps
                    }
                },

                // Disable usb30_prim_gdsc power domain
                Package()
                {
                    "FOOTSWITCH",                   // Footswitch
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",      // USB 3.0 Core Power domain
                        2                           // 2 == Disable
                    }
                },

                //enable vdd_min
                Package() {"NPARESOURCE", Package() {1, "/arc/client/rail_cx", 0}},

                //Power Grid for SM7325
                Package()
                {
                    "PMICVREGVOTE",                 // PMICVREGVOTE resource
                    Package()                       // Vote for L02B
                    {
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        0,                          // Voltage = 0 V
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // Vote for L01B
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        0,                          // Voltage         : 0 microvolts ( V )
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L01C
                    {
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        0,                          // Voltage         : 0 microvolts ( V )
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L06B
                    {
                        "PPP_RESOURCE_ID_LDO6_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        0,                          // Voltage         : 0 microvolts ( V )
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L10C
                    {
                        "PPP_RESOURCE_ID_LDO10_C",  // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        0,                          // Voltage         : 0 microvolts ( V )
                        0,                          // SW Enable = Disable
                        4,                          // SW Power Mode =
                        0                           // Head Room
                    }
                }
            },
            // Define Abandon State for USB0 (host) stack ie. Power State invoked when stack unloads/tears down
            Package()
            {
                "ABANDON_DSTATE",                   // Abandon D state defined as D3
                3
            }
        },

        //
        //************************* USB3.0 SS/HS0 core (Peripheral Stack) ****************************
        //
        Package()
        {
            "DEVICE",
            "\\_SB.URS0.UFN0",
            Package()
            {
                "COMPONENT",
                0x0,
                // F-State placeholders
                Package()
                {
                    "FSTATE",
                    0x0
                },
                Package()
                {
                    "PSTATE",
                    0x0
                }
            },
            Package()
            { // PERIPH D0
                "DSTATE",
                0x0,
                // Power Grid for SM7325
                Package()
                {
                    // L01C
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L01C
                    {
                        "PPP_RESOURCE_ID_LDO1_C",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type = LDO
                        1800000,                    // Voltage 1.8V        : microvolts ( V )
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L01B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L01B
                    {
                        "PPP_RESOURCE_ID_LDO1_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        912000,                     // Voltage (microvolts)
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    // L02B
                    "PMICVREGVOTE",                 // PMIC VREG resource
                    Package()                       // Vote for L02B
                    {
                        "PPP_RESOURCE_ID_LDO2_B",   // Voltage Regulator ID
                        1,                          // Voltage Regulator type 1 = LDO
                        3072000,                    // Voltage = 3.072 V
                        1,                          // SW Enable = Enable
                        7,                          // SW Power Mode =
                        0                           // Head Room
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,
                        1200000,
                        1,
                        7,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        7,
                        0
                    }
                },
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",
                        1
                    }
                },

                Package() {"CLOCK", Package() {"gcc_usb30_prim_sleep_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 8, 200, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 8, 19200, 7}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 8, 19200, 7}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 8, 19200, 7}},

                Package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 256}

                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_USB3_0",
                        "ICBID_SLAVE_EBI1",
                        671088640,
                        671088640
                    }
                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB3_0",
                        200000000,
                        0
                    }
                }
            },
            Package()
            {
                "DSTATE",
                0x1
            },
            Package()
            {
                "DSTATE",
                0x2,

                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_USB3_0",
                        "ICBID_SLAVE_EBI1",
                        0,
                        0
                    }
                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB3_0",
                        0,
                        0
                    }
                },
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",
                        1
                    }
                },
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_cx",
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        1,
                        1800000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_B",
                        1,
                        912000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        1,
                        3072000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,
                        1200000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        4,
                        0
                    }
                }
            },
            Package()
            {
                "DSTATE",
                0x3,

                Package() {"CLOCK", Package() {"gcc_usb30_prim_sleep_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_pipe_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_prim_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_prim_mock_utmi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb3_prim_phy_com_aux_clk", 2}},

                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_USB3_0",
                        "ICBID_SLAVE_EBI1",
                        0,
                        0
                    }
                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB3_0",
                        0,
                        0
                    }
                },
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_prim_gdsc",
                        2
                    }
                },
                Package()
                {
                    "NPARESOURCE",
                    Package() {1, "/arc/client/rail_cx", 0}

                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_B",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                }
            },
            Package()
            {
                "ABANDON_DSTATE",
                3
            }
        },
        Package()
        {
            "DEVICE",
            "\\_SB.USB1",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
                    0x0
                },
                Package()
                {
                    "PSTATE",
                    0x0
                }
            },
            Package(0xe)
            {
                "DSTATE",
                0x0,
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        1,
                        1800000,
                        1,
                        7,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        7,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        1,
                        3072000,
                        1,
                        7,
                        0
                    }
                },
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_sec_gdsc",
                        1
                    }
                },
                Package() {"CLOCK", Package() {"gcc_usb30_sec_sleep_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_sec_axi_clk", 8, 120, 9}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_sec_axi_clk", 8, 120, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_master_clk", 8, 120, 9}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_mock_utmi_clk", 8, 19200, 7}},

                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_USB2",
                        "ICBID_SLAVE_EBI1",
                        60000000,
                        60000000
                    }
                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB2",
                        200000000,
                        0
                    }
                },
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_cx",
                        256
                    }
                }
            },
            Package(0xe)
            {
                "DSTATE",
                0x1,
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_sec_gdsc",
                        1
                    }
                },

                Package() {"CLOCK", Package() {"gcc_usb30_sec_master_clk", 3, 9600, 5}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_sec_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_mock_utmi_clk", 2}},
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB2",
                        0,
                        0
                    }
                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_USB2",
                        "ICBID_SLAVE_EBI1",
                        0,
                        0
                    }
                },
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_cx",
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        1,
                        1800000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        1,
                        3072000,
                        1,
                        4,
                        0
                    }
                }
            },
            Package(0xe)
            {
                "DSTATE",
                0x2,
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_sec_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB2",
                        0,
                        0
                    }
                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_USB2",
                        "ICBID_SLAVE_EBI1",
                        0,
                        0
                    }
                },
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_sec_gdsc",
                        1
                    }
                },
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_cx",
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        1,
                        1800000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        1,
                        3072000,
                        1,
                        4,
                        0
                    }
                }
            },
            Package(0xf)
            {
                "DSTATE",
                0x3,
                Package() {"CLOCK", Package() {"gcc_usb30_sec_sleep_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_aggre_usb3_sec_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_cfg_noc_usb3_sec_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_master_clk", 3, 9600000, 1}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_master_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_usb30_sec_mock_utmi_clk", 2}},

                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_APPSS_PROC",
                        "ICBID_SLAVE_USB2",
                        0,
                        0
                    }
                },
                Package()
                {
                    "BUSARB",
                    Package()
                    {
                        3,
                        "ICBID_MASTER_USB2",
                        "ICBID_SLAVE_EBI1",
                        0,
                        0
                    }
                },
                Package()
                {
                    "FOOTSWITCH",
                    Package()
                    {
                        "gcc_usb30_sec_gdsc",
                        2
                    }
                },
                Package()
                {
                    "NPARESOURCE",
                    Package()
                    {
                        1,
                        "/arc/client/rail_cx",
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO2_B",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                },
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO1_C",
                        1,
                        0,
                        0,
                        4,
                        0
                    }
                }
            },
            Package()
            {
                "ABANDON_DSTATE",
                3
            }
        }
    })
}

Scope (\_SB.PEP0)
{
    Method (BPMD)
    {
        If ((STOR == 1))
        {
            If ((PUS3 == 1))
            {
                Return (CPCC)
            }
            Else
            {
                Return (BPCC)
            }
        }
        ElseIf ((STOR == 2))
        {
            Return (DPCC)
        }
        Else
        {
            Return (FPCC)
        }
    }

    Method (SDMD)
    {
        Return (SDCC)
    }

    Name (BPCC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
                    0x0,
                    Package() { "PSTATE_ADJUST", Package() { 0, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 0 } },
                    Package() { "PSTATE_ADJUST", Package() { 2, 0 } }
                },
                Package()
                {
                    "FSTATE",
                    0x1,
                    Package() { "PSTATE_ADJUST", Package() { 2, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 1, 1 } },
                    Package() { "PSTATE_ADJUST", Package() { 0, 1 } }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x0,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "FOOTSWITCH", Package() { "gcc_ufs_phy_gdsc", 1 }}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() { "FOOTSWITCH", Package() { "gcc_ufs_phy_gdsc", 2 }}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,

                        Package() {"CLOCK", Package() {"gcc_ufs_phy_axi_clk", 8, 300000000, 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_unipro_core_clk", 8, 300000000, 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 9, 18}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 3, 300000000, 2}},
                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 1}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_unipro_core_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_axi_clk", 2}}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x02,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_UFS_MEM", "ICBID_SLAVE_EBI1", 1200000000, 1200000000}},
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_UFS_MEM_CFG", 299000000, 0}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_UFS_MEM_CFG", 0, 0}},
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_UFS_MEM", "ICBID_SLAVE_EBI1", 0, 0}}
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x0,

                Package() {"PSTATE_ADJUST", Package() { 2, 0 } },
                Package() {"PSTATE_ADJUST", Package() { 0, 0 } },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        1,
                        2904000,
                        1,
                        7,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        1,
                        1200000,
                        1,
                        7,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,
                        1200000,
                        1,
                        7,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        7,
                        0
                    }
                },

                Package() {"DELAY", Package() { 35 } },

                Package() {"PSTATE_ADJUST", Package() { 1, 0 } }
            },
            Package()
            {
                "DSTATE",
                0x03,

                Package() {"PSTATE_ADJUST", Package() { 1, 1 } },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        4,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,
                        0,
                        0,
                        0,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        1,
                        1200000,
                        1,
                        4,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        1,
                        0,
                        0,
                        0,
                        0
                    }
                },

                Package() {"PSTATE_ADJUST", Package() { 0, 1 } },
                Package() {"PSTATE_ADJUST", Package() { 2, 1 } }
            },
            Package()
            {
                "CRASHDUMP_EXCEPTION",
                Package() {"EXECUTE_FUNCTION", Package() {"ExecuteOcdEMMCExceptions"}}
            },
            Package() {"CRASHDUMP_DSTATE", 0}
        }
    })

    Name (CPCC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
                    0x0,
                    Package() {"PSTATE_ADJUST", Package() { 0, 0 } },
                    Package() {"PSTATE_ADJUST", Package() { 1, 0 } },
                    Package() {"PSTATE_ADJUST", Package() { 2, 0 } }
                },
                Package()
                {
                    "FSTATE",
                    0x1,
                    Package() {"PSTATE_ADJUST", Package() { 2, 1 } },
                    Package() {"PSTATE_ADJUST", Package() { 1, 1 } },
                    Package() {"PSTATE_ADJUST", Package() { 0, 1 } }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x0,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "FOOTSWITCH", Package() { "gcc_ufs_phy_gdsc", 1 }}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() { "FOOTSWITCH", Package() { "gcc_ufs_phy_gdsc", 2 }}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,

                        Package() {"CLOCK", Package() {"gcc_ufs_phy_axi_clk", 8, 300000000, 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_unipro_core_clk", 8, 300000000, 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 9, 18}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 3, 300000000, 2}},
                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 1}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 1}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,

                        Package() {"CLOCK", Package() {"gcc_aggre_ufs_phy_axi_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ahb_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_phy_aux_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_tx_symbol_0_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_0_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_rx_symbol_1_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_ice_core_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_unipro_core_clk", 2}},
                        Package() {"CLOCK", Package() {"gcc_ufs_phy_axi_clk", 2}}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x02,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_UFS_MEM", "ICBID_SLAVE_EBI1", 2400000000, 2400000000}},
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_UFS_MEM_CFG", 299000000, 0}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_APPSS_PROC", "ICBID_SLAVE_UFS_MEM_CFG", 0, 0}},
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_UFS_MEM", "ICBID_SLAVE_EBI1", 0, 0}}
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x0,

                Package() {"PSTATE_ADJUST", Package() { 2, 0 } },
                Package() {"PSTATE_ADJUST", Package() { 0, 0 } },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        1,
                        2504000,
                        1,
                        7,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        1,
                        1200000,
                        1,
                        7,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,
                        1200000,
                        1,
                        7,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        7,
                        0
                    }
                },

                Package() {"DELAY", Package() { 35 }},

                Package() {"PSTATE_ADJUST", Package() { 1, 0 } }
            },
            Package()
            {
                "DSTATE",
                0x03,

                Package() {"PSTATE_ADJUST", Package() { 1, 1 } },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,
                        880000,
                        1,
                        4,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,
                        0,
                        0,
                        0,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        1,
                        1200000,
                        1,
                        4,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        1,
                        0,
                        0,
                        0,
                        0
                    }
                },

                Package() {"PSTATE_ADJUST", Package() { 0, 1 } },

                Package() {"PSTATE_ADJUST", Package() { 2, 1 } }
            },

            Package() {"CRASHDUMP_DSTATE", 0}
        }
    })
    Name (FPCC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.UFS0",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
                    0x0
                },
                Package()
                {
                    "FSTATE",
                    0x1
                }
            },

            Package()
            {
                "PRELOAD_DSTATE",
                0x03
            },

            Package()
            {
                "DSTATE",
                0x0
            },

            Package()
            {
                "DSTATE",
                0x03,
                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO9_B",
                        1,
                        0,
                        0,
                        0,
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO7_B",
                        1,
                        0,
                        0,
                        0,
                        0
                    }
                }
            }
        }
    })
    Name (DPCC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.SDC1",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
                    0x0
                },
                Package()
                {
                    "FSTATE",
                    0x1
                },

                Package (0x1A)
                {
                    "PSTATE_SET",
                    0x0,

                    //
                    // Contract with SDBUS for card frequencies
                    //
                    // P-State      Note
                    // --------     -----
                    // 0 - 19       Reserved (Legacy)
                    // 20           Reset to 3.3v signal voltage (max fixed at 2.95v)
                    // 21           1.8v signal voltage (max fixed at 1.85v)
                    Package(){"PSTATE",     0, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     1, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     2, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     3, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     4, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     5, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     6, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     7, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     8, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",     9, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    10, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    11, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    12, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    13, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    14, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    15, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    16, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    17, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    18, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    19, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    20, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    21, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    22,
                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO7_B",
                                1,
                                2960000,
                                1,
                                7,
                                0
                            }
                        },

                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO19_B",
                                1,
                                1800000,
                                1,
                                7,
                                0
                            }
                        },

                        Package() {"DELAY", Package() { 35 }}
                    },

                    Package() {"PSTATE",   23,
                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO7_B",
                                1,
                                0,
                                0,
                                0,
                                0
                            }
                        },

                        Package() {"DELAY", Package() { 35 }}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 8, 400000, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x02,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 8, 20000000, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x03,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 8, 25000000, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x04,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 8, 50000000, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x05,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 8, 100000000, 2}
                        }
                    },
                    Package()
                    {
                        "PSTATE",
                        0x06,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 8, 192000000, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x07,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_apps_clk", 8, 384000000, 2}}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x02,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_1", "ICBID_SLAVE_EBI1", 800000000, 400000000}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_1", "ICBID_SLAVE_EBI1", 400000000, 200000000}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x02,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_1", "ICBID_SLAVE_EBI1", 200000000, 100000000}
                        }
                    },
                    Package()
                    {
                        "PSTATE",
                        0x03,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_1", "ICBID_SLAVE_EBI1", 40000000, 20000000}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x04,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_1", "ICBID_SLAVE_EBI1", 0, 0}}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x03,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"PSTATE_ADJUST", Package() { 1, 7 } },
                        Package() {"PSTATE_ADJUST", Package() { 2, 0 } },
                        Package() {"PSTATE_ADJUST", Package() { 5, 3 } }
                    },

                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"PSTATE_ADJUST", Package() { 1, 5 } },
                        Package() {"PSTATE_ADJUST", Package() { 2, 2 } },
                        Package() {"PSTATE_ADJUST", Package() { 5, 1 } }
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x04,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_ahb_clk", 1}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_ahb_clk", 2}}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x05,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_ice_core_clk", 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_ice_core_clk", 8, 100000000, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x02,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_ice_core_clk", 8, 0x08F0D180, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x03,
                        Package() {"CLOCK", Package() {"gcc_sdcc1_ice_core_clk", 8, 300000000, 2}}
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x0,

                Package() {"TLMMPORT", Package() { 1781760, 131071, 8164 }},
                Package() {"TLMMPORT", Package() { 1781764, 131071, 1 }},
                Package() {"PSTATE_ADJUST", Package() { 1, 7 }},
                Package() {"PSTATE_ADJUST", Package() { 2, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 5, 3 }},
                Package() {"PSTATE_ADJUST", Package() { 4, 0 }},

                Package()
                {
                    "PSTATE_RESTORE"
                },

                Package() {"PSTATE_ADJUST", Package() { 0, 22 }}
            },

            Package()
            {
                "DSTATE",
                0x03,

                Package()
                {
                    "PSTATE_SAVE"
                },

                Package() {"PSTATE_ADJUST", Package() { 5, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 4, 1 }},
                Package() {"PSTATE_ADJUST", Package() { 1, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 2, 4 }},
                Package() {"TLMMPORT", Package() { 1781760, 131071, 0 }},
                Package() {"TLMMPORT", Package() { 1781764, 131071, 0 }}
            },

            Package()
            {
                "CRASHDUMP_EXCEPTION",
                Package() {"EXECUTE_FUNCTION", Package() {"ExecuteOcdEMMCExceptions"}}
            },

            Package()
            {
                "CRASHDUMP_DSTATE",
                0
            }
        }
    })
    Name (SDCC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.SDC2",
            Package()
            {
                "COMPONENT",
                0x0,
                Package()
                {
                    "FSTATE",
                    0x0
                },

                Package()
                {
                    "FSTATE",
                    0x1
                },

                Package ()
                {
                    "PSTATE_SET",
                    0x0,

                    //
                    // Contract with SDBUS for card frequencies
                    //
                    // P-State      Note
                    // --------     -----
                    // 0 - 19       Reserved (Legacy)
                    // 20           Reset to 3.3v signal voltage (max fixed at 2.95v)
                    // 21           1.8v signal voltage (max fixed at 1.85v)
                    Package(){"PSTATE",    0, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    1, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    2, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    3, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    4, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    5, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    6, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    7, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    8, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",    9, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   11, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   12, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   13, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   14, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   15, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   16, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   17, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   18, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   19, Package(){"DELAY", Package() { 1 }}},
                    Package(){"PSTATE",   20,
                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                1,
                                0,
                                0,
                                0,
                                0
                            }
                        },

                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                1,
                                0,
                                0,
                                0,
                                0
                            }
                        },

                        Package() {"DELAY", Package() { 35 }},

                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                1,
                                2960000,
                                1,
                                7,
                                0
                            }
                        },

                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                1,
                                2950000,
                                1,
                                7,
                                0
                            }
                        },

                        Package() {"DELAY", Package() { 35 }}
                    },
                    Package(){"PSTATE",   0x15,
                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                1,
                                1800000,
                                1,
                                7,
                                0
                            }
                        },

                        Package() {"DELAY", Package() { 35 }}
                    },

                    Package(){"PSTATE",   0x16,
                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                1,
                                2960000,
                                1,
                                7,
                                0
                            }
                        },

                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                1,
                                2950000,
                                1,
                                0x07,
                                0
                            }
                        },

                        Package() {"DELAY", Package() { 35 }}
                    },

                    Package(){"PSTATE",   0x17,
                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO9_C",
                                1,
                                0,
                                0,
                                0,
                                0
                            }
                        },

                        Package()
                        {
                            "PMICVREGVOTE",
                            Package()
                            {
                                "PPP_RESOURCE_ID_LDO6_C",
                                1,
                                0,
                                0,
                                0,
                                0
                            }
                        },

                        Package() {"DELAY", Package() { 35 }}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x1,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"CLOCK", Package() {"gcc_sdcc2_apps_clk", 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"CLOCK", Package() {"gcc_sdcc2_apps_clk", 8, 100000000, 2}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x02,
                        Package() {"CLOCK", Package() {"gcc_sdcc2_apps_clk", 8, 202000000, 2}}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x02,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_2", "ICBID_SLAVE_EBI1", 400000000, 200000000}}
                    },

                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_2", "ICBID_SLAVE_EBI1", 200000000, 100000000}}
                    },

                    Package()
                    {
                        "PSTATE",
                        0x02,
                        Package() {"BUSARB", Package() {3, "ICBID_MASTER_SDCC_2", "ICBID_SLAVE_EBI1", 0, 0}}
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x03,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() { "PSTATE_ADJUST", Package() { 1, 2 } },
                        Package() { "PSTATE_ADJUST", Package() { 2, 0 } }
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() { "PSTATE_ADJUST", Package() { 1, 1 } },
                        Package() { "PSTATE_ADJUST", Package() { 2, 1 } }
                    }
                },

                Package()
                {
                    "PSTATE_SET",
                    0x04,

                    Package()
                    {
                        "PSTATE",
                        0x0,
                        Package() {"CLOCK", Package() {"gcc_sdcc2_ahb_clk", 1}}
                    },
                    Package()
                    {
                        "PSTATE",
                        0x1,
                        Package() {"CLOCK", Package() {"gcc_sdcc2_ahb_clk", 2}}
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x0,

                Package() {"PSTATE_ADJUST", Package() { 0, 22 }},
                Package() {"TLMMPORT", Package() { 1785856, 32767, 8164 }},
                Package() {"PSTATE_ADJUST", Package() { 2, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 4, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 1, 2 }}
            },
            Package()
            {
                "DSTATE",
                0x03,

                Package() {"PSTATE_ADJUST", Package() { 1, 0 }},
                Package() {"PSTATE_ADJUST", Package() { 4, 1 }},
                Package() {"PSTATE_ADJUST", Package() { 2, 2 }},
                Package() {"TLMMPORT", Package() { 1785856, 32767, 2560 }},
                Package() {"PSTATE_ADJUST", Package() { 0, 23 }}
            },

            Package()
            {
                "CRASHDUMP_EXCEPTION",
                Package() {"EXECUTE_FUNCTION", Package() {"ExecuteOcdSdCardExceptions"}}
            },

            Package()
            {
                "CRASHDUMP_DSTATE",
                0
            }
        }
    })
}
