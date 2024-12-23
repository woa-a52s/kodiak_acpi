//--------------------------------------------------------------------------------------------------
// This file contains all graphics ACPI Device Configuration Information and Methods
//--------------------------------------------------------------------------------------------------

Device (GPU0)
{
    Name (_HID, "QCOM0A36")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)
    Name (_CLS, 0x0003000000000000)

    // Expose the internal monitor device to allow it to be used in a thermal zone
    // for thermal mitigation.
    //
    Device (MON0)
    {
        Method (_ADR, 0, NotSerialized)
        {
            // 0 is always the address assigned for the internal monitor.
            //
            Return (Zero)
        }
    }

    Name (_DEP, Package (0x0A)
    {
        \_SB.MMU0,
        \_SB.MMU1,
        \_SB.IMM0,
        \_SB.IMM1,
        \_SB.PEP0,
        \_SB.PMIC,
        \_SB.PILC,
        \_SB.RPEN,
        \_SB.TREE,
        \_SB.SCM0
    })
    Method (_CRS, 0, NotSerialized)
    {
        Name (ABUF, ResourceTemplate ()
        {
            // MDP register/memory space (IPCAT->SoC->Memory Maps->Config NOC->MMSS->MMSS_MDSS)
            //
            Memory32Fixed (ReadWrite, 0x0AE00000, 0x00200000,)

            // DP PHY register/memory space (IPCAT->SoC->Memory Maps->Config NOC->PERIPH_SS_AHB2PHY_NORTH)
            //
            Memory32Fixed (ReadWrite, 0x088E0000, 0x00010000,)

            // MDP Interrupt, vsync (IPCAT->SoC->Interrupts->SM7325->mdp_irq)
            //
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x00000073,}

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed (ReadWrite, 0x03D00000, 0x0003F010,)

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed (ReadWrite, 0x03D60000, 0x0003F000,)

            // GPU Interrupt (IPCAT->SoC->Interrupts->SDM850->gc_sys_irq[0]) (Source Subsystem = GPU Subsystem, Subsystem Port = gc_sys_irq[0])
            //
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x0000014C,}

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed (ReadWrite, 0x0B290000, 0x00010000,)

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed (ReadWrite, 0x0B490000, 0x00010000,)

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Memory32Fixed (ReadWrite, 0x03D90000, 0x00009000,)

            //
            //
            Memory32Fixed (ReadWrite, 0x03DE0000, 0x00010000,)

            // GPU RPMh CPRF register range
            //
            Memory32Fixed (ReadWrite, 0x0C200000, 0x0000FFFF,)

            // VIDC register address space (IPCAT->SoC->Memory Maps->Config NOC->Video_SS_Wrapper)
            //
            Memory32Fixed (ReadWrite, 0x0AA00000, 0x00200000,)

            // VIDC Interrupt (IPCAT->SoC->Interrupts->SM7325->VENUS_IRQ)
            //
            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {0x000000CE,}

            // TLMM GPIO used to reset the DSI panel
            //
            GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionNone, "\\_SB.GIO0", 0x00, ResourceConsumer, ,) {0x002C}
        })
        Return (ABUF)
    }

    //------------------------------------------------------------------------------
    // Resource Auxiliary Info
    // This method is a companion method to the main _CRS resource method.  It
    // includes information for each resource, such as the owning component, a
    // string identifier, etc.
    //------------------------------------------------------------------------------
    //
    Method (RESI, 0, NotSerialized)
    {
        Name (AINF, Package (0x10)
        {
            0x03,                           // Table Format Major Version
            Zero,                           // Table Format Minor Version

            // MDP register/memory space (IPCAT->SoC->Memory Maps->Config NOC->MMSS->MMSS_MDSS)
            //
            Package (0x03)
            {
                "RESOURCE",
                "MDP_REGS",                 // Resource Name
                "DISPLAY"                   // Owning Component
            },

            // DP PHY register/memory space (IPCAT->SoC->Memory Maps->Config NOC->PERIPH_SS_AHB2PHY_NORTH)
            //
            Package (0x03)
            {
                "RESOURCE",
                "DP_PHY_REGS",              // Resource Name
                "DISPLAY"                   // Owning Component
            },

            // MDP Interrupt, vsync (IPCAT->SoC->Interrupts->SM7325->mdp_irq)
            //
            Package (0x03)
            {
                "RESOURCE",
                "VSYNC_INTERRUPT",          // Resource Name
                "DISPLAY"                   // Owning Component
            },

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package (0x03)
            {
                "RESOURCE",
                "GFX_REGS",                 // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package (0x03)
            {
                "RESOURCE",
                "GFX_REG_CONT",             // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            // GPU Interrupt (IPCAT->SoC->Interrupts->SDM850->gc_sys_irq[0]) (Source Subsystem = GPU Subsystem, Subsystem Port = gc_sys_irq[0])
            //
            Package (0x03)
            {
                "RESOURCE",
                "GFX_INTERRUPT",            // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package (0x03)
            {
                "RESOURCE",
                "GPU_PDC_SEQ_MEM",          // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package (0x03)
            {
                "RESOURCE",
                "GPU_PDC_REGS",             // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            // GPU register space (IPCAT->SoC->Memory Maps->Config NOC->A6X) from SWI Browser
            //
            Package (0x03)
            {
                "RESOURCE",
                "GPU_CC",                   // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            //
            //
            Package (0x03)
            {
                "RESOURCE",
                "GPU_RSCC",                 // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            // GPU RPMh CPRF register range
            //
            Package (0x03)
            {
                "RESOURCE",
                "GPU_RPMH_CPRF",            // Resource Name
                "GRAPHICS"                  // Owning Component
            },

            // VIDC register address space (IPCAT->SoC->Memory Maps->Config NOC->Video_SS_Wrapper)
            //
            Package (0x03)
            {
                "RESOURCE",
                "VIDEO_REGS",               // Resource Name
                "VIDEO"                     // Owning Component
            },

            // VIDC Interrupt (IPCAT->SoC->Interrupts->SM7325->VENUS_IRQ)
            //
            Package (0x03)
            {
                "RESOURCE",
                "VIDC_INTERRUPT",           // Resource Name
                "VIDEO"                     // Owning Component
            },

            // TLMM GPIO used to reset the DSI panel
            //
            Package (0x03)
            {
                "RESOURCE",
                "DSI_PANEL_RESET",          // Resource Name
                "DISPLAY"                   // Owning Component
            }
        })
        Return (AINF)
    }

    // Include Display ACPI extensions, which include panel configuration (_ROM) method
    //
    Include("display.asl")

    // Include display adapter connfiguration for external display
    //
    Include("displayext.asl")

    Name (_DOD, Package (One)
    {
        0x00024321
    })

    //------------------------------------------------------------------------------
    // _STA method
    // _STA method, would be used to enable/disable GPU device from uefi menu.
    //------------------------------------------------------------------------------
    //
    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_HRV, 0, NotSerialized)
    {
        Name (RESU, Zero)
        Name (TIER, Zero)
        Name (DREV, Zero)
        Name (FAMI, Zero)
        Name (PROD, Zero)
        And(\_SB_.SIDT, 0xf, TIER)
        And(ShiftRight(\_SB_.SJTG, 0x1c, ), 0xf, DREV)
        ShiftLeft(DREV, 0x4, DREV)
        And(ShiftRight(\_SB_.SJTG, 0xc, ), 0xffff, PROD)
        If(Or(LEqual(PROD, 0x193), LEqual(PROD, 0x1eb), ))
        {
            ShiftLeft(One, 0x8, FAMI)
        }
        If(LEqual(PROD, 0x194))
        {
            ShiftLeft(0x2, 0x8, FAMI)
        }
        If(Or(LEqual(PROD, 0x1e3), LEqual(PROD, 0x20a), ))
        {
            ShiftLeft(0x3, 0x8, FAMI)
        }
        Or(TIER, RESU, RESU)
        Or(DREV, RESU, RESU)
        Or(FAMI, RESU, RESU)
        Return (RESU)
    }

    // Enumeration and device info for the AVStream child driver
    //
    Device (AVS0)
    {
        // The address for this device (Same as in _DOD, above)
        //
        Name (_ADR, 0x00024321)

        Method (_CRS, 0, NotSerialized)
        {
            Name (RBUF, Buffer (0x02)
            {
                    0x79, 0x00
            })
            Return (RBUF)
        }

        Name (_DEP, Package (0x03)
        {
            \_SB.MMU0,
            \_SB.IMM0,
            \_SB.VFE0
        })
    }

    //------------------------------------------------------------------------------
    // Child Device Info
    // This method includes information for child devices
    //------------------------------------------------------------------------------
    //
    Method (CHDV, 0, NotSerialized)
    {
        Name (CHIF, Package (0x02)
        {
            One,                                        // Number of Child devices
            Package (0x07)
            {
                "CHILDDEV",
                Zero,                                   // Child ID
                0x00024321,                             // ACPI UID
                "QCOM_AVStream_7280",                   // Hardware ID
                Zero,                                   // Instance ID
                "Qualcomm Camera AVStream Mini Driver", // Device Text

                Package (0x04)
                {
                    "COMPATIBLEIDS",
                    0x02,                               // Number of Compatible IDs
                    "VEN_QCOM&DEV__AVSTREAM",           // Compatible ID 1
                    "QCOM_AVSTREAM"                     // Compatible ID 2
                }
            }
        })
        Return (CHIF)
    }
}
