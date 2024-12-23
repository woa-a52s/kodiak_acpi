//
// Platform specific data
//

Scope (\_SB.ADSP) {}
Scope (\_SB.AMSS) {}
Scope (\_SB.PILC) {}
Scope (\_SB.CDI) {}
Scope (\_SB.RPEN) {}

Scope (\_SB.NSP0)
{
    Name (_CID, "QCOMFFE8")
}

Scope (\_SB.AMSS) {

    Method (_STA, 0, NotSerialized) {
        If ((SKUV == 0x04)) {
            Return (Zero)
        }
        Else {
            Return (0x0F)
        }
    }

    Method (_SUB, 0, NotSerialized) {
        Return (\_SB.PSUB)
    }
}

Scope (\_SB.PILC) {
    Method (_SUB, 0, NotSerialized) {
        If ((SKUV == 0x04)) {
            Return ("IDPA7280")
        }
        Else {
            Return (\_SB.PSUB)
        }
    }
}

Scope (\_SB.ADSP) {
    Method (_SUB, 0, NotSerialized) {
        If ((SKUV == 0x05)) {
            Return ("IWSA7280")
        }
        Else {
            Return (\_SB.PSUB)
        }
    }
}
