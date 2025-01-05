//
// HWN LED - Hardware LED notification device
//
Name(HWNL, 0)
Device(HWN0)
{
    Name(_HID, "QCOM0A68")
    Name(_UID, 0)
    Alias(\_SB_.PSUB, _SUB)

    Method(_STA)
    {
        If(LEqual(\_SB_.HWNL, 0)) {
            Return(0)
        }
        Else {
            Return(0x0F)
        }
    }

    // ACPI method for LED Configs
    Method(HWNL, 0x0, NotSerialized)
    {
        Name(CFG0,
        Package()
        {
            0x2,    // PMIC number
            0x3,    // Total HWN LEDs

            //RGB LEDs
            0x19b,  // Fade interval in ms (0-511 ms)
            0x14,   // Fade Steps i.e 5, 10, 15, 20(max)

            Zero,   // LED0 Id (Red)
            Zero,   // LED0 bank on PMIC

            One,    // LED1 Id (Green)
            One,    // LED1 bank on PMIC

            0x2,    // LED2 Id (Blue)
            0x2,    // LED2 bank on PMIC

            //RGB PWM Config
            One,    // PWM bit Resoultion
                    // Valid Inputs ( 0 - 6 bit mode, 1 - 9 bit mode)
            One,    // PWM_EN_HI
            One,    // PWM_EN_LO
            0x3,    // PWM_MASTER_CLK_FREQ
                    // Valid Inputs (0- No Clk, 1 - 1.024 KHz, 2 - 32.764 KHz, 3 - 19.2 MHz)
            0x6,    // Clock Pre Divide (Values can be 1, 3, 5, 6)
            One     // Exponent (Values range 0 - 7)
        })
        Return(CFG0)
    }
}
