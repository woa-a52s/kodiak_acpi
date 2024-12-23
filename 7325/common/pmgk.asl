Device (PMGK)
{
    Name (_HID, "QCOM0A8E")
    Alias (\_SB.PSUB, _SUB)
    Name (_DEP, Package (0x02)
    {
        \_SB.GLNK,
        \_SB.ABD
    })
    Name (LKUP, Zero)
    Method (GEPT, 0, NotSerialized)
    {
        Name (BUFF, Buffer (0x04){})
        CreateByteField (BUFF, Zero, STAT)
        CreateWordField (BUFF, 0x02, DATA)
        Store(0x3, DATA)
        Return(DATA)
    }

    Name (BUFF, Buffer (0x32){})
    CreateField (BUFF, Zero, 0x08, BSTA)
    CreateField (BUFF, 0x08, 0x08, BSIZ)
    CreateField (BUFF, 0x10, 0x10, BVER)
    CreateField (BUFF, 0x30, 0x20, BCCI)
    CreateField (BUFF, 0x50, 0x40, BCTL)
    CreateField (BUFF, 0x90, 0x80, BMGI)
    CreateField (BUFF, 0x0110, 0x80, BMGO)
    Method (USBN, 1, NotSerialized)
    {
        Store(UCSI, BUFF)
        Store(BVER, \_SB_.UCSI.VERS)
        Store(BMGI, \_SB_.UCSI.MSGI)
        Store(BCCI, \_SB_.UCSI.CCI_)
        Notify(\_SB_.UCSI, Arg0)
        Return(Zero)
    }

    Method (UPAN, 1, NotSerialized)
    {
        Name (VNTF, 0xFFFFFFFF)
        Name (VPRT, 0x04)
        Name (VMUX, Zero)
        Name (VCCS, 0x02)
        Name (VDPP, Zero)
        Name (VHPD, Zero)
        Name (VHSF, 0x02)
        Name (VHIQ, Zero)
        Name (BCCX, Zero)
        Name (BDIX, Zero)
        Store(Arg0, VNTF)
        And(VNTF, 0xff, VPRT)
        ShiftRight(VNTF, 0x8, VNTF)
        And(VNTF, 0xff, VCCS)
        ShiftRight(VNTF, 0x8, VNTF)
        And(VNTF, 0xff, VMUX)
        While(One)
        {
            Name(_T_0, Zero)
            Store(VMUX, _T_0)
            If(LEqual(_T_0, Zero))
            {
                Store(Zero, VHSF)
                Break
            }
            Else
            {
                If(LEqual(_T_0, One))
                {
                    Store(Zero, VHSF)
                    Break
                }
                Else
                {
                    If(LEqual(_T_0, 0x2))
                    {
                        Store(One, VHSF)
                        Break
                    }
                    Else
                    {
                        If(LEqual(_T_0, 0x3))
                        {
                            Store(Zero, VHSF)
                            Break
                        }
                    }
                }
            }
            Break
        }

        ShiftRight(VNTF, 0x8, VNTF)
        And(VNTF, 0x80, VHIQ)
        If(LEqual(VHIQ, Zero))
        {
            Store(Zero, VHIQ)
        }
        Else
        {
            Store(One, VHIQ)
        }
        And(VNTF, 0x40, VHPD)
        If(LEqual(VHPD, Zero))
        {
            Store(Zero, VHPD)
        }
        Else
        {
            Store(One, VHPD)
        }
        And(VNTF, 0x3f, VDPP)
        If(LEqual(VDPP, Zero))
        {
            Store(Zero, VDPP)
        }
        Else
        {
            If(LEqual(VCCS, One))
            {
                Add(VDPP, 0x6, VDPP)
            }
        }

        Store(VCCS, BCCX)
        ShiftLeft(VMUX, 0x2, VMUX)
        Or(VMUX, BCCX, BCCX)
        ShiftLeft(VHSF, 0x4, VHSF)
        Or(VHSF, BCCX, BCCX)
        Store(VDPP, BDIX)
        ShiftLeft(VHPD, 0x4, VHPD)
        Or(VHPD, BDIX, BDIX)
        ShiftLeft(VHIQ, 0x5, VHIQ)
        Or(VHIQ, BDIX, BDIX)
        Store(0x2, \_SB_.UCS0.EINF)
        While (One)
        {
            Name(_T_1, Zero)
            Store(VPRT, _T_1)
            If(LEqual(_T_1, Zero))
            {
                Or(One, \_SB_.UCS0.EUPD, \_SB_.UCS0.EUPD)
                Store(BCCX, \_SB_.UCS0.ECC0)
                Store(BDIX, \_SB_.UCS0.EDI0)
                \_SB_.UCS0.USBR
                Break
            }
            Else
            {
                If(LEqual(_T_1, One))
                {
                    Or(0x2, \_SB_.UCS0.EUPD, \_SB_.UCS0.EUPD)
                    Store(BCCX, \_SB_.UCS0.ECC1)
                    Store(BDIX, \_SB_.UCS0.EDI1)
                    \_SB_.UCS0.USBR
                    Break
                }
            }
            Break
        }

        Return (Zero)
    }

    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
    {
        Name (RBUF, Buffer (0x02)
        {
                0x79, 0x00                                       // y.
        })
        Return (RBUF) /* \_SB_.PMGK._CRS.RBUF */
    }

    Method (LKST, 1, NotSerialized)
    {
        Store(Arg0, LKUP)
        Notify (\_SB.UCSI, Zero) // Bus Check
        Return (Zero)
    }

    Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
    {
        Connection (
            I2cSerialBus (0x0003, ControllerInitiated, 0x00000000, AddressingMode7Bit, "\\_SB.ABD", 0x00, ResourceConsumer, ,)
        ),
        AccessAs (BufferAcc, AttribRawBytes (0x30)),
        UCSI,   384
    }
}
