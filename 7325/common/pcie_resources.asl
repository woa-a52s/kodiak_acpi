//===========================================================================
//                           <pcie_resources.asl>
// DESCRIPTION
//   This file contans the resources needed by pcie subsystem.
//
//===========================================================================


Scope (\_SB.PEP0)
{
    // PCIe Intra-Soc ports
    Method (PEMD, 0, NotSerialized)
    {
        If ((SKUV == One))
        {
            Return (PEMC)
        }
        Else
        {
            Return (PEMX)
        }
    }

    Name (PEMC,
    Package (0x02)
    {
        Package (0x09)
        {
            "DEVICE",
            "\\_SB.PCI1",
            Package (0x04)
            {
                "COMPONENT",
                Zero, // Component 0.
                Package (0x02)
                {
                    "FSTATE",
                    Zero // f0 state
                },

                Package (0x02)
                {
                    "FSTATE",
                    One // f1 state
                }
            },

            Package (0x0F)
            {
                "DSTATE",
                Zero, // D0 state
                Package (0x02)
                {
                    "TLMMGPIO",
                    Package (0x07)
                    {
                        0x13,
                        One,
                        Zero,
                        One,
                        Zero,
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",           // Voltage Regulator ID
                        One,                                // Voltage Regulator type = LDO
                        0x00124F80,                         // Voltage 1.2V        : microvolts ( V )
                        One,                                // Enable = Enable
                        One,                                // Power Mode = NPM
                        Zero                                // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,            // Voltage Regulator Type, 1 = LDO
                        0x000D6D80,     // Voltage (uV)
                        One,            // Enable = Enable
                        One,            // Power Mode = NPM
                        Zero            // Headroom
                    }
                },

                // Turning on PCIe core
                Package (0x02) {"FOOTSWITCH", Package (0x02) {"gcc_pcie_1_gdsc", One}},

                // ICB votes through PSTATE
                Package (0x02) {"BUSARB", Package (0x05) {0x03, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 0x74D33A00, 0x74D33A00}},

                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_pipe_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_axi_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_q2a_axi_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_mstr_axi_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_cfg_ahb_clk", One}},
                Package (0x02) {"CLOCK", Package (0x04) {"gcc_pcie_1_aux_clk", 0x08, 0x0124F800, 0x03}},
                Package (0x02) {"CLOCK", Package (0x04) {"gcc_pcie1_phy_rchng_clk", 0x08, 0x05F5E100, 0x03}},

                Package (0x02)
                {
                    "TLMMGPIO",
                    Package (0x07)
                    {
                        0x4F,
                        Zero,
                        0x03,
                        Zero,
                        0x03,
                        Zero,
                        Zero
                    }
                }
            },

            Package (0x02)
            {
                "DSTATE",
                One // D1 state
            },

            Package (0x02)
            {
                "DSTATE",
                0x02 // D2 state
            },

            Package (0x0E)
            {
                "DSTATE",
                0x03, // D3 state
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_aux_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_axi_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_q2a_axi_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_mstr_axi_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_cfg_ahb_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie1_phy_rchng_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_pipe_clk", 0x02}},

                // ICB votes
                Package (0x02) {"BUSARB", Package (0x05) {0x03, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", Zero, Zero}},

                // Turn off PCIe core
                Package (0x02) {"FOOTSWITCH", Package (0x02) {"gcc_pcie_1_gdsc", 0x02}},

                Package (0x02)
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",          // Voltage Regulator ID
                        One,                                // Voltage Regulator type = LDO
                        Zero,                               // Voltage 1.2V        : microvolts ( V )
                        Zero,                               // Enable = Disable
                        Zero,                               // Power Mode = NPM
                        Zero                                // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,            // Voltage Regulator Type, 1 = LDO
                        Zero,           // Voltage (uV)
                        Zero,           // Enable = Disable
                        Zero,           // Power Mode = NPM
                        Zero            // Headroom
                    }
                },

                Package (0x02)
                {
                    "TLMMGPIO",
                    Package (0x07)
                    {
                        0x13,
                        Zero,
                        Zero,
                        One,
                        Zero,
                        Zero,
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
                        "ExecuteOcdPCIeExceptions"
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_DSTATE",
                Zero
            }
        },

        Package (0x07)
        {
            "DEVICE",
            "\\_SB.PCI1.RP1",
            Package (0x04)
            {
                "COMPONENT",
                Zero, // Component 0
                Package (0x02)
                {
                    "FSTATE",
                    Zero // f0 state
                },
                Package (0x02)
                {
                    "FSTATE",
                    One // f1 state
                }
            },

            Package (0x02)
            {
                "DSTATE",
                Zero // D0 state
            },

            Package (0x02)
            {
                "DSTATE",
                One // D1 state
            },

            Package (0x02)
            {
                "DSTATE",
                0x02 // D2 state
            },

            Package (0x02)
            {
                "DSTATE",
                0x03 // D3 state
            }
        }
    })
    Name (PEMX,
    Package (0x02)
    {
        Package (0x09)
        {
            "DEVICE",
            "\\_SB.PCI1",
            Package (0x04)
            {
                "COMPONENT",
                Zero, // Component 0.
                Package (0x02)
                {
                    "FSTATE",
                    Zero // f0 state
                },

                Package (0x02)
                {
                    "FSTATE",
                    One // f1 state
                }
            },
            Package (0x0F)
            {
                "DSTATE",
                Zero, // D0 state
                Package (0x02)
                {
                    "TLMMGPIO",
                    Package (0x07)
                    {
                        0x33,
                        One,
                        Zero,
                        One,
                        Zero,
                        Zero,
                        Zero
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",           // Voltage Regulator ID
                        One,                                // Voltage Regulator type = LDO
                        0x00124F80,                         // Voltage 1.2V        : microvolts ( V )
                        One,                                // Enable = Enable
                        One,                                // Power Mode = NPM
                        Zero                                // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",
                        One,            // Voltage Regulator Type, 1 = LDO
                        0x000D6D80,     // Voltage (uV)
                        One,            // Enable = Enable
                        One,            // Power Mode = NPM
                        Zero            // Headroom
                    }
                },

                // Turning on PCIe core
                Package (0x02) {"FOOTSWITCH", Package (0x02) {"gcc_pcie_1_gdsc", One}},

                // ICB votes
                Package (0x02) {"BUSARB", Package (0x05) {0x03, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", 0x74D33A00, 0x74D33A00}},

                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_pipe_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_axi_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_q2a_axi_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_mstr_axi_clk", One}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_cfg_ahb_clk", One}},
                Package (0x02) {"CLOCK", Package (0x04) {"gcc_pcie_1_aux_clk", 0x08, 0x0124F800, 0x03}},
                Package (0x02) {"CLOCK", Package (0x04) {"gcc_pcie1_phy_rchng_clk", 0x08, 0x05F5E100, 0x03}},

                Package (0x02)
                {
                    "TLMMGPIO",
                    Package (0x07)
                    {
                        0x4F,
                        Zero,
                        0x03,
                        Zero,
                        0x03,
                        Zero,
                        Zero
                    }
                }
            },

            Package (0x02)
            {
                "DSTATE",
                One // D1 state
            },

            Package (0x02)
            {
                "DSTATE",
                0x02 // D2 state
            },

            Package (0x0E)
            {
                "DSTATE",
                0x03, // D3 state
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_aux_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_axi_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_slv_q2a_axi_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_mstr_axi_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_cfg_ahb_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie1_phy_rchng_clk", 0x02}},
                Package (0x02) {"CLOCK", Package (0x02) {"gcc_pcie_1_pipe_clk", 0x02}},

                // ICB votes
                Package (0x02) {"BUSARB", Package (0x05) {0x03, "ICBID_MASTER_PCIE_1", "ICBID_SLAVE_EBI1", Zero, Zero}},

                // Turn off PCIe core
                Package (0x02) {"FOOTSWITCH", Package (0x02) {"gcc_pcie_1_gdsc", 0x02}},

                Package (0x02)
                {
                    "PMICVREGVOTE",                         // PMIC VREG resource
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO10_C",          // Voltage Regulator ID
                        One,                                // Voltage Regulator type = LDO
                        Zero,                               // Voltage 1.2V        : microvolts ( V )
                        Zero,                               // Enable = Disable
                        Zero,                               // Power Mode = NPM
                        Zero                                // Head Room
                    }
                },

                Package (0x02)
                {
                    "PMICVREGVOTE",
                    Package (0x06)
                    {
                        "PPP_RESOURCE_ID_LDO6_B",
                        One,            // Voltage Regulator Type, 1 = LDO
                        Zero,           // Voltage (uV)
                        Zero,           // Enable = Disable
                        Zero,           // Power Mode = NPM
                        Zero            // Headroom
                    }
                },

                Package (0x02)
                {
                    "TLMMGPIO",
                    Package (0x07)
                    {
                        0x33,
                        Zero,
                        Zero,
                        One,
                        Zero,
                        Zero,
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
                        "ExecuteOcdPCIeExceptions"
                    }
                }
            },

            Package (0x02)
            {
                "CRASHDUMP_DSTATE",
                Zero
            }
        },

        Package (0x07)
        {
            "DEVICE",
            "\\_SB.PCI1.RP1",
            Package (0x04)
            {
                "COMPONENT",
                Zero, // Component 0
                Package (0x02)
                {
                    "FSTATE",
                    Zero // f0 state
                },

                Package (0x02)
                {
                    "FSTATE",
                    One // f1 state
                }
            },

            Package (0x02)
            {
                "DSTATE",
                Zero // D0 state
            },

            Package (0x02)
            {
                "DSTATE",
                One // D1 state
            },

            Package (0x02)
            {
                "DSTATE",
                0x02 // D2 state
            },

            Package (0x02)
            {
                "DSTATE",
                0x03 // D3 state
            }
        }
    })
}
