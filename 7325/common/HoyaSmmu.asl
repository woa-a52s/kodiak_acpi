//
// SMMU Driver
//
Device (MMU0)
{
    Name (_HID, "QCOM0A09")
    Name (_UID, Zero)
    Alias (\_SB.PSUB, _SUB)
    Alias (\_SB.SVMJ, _HRV)
    Name (_DEP, Package (One)
    {
        \_SB.PEP0
    })

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            // a-TCU register address space
            Memory32Fixed (ReadWrite, 0x15000000, 0x00100000,)

            // a-TCU: there is one interrupt for each CB handled by HLOS clients (only non-secure CBs)
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000080,} // CB 0
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000081,} // CB 1
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000082,} // CB 2
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000083,} // CB 3
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000084,} // CB 4
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000085,} // CB 5
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000086,} // CB 6
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000087,} // CB 7
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000088,} // CB 8
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000089,} // CB 9
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000008A,} // CB 10
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000008B,} // CB 11
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000008C,} // CB 12
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000008D,} // CB 13
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000008E,} // CB 14
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000008F,} // CB 15
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000090,} // CB 16
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000091,} // CB 17
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000092,} // CB 18
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000093,} // CB 19
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000094,} // CB 20
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000095,} // CB 21
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000096,} // CB 22
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000D5,} // CB 23
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000D6,} // CB 24
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000D7,} // CB 25
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000D8,} // CB 26
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000D9,} // CB 27
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000DA,} // CB 28
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000DB,} // CB 29
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000DC,} // CB 30
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000DD,} // CB 31
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000DE,} // CB 32
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000DF,} // CB 33
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000000E0,} // CB 34
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000015B,} // CB 35
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000015C,} // CB 36
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000015D,} // CB 37
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000015E,} // CB 38
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000015F,} // CB 39
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000160,} // CB 40
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000161,} // CB 41
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000162,} // CB 42
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000163,} // CB 43
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000164,} // CB 44
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000165,} // CB 45
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000166,} // CB 46
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000167,} // CB 47
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000168,} // CB 48
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000169,} // CB 49
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000016A,} // CB 50
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000016B,} // CB 51
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000016C,} // CB 52
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000016D,} // CB 53
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000016E,} // CB 54
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x0000016F,} // CB 55
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000170,} // CB 56
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000171,} // CB 57
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000172,} // CB 58
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000173,} // CB 59
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000174,} // CB 60
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000175,} // CB 61
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000176,} // CB 62
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000177,} // CB 63
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x00000178,} // CB 64
        })
    }
}

Device (MMU1)
{
    Name (_HID, "QCOM0A09")
    Name (_UID, One)
    Alias (\_SB.PSUB, _SUB)
    Alias (\_SB.SVMJ, _HRV)
    Name (_DEP, Package (One)
    {
        \_SB.PEP0
    })

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }

    Method (_CRS, 0, NotSerialized)
    {
        Return (ResourceTemplate ()
        {
            // g-TCU register address space
            Memory32Fixed (ReadWrite, 0x03DA0000, 0x00020000,)
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002C6,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002C7,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002C8,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002C9,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002CA,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002CB,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002CC,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002CD,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002CE,}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, ) {0x000002CF,}
        })
    }
}

Device (IMM0)
{
    Name (_HID, "QCOM068F")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, Zero)
}

Device (IMM1)
{
    Name (_HID, "QCOM068F")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, One)

    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}
