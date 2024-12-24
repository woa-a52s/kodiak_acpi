//===========================================================================
//                           <cust_touch_resources.asl>
// DESCRIPTION
//   This file contains the resources needed by touch driver.
//
//===========================================================================
Scope (\_SB.PEP0)
{
    Method (LPMX)
    {
        Return (LPXC)
    }

    Name (LPXC,
    Package () {
        // Touch LVS1
        Package ()
        {
            "DEVICE",
            "\\_SB.TSC1",
            Package()
            {
                "DSTATE",
                0x0, // D0 state
                Package()
                {
                    "PMICVREGVOTE",                     // PMICVREGVOTE resource
                    Package (0x08)
                    {
                        "PPP_RESOURCE_ID_LDO7_C",       // Voltage Regulator ID
                        1,                              // Voltage Regulator type = LDO
                        3000000,                        // Voltage 3.0V
                        1,                              // Enable = Enable
                        7,                              // Power mode - Normal Power Mode
                        0,                              // Head Room
                        "HLOS_DRV",
                        "REQUIRED"
                    }
                },

                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource
                    Package()
                    {
                        81,     // GPIO pin
                        0,      // State low
                        0,      // Function select 0
                        0,      // Direction - input (input-enable)
                        0,      // No pull (bias-disable)
                        0       // Drive strength - 0 == 2 mA
                    }
                },

                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource
                    Package()
                    {
                        81,     // GPIO pin
                        0,      // State low
                        0,      // Function select 0
                        0,      // Direction - input (input-enable)
                        1,      // Pull down (bias-pull-down)
                        0       // Drive strength - 0 == 2 mA
                    }
                },

                Package()
                {
                    "DELAY",    // Hold the RESET line for 200ms
                    Package (1)
                    {
                        200     // 200 Milsec delay
                    }
                }
            },

            Package()
            {
                "DSTATE",
                0x03, // D3 state
                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource
                    Package()
                    {
                        81,     // GPIO pin
                        0,      // State low
                        0,      // Function select 0
                        0,      // Direction - input (input-enable)
                        1,      // Pull down (bias-pull-down)
                        0       // Drive strength - 0 == 2 mA
                    }
                },

                Package()
                {
                    "TLMMGPIO", // TLMMGPIO resource
                    Package()
                    {
                        81,     // GPIO pin
                        0,      // State low
                        0,      // Function select 0
                        0,      // Direction - input (input-enable)
                        1,      // Pull down (bias-pull-down)
                        0       // Drive strength - 0 == 2 mA
                    }
                },

                Package()
                {
                    "PMICVREGVOTE",                     // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO7_C",       // Voltage Regulator ID
                        1,                              // Voltage Regulator type = LDO
                        0,                              // Voltage 0V
                        1,                              // Enable = Enable
                        7,                              // Power mode - Normal Power Mode
                        0,                              // Head Room
                        "REQUIRED"
                    }
                }
            }
        }
    })
}
