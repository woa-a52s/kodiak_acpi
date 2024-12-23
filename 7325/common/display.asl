//
// This file contains the ACPI Extensions for Display Adapters
//
///
// _ROM Method - Used to retrieve proprietary ROM data for primary panel
//
Method (_ROM, 3, NotSerialized)
{

    // Include primary panel specific ROM data
    Include("panelcfg.asl")

    //======================================================================================
    //  Based on the panel Id(Arg2), store the buffer object into Local2
    //
    //  IMPORTANT:
    //       PCFG is buffer name for all default panel configurations
    //       All other dynamically detected panel configurations must not use this name
    //======================================================================================
    Switch (  ToInteger (Arg2) )
    {
        // Truly WQHD Dual DSI Command Mode
        Case (0x006F00) {
            Store (PCFG, Local2)
        }
        // All others
        Default {
            Store (PCFG, Local2)
        }
    }

    // Ensure offset does not exceed the buffer size
    // otherwise return a Null terminated buffer
    If (LGreaterEqual(Arg0, Sizeof(Local2)))
    {
        Return( Buffer(){0x0} )
    }
    Else
    {
        // Make a local copy of the offset
        Store(Arg0, Local0)
    }

    // Ensure the size requested is less than 4k
    If (LGreater(Arg1, 0x1000))
    {
        Store(0x1000, Local1)
    }
    else
    {
        Store(Arg1, Local1)
    }

    // Finaly ensure the total size does not exceed the size of the buffer
    if (LGreater(Add(Local0, Local1), Sizeof(Local2)))
    {
        // Calculate the maximum size we can return
        Subtract(Sizeof(Local2), Local0, Local1);
    }

    // Multiply offset and size by 8 to convert to bytes and create the RBuf
    CreateField(Local2, Multiply(0x8, Local0), Multiply(0x8, Local1), RBUF)

    Return(RBUF)
}

//
// PGRT - panel gamma response table
//
//   This method returns the Gamma response table for a panel.
//   The table is given in 2 arrays, one representing the x axis or grayscale and other
//   representing the y axis or luminance.
//
//   The table is given in a 256 entries array, where the first entry value represents
//   the luminance (Y) achieved when displaying black on the screen (shade value is 0
//   for all R, G and B) and the last entry represents the luminance (Y) achieved when
//   displaying white on the screen (shade value is 255 for all R, G and B).
//
//   The array must be 256 entries.
//
//   The range of each entry must be from 0 to 0xffff
//
//   Values are least significant byte first. E.g. {0x01, 0x00} represents 0x1 and
//   {0x02, 0x01} represents 0x0102
//
// +--- 2 bytes ---+--- 2 bytes ---+--- 2 bytes ---+-----------+--- 2 bytes ---+
// |     Y[0]      |     Y[1]      |     Y[2]      |    ...    |     Y[255]    |
// +---------------+---------------+---------------+-----------+---------------+
Method (PGRT, 2, NotSerialized) {
    // Arg0 - Panel ID

    // Arg1 - Data size

    // Based on the panel Id read the GRT buffer and return the data

    // If nothing specified return NULL

    Name (RBUF, Buffer (One) {0x00})

    // Return the packet data
    Return (RBUF)
}


//
// PBRT - panel backlight response table
//
//   This method returns the Backlight response table for a panel.
//   The table is given in a 256 entries array, where the first entry value represents
//   the backlight level (BL) to achieve 0 luminance and the last entry represents
//   the highest backlight level to achieve the maximum desired luminance.
//   In other words, this array serves as a map from luminance to backlight levels,
//   where the index is the desired luminance level and the value (or output) is
//   the backlight level to be sent to the hardware (backlight controller).
//
//   The array must be 256 entries.
//
//   The range of each entry must be from 0 to 0xffff
//
//   Values are least significant byte first. E.g. {0x01, 0x00} represents 0x1 and
//   {0x02, 0x01} represents 0x0102
//
// +--- 2 bytes ---+--- 2 bytes ---+--- 2 bytes ---+-----------+--- 2 bytes ---+
// |    BL[0]      |    BL[1]      |    BL[2]      |    ...    |    BL[255]    |
// +---------------+---------------+---------------+-----------+---------------+
Method (PBRT, 2, NotSerialized) {
    // Arg0 - Panel ID

    // Arg1 - Data size

    // Based on the panel Id read the BRT buffer and return the data

    // If nothing specified return NULL

    Name (RBUF, Buffer (One) {0x00})

    // Return the packet data
    Return (RBUF)
}
