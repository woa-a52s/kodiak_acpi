//===========================================================================
//                           <pcie_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pcie subsystem.
//
//===========================================================================


Scope (\_SB.PEP0)
{
    Method (PEMD)
    {
        If ((SKUV == 1))
        {
            // PCIe Intra-Soc ports
            Return (PEMC)
        }
        Else
        {
            // PCIe HP port
            Return (PEMX)
        }
    }

    Name (PEMC,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.PCI1",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0 // f0 state
                },

                Package()
                {
                    "FSTATE",
                    0x1 // f1 state
                }
            },

            Package()
            {
                "DSTATE",
                0x0, // D0 state
                Package()
                {
                    "TLMMGPIO",                             // TLMMGPIO resource
                    Package()
                    {
                        19,                                 // PIN number = 19
                        1,                                  // State: active
                        0,                                  // Function select = GPIO
                        1,                                  // direction = Output.
                        0,                                  // Pull value = No Pull
                        0,                                  // Drive Strength: 0x0 = 2mA
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage 1.2V        : microvolts ( V )
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0                                   // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,                                  // Voltage Regulator Type, 1 = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0                                   // Headroom
                    }
                },

                // Turning on PCIe core
                Package() {"FOOTSWITCH", Package() {"gcc_pcie_1_gdsc", 1}},

                // ICB votes through PSTATE
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 1960000000, 1960000000}},

                Package() {"CLOCK", Package() {"gcc_pcie_1_pipe_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_axi_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_q2a_axi_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_mstr_axi_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_cfg_ahb_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_aux_clk", 8, 19200000, 3}},
                Package() {"CLOCK", Package() {"gcc_pcie1_phy_rchng_clk", 8, 100000000, 3}},

                Package()
                {
                    "TLMMGPIO",                             // TLMMGPIO resource
                    Package()
                    {
                        79,                                 // PIN number = 79
                        0,                                  // State = Inactive
                        3,                                  // Function select =
                        0,                                  // direction = Input
                        3,                                  // Pull value =
                        0,                                  // Drive Strength = 2mA
                        0
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x1 // D1 state
            },

            Package()
            {
                "DSTATE",
                0x2 // D2 state
            },

            Package (0x0E)
            {
                "DSTATE",
                0x3, // D3 state
                Package() {"CLOCK", Package() {"gcc_pcie_1_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_q2a_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_mstr_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_cfg_ahb_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie1_phy_rchng_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_pipe_clk", 2}},

                // ICB votes
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 0, 0}},

                // Turn off PCIe core
                Package() {"FOOTSWITCH", Package() {"gcc_pcie_1_gdsc", 2}},

                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",          // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage 1.2V        : microvolts ( V )
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0                                   // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,                                  // Voltage Regulator Type, 1 = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0                                   // Headroom
                    }
                },

                Package()
                {
                    "TLMMGPIO",                             // TLMMGPIO resource
                    Package()
                    {
                        19,                                 // PIN number = 19
                        0,                                  // State = Inactive
                        0,                                  // Function select = GPIO
                        1,                                  // direction = Output
                        0,                                  // Pull value = No Pull
                        0,                                  // Drive Strength = 2mA
                        0
                    }
                }
            },

            Package()
            {
                "CRASHDUMP_EXCEPTION",
                Package()
                {
                    "EXECUTE_FUNCTION",
                    Package ()
                    {
                        "ExecuteOcdPCIeExceptions"
                    }
                }
            },

            Package()
            {
                "CRASHDUMP_DSTATE",
                0
            }
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI1.RP1",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0
                Package()
                {
                    "FSTATE",
                    0x0 // f0 state
                },
                Package()
                {
                    "FSTATE",
                    0x1 // f1 state
                }
            },

            Package()
            {
                "DSTATE",
                0x0 // D0 state
            },

            Package()
            {
                "DSTATE",
                0x1 // D1 state
            },

            Package()
            {
                "DSTATE",
                0x2 // D2 state
            },

            Package()
            {
                "DSTATE",
                0x3 // D3 state
            }
        }
    })
    Name (PEMX,
    Package()
    {
        Package()
        {
            "DEVICE",
            "\\_SB.PCI1",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0.
                Package()
                {
                    "FSTATE",
                    0x0 // f0 state
                },

                Package()
                {
                    "FSTATE",
                    0x1 // f1 state
                }
            },
            Package (0x0F)
            {
                "DSTATE",
                0x0, // D0 state
                Package()
                {
                    "TLMMGPIO",                             // TLMMGPIO resource
                    Package()
                    {
                        51,                                 // PIN number = 51
                        1,                                  // State = active
                        0,                                  // Function select = GPIO
                        1,                                  // direction = Output
                        0,                                  // Pull value = No Pull
                        0,                                  // Drive Strength = 2mA
                        0
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",           // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        1200000,                            // Voltage 1.2V        : microvolts ( V )
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0                                   // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        1,                                  // Voltage Regulator Type, 1 = LDO
                        880000,                             // Voltage (uV)
                        1,                                  // Enable = Enable
                        1,                                  // Power Mode = NPM
                        0                                   // Headroom
                    }
                },

                // Turning on PCIe core
                Package() {"FOOTSWITCH", Package() {"gcc_pcie_1_gdsc", 1}},

                // ICB votes
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 1960000000, 1960000000}},

                Package() {"CLOCK", Package() {"gcc_pcie_1_pipe_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_axi_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_q2a_axi_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_mstr_axi_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_cfg_ahb_clk", 1}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_aux_clk", 8, 19200000, 3}},
                Package() {"CLOCK", Package() {"gcc_pcie1_phy_rchng_clk", 8, 100000000, 3}},

                Package()
                {
                    "TLMMGPIO",                             // TLMMGPIO resource
                    Package()
                    {
                        79,                                 // PIN number = 79
                        0,                                  // State = Inactive
                        3,                                  // Function select =
                        0,                                  // direction = Input
                        3,                                  // Pull value =
                        0,                                  // Drive Strength = 2mA
                        0
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x1 // D1 state
            },

            Package()
            {
                "DSTATE",
                0x2 // D2 state
            },

            Package()
            {
                "DSTATE",
                0x3, // D3 state
                Package() {"CLOCK", Package() {"gcc_pcie_1_aux_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_slv_q2a_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_mstr_axi_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_cfg_ahb_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie1_phy_rchng_clk", 2}},
                Package() {"CLOCK", Package() {"gcc_pcie_1_pipe_clk", 2}},

                // ICB votes
                Package() {"BUSARB", Package() {3, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 0, 0}},

                // Turn off PCIe core
                Package() {"FOOTSWITCH", Package() {"gcc_pcie_1_gdsc", 2}},

                Package()
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",          // Voltage Regulator ID
                        1,                                  // Voltage Regulator type = LDO
                        0,                                  // Voltage 1.2V        : microvolts ( V )
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0                                   // Head Room
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        1,                                  // Voltage Regulator Type, 1 = LDO
                        0,                                  // Voltage (uV)
                        0,                                  // Enable = Disable
                        0,                                  // Power Mode = NPM
                        0                                   // Headroom
                    }
                },

                Package()
                {
                    "TLMMGPIO",                             // TLMMGPIO resource
                    Package()
                    {
                        51,                                 // PIN number = 51
                        0,                                  // State = Inactive
                        0,                                  // Function select = GPIO
                        1,                                  // direction = Output
                        0,                                  // Pull value = No Pull
                        0,                                  // Drive Strength = 2mA
                        0
                    }
                }
            },

            Package()
            {
                "CRASHDUMP_EXCEPTION",
                Package()
                {
                    "EXECUTE_FUNCTION",
                    Package ()
                    {
                        "ExecuteOcdPCIeExceptions"
                    }
                }
            },

            Package()
            {
                "CRASHDUMP_DSTATE",
                0
            }
        },

        Package()
        {
            "DEVICE",
            "\\_SB.PCI1.RP1",
            Package()
            {
                "COMPONENT",
                0x0, // Component 0
                Package()
                {
                    "FSTATE",
                    0x0 // f0 state
                },

                Package()
                {
                    "FSTATE",
                    0x1 // f1 state
                }
            },

            Package()
            {
                "DSTATE",
                0x0 // D0 state
            },

            Package()
            {
                "DSTATE",
                0x1 // D1 state
            },

            Package()
            {
                "DSTATE",
                0x2 // D2 state
            },

            Package()
            {
                "DSTATE",
                0x3 // D3 state
            }
        }
    })
}
