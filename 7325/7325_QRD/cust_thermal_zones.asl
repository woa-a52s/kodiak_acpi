//
//CPU Aggregator Device -- Required for Thermal Parking
//
Device (AGR0)
{
    Name (_HID, "ACPI000C")
    Name (_PUR, Package (0x02) {One, Zero})
    Method (_OST, 3, NotSerialized)
    {
        \_SB.PEP0.ROST = Arg2
    }
}

//---------------------------------------------------------------------
//
//        Thermal Zones for QC reference hardware
//
//TZ0 - TZ39 are thermal zones developed by QC for reference hardware
//and can be modified by the OEMs.
//---------------------------------------------------------------------

//---------------------------------------------------------------------
//        Thermal Zones(0-18) for CPU sensors
//24AD - Little CPU virtual sensor
//24AE - Big CPU virtual sensor
// This thermal zone is only used for temperature logging for little CPUs
// as you may notice that _PSV, _TC1, _TC2, _TSP params are removed.
// This is the passive cooling mechanism by dialing down frequency is now
// done actively by hardware starting from 8998.
//---------------------------------------------------------------------
//Regular Thermal zone for Little CPU TSENS to dial back little CPUs at 90C
ThermalZone (TZ0) {
    Name (_HID, "QCOM0A58")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }

    Name (TTSP, One)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ0.TTSP)}
} // end of TZ0

// Regular Thermal Zone for Little CPU TSENS to Park cores at 105C
ThermalZone (TZ1) {
    Name (_HID, "QCOM0A58")
    Name (_UID, One)
    Name (_TZD, Package (One) {\_SB.PEP0})

    Name (TPSV, 0x0EC4)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ1.TPSV) }

    Name (_MTL, 0x14)

    // Control how aggressively the thermal manager applies thermal
    // throttling performance against temperature change.
    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ1.TTC1) }

    // _TTC2 Controls how aggressively the thermal manager applies thermal
    // throttling performance against temperature delta between the
    // current temperature and _PSV.
    // once the temp goes above _PSV, we like to have aggressive
    // throttling based on  how far above the temp is above the threshold.
    // Since that is controlled via _TC2, we like it to be high.
    // please refer to the ACPI spec 6.0 to understand the significance of
    // _TC2 or take a look at the explanation at the top of this file.
    Name (TTC2, One)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ1.TTC2) }

    // Appropriate temperature sampling interval for the zone in tenths
    // of a second. The thermal manager uses this interval to determine
    // how often it should evaluate the thermal throttling performance.
    // Must be greater than zero. For more information, see Thermal
    // throttling algorithm on msdn page
    // https://msdn.microsoft.com/en-us/library/windows/hardware/mt643928(v=vs.85).aspx
    Name (TTSP, One)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ1.TTSP) }

    // This optional object evaluates to a recommended polling frequency
    // (in tenths of seconds) for this thermal zone. A value of zero indicates
    // that OSPM does not need to poll the temperature of this thermal zone in
    // order to detect temperature changes (the hardware is capable of
    // generating asynchronous notifications).
    // TZP should be marked 0 for all thermal zones as our TSENS sensors
    // generate interrupts to complete thermal IOCTL read call.
    Name (_TZP, Zero)

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }
} // end of TZ1

// Regular Thermal Zone for big CPU TSENS to dial back big CPUs at 90C
// This thermal zone is only used for temperature logging for Big CPUs
// as you may notice that _PSV, _TC1, _TC2, _TSP params are removed.
// This is the passive cooling mechanism by dialing down frequency is now
// done actively by hardware starting from 8998.
ThermalZone (TZ2) {
    Name (_HID, "QCOM0A59")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }

    Name (TTSP, One)
    Method (_TSP, 0, NotSerialized) {
        Return (\_SB.TZ2.TTSP)
    }
} // end of TZ2

// Thermal Zone 3
ThermalZone (TZ3) {
    Name (_HID, "QCOM0A59")
    Name (_UID, One)
    Name (_TZD, Package (One) {\_SB.PEP0})

    Name (TPSV, 0x0EC4)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ3.TPSV) }

    Name (_MTL, 0x14)

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ3.TTC1) }

    Name (TTC2, One)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ3.TTC2) }

    Name (TTSP, One)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ3.TTSP) }

    Name (_TZP, Zero)

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }
} // end of TZ3

