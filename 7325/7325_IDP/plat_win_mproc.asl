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

    Method (_STA)
    {
        Return (0xF)
    }

    Method (_SUB)
    {
        Return (\_SB.PSUB)
    }
}

Scope (\_SB.PILC) {

    Method (_SUB)
    {
        Return (\_SB.PSUB)
    }
}

Scope (\_SB.ADSP) {

    Method (_SUB)
    {
        Return (\_SB.PSUB)
    }
}
