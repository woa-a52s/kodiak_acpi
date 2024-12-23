//===========================================================================
//                           <cust_touch_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by touch driver.
//
//===========================================================================
Scope(\_SB_.PEP0)
{

    Method(LPMX, 0x0, NotSerialized)
    {
        Return(LPXC)
    }

    Name(LPXC,
         Package(One){
        // Touch LVS1
        Package(0x4)
        {
            "DEVICE",
            "\\_SB.TSC1",
            Package()
            {
                "DSTATE",
                0x0, // D0 state

                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource TS_INT
                    Package()
                    {
                        105,  // PIN number = 105
                        1,    // State:  active = 0x1
                        0,    // Function select = 0
                        1,    // direction = Output.
                        3,    // Pull Up
                        3     // Drive Strength:
                    }
                },
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource RESET
                    Package()
                    {
                        81, // PIN number = 81
                        1,  // State: active = 0x1
                        0,  // Function select = 0
                        0,  // direction = Input.
                        3,  // Pull Up
                        3   // Drive Strength:
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package(0x8)
                    {
                        "PPP_RESOURCE_ID_LDO3_C",
                        One,
                        0x2ab980,
                        One,
                        0x7,
                        Zero,
                        "HLOS_DRV",
                        "REQUIRED"
                    }
                },
                Package(0x2)
                {
                    "DELAY",
                    Package(0x1)
                    {
                        0x64
                    }
                },
                Package(0x2)
                {
                    "TLMMGPIO",
                    Package(0x6)
                    {
                        0x69,
                        Zero,
                        Zero,
                        One,
                        One,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "DELAY",
                    Package(0x1)
                    {
                        0xa
                    }
                },
                Package(0x2)
                {
                    "TLMMGPIO",
                    Package(0x6)
                    {
                        0x69,
                        One,
                        Zero,
                        One,
                        0x3,
                        0x3
                    }
                },
                Package(0x2)
                {
                    "DELAY",
                    Package(0x1)
                    {
                        0xc8
                    }
                }
            },
            Package(0x4)
            {
                "DSTATE",
                0x3,
                Package(0x2)
                {
                    "TLMMGPIO",
                    Package(0x6)
                    {
                        0x69,
                        Zero,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                },
                Package(0x2)
                {
                    "TLMMGPIO",
                    Package(0x6)
                    {
                        0x51,
                        Zero,
                        Zero,
                        Zero,
                        Zero,
                        Zero
                    }
                }
            }
        }
    })
}
