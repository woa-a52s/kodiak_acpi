//
// HWN Haptics - Hardware Haptics device
//
Name (HWNH, 0)
Device (HWN1)
{
    Name (_HID, "QCOM0A69")
    Name (_UID, 1)
    Alias (\_SB.PSUB, _SUB)

    Method (_STA)
    {
        If ((\_SB.HWNH == 0)) {
            Return (0)
        }
        Else {
            Return (0x1)
        }
    }

    Name (_DEP, Package (0x1)
    {
        \_SB.PMIC
    })

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0, "\\_SB.PM02", 0, ResourceConsumer, ,) {3584}
        })
        Return (RBUF)
    }

    /* ACPI methods for HAPI - Haptics Device info */
    Method (HAPI, 0, NotSerialized)
    {
        Name (CFG0, Package ()
        {
            1,    // TotalHwnVib - Total HWN Vibs
            1,    // PmicNumber - PMIC Number for HWN Vibs
            1     // HapticsConfigInputSource - Read configuration from  0: Registry, 1: ACPI (HAPC method)
        })
        Return (CFG0)
    }

    /* ACPI methods for HAPC - Haptics configuration method */
    Method (HAPC, 0, NotSerialized)
    {
        Name (CFG0, Package ()
        {
            //------------------------ Actuator Config -----------------------------------------------------
            0,      // VibType                  - 0: LRA, 1: ERM
            2436,   // VibVmaxCfg               - 2436 mV
            0,      // PeakCurrentLimit         - 0: 400ma, 1: 800ma
            1,      // ShortCircuitDebounce     - 0: No Deb, 1: 8 clk cycles, 2: 16 clk cycles, 3: 32 clk cycles
            1,      // InternalPWMFreq          - 0: 253KHz, 1: 505KHz, 2: 739KHz, 3: 1076KHz
            1,      // PWMCapacitance           - 0: 26PF, 1: 13PF, 2: 8p7PF, 3: 6p5PF
            1,      // SlewRate                 - 0: 6ns, 1: 16ns
            0,      // LRASignalType            - 0: Sinusoidal, 1: Square
            //----------------------------------------------------------------------------------------------

            //------------------------ LRA Auto Resonance Config -------------------------------------------

            4,      // LRAAutoResMode           - 0: No auto resonance, 1: ZXD, 2: QWD, 3: MAX QWD, 4: ZXD with EOP

            1,      // LRAAutoResHighZDuration  - 0: No HighZ,
                    //                              1: [2 LRA period (ZXD), 1/8 LRA period (QWD)],
                    //                              2: [3 LRA period (ZXD), 1/4 LRA period (QWD)],
                    //                              3: [4 LRA period (ZXD), 1/2 LRA period (QWD)]

            3,      // LRAAutoResCalibFreqZXD   - 0: 4 LRA periods, 1: 8 LRA periods,
                    //                              2: 16 LRA periods, 3: 32 LRA periods

            20,     // InitialAutoResDelayQWD   - Delay(in ms) used for QWD mode before enabling auto-resonance
                    //                              Typical value is 5-20ms. This is to ensure there is enough
                    //                              back emf for Auto Resonance to work fine.
                    //                              - This is a don't care in ZXD mode
            //----------------------------------------------------------------------------------------------

            //------------------------ Braking Config ------------------------------------------------------
            1,      // AutoBrakingEnable        - 0: Disable, 1: Enable
            3,      // BrakePattern             - brake pattern of [0,0,0,VMAX] = [ 00 00 00 11] = 0x03
            0,      // BrakeWithMaxVoltageEnable - 0: Disable, 1: Enable - Brake pattern applied with max voltage
                    //                              that can be supplied by PMIC Haptics module
            //----------------------------------------------------------------------------------------------

            //------------------------ Acceleration Config -------------------------------------------------
            0,      // DirectModeAccelerationEnable - 0: Disable, 1: Enable
            6,      // DirectModeAccelerationDuration - in milli seconds
            //----------------------------------------------------------------------------------------------

            0,      // HapticsSource            - 0: VMAX, 1: BUFFER, 2: AUDIO, 3: EXT PWM
            0,      // HapticsTrigger           - 0: Play, 1: Line In
            1333,   // PlayRateCode             - LRA Freq 150Hz, PlayRateCode = (200 * 1000) / LRA_Freq
            3,      // MaxSCIntrRetries         - Max SC Interrupt retries before crashing the device
            1       // HapticsAutoResErrorRecover - Enable Auto Resonance Error recovery support
        })
        Return (CFG0)
    }
}
