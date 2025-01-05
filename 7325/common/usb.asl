// HPD Notification Event in Display Driver
// HPD_STATUS_LOW_NOTIFY_EVENT    -  0x92
// HPD_STATUS_HIGH_NOTIFY_EVENT   -  0x93
// All other valus are invalid
Name (HPDB, 0x00000000)

//HPD Status
Name (HPDS, Buffer() {0x00})

Name (DPPN, 0x0D)

// Holds the CC OUT Status
// 0 -> CC1
// 1 -> CC2
// 2 -> CC Open
Name (CCST, Buffer() {0x02})

Name (PORT, Buffer() {0x02})
Name (HIRQ, Buffer() {0x00})

// USB Capabilities bitmap
// Indicates the platform's USB capabilities, extend as required.
//   Bit  Description
//   ---  ---------------------------------------------------
//     0  Super Speed Gen1 supported (Synopsys IP)
//     1  PMIC VBUS detection supported
//     2  USB PHY interrupt supported (seperate from ULPI)
//     3  TypeC supported
Name (USBC, Buffer() {0x0B})

Name (MUXC, Buffer() {0x00})

Device (URS0)
{
    Name (_HID, "QCOM0A8B")
    Name (_CID, "PNP0CA1")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
    Name (_CCA, 0) // Cache-incoherent bus-master, Hardware does not manage cache coherency
    Name (_DEP, Package (0x02)
    {
        \_SB.PEP0,
        \_SB.UCS0
    })
    Name (_CRS, ResourceTemplate () {
        Memory32Fixed (ReadWrite, 0x0A600000, 0x000FFFFF)
    })

    // Dynamically enumerated device (host mode stack) on logical USB bus
    Device (USB0)
    {
        Name (_ADR, 0)
        Name (_S0W, 3)
        Name (_CRS, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared       , , , ) {0xA5}
            Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA2}
            Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x211}
            Interrupt (ResourceConsumer, Edge , ActiveHigh, SharedAndWake, , , ) {0x20F}
            Interrupt (ResourceConsumer, Edge , ActiveHigh, SharedAndWake, , , ) {0x20E}
        })

        Device (RHUB)
        {
            Name (_ADR, 0)
            Device (PRT1)
            {
                Name (_ADR, 1)

                // _UPC as defined in the ACPI spec.
                Name (_UPC, Package()
                {
                    0x01,                           // Port is connectable.
                    0x09,                           // Connector type: Type C connector - USB2 and SS with switch.
                    0x00000000,                     // Reserved0 - must be zero.
                    0x00000000                      // Reserved1 - must be zero.
                })

                // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
                // derive a unique "Connector ID". The other fields are not really important.
                Name (_PLD, Package()
                {
                    Buffer ()
                    {
                        0x82,                       // Revision 2, ignore color.
                        0x00, 0x00, 0x00,           // Color (ignored).
                        0x00, 0x00, 0x00, 0x00,     // Width and height.
                        0x69,                       // User visible; Back panel; VerticalPos:Center.
                        0x0C,                       // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                        0x00, 0x00,
                        0x00, 0x00, 0x00, 0x00,     // Not ejectable.
                        0xFF, 0xFF, 0xFF, 0xFF      // Vert. and horiz. offsets not supplied.
                    }
                })
            }
        }
        // Device Specific Method takes 4 args:
        //  Arg0 : Buffer containing a UUID [16 bytes]
        //  Arg1 : Integer containing the Revision ID
        //  Arg2 : Integer containing the Function Index
        //  Arg3 : Empty Package (Not used)
        Method (_DSM, 0x4, NotSerialized)
        {
            // UUID selector
            switch(ToBuffer(Arg0)) {
                // UFX interface identifier
                case(ToUUID("CE2EE385-00E6-48CB-9F05-2EDB927C4899")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {0,2,3,4} supported
                                case(0) { Return(Buffer(){0x1D}); Break; }
                                // Function 0 only supported for invalid revision
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 2: Port type identification
                        // 0x00  Regular USB
                        // 0x01  HSIC
                        // 0x02  SSIC
                        // 0x03  0xff reserved
                        case(2) { Return(0x0); Break; }

                        // Function 3: Query Controller Capabilities
                        // bit 0 represents the support for software assisted USB endpoint offloading feature
                        // 1 - Offloading endpoint supported
                        case(3) { Return(0x0); Break; }

                        // Function 4: Interrupter Number
                        case(4) { Return(0x2); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {CE2EE385-00E6-48CB-9F05-2EDB927C4899}
                default { Return (Buffer(){0x00}); Break; }
            } // UUID
        } // _DSM
        //
        // The following values of PHY will be configured if OEMs do not
        // overwrite the values.
        //
        // For SNPS core, PARAMETER_OVERRIDE_X is used to configure HS PHY.
        // For SS PHY, PERIPH_SS_USB3PHY_QSERDES_TX_TX_DRV_LVL is used to tune swing
        // and PERIPH_SS_USB3PHY_QSERDES_TX_TX_EMP_POST1_LVL for de_emphasis.
        //
        // AccessMethod:
        // 0 - DirectAccess: The register address is accessed directly from the mapped memory.
        //
        Method (PHYC, 0, NotSerialized) {
            Name (CFG0, Package (Zero) {} )
            Return (CFG0)
        }
    } // USB0

    // Dynamically enumerated device (peripheral mode stack) on logical USB bus
    Device (UFN0)
    {
        Name (_ADR, 1)
        Name (_S0W, 3) // Enable power management

        Device (RHUB)
        {
            Name (_ADR, 0)
            Device (PRT1)
            {
                Name (_ADR, 1)

                // _UPC as defined in the ACPI spec.
                Name (_UPC, Package()
                {
                    0x01,                           // Port is connectable.
                    0x09,                           // Connector type: Type C connector - USB2 and SS with switch.
                    0x00000000,                     // Reserved0 - must be zero.
                    0x00000000                      // Reserved1 - must be zero.
                })
                Name (_PLD, Package()
                {
                    Buffer()
                    {
                        0x82,                       // Revision 2, ignore color.
                        0x00, 0x00, 0x00,           // Color (ignored).
                        0x00, 0x00, 0x00, 0x00,     // Width and height.
                        0x69,                       // User visible; Back panel; VerticalPos:Center.
                        0x0C,                       // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                        0x00, 0x00,
                        0x00, 0x00, 0x00, 0x00,     // Not ejectable.
                        0xFF, 0xFF, 0xFF, 0xFF      // Vert. and horiz. offsets not supplied.
                    }
                })
            }
        }
        Name (_CRS, ResourceTemplate () {
            // usb30_ctrl_irq[0]
            Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, , , ) {0xA5}
            //usb30_power_event_irq
            Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0xA2}
        })

        // Device Specific Method takes 4 args:
        //  Arg0 : Buffer containing a UUID [16 bytes]
        //  Arg1 : Integer containing the Revision ID
        //  Arg2 : Integer containing the Function Index
        //  Arg3 : Package that contains function-specific arguments
        Method (_DSM, 0x4, NotSerialized)
        {
            // UUID selector
            switch(ToBuffer(Arg0)) {
                // UFX interface identifier
                case(ToUUID("FE56CFEB-49D5-4378-A8A2-2978DBE54AD2")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {1} supported
                                case(0) { Return(Buffer(){0x03}); Break; }
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 1: Return number of supported USB PHYSICAL endpoints
                        // Synopsys core configured to support 16 IN/16 OUT EPs, including EP0
                        case(1) { Return(32); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {FE56CFEB-49D5-4378-A8A2-2978DBE54AD2}

                // QCOM specific interface identifier
                case(ToUUID("18DE299F-9476-4FC9-B43B-8AEB713ED751")) {
                    // Function selector
                    switch(ToInteger(Arg2)) {
                        // Function 0: Return supported functions, based on revision
                        case(0) {
                            // Version selector
                            switch(ToInteger(Arg1)) {
                                // Revision0: functions {1} supported
                                case(0) { Return(Buffer(){0x03}); Break; }
                                default { Return(Buffer(){0x01}); Break; }
                            }
                            // default
                            Return (Buffer(){0x00}); Break;
                        }

                        // Function 1: Return device capabilities bitmap
                        //   Bit  Description
                        //   ---  -------------------------------
                        //     0  Superspeed Gen1 supported
                        //     1  PMIC VBUS detection supported
                        //     2  USB PHY interrupt supported
                        //     3  Type-C supported
                        //     4  Delay USB initialization
                        //     5  HW based charger detection
                        case(1) { Return(0x39); Break; }

                        default { Return (Buffer(){0x00}); Break; }
                    } // Function
                } // {18DE299F-9476-4FC9-B43B-8AEB713ED751}

                default { Return (Buffer(){0x00}); Break; }
            } // UUID
        } // _DSM

        //
        // The following values of PHY will be configured if OEMs do not
        // overwrite the values.
        //
        // For SNPS core, PARAMETER_OVERRIDE_X is used to configure HS PHY.
        // For SS PHY, PERIPH_SS_USB3PHY_QSERDES_TX_TX_DRV_LVL is used to tune swing
        // and PERIPH_SS_USB3PHY_QSERDES_TX_TX_EMP_POST1_LVL for de_emphasis.
        //
        // AccessMethod:
        // 0 - DirectAccess: The register address is accessed directly from the mapped memory.
        //
        Method (PHYC, 0, NotSerialized) {
            Name (CFG0, Package (Zero){})
            Return (CFG0)
        }
    } // UFN0
} // URS0

