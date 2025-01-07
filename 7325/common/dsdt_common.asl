//
//
//
Name(SOID, 0xffffffff)          // Holds the Chip Id
Name(STOR, 0xabcabcab)          // Holds boot options 0 = nvme, 1 = ufs
Name(SIDS, "899800000000000")   // Holds the Chip ID translated to a string
Name(SIDV, 0xffffffff)          // Holds the Chip Version as (major<<16)|(minor&0xffff)
Name(SVMJ, 0xffff)              // Holds the major Chip Version
Name(SVMI, 0xffff)              // Holds the minor Chip Version
Name(SDFE, 0xffff)              // Holds the Chip Family enum
Name(SFES, "899800000000000")   // Holds the Chip Family translated to a string
Name(SIDM, 0xfffffffff)         // Holds the Modem Support bit field
Name(SUFS, 0xffffffff)          // Holds secondary UFS enablement (1 = enabled)
Name(PUS3, 0xffffffff)          // Holds whether primary UFS has 3.0 part (1 = UFS 3.0 and newer)
Name(SUS3, 0xffffffff)          // Holds whether secondary UFS has 3.0 part (1 = UFS 3.0 and newer)
Name(SIDT, 0xffffffff)          // Holds the Chip Tier value
Name(SJTG, 0xffffffff)          // Holds the JTAG ID
Name(SOSN, 0xaaaaaaaabbbbbbbb)  // Holds the Chip Serial Number
Name(PLST, 0xffffffff)          // Holds the Device platform subtype
Name(EMUL, 0xffffffff)          // Holds the Device emulation type
Name(RMTB, 0xaaaaaaaa)          // Holds the RemoteFS shared memory base address
Name(RMTX, 0xbbbbbbbb)          // Holds the RemoteFS shared memory length
Name(RFMB, 0xcccccccc)          // Holds the RFSA MPSS shared memory base address
Name(RFMS, 0xdddddddd)          // Holds the RFSA MPSS shared memory length
Name(RFAB, 0xeeeeeeee)          // Holds the RFSA ADSP shared memory base address
Name(RFAS, 0x77777777)          // Holds the RFSA ADSP shared memory length
Name(TCMA, 0xdeadbeef)          // Holds TrEE Carveout Memory Address
Name(TCML, 0xbeefdead)          // Holds TrEE Carveout Memory Length
Name(SOSI, 0xdeadbeefffffffff)  // Holds the base address of the SoCInfo shared memory region used by ChipInfoLib
Name(PRP1, 0xffffffff)          // 0xFFFFFFFF - PCIe state unknown : 0x00000001 - PCIe root port 1 present : 0x00000000 - PCIe root port 1 not present
Name(SKUV, 0xffffffff)          // SKU Version. On IDP kodiak platforms set to 1
Name(SDDR, 0xffffffff)

//
// Storage - UFS/SD
//
Include("ufs.asl")
Include("emmc.asl")
Include("sdc.asl")

//
// ASL Bridge Device
//
Include("abd.asl")

Name(ESNL, 20) // Exsoc name limit 20 characters
Name(DBFL, 23) // buffer Length, should be ESNL+3

//
// PMIC driver
//
Include("pmic_core.asl")

//
// PMICTCC driver
//
Include("pmic_batt.asl")

Include("pmgk.asl")
Include("pep_common.asl")
Include("audio_resources.asl")
Include("graphics_preload_resources.asl")
Include("corebsp_resources.asl")
Include("wcnss_resources.asl")
Include("pcie_resources.asl")
Include("cust_touch_resources.asl")
Include("bam.asl")
Include("buses.asl")

//
// MPROC Drivers (PIL Driver and Subsystem Drivers)
//
Include("win_mproc.asl")

Include("syscache.asl")
Include("smmu.asl")
Include("graphics.asl")
Include("SCM.asl")

//
// SPMI driver
//
Include("spmi.asl")

//
// TLMM controller.
//
Include("qcgpio.asl")

//
// Inter Processor Communication Device
//
Device(IPCC)
{
    Name(_HID, "QCOM06C2")
    Name(_UID, 0)
    Alias(\_SB_.PSUB, _SUB)
    Method(_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {261}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {262}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {263}
            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, , , ) {746}
        })
        Return (RBUF)
    }
}

Include("pcie1.asl")
Include("cbsp_mproc.asl")
Include("adsprpc.asl")

//
// RemoteFS
//
Include("rfs.asl")

//
// Qualcomm IPA
Include("ipa.asl")

//
// Qualcomm DIAG Service
//
Device(QDIG)
{
    Name(_DEP, Package()
    {
        \_SB_.GLNK
    })
    Name(_HID, "QCOM0A13")
    Alias(\_SB_.PSUB, _SUB)
}

Include("ssm.asl")

//
// Clusters & cores
//
Include("Pep_lpi.asl")

//
//Qualcomm Diagnostic Consumer Interface
//
Device(QDCI)
{
    Name(_DEP, Package()
    {
        \_SB_.GLNK
    })
    Name(_HID, "QCOM0A12")
    Alias(\_SB_.PSUB, _SUB)
}

//
// QCOM GPS
//
Include("gps.asl")

// QUPV3 GPI device node and resources
//
Include("qgpi.asl")

Include("qwpp.asl")

//
// SOC Partition Interface Device
//
Device(SOCP)
{
    Name(_HID, "QCOM06DD")
    Alias(\_SB_.PSUB, _SUB)
    Alias(\_SB_.STOR, STOR)
}

// QDSS driver
Include("Qdss.asl")

Include("qcdb.asl")

//
// Data components
//
Include("data.asl")

Include("ssvc.asl")
