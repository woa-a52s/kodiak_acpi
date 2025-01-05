//
// SMMU Driver
//

Device (MMU0)
{
    Name (_HID, "QCOM0A09")
    Name (_UID, 0)
    Alias (\_SB.PSUB, _SUB)
    Alias (\_SB.SVMJ, _HRV)
    Name (_DEP, Package ()
    {
        \_SB.PEP0
    })

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            // a-TCU register address space
            Memory32Fixed (ReadWrite, 0x15000000, 0x100000)

            // a-TCU: there is one interrupt for each CB handled by HLOS clients (only non-secure CBs)
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {128} // CB 0
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {129} // CB 1
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {130} // CB 2
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {131} // CB 3
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {132} // CB 4
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {133} // CB 5
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {134} // CB 6
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {135} // CB 7
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {136} // CB 8
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {137} // CB 9
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {138} // CB 10
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {139} // CB 11
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {140} // CB 12
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {141} // CB 13
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {142} // CB 14
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {143} // CB 15
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {144} // CB 16
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {145} // CB 17
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {146} // CB 18
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {147} // CB 19
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {148} // CB 20
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {149} // CB 21
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {150} // CB 22
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {213} // CB 23
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {214} // CB 24
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {215} // CB 25
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {216} // CB 26
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {217} // CB 27
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {218} // CB 28
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {219} // CB 29
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {220} // CB 30
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {221} // CB 31
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {222} // CB 32
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {223} // CB 33
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {224} // CB 34
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {347} // CB 35
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {348} // CB 36
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {349} // CB 37
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {350} // CB 38
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {351} // CB 39
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {352} // CB 40
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {353} // CB 41
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {354} // CB 42
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {355} // CB 43
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {356} // CB 44
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {357} // CB 45
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {358} // CB 46
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {359} // CB 47
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {360} // CB 48
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {361} // CB 49
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {362} // CB 50
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {363} // CB 51
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {364} // CB 52
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {365} // CB 53
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {366} // CB 54
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {367} // CB 55
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {368} // CB 56
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {369} // CB 57
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {370} // CB 58
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {371} // CB 59
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {372} // CB 60
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {373} // CB 61
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {374} // CB 62
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {375} // CB 63
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {376} // CB 64
        })
    }
}

Device (MMU1)
{
    Name (_HID, "QCOM0A09")
    Name (_UID, 1)
    Alias (\_SB.PSUB, _SUB)
    Alias (\_SB.SVMJ, _HRV)
    Name (_DEP, Package ()
    {
        \_SB.PEP0
    })

    Method (_STA)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            // g-TCU register address space
            Memory32Fixed (ReadWrite, 0x03DA0000, 0x00020000,)
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {710} // CB 0
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {711} // CB 1
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {712} // CB 2
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {713} // CB 3
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {714} // CB 4
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {715} // CB 5
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {716} // CB 6
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {717} // CB 7
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {718} // CB 8
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {719} // CB 9
        })
    }
}

Device (IMM0)
{
    Name (_HID, "QCOM068F")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
}

Device (IMM1)
{
    Name (_HID, "QCOM068F")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 1)

    Method (_STA)
    {
        Return (0x0F)
    }
}
