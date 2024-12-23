//
//
//
DefinitionBlock("DSDT.aml", "DSDT", 0x02, "QCOMM ", "SDM7280 ", 3)
{
    Scope(\_SB_) {

        Include("dsdt_common.asl")

        //
        // Hardware Notifications 0
        //
        Include("cust_hwn0.asl")
        Include("cust_camera.asl")
        Include("cust_sensors.asl")
        Include("usb.asl")

        // Thermal Zone devices
        Include("cust_thermal_zones.asl")

        //
        // Hardware Notifications 1
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

        Device(NRCX)
        {
            Name(_HID, "QCOM0AD6")
            Alias(\_SB_.PSUB, _SUB)
        }
        Device(PSAU)
        {
            Name(_HID, "QCOM0AE1")
            Alias(\_SB_.PSUB, _SUB)
        }
        Scope(\_SB_.NRCX)
        {
            Method(_STA, 0x0, NotSerialized)
            {
                If(LOr(LOr(LEqual(\_SB_.SKUV, 0x4), LEqual(\_SB_.SKUV, 0x6)), LEqual(\_SB_.SKUV, 0x7)))
                {
                    Return(Zero)
                }
                Else
                {
                    Return(0xf)
                }
            }
        }
        Scope(\_SB_.PSAU)
        {
            Method(_STA, 0x0, NotSerialized)
            {
                If(LOr(LOr(LEqual(\_SB_.SKUV, 0x4), LEqual(\_SB_.SKUV, 0x6)), LEqual(\_SB_.SKUV, 0x7)))
                {
                    Return(Zero)
                }
                Else
                {
                    Return(0xf)
                }
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
