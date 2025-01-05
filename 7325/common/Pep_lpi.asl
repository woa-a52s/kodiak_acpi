//
// PEP LPI
//

Device(SYSM) {
    Name(_HID, "ACPI0010")
    Name(_UID, 0x100000)

    Name(_LPI, Package() {
        0, // Version
        0x1000000, // Level ID
        1, // Count

        Package() {
            9500,  // Min residency (us)
            6000,  // Wake latency (us)
            1,     // Flags, set bit0 to 1 to enable this state
            32,    // Arch context last flags + 32 For Debugger Transistion by PEP.
            0,     // Residency counter frequency
            0,     // Enabled parent state
            45824, // Integer entry method
            Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
            Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
            "platform.DRIPS" // Name
        }
    }) // End of _LPI

    Device(CLUS) {
        Name(_HID, "ACPI0010")
        Name(_UID, 0x10)
        Name(_LPI, Package() {
            0, // Version
            0x1000000, // Level ID
            2, // Count

            // State 0: D2
            Package() {
                5900, // Min residency (us)
                3000, // Wake latency (us)
                0,    // Flags, set bit0 to 1 to enable this state
                0,    // Arch context last flags
                0,    // Residency counter frequency
                0,    // Enabled parent state
                32,   // Integer entry method
                Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                "L3Cluster.D2" // Name
            },
            // State 1: D4
            Package() {
                6000, // Min residency (us)
                3300, // Wake latency (us)
                1,    // Flags, set bit0 to 1 to enable this state
                0,    // Arch context last flags
                0,    // Residency counter frequency
                1,    // Enabled parent state (Till E1)
                64,   // Integer entry methods
                Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                "L3Cluster.D4" // Name
            }
        }) // End of _LPI

        Device(CPU0) { // Kyro Silver CPU0
            Name(_HID, "ACPI0007")
            Name(_UID, 0)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver0.C1" // Name
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver0.C2"
                },
                // C3
                Package() {
                    1774, // Min residency (us)
                    901,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver0.C3" // Name
                },
                // C4
                Package() {
                    4001, // Min residency (us)
                    915,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    2,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver0.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU0

        Device(CPU1) { // Kyro Silver CPU1
            Name(_HID, "ACPI0007")
            Name(_UID, 1)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver1.C1" // Name
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver1.C2" // Name
                },
                // C3
                Package() {
                    1774, // Min residency (us)
                    901,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state (Enables D4)
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver1.C3" // Name
                },
                // C4
                Package() {
                    4001, // Min residency (us)
                    915,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    2,    // Enabled parent state (Enables LLC)
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver1.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU1

        Device(CPU2) { // Kyro Silver CPU2
            Name(_HID, "ACPI0007")
            Name(_UID, 2)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver2.C1" // Name
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver2.C2" // Name
                },
                // C3
                Package() {
                    1774, // Min residency (us)
                    901,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver2.C3" // Name
                },
                // C4
                Package() {
                    4001, // Min residency (us)
                    915,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    2,    // Enabled parent state (Enables LLC)
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver2.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU2

        Device(CPU3) { // Kyro Silver CPU3
            Name(_HID, "ACPI0007")
            Name(_UID, 0x3)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver3.C1" // Name
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver3.C2" // Name
                },
                // C3
                Package() {
                    1774, // Min residency (us)
                    901,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state (Enables D4)
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver3.C3" // Name
                },
                // C4
                Package() {
                    4001, // Min residency (us)
                    915,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    2,    // Enabled parent state (Enables LLC)
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoSilver3.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU3

        Device(CPU4) { // Kyro Gold CPU0
            Name(_HID, "ACPI0007")
            Name(_UID, 0x4)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold0.C1" // Name
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold0.C2" // Name
                },
                // C3
                Package() {
                    3850, // Min residency (us)
                    860,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state (Enables D4)
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold0.C3" // Name
                },
                // C4
                Package() {
                    3950, // Min residency (us)
                    910,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    2,    // Enabled parent state (Enables LLC)
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold0.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU4

        Device(CPU5) { // Kyro Gold CPU1
            Name(_HID, "ACPI0007")
            Name(_UID, 0x5)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold1.C1" // Name
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold1.C2" // Name
                },
                // C3
                Package() {
                    3850, // Min residency (us)
                    860,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold1.C3" // Name
                },
                // C4
                Package() {
                    3950, // Min residency (us)
                    910,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    2,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold1.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU5

        Device(CPU6) { // Kryo Gold CPU2
            Name(_HID, "ACPI0007")
            Name(_UID, 0x6)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold2.C1"
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold2.C2" // Name
                },
                // C3
                Package() {
                    3850, // Min residency (us)
                    860,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold2.C3" // Name
                },
                // C4
                Package() {
                    3950, // Min residency (us)
                    910,  // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    1,    // Arch context last flags
                    0,    // Residency counter frequency
                    2,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoGold2.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU6

        Device(CPU7) { // Kryo Prime CPU3
            Name(_HID, "ACPI0007")
            Name(_UID, 0x7)
            Method(_STA) { Return(0xf) }

            Name(_LPI, Package() {
                0, // Version
                0, // Level ID
                4, // Count

                // Core Clock Gate - C1
                Package() {
                    0,    // Min residency (us)
                    0,    // Wake latency (us)
                    1,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    0,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 255, 255, 255, 255, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoPrime0.C1" // Name
                },
                // C2
                Package() {
                    400,  // Min residency (us)
                    100,  // Wake latency (us)
                    0,    // Flags, set bit0 to 1 to enable this state
                    0,    // Arch context last flags
                    0,    // Residency counter frequency
                    1,    // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 2, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoPrime0.C2" // Name
                },
                // C3
                Package() {
                    0xf96, // Min residency (us)
                    0x3e8, // Wake latency (us)
                    1,     // Flags, set bit0 to 1 to enable this state
                    1,     // Arch context last flags
                    0,     // Residency counter frequency
                    1,     // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 3, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoPrime0.C3" // Name
                },
                // C4
                Package() {
                    0x118a, // Min residency (us)
                    0x5dc,  // Wake latency (us)
                    1,      // Flags, set bit0 to 1 to enable this state
                    1,      // Arch context last flags
                    0,      // Residency counter frequency
                    2,      // Enabled parent state
                    Buffer() {130, 12, 0, 127, 32, 0, 3, 4, 0, 0, 64, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    Buffer() {130, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 121, 0},
                    "KryoPrime0.C4" // Name
                }
            }) // End of _LPI
        } // End of CPU7
    } // End of CLUS
} // End of SYSM