// Thermal zone 4
ThermalZone (TZ4) {
    Name (_HID, "QCOM0AD4")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }

    Name (TTSP, One)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ4.TTSP) }
}

ThermalZone (TZ5) {
    Name (_HID, "QCOM0AD4")
    Name (_UID, One)
    Name (_TZD, Package (One) {\_SB.PEP0})

    Name (TPSV, 0x0EC4)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ5.TPSV) }

    Name (_MTL, 0x14)

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ5.TTC1) }

    Name (TTC2, One)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ5.TTC2) }

    Name (TTSP, One)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ5.TTSP) }

    Name (_TZP, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }
} // end of TZ5

//---------------------------------------------------------------------
//        Thermal Zones(20-21) for GPU TSENS
//
// \_SB.GPU0 should be used for GPU thermal mitigation, and
// \_SB.GPU0.AVS0 should be used for MDSS/Video thermal mitigation.
// Currently there is no handling for Video thermal mitigation.
// When needed, Video will be added to GPU0.AVS0 interface.
//---------------------------------------------------------------------
//Thermal zone for TSENS14 dial back GPUs at 85C
ThermalZone (TZ6) {
    Name (_HID, "QCOM0A91")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.GPU0})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ6.TPSV) }

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ6.TTC1) }

    Name (TTC2, 0x02)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ6.TTC2) }

    Name (TTSP, 0x02)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ6.TTSP) }

    Name (_TZP, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }
}

// Thermal Zone 7
ThermalZone (TZ7) {
    Name (_HID, "QCOM0A51")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }

    Name (TTSP, 0x32)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ7.TTSP) }
} // end of TZ7

// Thermal Zone 9
ThermalZone (TZ9) {
    Name (_HID, "QCOM0A4C")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }

    Name (TTSP, 0x32)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ9.TTSP) }
} // end of TZ9

// Thermal Zone 10
ThermalZone (TZ10) {
    Name (_HID, "QCOM0A92")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MJCT})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ10.TPSV) }

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ10.TTC1) }

    Name (TTC2, 0x02)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ10.TTC2) }

    Name (TTSP, 0x0A)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ10.TTSP) }

    Name (_TZP, Zero)

    Method (_STA, 0, NotSerialized)
    {
        If ((((\_SB.SJTG == 0x001EB0E1) || (SKUV == 0x04)) || (SKUV == 0x06))) {
            Return (Zero)
        }
        Else {
            Return (0x0F)
        }
    }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }
} // end of TZ10

// Thermal Zone 11
ThermalZone (TZ11)
{
    Name (_HID, "QCOM0ABF")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.CSW0})

    Name (TPSV, 0x0EC4)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ11.TPSV) }

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ11.TTC1) }

    Name (TTC2, One)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ11.TTC2) }

    Name (TTSP, 0x32)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ11.TTSP) }

    Name (_TZP, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }
} // end of TZ11

// Thermal Zone 12
ThermalZone (TZ12)
{
    Name (_HID, "QCOM0A4B")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }

    Name (TTSP, 0x32)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ12.TTSP) }
} // end of TZ12

// Thermal Zone 13
ThermalZone (TZ13)
{
    Name (_HID, "QCOM0A57")
    Name (_UID, Zero)
    Name (_TZD, Package (0x04) {\_SB.WLTM, \_SB.CSW0, \_SB.GPU0, _SB.MBCL})

    Method (_DEP, 0, NotSerialized) {
        Return (Package (0x02) {\_SB.PEP0, \_SB.BCL1})
    }
} // end of TZ13

