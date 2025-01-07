//
// NOTE: The 3rd parameter (i.e. ComplianceRevision) must be >=2 for 64-bit integer support.
//
DefinitionBlock("DSDT.aml", "DSDT", 0x02, "QCOMM ", "SDM7280 ", 3)
{
    Scope(\_SB_) {

        Include("addSub.asl")
        Include("dsdt_common.asl")

        //
        // Hardware LED notification device
        //
        Include("cust_hwn0.asl")

        Include("cust_camera.asl")
        Include("cust_sensors.asl")
        Include("usb.asl")

        // Thermal Zone devices
        Include("cust_thermal_zones.asl")

        //
        // Hardware Haptics device
        //
        Include("cust_hwn1.asl")

        //
        // Touch
        //
        Include("cust_touch.asl")

        //
        // Buttons
        //
        Include("cust_arraybutton.asl")

        //
        // 5GNR Coexistence Manager Modem Driver
        //
        Device(NRCX)
        {
            Name(_HID, "QCOM0AD6")
            Alias(\_SB_.PSUB, _SUB)
        }

        //
        // AutoReg Driver
        //
        Device(PSAU)
        {
            Name(_HID, "QCOM0AE1")
            Alias(\_SB_.PSUB, _SUB)
        }
        Scope(\_SB_.NRCX)
        {
            // Load component, version check (SKUV) has been disabled
            Method(_STA)
            {
                // If(LOr(LOr(LEqual(\_SB_.SKUV, 0x4), LEqual(\_SB_.SKUV, 0x6)), LEqual(\_SB_.SKUV, 0x7))) { Return(0) }
                // Else {
                Return(0xf) //}
            }
        }
        Scope(\_SB_.PSAU)
        {
            // Load component, version check (SKUV) has been disabled
            Method(_STA)
            {
                // If(LOr(LOr(LEqual(\_SB_.SKUV, 0x4), LEqual(\_SB_.SKUV, 0x6)), LEqual(\_SB_.SKUV, 0x7))) { Return(0) }
                // Else {
                Return(0xf) //}
            }
        }

        //
        // Bluetooth
        //
        Include("wcnss_bt.asl")

        //
        // ADC driver
        //
        Include("adc.asl")
    }
}
