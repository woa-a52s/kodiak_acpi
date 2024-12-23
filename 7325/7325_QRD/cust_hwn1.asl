//
// HWN Haptics - Hardware Haptics device
//
Name (HWNH, Zero)
Device (HWN1)
{
    Name (_HID, "QCOM0A69")
    Name (_UID, One)
    Alias (\_SB.PSUB, _SUB)

    Method (_STA, 0, NotSerialized)
    {
        If ((\_SB.HWNH == Zero)) {
            Return (Zero)
        }
        Else {
            Return (Zero)
        }
    }

    Name (_DEP, Package (One)
    {
        \_SB.PMIC
    })

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0x0000, "\\_SB.PM02", 0x00, ResourceConsumer, ,) {0x0E00}
        })
        Return (RBUF)
    }

    /* ACPI methods for HAPI - Haptics Device info */
    Method (HAPI, 0, NotSerialized)
    {
        Name (CFG0, Package (0x03)
        {
            One,    // TotalHwnVib - Total HWN Vibs
            One,    // PmicNumber - PMIC Number for HWN Vibs
            One     // HapticsConfigInputSource - Read configuration from  0: Registry, 1: ACPI (HAPC method)
        })
        Return (CFG0)
    }

    /* ACPI methods for HAPC - Haptics configuration method */
    Method (HAPC, 0, NotSerialized)
    {
        Name (CFG0, Package (0x16)
        {
            //------------------------ Actuator Config -----------------------------------------------------
            Zero,       // VibType                  - 0: LRA, 1: ERM
            0x0984,     // VibVmaxCfg               - 2436 mV
            Zero,       // PeakCurrentLimit         - 0: 400ma, 1: 800ma
            One,        // ShortCircuitDebounce     - 0: No Deb, 1: 8 clk cycles, 2: 16 clk cycles, 3: 32 clk cycles
            One,        // InternalPWMFreq          - 0: 253KHz, 1: 505KHz, 2: 739KHz, 3: 1076KHz
            One,        // PWMCapacitance           - 0: 26PF, 1: 13PF, 2: 8p7PF, 3: 6p5PF
            One,        // SlewRate                 - 0: 6ns, 1: 16ns
            Zero,       // LRASignalType            - 0: Sinusoidal, 1: Square
            //----------------------------------------------------------------------------------------------

            //------------------------ LRA Auto Resonance Config -------------------------------------------

            0x04,       // LRAAutoResMode           - 0: No auto resonance, 1: ZXD, 2: QWD, 3: MAX QWD, 4: ZXD with EOP

            One,        // LRAAutoResHighZDuration  - 0: No HighZ,
                        //                              1: [2 LRA period (ZXD), 1/8 LRA period (QWD)],
                        //                              2: [3 LRA period (ZXD), 1/4 LRA period (QWD)],
                        //                              3: [4 LRA period (ZXD), 1/2 LRA period (QWD)]

            0x03,       // LRAAutoResCalibFreqZXD   - 0: 4 LRA periods, 1: 8 LRA periods,
                        //                              2: 16 LRA periods, 3: 32 LRA periods

            0x14,       // InitialAutoResDelayQWD   - Delay(in ms) used for QWD mode before enabling auto-resonance
                        //                              Typical value is 5-20ms. This is to ensure there is enough
                        //                              back emf for Auto Resonance to work fine.
                        //                              - This is a don't care in ZXD mode
            //----------------------------------------------------------------------------------------------

            //------------------------ Braking Config ------------------------------------------------------
            One,        // AutoBrakingEnable        - 0: Disable, 1: Enable
            0x03,       // BrakePattern             - brake pattern of [0,0,0,VMAX] = [ 00 00 00 11] = 0x03
            Zero,       // BrakeWithMaxVoltageEnable - 0: Disable, 1: Enable - Brake pattern applied with max voltage
                        //                              that can be supplied by PMIC Haptics module
            //----------------------------------------------------------------------------------------------

            //------------------------ Acceleration Config -------------------------------------------------
            Zero,       // DirectModeAccelerationEnable - 0: Disable, 1: Enable
            0x06,       // DirectModeAccelerationDuration - in milli seconds
            //----------------------------------------------------------------------------------------------

            Zero,       // HapticsSource            - 0: VMAX, 1: BUFFER, 2: AUDIO, 3: EXT PWM
            Zero,       // HapticsTrigger           - 0: Play, 1: Line In
            0x0535,     // PlayRateCode             - LRA Freq 150Hz, PlayRateCode = (200 * 1000) / LRA_Freq
            0x03,       // MaxSCIntrRetries         - Max SC Interrupt retries before crashing the device
            One         // HapticsAutoResErrorRecover - Enable Auto Resonance Error recovery support
        })
        Return (CFG0) /* \_SB_.HWN1.HAPC.CFG0 */
    }
}