// Thermal Zone 15
ThermalZone (TZ15)
{
    Name (_HID, "QCOM0AC8")
    Name (_UID, Zero)
    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x00C0}
        })
        Return (RBUF)
    }

    Name (_TZD, Package (One) {\_SB.PEP0})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ15.TPSV) }

    Name (TCRT, 0x0F28)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ15.TCRT) }

    Name (_MTL, 0x14)

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ15.TTC1) }

    Name (TTC2, 0x14)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ15.TTC2) }

    Name (_TSP, One)

    Name (_TZP, Zero)

    Method(_DSM, 0x4, NotSerialized) {
        While(One) {
            Name(_T_0, Buffer(One) {0x00})
            CopyObject(ToBuffer(Arg0, ), _T_0)
            If(LEqual(_T_0, Buffer(0x10) {0x4b, 0x2c, 0xd4, 0xc2, 0x5e, 0xe2, 0x1c, 0x47, 0x8a, 0x4e, 0x29, 0x0a, 0xac, 0x3a, 0x29, 0xa3})) {
                While(One) {
                    Name(_T_1, Zero)
                    Store(Arg2, _T_1)
                    If(LEqual(_T_1, Zero)) {
                        While(One) {
                            Name(_T_2, Zero)
                            Store(Arg1, _T_2)
                            If(LEqual(_T_2, Zero)) {
                                Return(Buffer(One) {0x03})
                            }
                            Break
                        }
                        Return(Buffer(One) {0x00})
                    }
                    Else {
                        If(LEqual(_T_1, One)) {
                            Store(DerefOf(Index(Arg3, Zero, )), \_SB_.TZ15.TPSV)
                            Store(DerefOf(Index(Arg3, One, )), \_SB_.TZ15.TCRT)
                            Store(DerefOf(Index(Arg3, 0x2, )), \_SB_.TZ15.TTC2)
                            Store(Zero, \_SB_.TZ15.TTC1)
                            Notify(\_SB_.TZ15, 0x81)
                            Return(\_SB_.TZ15.TPSV)
                        }
                        Else {
                            Return(Zero)
                        }
                    }
                    Break
                }
            }
            Else {
                Return(Zero)
            }
            Break
        }
    }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (0x02) {\_SB.PEP0, \_SB.PMIC})
    }
} // end of TZ15

// Thermal Zone 16
ThermalZone (TZ16) {
    Name (_HID, "QCOM0AC9")
    Name (_UID, Zero)

    Method (_CRS, 0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0100}
        })
        Return (RBUF)
    }

    Name (_TZD, Package (0x02) {\_SB.WLTM, \_SB.MJCT})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ16.TPSV) }

    Name (TCRT, 0x0F28)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ16.TCRT) }

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ16.TTC1) }

    Name (TTC2, 0x14)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ16.TTC2) }

    Name (_TSP, One)

    Name (_TZP, Zero)

    Method (_DSM, 4, NotSerialized) {
        While (One) {
            Name (_T_0, Buffer (One) {0x00})
            CopyObject (ToBuffer (Arg0), _T_0)
            If ((_T_0 == ToUUID ("c2d42c4b-e25e-471c-8a4e-290aac3a29a3") )) {
                While(One) {
                    Name(_T_1, Zero)
                    Store(Arg2, _T_1)
                    If(LEqual(_T_1, Zero)) {
                        While(One) {
                            Name(_T_2, Zero)
                            Store(Arg1, _T_2)
                            If(LEqual(_T_2, Zero)) {
                                Return(Buffer(One) {0x03})
                            }
                            Break
                        }
                        Return(Buffer(One) {0x00})
                    }
                    Else {
                        If(LEqual(_T_1, One)) {
                            Store(DerefOf(Index(Arg3, Zero, )), \_SB_.TZ16.TPSV)
                            Store(DerefOf(Index(Arg3, One, )), \_SB_.TZ16.TCRT)
                            Store(DerefOf(Index(Arg3, 0x2, )), \_SB_.TZ16.TTC2)
                            Store(Zero, \_SB_.TZ16.TTC1)
                            Notify(\_SB_.TZ16, 0x81)
                            Return(\_SB_.TZ16.TPSV)
                        }
                        Else {
                            Return(Zero)
                        }
                    }
                    Break
                }
            }
            Else {
                Return (Zero)
            }

            Break
        }
    }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (0x02) {\_SB.PEP0, \_SB.PMIC})
    }
} // end of TZ16

