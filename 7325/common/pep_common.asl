//
// The PEP Device & Driver Related Configuration
//

Device (PEP0)
{
    Name (_HID, "QCOM0A17")
    Name (_CID, "PNP0D80")

    Include("thz.asl")

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
        // List interrupt resources in the order they are used in PEP_Driver.c
        Return (ResourceTemplate ()
        {
            // TSENS threshold interrupts
            // Controller 0: Low / high
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {538}
            // Controller 0: Critical
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {540}
            // Controller 1: Low / high
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {539}
            // Controller 1: Critical
            Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, , , ) {541}

            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {37}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {62}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {63}
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, , , ) {51}
            Interrupt (ResourceConsumer, Edge , ActiveHigh, Exclusive, , , ) {613}
            Interrupt (ResourceConsumer, Edge , ActiveHigh, Exclusive, , , ) {269}
            Interrupt (ResourceConsumer, Edge , ActiveHigh, Exclusive, , , ) {275}
        })
    }

    Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
    {
        Connection (I2cSerialBus( 0x0001, ControllerInitiated, 0x0, AddressingMode7Bit, "\\_SB.ABD", 0, ResourceConsumer, ,)),
        AccessAs(BufferAcc, AttribRawBytes (21)),
        FLD0, 168
    }

    // Get port to connect to
    Method (GEPT)
    {
        Name (BUFF, Buffer (4){})
        CreateByteField(BUFF, 0x00, STAT)
        CreateWordField(BUFF, 0x02, DATA)
        Store(0x1, DATA) //in this example we will connect to ABDO
        Return (DATA)
    }

    Name (ROST, 0x0)
    // Number of CPUs to Park
    Method (NPUR, 0x1, NotSerialized)
    {
        Store(Arg0, Index(\_SB_.AGR0._PUR, 1))
        Notify(\_SB.AGR0, 0x80)
    }

    // ACPI method to return intr descriptor
    Method (INTR, 0, NotSerialized) {
        Name (RBUF, Package()
            {
            // Version
            0x00000002,
            // Number of hosts
            0x00000001,
            // number of memory regions
            0x00000003,
            // number of IPC registers
            0x00000001,

            // Rpm: APCS_IPC(0)
            // Host = SMEM_RPM
            0x00000006,
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
            0x00000008,
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

    // Method to return Pep Ppp Resource Range Package
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

    // Methods to read USB DP & DM interrupts polarity
    // The return names should match with buffers
    // declared and defined in usb.asl file.

    // This method allows PEP to read Polarity of
    // eud_p0_dmse_int_mx & eud_p0_dpse_int_mx
    // interrupts which belong to Primary USB Port (P0)
    Method (DPRF)
    {
        // Return DPRF
        Return (\_SB.DPP0)
    }

    // This method allows PEP to read Polarity of
    // eud_p1_dmse_int_mx & eud_p1_dpse_int_mx
    // interrupts which belong to Secondary USB Port (P1)
    Method (DMRF)
    {
        // Return DMRF
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
