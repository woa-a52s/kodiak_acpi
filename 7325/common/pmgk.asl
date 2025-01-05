//
// PMGK device
//

Device (PMGK)
{
    Name (_HID, "QCOM0A8E")
    Alias (\_SB.PSUB, _SUB)

    Name (_DEP, Package()
    {
        \_SB.GLNK,
        \_SB.ABD
    })

    Name (LKUP, 0)
    Method (GEPT, 0, NotSerialized) {
        Name (BUFF, Buffer (0x04){})
        CreateByteField (BUFF, 0, STAT)
        CreateWordField (BUFF, 0x02, DATA)
        Store(0x3, DATA)
        Return(DATA)
    }

    Name (BUFF, Buffer (0x32){})
    CreateField (BUFF, 0, 0x08, BSTA)
    CreateField (BUFF, 0x08, 0x08, BSIZ)
    CreateField (BUFF, 0x10, 0x10, BVER)
    CreateField (BUFF, 0x30, 0x20, BCCI)
    CreateField (BUFF, 0x50, 0x40, BCTL)
    CreateField (BUFF, 0x90, 0x80, BMGI)
    CreateField (BUFF, 0x0110, 0x80, BMGO)

    Method (USBN, 1, NotSerialized) {
        Store(UCSI, BUFF)
        Store(BVER, \_SB_.UCSI.VERS)
        Store(BMGI, \_SB_.UCSI.MSGI)
        Store(BCCI, \_SB_.UCSI.CCI_)
        Notify(\_SB_.UCSI, Arg0)
        Return(0)
    }

    Method (UPAN, 1, NotSerialized) {
        Name (VNTF, 0xFFFFFFFF)
        Name (VPRT, 0x04)
        Name (VMUX, 0)
        Name (VCCS, 0x02)
        Name (VDPP, 0)
        Name (VHPD, 0)
        Name (VHSF, 0x02)
        Name (VHIQ, 0)
        Name (BCCX, 0)
        Name (BDIX, 0)
        Store(Arg0, VNTF)
        And(VNTF, 0xff, VPRT)
        ShiftRight(VNTF, 0x8, VNTF)
        And(VNTF, 0xff, VCCS)
        ShiftRight(VNTF, 0x8, VNTF)
        And(VNTF, 0xff, VMUX)
        While(0x1) {
            Name(_T_0, 0)
            Store(VMUX, _T_0)
            If(LEqual(_T_0, 0)) {
                Store(0, VHSF)
                Break
            }
            Else {
                If(LEqual(_T_0, 0x1)) {
                    Store(0, VHSF)
                    Break
                }
                Else {
                    If(LEqual(_T_0, 0x2)) {
                        Store(0x1, VHSF)
                        Break
                    }
                    Else {
                        If(LEqual(_T_0, 0x3))
                        {
                            Store(0, VHSF)
                            Break
                        }
                    }
                }
            }
            Break
        }

        ShiftRight(VNTF, 0x8, VNTF)
        And(VNTF, 0x80, VHIQ)
        If(LEqual(VHIQ, 0)) {
            Store(0, VHIQ)
        }
        Else {
            Store(0x1, VHIQ)
        }
        And(VNTF, 0x40, VHPD)
        If(LEqual(VHPD, 0)) {
            Store(0, VHPD)
        }
        Else {
            Store(0x1, VHPD)
        }
        And(VNTF, 0x3f, VDPP)
        If(LEqual(VDPP, 0)) {
            Store(0, VDPP)
        }
        Else {
            If(LEqual(VCCS, 0x1))
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
        While (0x1) {
            Name(_T_1, 0)
            Store(VPRT, _T_1)
            If(LEqual(_T_1, 0)) {
                Or(0x1, \_SB_.UCS0.EUPD, \_SB_.UCS0.EUPD)
                Store(BCCX, \_SB_.UCS0.ECC0)
                Store(BDIX, \_SB_.UCS0.EDI0)
                \_SB_.UCS0.USBR
                Break
            }
            Else {
                If(LEqual(_T_1, 0x1))
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

        Return (0)
    }

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, Buffer ()
        {
            0x79, 0x00
        })
        Return (RBUF)
    }

    Method (LKST, 1, NotSerialized) {
        Store(Arg0, LKUP)
        Notify (\_SB.UCSI, 0)
        Return (0)
    }

    Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve) {
        Connection (
            I2cSerialBus (3, ControllerInitiated, 0, AddressingMode7Bit, "\\_SB.ABD", 0, ResourceConsumer, , )
        ),
        AccessAs (BufferAcc, AttribRawBytes (0x30)),
        UCSI,384
    }
}
