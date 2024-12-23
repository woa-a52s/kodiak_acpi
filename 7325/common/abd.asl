//
// This file contains ASL Bridge Device definitions
//

//
// ASL Bridge Device
//
Device (ABD)
{
    Name (_DEP, Package (0x1)
    {
        \_SB.PEP0
    })
    Name (_HID, "QCOM0427")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
    OperationRegion (ROP1, GenericSerialBus, Zero, 0x0100)
    Name (AVBL, Zero)
    Method (_REG, 0x2, NotSerialized)
    {
        If ((Arg0 == 0x09))
        {
            AVBL = Arg1
        }
    }
}