// Thermal Zone 18
ThermalZone (TZ18) {
    Name (_HID, "QCOM0ACB")
    Name (_UID, Zero)
    Method (_CRS, 0, NotSerialized)
    {

        Name (RBUF, ResourceTemplate ()
        {
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000, "\\_SB.PM01", 0x00, ResourceConsumer, ,) {0x0180}
        })
        Return (RBUF)
    }

    Name (_TZD, Package (0x03) {\_SB.MBS0, \_SB.MBS1, \_SB.MBS2})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ18.TPSV) }

    Name (TCRT, 0x0F28)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ18.TCRT) }

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ18.TTC1) }

    Name (TTC2, 0x14)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ18.TTC2) }

    Name (_TSP, One)

    Name (_TZP, Zero)

    Method (_DSM, 4, NotSerialized) {
        While (One) {
            Name (_T_0, Buffer (One) {0x00})
            CopyObject (ToBuffer (Arg0), _T_0)
            If ((_T_0 == ToUUID ("c2d42c4b-e25e-471c-8a4e-290aac3a29a3") )) {
                While(One) {
                    Name(_T_1, Zero)
                    Store(Arg2, _T_1)
                    If(LEqual(_T_1, Zero)) {
                        While(One) {
                            Name(_T_2, Zero)
                            Store(Arg1, _T_2)
                            If(LEqual(_T_2, Zero)) {
                                Return(Buffer(One) {0x03})
                            }
                            Break
                        }
                        Return(Buffer(One) {0x00})
                    }
                    Else {
                        If(LEqual(_T_1, One)) {
                            Store(DerefOf(Index(Arg3, Zero, )), \_SB_.TZ18.TPSV)
                            Store(DerefOf(Index(Arg3, One, )), \_SB_.TZ18.TCRT)
                            Store(DerefOf(Index(Arg3, 0x2, )), \_SB_.TZ18.TTC2)
                            Store(Zero, \_SB_.TZ18.TTC1)
                            Notify(\_SB_.TZ18, 0x81)
                            Return(\_SB_.TZ18.TPSV)
                        }
                        Else {
                            Return(Zero)
                        }
                    }
                    Break
                }
            }
            Else {
                Return (Zero)
            }
            Break
        }
    }

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SJTG == 0x001EB0E1) || (SKUV == 0x04)) || (SKUV == 0x06)))
        {
            Return (Zero)
        }
        Else {
            Return (0x0F)
        }
    }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (0x02) {\_SB.PEP0, \_SB.PMIC})
    }
} // end of TZ18

// Thermal Zone 99
ThermalZone (TZ99) {
    Name (_HID, "QCOM0A5A")
    Name (_UID, Zero)
    Name (_TZD, Package (0x0D) {
        \_SB.SYSM.CLUS.CPU0, \_SB.SYSM.CLUS.CPU1, \_SB.SYSM.CLUS.CPU2, \_SB.SYSM.CLUS.CPU3,
        \_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5, \_SB.SYSM.CLUS.CPU6, \_SB.SYSM.CLUS.CPU7,
        \_SB.PEP0, \_SB.WLTM, \_SB.CSW0, \_SB.GPU0, \_SB.MJCT})

    Name (TPSV, 0x0EC4)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ99.TPSV) }

    Name (TCRT, 0x0F28)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ99.TCRT) }

    Name (_MTL, 0x14)

    Name (TTC1, 0x04)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ99.TTC1) }

    Name (TTC2, 0x03)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ99.TTC2) }

    Name (TTSP, 0x0A)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ99.TTSP) }

    Name (_TZP, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.PEP0})
    }
} // end of TZ99


Device (MPA) {
    Name (_HID, "QCOM04B4")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MPA1) {
    Name (_HID, "QCOM04B5")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBJ0) {
    Name (_HID, "QCOM04B6")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBJ1) {
    Name (_HID, "QCOM04B7")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBJ2) {
    Name (_HID, "QCOM04B8")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBJ3) {
    Name (_HID, "QCOM04B9")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBS0) {
    Name (_HID, "QCOM04BA")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBS1)
{
    Name (_HID, "QCOM04BB")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBS2) {
    Name (_HID, "QCOM04BC")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MSKN) {
    Name (_HID, "QCOM04BE")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MJCT) {
    Name (_HID, "QCOM04BF")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

Device (MBCL) {
    Name (_HID, "QCOM06D4")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (One) {\_SB.IPC0})

    Method (_STA, 0, NotSerialized) {
        If ((((\_SB.SKUV == 0x04) || (\_SB.SKUV == 0x06)) || (\_SB.SKUV == 0x07)))
        { Return (Zero) }
        Else
        { Return (0x0F) }
    }
}

ThermalZone (TZ51) {
    Name (_HID, "QCOM04C0")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MPA})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ51.TPSV) }

    Name (TCRT, 0x0F5A)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ51.TCRT) }

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ51.TTC1) }

    Name (TTC2, 0x02)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ51.TTC2) }

    Name (TTSP, 0x0A)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ51.TTSP) }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MPA})
    }
}

ThermalZone (TZ52) {
    Name (_HID, "QCOM04C1")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MPA1})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ52.TPSV) }

    Name (TCRT, 0x0F5A)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ52.TCRT) }

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ52.TTC1) }

    Name (TTC2, 0x02)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ52.TTC2) }

    Name (TTSP, 0x0A)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ52.TTSP) }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MPA1})
    }
}

