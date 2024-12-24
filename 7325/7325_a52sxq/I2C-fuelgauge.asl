        Device (I2C4)
        {
            Name (_HID, "QCOM0A10")
            Alias(\_SB.PSUB, _SUB)
            Name (_UID, 0x04)
            Name (_DEP, Package()
            {
                \_SB_.PEP0,
                \_SB_.QGP1,
                \_SB_.MMU0
            })
            Name (_CCA, Zero)
            Name (_STR, Unicode ("QUP_0_SE_3"))
            Method (_CRS, 0x0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0098c000,
                        0x00004000
                        )
                    Interrupt(ResourceConsumer, Level, ActiveHigh, Exclusive, , , )
                    {
                        0x27c // i2c node "interrupts = <0x00 0x25c 0x04>;" 0x25c + 0x20 = 0x27c
                    }
                })
                Return (RBUF)
            }
        }
