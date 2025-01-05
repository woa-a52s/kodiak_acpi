//
// The Driver for Dynamically Changing Thresholds
// of Thermal Zones
//

Method (THTZ, 4, NotSerialized)
{

    // Switch based on thermal zone number
    Switch(toInteger(Arg0))
    {
        Case(1)
        {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ1.TPSV)
                        Notify(\_SB.TZ1, 0x81)
                    }
                    Return(\_SB.TZ1._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ1.TTSP)
                        Notify(\_SB.TZ1, 0x81)
                    }
                    Return(\_SB.TZ1._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ1.TTC1)
                        Notify(\_SB.TZ1, 0x81)
                    }
                    Return(\_SB.TZ1._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ1.TTC2)
                        Notify(\_SB.TZ1, 0x81)
                    }
                    Return(\_SB.TZ1._TC2)
                }

                Default
                {
                    Return(0xFFFF)
                }
            }
        }

        Case(3)
        {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ3.TPSV)
                        Notify(\_SB.TZ3, 0x81)
                    }
                    Return(\_SB.TZ3._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ3.TTSP)
                        Notify(\_SB.TZ3, 0x81)
                    }
                    Return(\_SB.TZ3._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ3.TTC1)
                        Notify(\_SB.TZ3, 0x81)
                    }
                    Return(\_SB.TZ3._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ3.TTC2)
                        Notify(\_SB.TZ3, 0x81)
                    }
                    Return(\_SB.TZ3._TC2)
                }

                Default
                {
                    Return(0xFFFF)
                }
            }
        }

        Case(5)
        {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ5.TPSV)
                        Notify(\_SB.TZ5, 0x81)
                    }
                    Return(\_SB.TZ5._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ5.TTSP)
                        Notify(\_SB.TZ5, 0x81)
                    }
                    Return(\_SB.TZ5._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ5.TTC1)
                        Notify(\_SB.TZ5, 0x81)
                    }
                    Return(\_SB.TZ5._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ5.TTC2)
                        Notify(\_SB.TZ5, 0x81)
                    }
                    Return(\_SB.TZ5._TC2)
                }

                Default
                {
                    Return(0xFFFF)
                }
            }
        }
        Case(6)
        {
                Switch(toInteger(Arg3))
                {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ6.TPSV)
                        Notify(\_SB.TZ6, 0x81)
                    }
                    Return(\_SB.TZ6._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ6.TTSP)
                        Notify(\_SB.TZ6, 0x81)
                    }
                    Return(\_SB.TZ6._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ6.TTC1)
                        Notify(\_SB.TZ6, 0x81)
                    }
                    Return(\_SB.TZ6._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ6.TTC2)
                        Notify(\_SB.TZ6, 0x81)
                    }
                    Return(\_SB.TZ6._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(10) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ10.TPSV)
                        Notify(\_SB.TZ10, 0x81)
                    }
                    Return(\_SB.TZ10._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ10.TTSP)
                        Notify(\_SB.TZ10, 0x81)
                    }
                    Return(\_SB.TZ10._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ10.TTC1)
                        Notify(\_SB.TZ10, 0x81)
                    }
                    Return(\_SB.TZ10._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ10.TTC2)
                        Notify(\_SB.TZ10, 0x81)
                    }
                    Return(\_SB.TZ10._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(11) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ11.TPSV)
                        Notify(\_SB.TZ11, 0x81)
                    }
                    Return(\_SB.TZ11._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ11.TTSP)
                        Notify(\_SB.TZ11, 0x81)
                    }
                    Return(\_SB.TZ11._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ11.TTC1)
                        Notify(\_SB.TZ11, 0x81)
                    }
                    Return(\_SB.TZ11._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ11.TTC2)
                        Notify(\_SB.TZ11, 0x81)
                    }
                    Return(\_SB.TZ11._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(13) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ13.TPSV)
                        Notify(\_SB.TZ13, 0x81)
                    }
                    Return(\_SB.TZ13._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ13.TTSP)
                        Notify(\_SB.TZ13, 0x81)
                    }
                    Return(\_SB.TZ13._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ13.TTC1)
                        Notify(\_SB.TZ13, 0x81)
                    }
                    Return(\_SB.TZ13._TC1)
                }
                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ13.TTC2)
                        Notify(\_SB.TZ13, 0x81)
                    }
                    Return(\_SB.TZ13._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(15) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ15._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ15._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ15._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ15._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(16) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ16.TPSV)
                        Notify(\_SB.TZ16, 0x81)
                    }
                    Return(\_SB.TZ16._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ16._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ16._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ16._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ16._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(17) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ17._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ17._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ17._TC1)
                }
                Case(4) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ17._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(18) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ18._PSV)
                }
                Case(2) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ18._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ18._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Return (0xFFFF)
                    }
                    Return(\_SB.TZ18._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(31) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ31.TPSV)
                        Notify(\_SB.TZ31, 0x81)
                    }
                    Return(\_SB.TZ31._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ31.TCRT)
                        Notify(\_SB.TZ31, 0x81)
                    }
                    Return(\_SB.TZ31._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ31.TTSP)
                        Notify(\_SB.TZ31, 0x81)
                    }
                    Return(\_SB.TZ31._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ31.TTC1)
                        Notify(\_SB.TZ31, 0x81)
                    }
                    Return(\_SB.TZ31._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ31.TTC2)
                        Notify(\_SB.TZ31, 0x81)
                    }
                    Return(\_SB.TZ31._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(32) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ32.TPSV)
                        Notify(\_SB.TZ32, 0x81)
                    }
                    Return(\_SB.TZ32._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ32.TCRT)
                        Notify(\_SB.TZ32, 0x81)
                    }
                    Return(\_SB.TZ32._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ32.TTSP)
                        Notify(\_SB.TZ32, 0x81)
                    }
                    Return(\_SB.TZ32._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ32.TTC1)
                        Notify(\_SB.TZ32, 0x81)
                    }
                    Return(\_SB.TZ32._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ32.TTC2)
                        Notify(\_SB.TZ32, 0x81)
                    }
                    Return(\_SB.TZ32._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(33) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ33.TPSV)
                        Notify(\_SB.TZ33, 0x81)
                    }
                    Return(\_SB.TZ33._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ33.TCRT)
                        Notify(\_SB.TZ33, 0x81)
                    }
                    Return(\_SB.TZ33._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ33.TTSP)
                        Notify(\_SB.TZ33, 0x81)
                    }
                    Return(\_SB.TZ33._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ33.TTC1)
                        Notify(\_SB.TZ33, 0x81)
                    }
                    Return(\_SB.TZ33._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ33.TTC2)
                        Notify(\_SB.TZ33, 0x81)
                    }
                    Return(\_SB.TZ33._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(34) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ34.TPSV)
                        Notify(\_SB.TZ34, 0x81)
                    }
                    Return(\_SB.TZ34._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ34.TCRT)
                        Notify(\_SB.TZ34, 0x81)
                    }
                    Return(\_SB.TZ34._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ34.TTSP)
                        Notify(\_SB.TZ34, 0x81)
                    }
                    Return(\_SB.TZ34._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ34.TTC1)
                        Notify(\_SB.TZ34, 0x81)
                    }
                    Return(\_SB.TZ34._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ34.TTC2)
                        Notify(\_SB.TZ34, 0x81)
                    }
                    Return(\_SB.TZ34._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(35) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ35.TPSV)
                        Notify(\_SB.TZ35, 0x81)
                    }
                    Return(\_SB.TZ35._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ35.TCRT)
                        Notify(\_SB.TZ35, 0x81)
                    }
                    Return(\_SB.TZ35._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ35.TTSP)
                        Notify(\_SB.TZ35, 0x81)
                    }
                    Return(\_SB.TZ35._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ35.TTC1)
                        Notify(\_SB.TZ35, 0x81)
                    }
                    Return(\_SB.TZ35._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ35.TTC2)
                        Notify(\_SB.TZ35, 0x81)
                    }
                    Return(\_SB.TZ35._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(36) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ36.TPSV)
                        Notify(\_SB.TZ36, 0x81)
                    }
                    Return(\_SB.TZ36._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ36.TCRT)
                        Notify(\_SB.TZ36, 0x81)
                    }
                    Return(\_SB.TZ36._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ36.TTSP)
                        Notify(\_SB.TZ36, 0x81)
                    }
                    Return(\_SB.TZ36._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ36.TTC1)
                        Notify(\_SB.TZ36, 0x81)
                    }
                    Return(\_SB.TZ36._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ36.TTC2)
                        Notify(\_SB.TZ36, 0x81)
                    }
                    Return(\_SB.TZ36._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(37) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ37.TPSV)
                        Notify(\_SB.TZ37, 0x81)
                    }
                    Return(\_SB.TZ37._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ37.TCRT)
                        Notify(\_SB.TZ37, 0x81)
                    }
                    Return(\_SB.TZ37._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ37.TTSP)
                        Notify(\_SB.TZ37, 0x81)
                    }
                    Return(\_SB.TZ37._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ37.TTC1)
                        Notify(\_SB.TZ37, 0x81)
                    }
                    Return(\_SB.TZ37._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ37.TTC2)
                        Notify(\_SB.TZ37, 0x81)
                    }
                    Return(\_SB.TZ37._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(38) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ38.TPSV)
                        Notify(\_SB.TZ38, 0x81)
                    }
                    Return(\_SB.TZ38._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ38.TCRT)
                        Notify(\_SB.TZ38, 0x81)
                    }
                    Return(\_SB.TZ38._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ38.TTSP)
                        Notify(\_SB.TZ38, 0x81)
                    }
                    Return(\_SB.TZ38._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ38.TTC1)
                        Notify(\_SB.TZ38, 0x81)
                    }
                    Return(\_SB.TZ38._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ38.TTC2)
                        Notify(\_SB.TZ38, 0x81)
                    }
                    Return(\_SB.TZ38._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(99) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ99.TPSV)
                        Notify(\_SB.TZ99, 0x81)
                    }
                    Return(\_SB.TZ99._PSV)
                }

                Case(1) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ99.TCRT)
                        Notify(\_SB.TZ99, 0x81)
                    }
                    Return(\_SB.TZ99._CRT)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ99.TTSP)
                        Notify(\_SB.TZ99, 0x81)
                    }
                    Return(\_SB.TZ99._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ99.TTC1)
                        Notify(\_SB.TZ99, 0x81)
                    }
                    Return(\_SB.TZ99._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ99.TTC2)
                        Notify(\_SB.TZ99, 0x81)
                    }
                    Return(\_SB.TZ99._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(51) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ51.TPSV)
                        Notify(\_SB.TZ51, 0x81)
                    }
                    Return(\_SB.TZ51._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ51.TTSP)
                        Notify(\_SB.TZ51, 0x81)
                    }
                    Return(\_SB.TZ51._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ51.TTC1)
                        Notify(\_SB.TZ51, 0x81)
                    }
                    Return(\_SB.TZ51._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ51.TTC2)
                        Notify(\_SB.TZ51, 0x81)
                    }
                    Return(\_SB.TZ51._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(52) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ52.TPSV)
                        Notify(\_SB.TZ52, 0x81)
                    }
                    Return(\_SB.TZ52._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ52.TTSP)
                        Notify(\_SB.TZ52, 0x81)
                    }
                    Return(\_SB.TZ52._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ52.TTC1)
                        Notify(\_SB.TZ52, 0x81)
                    }

                    Return(\_SB.TZ52._TC1)
                }
                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ52.TTC2)
                        Notify(\_SB.TZ52, 0x81)
                    }
                    Return(\_SB.TZ52._TC2)
                }
                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(53) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ53.TPSV)
                        Notify(\_SB.TZ53, 0x81)
                    }
                    Return(\_SB.TZ53._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ53.TTSP)
                        Notify(\_SB.TZ53, 0x81)
                    }
                    Return(\_SB.TZ53._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ53.TTC1)
                        Notify(\_SB.TZ53, 0x81)
                    }
                    Return(\_SB.TZ53._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ53.TTC2)
                        Notify(\_SB.TZ53, 0x81)
                    }
                    Return(\_SB.TZ53._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(54) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ54.TPSV)
                        Notify(\_SB.TZ54, 0x81)
                    }
                    Return(\_SB.TZ54._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ54.TTSP)
                        Notify(\_SB.TZ54, 0x81)
                    }
                    Return(\_SB.TZ54._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ54.TTC1)
                        Notify(\_SB.TZ54, 0x81)
                    }
                    Return(\_SB.TZ54._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ54.TTC2)
                        Notify(\_SB.TZ54, 0x81)
                    }
                    Return(\_SB.TZ54._TC2)
                }
                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(55) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ55.TPSV)
                        Notify(\_SB.TZ55, 0x81)
                    }
                    Return(\_SB.TZ55._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ55.TTSP)
                        Notify(\_SB.TZ55, 0x81)
                    }
                    Return(\_SB.TZ55._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ55.TTC1)
                        Notify(\_SB.TZ55, 0x81)
                    }
                    Return(\_SB.TZ55._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ55.TTC2)
                        Notify(\_SB.TZ55, 0x81)
                    }
                    Return(\_SB.TZ55._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(56) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ56.TPSV)
                        Notify(\_SB.TZ56, 0x81)
                    }
                    Return(\_SB.TZ56._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ56.TTSP)
                        Notify(\_SB.TZ56, 0x81)
                    }
                    Return(\_SB.TZ56._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ56.TTC1)
                        Notify(\_SB.TZ56, 0x81)
                    }
                    Return(\_SB.TZ56._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ56.TTC2)
                        Notify(\_SB.TZ56, 0x81)
                    }
                    Return(\_SB.TZ56._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(57) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ57.TPSV)
                        Notify(\_SB.TZ57, 0x81)
                    }
                    Return(\_SB.TZ57._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ57.TTSP)
                        Notify(\_SB.TZ57, 0x81)
                    }
                    Return(\_SB.TZ57._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ57.TTC1)
                        Notify(\_SB.TZ57, 0x81)
                    }
                    Return(\_SB.TZ57._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ57.TTC2)
                        Notify(\_SB.TZ57, 0x81)
                    }
                    Return(\_SB.TZ57._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(58) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ58.TPSV)
                        Notify(\_SB.TZ58, 0x81)
                    }
                    Return(\_SB.TZ58._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ58.TTSP)
                        Notify(\_SB.TZ58, 0x81)
                    }
                    Return(\_SB.TZ58._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ58.TTC1)
                        Notify(\_SB.TZ58, 0x81)
                    }
                    Return(\_SB.TZ58._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ58.TTC2)
                        Notify(\_SB.TZ58, 0x81)
                    }
                    Return(\_SB.TZ58._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(59) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ59.TPSV)
                        Notify(\_SB.TZ59, 0x81)
                    }
                    Return(\_SB.TZ59._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ59.TTSP)
                        Notify(\_SB.TZ59, 0x81)
                    }
                    Return(\_SB.TZ59._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ59.TTC1)
                        Notify(\_SB.TZ59, 0x81)
                    }
                    Return(\_SB.TZ59._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ59.TTC2)
                        Notify(\_SB.TZ59, 0x81)
                    }
                    Return(\_SB.TZ59._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(60) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ60.TPSV)
                        Notify(\_SB.TZ60, 0x81)
                    }
                    Return(\_SB.TZ60._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ60.TTSP)
                        Notify(\_SB.TZ60, 0x81)
                    }
                    Return(\_SB.TZ60._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ60.TTC1)
                        Notify(\_SB.TZ60, 0x81)
                    }
                    Return(\_SB.TZ60._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ60.TTC2)
                        Notify(\_SB.TZ60, 0x81)
                    }
                    Return(\_SB.TZ60._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }
        Case(61) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ61.TPSV)
                        Notify(\_SB.TZ61, 0x81)
                    }
                    Return(\_SB.TZ61._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ61.TTSP)
                        Notify(\_SB.TZ61, 0x81)
                    }
                    Return(\_SB.TZ61._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ61.TTC1)
                        Notify(\_SB.TZ61, 0x81)
                    }
                    Return(\_SB.TZ61._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ61.TTC2)
                        Notify(\_SB.TZ61, 0x81)
                    }
                    Return(\_SB.TZ61._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Case(62) {
            Switch(toInteger(Arg3))
            {
                Case(0) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ62.TPSV)
                        Notify(\_SB.TZ62, 0x81)
                    }
                    Return(\_SB.TZ62._PSV)
                }

                Case(2) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ62.TTSP)
                        Notify(\_SB.TZ62, 0x81)
                    }
                    Return(\_SB.TZ62._TSP)
                }

                Case(3) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ62.TTC1)
                        Notify(\_SB.TZ62, 0x81)
                    }
                    Return(\_SB.TZ62._TC1)
                }

                Case(4) {
                    If(Arg2)
                    {
                        Store(Arg1, \_SB.TZ62.TTC2)
                        Notify(\_SB.TZ62, 0x81)
                    }
                    Return(\_SB.TZ62._TC2)
                }

                Default
                {
                    Return (0xFFFF)
                }
            }
        }

        Default {
            Return (0xFFFF)
        }
    }
}