ThermalZone (TZ53) {
    Name (_HID, "QCOM04C2")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MBJ0})

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MBJ0})
    }
}

ThermalZone (TZ54) {
    Name (_HID, "QCOM04C3")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MBJ1})

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MBJ1})
    }
}

ThermalZone (TZ55) {
    Name (_HID, "QCOM04C4")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MBJ2})

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MBJ2})
    }
}

ThermalZone (TZ56) {
    Name (_HID, "QCOM04C5")
    Name (_UID, Zero)
    Name (_TZD, Package (One)
    {
        \_SB.MBJ3
    })
    Method (_DEP, 0, NotSerialized)
    {
        Return (Package (One)
        {
            \_SB.MBJ3
        })
    }
}

ThermalZone (TZ57) {
    Name (_HID, "QCOM04C6")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MBS0})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ57.TPSV) }

    Name (TCRT, 0x0F5A)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ57.TCRT) }

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ57.TTC1) }

    Name (TTC2, 0x02)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ57.TTC2) }

    Name (TTSP, 0x0A)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ57.TTSP) }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MBS0})
    }
}

ThermalZone (TZ58) {
    Name (_HID, "QCOM04C7")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MBS1})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ58.TPSV) }

    Name (TCRT, 0x0F5A)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ58.TCRT) }

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ58.TTC1) }

    Name (TTC2, 0x02)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ58.TTC2) }

    Name (TTSP, 0x0A)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ58.TTSP) }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MBS1})
    }
}

ThermalZone (TZ59) {
    Name (_HID, "QCOM04C8")
    Name (_UID, Zero)
    Name (_TZD, Package (One) {\_SB.MBS2})

    Name (TPSV, 0x0E60)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ59.TPSV) }

    Name (TCRT, 0x0F5A)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ59.TCRT) }

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ59.TTC1) }

    Name (TTC2, 0x02)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ59.TTC2) }

    Name (TTSP, 0x0A)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ59.TTSP) }

    Method (_DEP, 0, NotSerialized) {
        Return (Package (One) {\_SB.MBS2})
    }
}

ThermalZone (TZ31) {
    Name (_HID, "QCOM0A5F")
    Name (_UID, Zero)

    Name (TTC1, One)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ31.TTC1) }

    Name (TTC2, 0x05)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ31.TTC2) }

    Name (TTSP, 0x1E)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ31.TTSP) }

    Name (_TZP, Zero)

    Method (_DEP, 0, NotSerialized) {
        Return (Package (0x02) {\_SB.PEP0, \_SB.ADC1})
    }
}

ThermalZone (TZ32) {
    Name (_HID, "QCOM0A61")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (0x02) {\_SB.PEP0, \_SB.ADC1})
    }

    Name (_TZD, Package (0x05) {\_SB.SYSM.CLUS.CPU4, \_SB.SYSM.CLUS.CPU5, \_SB.SYSM.CLUS.CPU6,
        \_SB.SYSM.CLUS.CPU7, \_SB.GPU0})

    Name (TPSV, 0x0E2E)
    Method (_PSV, 0, NotSerialized) { Return (\_SB.TZ32.TPSV) }

    Name (TCRT, 0x0EF6)
    Method (_CRT, 0, NotSerialized) { Return (\_SB.TZ32.TCRT) }

    Name (_MTL, 0x14)

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ32.TTC1) }

    Name (TTC2, 0x14)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ32.TTC2) }

    Name (TTSP, 0x28)

    Name (_TZP, Zero)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ32.TTSP) }
}

ThermalZone (TZ33) {
    Name (_HID, "QCOM0A63")
    Name (_UID, Zero)
    Method (_DEP, 0, NotSerialized) {
        Return (Package (0x02) {\_SB.PEP0, \_SB.ADC1})
    }

    Name (_MTL, 0x14)

    Name (TTC1, Zero)
    Method (_TC1, 0, NotSerialized) { Return (\_SB.TZ33.TTC1) }

    Name (TTC2, 0x14)
    Method (_TC2, 0, NotSerialized) { Return (\_SB.TZ33.TTC2) }

    Name (TTSP, 0x1E)

    Name (_TZP, Zero)
    Method (_TSP, 0, NotSerialized) { Return (\_SB.TZ33.TTSP) }
}