// Dynamically enumerated device (host mode stack) on logical Secondary USB bus
Device (USB1)
{
    Name (_HID, "QCOM0AA1")
    Name (_CID, "ACPI\\PNP0D15")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 1)
    Name (_CCA, 0)

    Method (_STA)
    {
        Return (0)
    }

    Name (_DEP, Package (0x1)
    {
        \_SB.PEP0
    })

    Name (_S0W, 3)
    Name (_ADR, 0)

    Name (_CRS, ResourceTemplate ()
    {
        Memory32Fixed (ReadWrite, 0x08C00000, 0x000FFFFF)
        Interrupt (ResourceConsumer, Level, ActiveHigh, Shared       , , , ) {0x112}
        Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, , , ) {0x111}
        Interrupt (ResourceConsumer, Edge , ActiveHigh, SharedAndWake, , , ) {0x20D}
        Interrupt (ResourceConsumer, Edge , ActiveHigh, SharedAndWake, , , ) {0x20C}
    })

    Device (RHUB)
    {
        Name (_ADR, 0) // Value zero reserved for Root Hub
        Device (PRT1)
        {
            Name (_ADR, 1)

            // _UPC as defined in the ACPI spec.
            Name (_UPC, Package()
            {
                0x01,                               // Port is connectable.
                0x06,                               // Connector type:
                0x00000000,                         // Reserved0 - must be zero.
                0x00000000                          // Reserved1 - must be zero.
            })
            // _PLD as defined in the ACPI spec. The GroupToken and GroupPosition are used to
            // derive a unique "Connector ID". The other fields are not really important.
            Name (_PLD, Package()
            {
                Buffer()
                {
                    0x82,                           // Revision 2, ignore color.
                    0x00, 0x00, 0x00,               // Color (ignored).
                    0x00, 0x00, 0x00, 0x00,         // Width and height.
                    0x69,                           // User visible; Back panel; VerticalPos:Center.
                    0x0C,                           // HorizontalPos:0; Shape:Vertical Rectangle; GroupOrientation:0.
                    0x80, 0x00,                     // Group Token:0; Group Position:1; So Connector ID is 1.
                    0x00, 0x00, 0x00, 0x00,         // Not ejectable.
                    0xFF, 0xFF, 0xFF, 0xFF          // Vert. and horiz. offsets not supplied.
                }
            })
        }
    }

    // Device Specific Method takes 4 args:
    //  Arg0 : Buffer containing a UUID [16 bytes]
    //  Arg1 : Integer containing the Revision ID
    //  Arg2 : Integer containing the Function Index
    //  Arg3 : Empty Package (Not used)
    Method (_DSM, 0x4, NotSerialized)
    {
        // UUID selector
        switch(ToBuffer(Arg0)) {
            // UFX interface identifier
            case(ToUUID("CE2EE385-00E6-48CB-9F05-2EDB927C4899")) {
                // Function selector
                switch(ToInteger(Arg2)) {
                    // Function 0: Return supported functions, based on revision
                    case(0) {
                        // Version selector
                        switch(ToInteger(Arg1)) {
                            // Revision0: functions {0,2,3,4} supported
                            case(0) { Return(Buffer(){0x1D}); Break; }
                            // Function 0 only supported for invalid revision
                            default { Return(Buffer(){0x01}); Break; }
                        }
                        // default
                        Return (Buffer(){0x00}); Break;
                    }

                    // Function 2: Port type identification
                    // 0x00  Regular USB
                    // 0x01  HSIC
                    // 0x02  SSIC
                    // 0x03  0xff reserved
                    case(2) { Return(0x0); Break; }

                    // Function 3: Query Controller Capabilities
                    // bit 0 represents the support for software assisted USB endpoint offloading feature
                    // 1 - Offloading endpoint supported
                    case(3) { Return(0x0); Break; }

                    // Function 4: Interrupter Number
                    case(4) { Return(0x2); Break; }

                    default { Return (Buffer(){0x00}); Break; }
                } // Function
            } // {CE2EE385-00E6-48CB-9F05-2EDB927C4899}
            default { Return (Buffer(){0x00}); Break; }
        } // UUID
    } // _DSM

    //
    // The following values of PHY will be configured if OEMs do not
    // overwrite the values.
    //
    // For SNPS core, PARAMETER_OVERRIDE_X is used to configure HS PHY.
    // For SS PHY, PERIPH_SS_USB3PHY_QSERDES_TX_TX_DRV_LVL is used to tune swing
    // and PERIPH_SS_USB3PHY_QSERDES_TX_TX_EMP_POST1_LVL for de_emphasis.
    //
    // AccessMethod:
    // 0 - DirectAccess: The register address is accessed directly from the mapped memory.
    //
    Method (PHYC, 0, NotSerialized) {
        Name (CFG0, Package() {} )
        Return (CFG0)
    }
}

Device (UCS0)
{
    Name (_HID, "QCOM0AA4")
    Name (_DEP, Package() {\_SB.PEP0})

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            GpioIo (Exclusive, PullDown, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, ,) {0x23}
        })
        Return (RBUF)
    }

    Method (MUXV, 0, NotSerialized) { Return (\_SB.MUXC) }
    Method (CCVL, 0, NotSerialized) { Return (\_SB.CCST) }
    Method (DPVL, 0, NotSerialized) { Return (\_SB.DPPN) }
    Method (HPDM, 0, NotSerialized) { Return (\_SB.HPDS) }
    Method (HPDI, 0, NotSerialized) { Return (\_SB.HIRQ) }
}
