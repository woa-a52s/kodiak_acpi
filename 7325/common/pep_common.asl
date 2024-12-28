//
// The PEP Device & Driver Related Configuration
//

Device (PEP0)
{
    Name (_HID, "QCOM0A17")
    Name (_CID, "PNP0D80")

    Method (THTZ, 4, NotSerialized) {
        While (One) {
            Name (_T_0, Zero)
            _T_0 = ToInteger (Arg0)
            If ((_T_0 == One)) {
                While (One) {
                    Name (_T_1, Zero)
                    _T_1 = ToInteger (Arg3)

                    If ((_T_1 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ1.TPSV = Arg1
                            Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ1._PSV ())
                    }

                    ElseIf ((_T_1 == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ1.TTSP = Arg1
                            Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ1._TSP ())
                    }

                    ElseIf ((_T_1 == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ1.TTC1 = Arg1
                            Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ1._TC1 ())
                    }

                    ElseIf ((_T_1 == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ1.TTC2 = Arg1
                            Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ1._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x03)) {
                While (One) {
                    Name (_T_2, Zero)
                    _T_2 = ToInteger (Arg3)

                    If ((_T_2 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ3.TPSV = Arg1
                            Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ3._PSV ())
                    }

                    ElseIf ((_T_2 == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ3.TTSP = Arg1
                            Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ3._TSP ())
                    }

                    ElseIf ((_T_2 == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ3.TTC1 = Arg1
                            Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ3._TC1 ())
                    }

                    ElseIf ((_T_2 == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ3.TTC2 = Arg1
                            Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ3._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }

                    Break
                }
            }

            ElseIf ((_T_0 == 0x05)) {
                While (One) {
                    Name (_T_3, Zero)
                    _T_3 = ToInteger (Arg3)

                    If ((_T_3 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ5.TPSV = Arg1
                            Notify (\_SB.TZ5, 0x81)
                        }
                        Return (\_SB.TZ5._PSV ())
                    }

                    ElseIf ((_T_3 == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ5.TTSP = Arg1
                            Notify (\_SB.TZ5, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ5._TSP ())
                    }

                    ElseIf ((_T_3 == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ5.TTC1 = Arg1
                            Notify (\_SB.TZ5, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ5._TC1 ())
                    }

                    ElseIf ((_T_3 == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ5.TTC2 = Arg1
                            Notify (\_SB.TZ5, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ5._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x06)) {
                While (One) {
                    Name (_T_4, Zero)
                    _T_4 = ToInteger (Arg3)

                    If ((_T_4 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ6.TPSV = Arg1
                            Notify (\_SB.TZ6, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ6._PSV ())
                    }

                    ElseIf ((_T_4 == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ6.TTSP = Arg1
                            Notify (\_SB.TZ6, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ6._TSP ())
                    }

                    ElseIf ((_T_4 == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ6.TTC1 = Arg1
                            Notify (\_SB.TZ6, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ6._TC1 ())
                    }

                    ElseIf ((_T_4 == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ6.TTC2 = Arg1
                            Notify (\_SB.TZ6, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ6._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x0A)) {
                While (One) {
                    Name (_T_5, Zero)
                    _T_5 = ToInteger (Arg3)

                    If ((_T_5 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ10.TPSV = Arg1
                            Notify (\_SB.TZ10, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ10._PSV ())
                    }

                    ElseIf ((_T_5 == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ10.TTSP = Arg1
                            Notify (\_SB.TZ10, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ10._TSP ())
                    }

                    ElseIf ((_T_5 == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ10.TTC1 = Arg1
                            Notify (\_SB.TZ10, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ10._TC1 ())
                    }

                    ElseIf ((_T_5 == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ10.TTC2 = Arg1
                            Notify (\_SB.TZ10, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ10._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x0B)) {
                While (One) {
                    Name (_T_6, Zero)
                    _T_6 = ToInteger (Arg3)

                    If ((_T_6 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ11.TPSV = Arg1
                            Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ11._PSV ())
                    }

                    ElseIf ((_T_6 == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ11.TTSP = Arg1
                            Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ11._TSP ())
                    }

                    ElseIf ((_T_6 == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ11.TTC1 = Arg1
                            Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ11._TC1 ())
                    }

                    ElseIf ((_T_6 == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ11.TTC2 = Arg1
                            Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ11._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x0D)) {
                While (One) {
                    Name (_T_7, Zero)
                    _T_7 = ToInteger (Arg3)

                    If ((_T_7 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ13.TPSV = Arg1
                            Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ13._PSV)
                    }

                    ElseIf ((_T_7 == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ13.TTSP = Arg1
                            Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ13._TSP)
                    }

                    ElseIf ((_T_7 == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ13.TTC1 = Arg1
                            Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ13._TC1)
                    }

                    ElseIf ((_T_7 == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ13.TTC2 = Arg1
                            Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ13._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x0F)) {
                While (One) {
                    Name (_T_8, Zero)
                    _T_8 = ToInteger (Arg3)

                    If ((_T_8 == Zero)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ15._PSV ())
                    }

                    ElseIf ((_T_8 == 0x02)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ15._TSP)
                    }

                    ElseIf ((_T_8 == 0x03)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ15._TC1 ())
                    }

                    ElseIf ((_T_8 == 0x04)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ15._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x10)) {
                While (One) {
                    Name (_T_9, Zero)
                    _T_9 = ToInteger (Arg3)

                    If ((_T_9 == Zero)) {
                        If (Arg2) {
                            \_SB.TZ16.TPSV = Arg1
                            Notify (\_SB.TZ16, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ16._PSV ())
                    }

                    ElseIf ((_T_9 == One)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ16._CRT ())
                    }

                    ElseIf ((_T_9 == 0x02)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ16._TSP)
                    }

                    ElseIf ((_T_9 == 0x03)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ16._TC1 ())
                    }

                    ElseIf ((_T_9 == 0x04)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ16._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x11)) {
                While (One) {
                    Name (_T_A, Zero)
                    _T_A = ToInteger (Arg3)

                    If ((_T_A == Zero)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ17._PSV)
                    }

                    ElseIf ((_T_A == 0x02)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ17._TSP)
                    }

                    ElseIf ((_T_A == 0x03)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ17._TC1)
                    }

                    ElseIf ((_T_A == 0x04)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ17._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x12)) {
                While (One) {
                    Name (_T_B, Zero)
                    _T_B = ToInteger (Arg3)

                    If ((_T_B == Zero)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ18._PSV ())
                    }

                    ElseIf ((_T_B == 0x02)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ18._TSP)
                    }

                    ElseIf ((_T_B == 0x03)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ18._TC1 ())
                    }

                    ElseIf ((_T_B == 0x04)) {
                        If (Arg2) {
                            Return (0xFFFF)
                        }
                        Return (\_SB.TZ18._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x1F)) {
                While (One) {
                    Name (_T_C, Zero)
                    _T_C = ToInteger (Arg3)

                    If ((_T_C == Zero)) {
                        If (Arg2) {
                            \_SB.TZ31.TPSV = Arg1
                            Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ31._PSV)
                    }

                    ElseIf ((_T_C == One)) {
                        If (Arg2) {
                            \_SB.TZ31.TCRT = Arg1
                            Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ31._CRT)
                    }

                    ElseIf ((_T_C == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ31.TTSP = Arg1
                            Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ31._TSP ())
                    }

                    ElseIf ((_T_C == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ31.TTC1 = Arg1
                            Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ31._TC1 ())
                    }

                    ElseIf ((_T_C == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ31.TTC2 = Arg1
                            Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ31._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x20)) {
                While (One) {
                    Name (_T_D, Zero)
                    _T_D = ToInteger (Arg3)

                    If ((_T_D == Zero)) {
                        If (Arg2) {
                            \_SB.TZ32.TPSV = Arg1
                            Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ32._PSV ())
                    }

                    ElseIf ((_T_D == One)) {
                        If (Arg2) {
                            \_SB.TZ32.TCRT = Arg1
                            Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ32._CRT ())
                    }

                    ElseIf ((_T_D == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ32.TTSP = Arg1
                            Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ32._TSP ())
                    }

                    ElseIf ((_T_D == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ32.TTC1 = Arg1
                            Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ32._TC1 ())

                    }

                    ElseIf ((_T_D == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ32.TTC2 = Arg1
                            Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ32._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x21)) {
                While (One) {
                    Name (_T_E, Zero)
                    _T_E = ToInteger (Arg3)

                    If ((_T_E == Zero)) {
                        If (Arg2) {
                            \_SB.TZ33.TPSV = Arg1
                            Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ33._PSV)
                    }

                    ElseIf ((_T_E == One)) {
                        If (Arg2) {
                            \_SB.TZ33.TCRT = Arg1
                            Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ33._CRT)
                    }

                    ElseIf ((_T_E == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ33.TTSP = Arg1
                            Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ33._TSP ())
                    }

                    ElseIf ((_T_E == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ33.TTC1 = Arg1
                            Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ33._TC1 ())
                    }

                    ElseIf ((_T_E == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ33.TTC2 = Arg1
                            Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ33._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x22)) {
                While (One) {
                    Name (_T_F, Zero)
                    _T_F = ToInteger (Arg3)

                    If ((_T_F == Zero)) {
                        If (Arg2) {
                            \_SB.TZ34.TPSV = Arg1
                            Notify (\_SB.TZ34, 0x81) // Information Change
                        }
                        Return (\_SB.TZ34._PSV)
                    }

                    ElseIf ((_T_F == One)) {
                        If (Arg2) {
                            \_SB.TZ34.TCRT = Arg1
                            Notify (\_SB.TZ34, 0x81) // Information Change
                        }
                        Return (\_SB.TZ34._CRT)
                    }

                    ElseIf ((_T_F == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ34.TTSP = Arg1
                            Notify (\_SB.TZ34, 0x81) // Information Change
                        }
                        Return (\_SB.TZ34._TSP)
                    }

                    ElseIf ((_T_F == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ34.TTC1 = Arg1
                            Notify (\_SB.TZ34, 0x81) // Information Change
                        }
                        Return (\_SB.TZ34._TC1)
                    }

                    ElseIf ((_T_F == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ34.TTC2 = Arg1
                            Notify (\_SB.TZ34, 0x81) // Information Change
                        }
                        Return (\_SB.TZ34._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x23)) {
                While (One) {
                    Name (_T_G, Zero)
                    _T_G = ToInteger (Arg3)

                    If ((_T_G == Zero)) {
                        If (Arg2) {
                            \_SB.TZ35.TPSV = Arg1
                            Notify (\_SB.TZ35, 0x81) // Information Change
                        }
                        Return (\_SB.TZ35._PSV)
                    }

                    ElseIf ((_T_G == One)) {
                        If (Arg2) {
                            \_SB.TZ35.TCRT = Arg1
                            Notify (\_SB.TZ35, 0x81) // Information Change
                        }
                        Return (\_SB.TZ35._CRT)
                    }

                    ElseIf ((_T_G == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ35.TTSP = Arg1
                            Notify (\_SB.TZ35, 0x81) // Information Change
                        }
                        Return (\_SB.TZ35._TSP)
                    }

                    ElseIf ((_T_G == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ35.TTC1 = Arg1
                            Notify (\_SB.TZ35, 0x81) // Information Change
                        }
                        Return (\_SB.TZ35._TC1)
                    }

                    ElseIf ((_T_G == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ35.TTC2 = Arg1
                            Notify (\_SB.TZ35, 0x81) // Information Change
                        }
                        Return (\_SB.TZ35._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x24)) {
                While (One) {
                    Name (_T_H, Zero)
                    _T_H = ToInteger (Arg3)

                    If ((_T_H == Zero)) {
                        If (Arg2) {
                            \_SB.TZ36.TPSV = Arg1
                            Notify (\_SB.TZ36, 0x81) // Information Change
                        }
                        Return (\_SB.TZ36._PSV)
                    }

                    ElseIf ((_T_H == One)) {
                        If (Arg2) {
                            \_SB.TZ36.TCRT = Arg1
                            Notify (\_SB.TZ36, 0x81) // Information Change
                        }
                        Return (\_SB.TZ36._CRT)
                    }

                    ElseIf ((_T_H == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ36.TTSP = Arg1
                            Notify (\_SB.TZ36, 0x81) // Information Change
                        }
                        Return (\_SB.TZ36._TSP)
                    }

                    ElseIf ((_T_H == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ36.TTC1 = Arg1
                            Notify (\_SB.TZ36, 0x81) // Information Change
                        }
                        Return (\_SB.TZ36._TC1)
                    }

                    ElseIf ((_T_H == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ36.TTC2 = Arg1
                            Notify (\_SB.TZ36, 0x81) // Information Change
                        }
                        Return (\_SB.TZ36._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x25)) {
                While (One) {
                    Name (_T_I, Zero)
                    _T_I = ToInteger (Arg3)

                    If ((_T_I == Zero)) {
                        If (Arg2) {
                            \_SB.TZ37.TPSV = Arg1
                            Notify (\_SB.TZ37, 0x81) // Information Change
                        }
                        Return (\_SB.TZ37._PSV)
                    }

                    ElseIf ((_T_I == One)) {
                        If (Arg2) {
                            \_SB.TZ37.TCRT = Arg1
                            Notify (\_SB.TZ37, 0x81) // Information Change
                        }
                        Return (\_SB.TZ37._CRT)
                    }

                    ElseIf ((_T_I == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ37.TTSP = Arg1
                            Notify (\_SB.TZ37, 0x81) // Information Change
                        }
                        Return (\_SB.TZ37._TSP)
                    }

                    ElseIf ((_T_I == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ37.TTC1 = Arg1
                            Notify (\_SB.TZ37, 0x81) // Information Change
                        }
                        Return (\_SB.TZ37._TC1)
                    }

                    ElseIf ((_T_I == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ37.TTC2 = Arg1
                            Notify (\_SB.TZ37, 0x81) // Information Change
                        }
                        Return (\_SB.TZ37._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x26)) {
                While (One) {
                    Name (_T_J, Zero)
                    _T_J = ToInteger (Arg3)

                    If ((_T_J == Zero)) {
                        If (Arg2) {
                            \_SB.TZ38.TPSV = Arg1
                            Notify (\_SB.TZ38, 0x81) // Information Change
                        }
                        Return (\_SB.TZ38._PSV)
                    }

                    ElseIf ((_T_J == One)) {
                        If (Arg2) {
                            \_SB.TZ38.TCRT = Arg1
                            Notify (\_SB.TZ38, 0x81) // Information Change
                        }
                        Return (\_SB.TZ38._CRT)
                    }

                    ElseIf ((_T_J == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ38.TTSP = Arg1
                            Notify (\_SB.TZ38, 0x81) // Information Change
                        }

                        Return (\_SB.TZ38._TSP)
                    }

                    ElseIf ((_T_J == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ38.TTC1 = Arg1
                            Notify (\_SB.TZ38, 0x81) // Information Change
                        }
                        Return (\_SB.TZ38._TC1)
                    }

                    ElseIf ((_T_J == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ38.TTC2 = Arg1
                            Notify (\_SB.TZ38, 0x81) // Information Change
                        }
                        Return (\_SB.TZ38._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x63)) {
                While (One) {
                    Name (_T_K, Zero)
                    _T_K = ToInteger (Arg3)

                    If ((_T_K == Zero)) {
                        If (Arg2) {
                            \_SB.TZ99.TPSV = Arg1
                            Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ99._PSV ())
                    }

                    ElseIf ((_T_K == One)) {
                        If (Arg2) {
                            \_SB.TZ99.TCRT = Arg1
                            Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ99._CRT ())
                    }

                    ElseIf ((_T_K == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ99.TTSP = Arg1
                            Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ99._TSP ())
                    }

                    ElseIf ((_T_K == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ99.TTC1 = Arg1
                            Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ99._TC1 ())
                    }

                    ElseIf ((_T_K == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ99.TTC2 = Arg1
                            Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ99._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x33)) {
                While (One) {
                    Name (_T_L, Zero)
                    _T_L = ToInteger (Arg3)

                    If ((_T_L == Zero)) {
                        If (Arg2) {
                            \_SB.TZ51.TPSV = Arg1
                            Notify (\_SB.TZ51, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ51._PSV ())
                    }

                    ElseIf ((_T_L == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ51.TTSP = Arg1
                            Notify (\_SB.TZ51, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ51._TSP ())
                    }

                    ElseIf ((_T_L == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ51.TTC1 = Arg1
                            Notify (\_SB.TZ51, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ51._TC1 ())
                    }

                    ElseIf ((_T_L == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ51.TTC2 = Arg1
                            Notify (\_SB.TZ51, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ51._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x34)) {
                While (One) {
                    Name (_T_M, Zero)
                    _T_M = ToInteger (Arg3)

                    If ((_T_M == Zero)) {
                        If (Arg2) {
                            \_SB.TZ52.TPSV = Arg1
                            Notify (\_SB.TZ52, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ52._PSV ())
                    }

                    ElseIf ((_T_M == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ52.TTSP = Arg1
                            Notify (\_SB.TZ52, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ52._TSP ())
                    }

                    ElseIf ((_T_M == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ52.TTC1 = Arg1
                            Notify (\_SB.TZ52, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ52._TC1 ())
                    }

                    ElseIf ((_T_M == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ52.TTC2 = Arg1
                            Notify (\_SB.TZ52, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ52._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x35)) {
                While (One) {
                    Name (_T_N, Zero)
                    _T_N = ToInteger (Arg3)

                    If ((_T_N == Zero)) {
                        If (Arg2) {
                            \_SB.TZ53.TPSV = Arg1
                            Notify (\_SB.TZ53, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ53._PSV)
                    }

                    ElseIf ((_T_N == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ53.TTSP = Arg1
                            Notify (\_SB.TZ53, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ53._TSP)
                    }

                    ElseIf ((_T_N == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ53.TTC1 = Arg1
                            Notify (\_SB.TZ53, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ53._TC1)
                    }

                    ElseIf ((_T_N == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ53.TTC2 = Arg1
                            Notify (\_SB.TZ53, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ53._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x36)) {
                While (One) {
                    Name (_T_O, Zero)
                    _T_O = ToInteger (Arg3)

                    If ((_T_O == Zero)) {
                        If (Arg2) {
                            \_SB.TZ54.TPSV = Arg1
                            Notify (\_SB.TZ54, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ54._PSV)
                    }

                    ElseIf ((_T_O == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ54.TTSP = Arg1
                            Notify (\_SB.TZ54, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ54._TSP)
                    }

                    ElseIf ((_T_O == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ54.TTC1 = Arg1
                            Notify (\_SB.TZ54, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ54._TC1)
                    }

                    ElseIf ((_T_O == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ54.TTC2 = Arg1
                            Notify (\_SB.TZ54, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ54._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x37)) {
                While (One) {
                    Name (_T_P, Zero)
                    _T_P = ToInteger (Arg3)

                    If ((_T_P == Zero)) {
                        If (Arg2) {
                            \_SB.TZ55.TPSV = Arg1
                            Notify (\_SB.TZ55, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ55._PSV)
                    }

                    ElseIf ((_T_P == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ55.TTSP = Arg1
                            Notify (\_SB.TZ55, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ55._TSP)
                    }

                    ElseIf ((_T_P == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ55.TTC1 = Arg1
                            Notify (\_SB.TZ55, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ55._TC1)
                    }

                    ElseIf ((_T_P == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ55.TTC2 = Arg1
                            Notify (\_SB.TZ55, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ55._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x38)) {
                While (One) {
                    Name (_T_Q, Zero)
                    _T_Q = ToInteger (Arg3)

                    If ((_T_Q == Zero)) {
                        If (Arg2) {
                            \_SB.TZ56.TPSV = Arg1
                            Notify (\_SB.TZ56, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ56._PSV)
                    }

                    ElseIf ((_T_Q == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ56.TTSP = Arg1
                            Notify (\_SB.TZ56, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ56._TSP)
                    }

                    ElseIf ((_T_Q == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ56.TTC1 = Arg1
                            Notify (\_SB.TZ56, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ56._TC1)
                    }

                    ElseIf ((_T_Q == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ56.TTC2 = Arg1
                            Notify (\_SB.TZ56, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ56._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x39)) {
                While (One) {
                    Name (_T_R, Zero)
                    _T_R = ToInteger (Arg3)
                    If ((_T_R == Zero)) {
                        If (Arg2) {
                            \_SB.TZ57.TPSV = Arg1
                            Notify (\_SB.TZ57, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ57._PSV ())
                    }

                    ElseIf ((_T_R == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ57.TTSP = Arg1
                            Notify (\_SB.TZ57, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ57._TSP ())
                    }

                    ElseIf ((_T_R == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ57.TTC1 = Arg1
                            Notify (\_SB.TZ57, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ57._TC1 ())
                    }

                    ElseIf ((_T_R == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ57.TTC2 = Arg1
                            Notify (\_SB.TZ57, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ57._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x3A)) {
                While (One) {
                    Name (_T_S, Zero)
                    _T_S = ToInteger (Arg3)
                    If ((_T_S == Zero)) {
                        If (Arg2) {
                            \_SB.TZ58.TPSV = Arg1
                            Notify (\_SB.TZ58, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ58._PSV ())
                    }

                    ElseIf ((_T_S == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ58.TTSP = Arg1
                            Notify (\_SB.TZ58, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ58._TSP ())
                    }

                    ElseIf ((_T_S == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ58.TTC1 = Arg1
                            Notify (\_SB.TZ58, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ58._TC1 ())
                    }

                    ElseIf ((_T_S == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ58.TTC2 = Arg1
                            Notify (\_SB.TZ58, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ58._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x3B)) {
                While (One) {
                    Name (_T_T, Zero)
                    _T_T = ToInteger (Arg3)

                    If ((_T_T == Zero)) {
                        If (Arg2) {
                            \_SB.TZ59.TPSV = Arg1
                            Notify (\_SB.TZ59, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ59._PSV ())
                    }

                    ElseIf ((_T_T == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ59.TTSP = Arg1
                            Notify (\_SB.TZ59, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ59._TSP ())
                    }

                    ElseIf ((_T_T == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ59.TTC1 = Arg1
                            Notify (\_SB.TZ59, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ59._TC1 ())
                    }

                    ElseIf ((_T_T == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ59.TTC2 = Arg1
                            Notify (\_SB.TZ59, 0x81) // Thermal Trip Point Change
                        }
                        Return (\_SB.TZ59._TC2 ())
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x3C)) {
                While (One) {
                    Name (_T_U, Zero)
                    _T_U = ToInteger (Arg3)
                    If ((_T_U == Zero)) {
                        If (Arg2) {
                            \_SB.TZ60.TPSV = Arg1
                            Notify (\_SB.TZ60, 0x81) // Information Change
                        }
                        Return (\_SB.TZ60._PSV)
                    }

                    ElseIf ((_T_U == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ60.TTSP = Arg1
                            Notify (\_SB.TZ60, 0x81) // Information Change
                        }
                        Return (\_SB.TZ60._TSP)
                    }

                    ElseIf ((_T_U == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ60.TTC1 = Arg1
                            Notify (\_SB.TZ60, 0x81) // Information Change
                        }
                        Return (\_SB.TZ60._TC1)
                    }

                    ElseIf ((_T_U == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ60.TTC2 = Arg1
                            Notify (\_SB.TZ60, 0x81) // Information Change
                        }
                        Return (\_SB.TZ60._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x3D)) {
                While (One) {
                    Name (_T_V, Zero)
                    _T_V = ToInteger (Arg3)

                    If ((_T_V == Zero)) {
                        If (Arg2) {
                            \_SB.TZ61.TPSV = Arg1
                            Notify (\_SB.TZ61, 0x81) // Information Change
                        }
                        Return (\_SB.TZ61._PSV)
                    }

                    ElseIf ((_T_V == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ61.TTSP = Arg1
                            Notify (\_SB.TZ61, 0x81) // Information Change
                        }
                        Return (\_SB.TZ61._TSP)
                    }

                    ElseIf ((_T_V == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ61.TTC1 = Arg1
                            Notify (\_SB.TZ61, 0x81) // Information Change
                        }
                        Return (\_SB.TZ61._TC1)
                    }

                    ElseIf ((_T_V == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ61.TTC2 = Arg1
                            Notify (\_SB.TZ61, 0x81) // Information Change
                        }
                        Return (\_SB.TZ61._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            ElseIf ((_T_0 == 0x3E)) {
                While (One) {
                    Name (_T_W, Zero)
                    _T_W = ToInteger (Arg3)

                    If ((_T_W == Zero)) {
                        If (Arg2) {
                            \_SB.TZ62.TPSV = Arg1
                            Notify (\_SB.TZ62, 0x81) // Information Change
                        }
                        Return (\_SB.TZ62._PSV)
                    }

                    ElseIf ((_T_W == 0x02)) {
                        If (Arg2) {
                            \_SB.TZ62.TTSP = Arg1
                            Notify (\_SB.TZ62, 0x81) // Information Change
                        }
                        Return (\_SB.TZ62._TSP)
                    }

                    ElseIf ((_T_W == 0x03)) {
                        If (Arg2) {
                            \_SB.TZ62.TTC1 = Arg1
                            Notify (\_SB.TZ62, 0x81) // Information Change
                        }
                        Return (\_SB.TZ62._TC1)
                    }

                    ElseIf ((_T_W == 0x04)) {
                        If (Arg2) {
                            \_SB.TZ62.TTC2 = Arg1
                            Notify (\_SB.TZ62, 0x81) // Information Change
                        }
                        Return (\_SB.TZ62._TC2)
                    }

                    Else {
                        Return (0xFFFF)
                    }
                    Break
                }
            }

            Else {
                Return (0xFFFF)
            }
            Break
        }
    }

    Name (_DEP, Package() {\_SB.IPCC})

    Method (_SUB, 0, NotSerialized)
    {
    Return ("IDP07280")
    }

    Method (_DSM, 4, NotSerialized) {

        While (One) {
            Name (_T_0, Buffer (One) {0x00})
            CopyObject (ToBuffer (Arg0), _T_0)
            If ((_T_0 == ToUUID ("8d5ca34c-ae83-4a2a-9dd1-a74ffead548b"))) {
                While (One) {
                    Name (_T_1, Zero)
                    _T_1 = ToInteger (Arg2)
                    If ((_T_1 == Zero)) {
                        While (One) {
                            Name (_T_2, Zero)
                            _T_2 = ToInteger (Arg1)
                            If ((_T_2 == Zero)) { Return (0x7E) }
                            Break
                        }
                        Return (Zero)
                    }

                    ElseIf ((_T_1 == One)) {
                        Name (SUBI, Package() {

                            Package() {"adsp", 1, 2},
                            Package() {"slpi", 0, 3},
                            Package() {"cdsp", 1, 4},
                            Package() {"modem", 1, 5},
                            Package() {"spss", 0, 6},
                            Package() {"wpss", 1, 7}
                        })
                        Return (SUBI)
                    }

                    ElseIf ((_T_1 == 0x02)) {
                        If (CondRefOf (\_SB.ADSP)) {
                            If (CondRefOf (\_SB.ADSP._STA)) {
                                Return (\_SB.ADSP._STA ())
                            }

                            Else {
                                Return (0x0F)
                            }
                        }

                        Else {
                            Return (0)
                        }
                    }

                    ElseIf ((_T_1 == 0x03)) {
                        If (CondRefOf (\_SB.SCSS)) {
                            If (CondRefOf (\_SB.SCSS._STA)) {
                                Return (\_SB.SCSS._STA)
                            }

                            Else {
                                Return (0x0F)
                            }
                        }

                        Else {
                            Return (0)
                        }
                    }

                    ElseIf ((_T_1 == 0x04)) {
                        If (CondRefOf (\_SB.NSP0)) {
                            If (CondRefOf (\_SB.NSP0._STA)) {
                                Return (\_SB.NSP0._STA ())
                            }

                            Else {
                                Return (0x0F)
                            }
                        }

                        Else {
                            Return (0)
                        }
                    }

                    ElseIf ((_T_1 == 0x05)) {
                        If (CondRefOf (\_SB.AMSS)) {
                            If (CondRefOf (\_SB.AMSS._STA))
                            {
                                Return (\_SB.AMSS._STA ())
                            }

                            Else {
                                Return (0x0F)
                            }
                        }

                        Else {
                            Return (0)
                        }
                    }

                    ElseIf ((_T_1 == 0x06)) {
                        If (CondRefOf (\_SB.SPSS)) {
                            If (CondRefOf (\_SB.SPSS._STA)) {
                                Return (\_SB.SPSS._STA)
                            }

                            Else {
                                Return (0x0F)
                            }
                        }

                        Else {
                            Return (0)
                        }
                    }

                    ElseIf ((_T_1 == 0x07)) {
                        If (CondRefOf (\_SB.WPSS)) {
                            If (CondRefOf (\_SB.WPSS._STA)) {
                                Return (\_SB.WPSS._STA ())
                            }

                            Else {
                                Return (0x0F)
                            }
                        }

                        Else {
                            Return (0)
                        }
                    }

                    Else {
                        Return (0)
                    }
                    Break
                }
            }

            Else {
                Return (0)
            }
            Break
        }
    }

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate () {
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {538}
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {540}
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {539}
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {541}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {37}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {62}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {63}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {51}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {613}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {269}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {275}
        })
    }

    Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve) {
        Connection (
            I2cSerialBus (1, ControllerInitiated, 0, AddressingMode7Bit, "\\_SB.ABD", 0, ResourceConsumer, ,)
        ),
        AccessAs (BufferAcc, AttribRawBytes (0x15)),
        FLD0,   168
    }

    Method (GEPT, 0, NotSerialized) {
        Name (BUFF, Buffer (0x04){})
        CreateByteField (BUFF, Zero, STAT)
        CreateWordField (BUFF, 0x02, DATA)
        DATA = One
        Return (DATA)
    }

    Name (ROST, 0x0)
    Method (NPUR, 1, NotSerialized) {
        \_SB.AGR0._PUR [One] = Arg0
        Notify (\_SB.AGR0, 0x80)
    }

    // ACPI method to return intr descriptor
    Method (INTR, 0, NotSerialized) {
        Name (RBUF, Package() {
            // Version
            0x02,
            // Number of hosts
            0x00000001,
            // number of memory regions
            0x03,
            // number of IPC registers
            0x00000001,

            // Rpm: APCS_IPC(0)
            // Host = SMEM_RPM
            0x06,
            // Physical address
            0x17911008,
            // Value
            0x00000001,
            // Reserved
            0x00000000,

            // Shared memory
            // Start address
            0x86000000,
            // Size
            0x00200000,
            // Reserved
            0x00000000,
            // Reserved
            0x00000000,

            // MSG RAM
            // Start address
            0x0C300000,
            // Size
            0x1000,
            // Reserved
            0x00000000,
            // Reserved
            0x00000000,

            // IMEM or TZ_WONCE
            // Start address
            0x01FD4000,
            // Size
            0x08,
            // Reserved
            0x00000000,
            // Reserved
            0x00000000,

            // IPC register 1
            // Physical addr
            0x17C0000C,
            // Reserved
            0x00000000,
            // Reserved
            0x00000000,
            // Reserved
            0x00000000
        })
        Return (RBUF)
    }

    Method (STND)
    {
        Return (STNX)
    }

    Name (STNX,
          Package()
    {
        // Power resources for devices
        // Names are reversed (so method OCMD becomes DMCO)
        //
        // Following format must be followed for name:
        // DMxx -- Exists on QCOM SoC. Will use normal PoFX for power mgmt
        // XMxx -- Exists off QCOM SoC and uses legacy power mgmt (_PS1, _PS2, etc)
        //
        // The files where these methods are declared must be included
        // at the bottom of this file and must exists inside the scope: \_SB.PEP0
        "DMPO",     // oem dummy
        "MMVD",
        "DMSB",     // buses resources
        "DMPA",     // AUDIO
        "DMPB",     // COREBSP
        "DMDS",
        "DMPL",     // PLATFORM
        "DMWE",     // EXTERNAL WIRELESS CONNECTIVITY
        "XMPL",     // PLATFORM
        "XMPT",
        "DMEP"      // PCIE-Resources
    })

    // CPU cap for DCVS Packages
    Name (DCVS, 0x0)

    // Method to return CPU cap for DCVS Package
    Method (PGDS)
    {
        Return (DCVS)
    }

    // PPP Supported Resources Package
    Name (PPPP,
    Package()
    {
        // Resource ID
        //------------------------
        Package() {"PPP_RESOURCE_ID_SMPS1_B"},
        Package() {"PPP_RESOURCE_ID_SMPS2_B"},
        Package() {"PPP_RESOURCE_ID_SMPS7_B"},
        Package() {"PPP_RESOURCE_ID_SMPS8_B"},
        Package() {"PPP_RESOURCE_ID_SMPS1_C"},
        Package() {"PPP_RESOURCE_ID_SMPS9_C"},
        Package() {"PPP_RESOURCE_ID_LDO1_B"},
        Package() {"PPP_RESOURCE_ID_LDO2_B"},
        Package() {"PPP_RESOURCE_ID_LDO3_B"},
        Package() {"PPP_RESOURCE_ID_LDO6_B"},
        Package() {"PPP_RESOURCE_ID_LDO7_B"},
        Package() {"PPP_RESOURCE_ID_LDO8_B"},
        Package() {"PPP_RESOURCE_ID_LDO9_B"},
        Package() {"PPP_RESOURCE_ID_LDO11_B"},
        Package() {"PPP_RESOURCE_ID_LDO12_B"},
        Package() {"PPP_RESOURCE_ID_LDO13_B"},
        Package() {"PPP_RESOURCE_ID_LDO14_B"},
        Package() {"PPP_RESOURCE_ID_LDO15_B"},
        Package() {"PPP_RESOURCE_ID_LDO16_B"},
        Package() {"PPP_RESOURCE_ID_LDO17_B"},
        Package() {"PPP_RESOURCE_ID_LDO18_B"},
        Package() {"PPP_RESOURCE_ID_LDO19_B"},
        Package() {"PPP_RESOURCE_ID_LDO1_C"},
        Package() {"PPP_RESOURCE_ID_LDO2_C"},
        Package() {"PPP_RESOURCE_ID_LDO3_C"},
        Package() {"PPP_RESOURCE_ID_LDO4_C"},
        Package() {"PPP_RESOURCE_ID_LDO5_C"},
        Package() {"PPP_RESOURCE_ID_LDO6_C"},
        Package() {"PPP_RESOURCE_ID_LDO7_C"},
        Package() {"PPP_RESOURCE_ID_LDO8_C"},
        Package() {"PPP_RESOURCE_ID_LDO9_C"},
        Package() {"PPP_RESOURCE_ID_LDO10_C"},
        Package() {"PPP_RESOURCE_ID_LDO11_C"},
        Package() {"PPP_RESOURCE_ID_LDO12_C"},
        Package() {"PPP_RESOURCE_ID_LDO13_C"},
        Package() {"PPP_RESOURCE_ID_LDO1_P"},
        Package() {"PPP_RESOURCE_ID_LDO2_P"},
        Package() {"PPP_RESOURCE_ID_LDO3_P"},
        Package() {"PPP_RESOURCE_ID_LDO4_P"},
        Package() {"PPP_RESOURCE_ID_LDO5_P"},
        Package() {"PPP_RESOURCE_ID_LDO6_P"},
        Package() {"PPP_RESOURCE_ID_LDO7_P"},
        Package() {"PPP_RESOURCE_ID_LDO1_Q"},
        Package() {"PPP_RESOURCE_ID_LDO2_Q"},
        Package() {"PPP_RESOURCE_ID_LDO3_Q"},
        Package() {"PPP_RESOURCE_ID_LDO4_Q"},
        Package() {"PPP_RESOURCE_ID_LDO5_Q"},
        Package() {"PPP_RESOURCE_ID_LDO6_Q"},
        Package() {"PPP_RESOURCE_ID_LDO7_Q"},
        Package() {"PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A"},
        Package() {"PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK1_A"},
        Package() {"PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A"},
        Package() {"PPP_RESOURCE_ID_BUCK_BOOST1_C"},
        Package() {"PPP_RESOURCE_ID_FIXED_VREG1"},
        Package() {"PPP_RESOURCE_ID_FIXED_VREG2"}
    })

    // Method to return PPP Package
    Method (PPPM)
    {
        Return (PPPP)
    }

    // Method to return System Default config packages
    Name (PRRP,
    Package() {})

    Method (PPRR)
    {
        Return (PRRP)
    }

    // Full PEP Device Package
    Name (FPDP, 0x0)
    Method (FPMD)
    {
        Return (FPDP)
    }

    Method (DPRF)
    {
        Return (\_SB.DPP0)
    }

    Method (DMRF)
    {
        Return (\_SB.DPP1)
    }

    Method (MPRF)
    {
        Return (\_SB.MPP0)
    }

    Method (MMRF)
    {
        Return (\_SB.MPP1)
    }
}

Scope(\_SB_.PEP0) {
    Method(PEPH)
    {
        Return(Package() {"ACPI\\VEN_QCOM&DEV_0A17"})
    }
}
