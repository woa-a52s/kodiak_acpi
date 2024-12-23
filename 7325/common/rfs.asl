//
// RemoteFS
//
Device (RFS0)
{
    Name (_DEP, Package (One)
    {
        \_SB.IPC0
    })

    Name (_HID, "QCOM0A15")
    Alias (\_SB.PSUB, _SUB)

    Method (_CRS, 0, NotSerialized) {
        Name (RBUF, ResourceTemplate ()
        {
            // RemoteFS Shared Memory
            Memory32Fixed (ReadWrite, 0x88888888, 0x99999999, _Y01)

            // RFSA MPSS Shared Memory
            Memory32Fixed (ReadWrite, 0x11111111, 0x22222222, _Y02)

            // RFSA ADSP Shared Memory
            Memory32Fixed (ReadWrite, 0x33333333, 0x44444444, _Y03)
        })

        CreateDWordField (RBUF, \_SB.RFS0._CRS._Y01._BAS, RMTA)
        CreateDWordField (RBUF, \_SB.RFS0._CRS._Y01._LEN, RMTL)
        CreateDWordField (RBUF, \_SB.RFS0._CRS._Y02._BAS, RFMA)
        CreateDWordField (RBUF, \_SB.RFS0._CRS._Y02._LEN, RFML)
        CreateDWordField (RBUF, \_SB.RFS0._CRS._Y03._BAS, RFAA)
        CreateDWordField (RBUF, \_SB.RFS0._CRS._Y03._LEN, RFAL)

        RMTA = \_SB.RMTB
        RMTL = \_SB.RMTX
        RFMA = \_SB.RFMB
        RFML = \_SB.RFMS
        RFAA = \_SB.RFAB
        RFAL = \_SB.RFAS

        Return (RBUF)
    }
}

Scope(\_SB_.RFS0) {
    Method(_STA, 0x0, NotSerialized) { Return(0xb) }
}
