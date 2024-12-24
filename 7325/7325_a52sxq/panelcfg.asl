Name (PCFG,
Buffer() {"<?xml version='1.0' encoding='utf-8'?>
<PanelName>AMS646YD01</PanelName>
<PanelDescription>LSI Single DSI Command Mode Panel (1080x2400 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0xE430</ManufactureID>
    <ProductCode>0x3416</ProductCode>
    <SerialNumber>0x000000</SerialNumber>
    <WeekofManufacture>0x09</WeekofManufacture>
    <YearofManufacture>0x13</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x3c</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x6a</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
    </Group>
<Group id='Active Timing'>
    <HorizontalActive>1080</HorizontalActive>
    <HorizontalFrontPorch>84</HorizontalFrontPorch>
    <HorizontalBackPorch>88</HorizontalBackPorch>
    <HorizontalSyncPulse>80</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>2400</VerticalActive>
    <VerticalFrontPorch>15</VerticalFrontPorch>
    <VerticalBackPorch>2</VerticalBackPorch>
    <VerticalSyncPulse>2</VerticalSyncPulse>
    <VerticalSyncSkew>0</VerticalSyncSkew>
    <VerticalTopBorder>0</VerticalTopBorder>
    <VerticalBottomBorder>0</VerticalBottomBorder>
    <InvertDataPolarity>False</InvertDataPolarity>
    <InvertVsyncPolairty>False</InvertVsyncPolairty>
    <InvertHsyncPolarity>False</InvertHsyncPolarity>
    <BorderColor>0x0</BorderColor>
</Group>
<Group id='Display Interface'>
    <InterfaceType>9</InterfaceType>
    <InterfaceColorFormat>3</InterfaceColorFormat>
</Group>
<Group id='DSI Interface'>
    <DSIChannelId>2</DSIChannelId>
    <DSIVirtualId>0</DSIVirtualId>
    <DSIColorFormat>36</DSIColorFormat>
    <DSITrafficMode>2</DSITrafficMode>
    <DSILanes>4</DSILanes>
    <DSIRefreshRate>0x780000</DSIRefreshRate>
    <DSIBitClockFrequency>1108000000</DSIBitClockFrequency>
    <DSICmdSwapInterface>False</DSICmdSwapInterface>
    <DSICmdUsingTrigger>False</DSICmdUsingTrigger>
    <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh>
    <DSIAutoRefreshFrameNumDiv>2</DSIAutoRefreshFrameNumDiv>
    <DSITECheckEnable>True</DSITECheckEnable>
    <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
    <DSITEvSyncStartPos>2400</DSITEvSyncStartPos>
    <DSITEvSyncInitVal>2400</DSITEvSyncInitVal>
    <DSIDSCEnable>True</DSIDSCEnable>
    <DSIDSCMajor>1</DSIDSCMajor>
    <DSIDSCMinor>1</DSIDSCMinor>
    <DSIDSCProfileID>4</DSIDSCProfileID>
    <DSIDSCSliceWidth>540</DSIDSCSliceWidth>
    <DSIDSCSliceHeight>40</DSIDSCSliceHeight>
    <DSILP11AtInit>True</DSILP11AtInit>
    <DSIControllerMapping>
        00
    </DSIControllerMapping>
    <DSITimingCLKZeroOverride>True</DSITimingCLKZeroOverride>
    <DSITimingCLKPrepareOverride>True</DSITimingCLKPrepareOverride>
    <DSITimingCLKTrailOverride>True</DSITimingCLKTrailOverride>
    <DSITimingHSExitOverride>True</DSITimingHSExitOverride>
    <DSITimingHSZeroOverride>True</DSITimingHSZeroOverride>
    <DSITimingHSPrepareOverride>True</DSITimingHSPrepareOverride>
    <DSITimingHSTrailOverride>True</DSITimingHSTrailOverride>
    <DSITimingHSRequestOverride>True</DSITimingHSRequestOverride>
    <DSITimingTASureOverride>True</DSITimingTASureOverride>
    <DSITimingTAGoOverride>True</DSITimingTAGoOverride>
    <DSITimingTAGetOverride>True</DSITimingTAGetOverride>
    <DSITimingCLKZeroValue>0x25</DSITimingCLKZeroValue>
    <DSITimingCLKPrepareValue>0x0A</DSITimingCLKPrepareValue>
    <DSITimingCLKTrailValue>0x0A</DSITimingCLKTrailValue>
    <DSITimingHSExitValue>0x27</DSITimingHSExitValue>
    <DSITimingHSZeroValue>0x24</DSITimingHSZeroValue>
    <DSITimingHSPrepareValue>0x0A</DSITimingHSPrepareValue>
    <DSITimingHSTrailValue>0x0A</DSITimingHSTrailValue>
    <DSITimingHSRequestValue>0xA</DSITimingHSRequestValue>
    <DSITimingTASureValue>0x02</DSITimingTASureValue>
    <DSITimingTAGoValue>0x02</DSITimingTAGoValue>
    <DSITimingTAGetValue>0x04</DSITimingTAGetValue>
    <DSITimingCLKPreOverride>True</DSITimingCLKPreOverride>
    <DSITimingCLKPostOverride>True</DSITimingCLKPostOverride>
    <DSITimingCLKPreValue>0x20</DSITimingCLKPreValue>
    <DSITimingCLKPostValue>0xF</DSITimingCLKPostValue>
</Group>
<DSIInitSequence>05 11 00
    FF 0A
    29 F0 5A 5A
    29 F2 00 05 0E 58 54 01 0C 00 04 26 E4 2F B0 0C 09 74 26 E4 0C 00 04 10 00 10 26 A8 10 00 10 10 3C 10 00 40 30 C8 00 C8 00 00 CE
    29 35 00
    29 2A 00 00 04 37
    29 2B 00 00 09 5F
    29 FC 5A 5A
    29 B0 00 2A C5
    29 C5 0D 10 80 45
    29 B0 00 2E C5
    29 C5 53 C7
    29 FC A5 A5
    29 E5 15
    29 ED 44 4C 20
    29 B0 00 04 F2
    29 F2 54
    29 CD 5C 51
    07 01
    0A 11 00 00 89 30 80 09 60 04 38 00 28 02 1C 02 1C 02 00 02 0E 00 20 03 DD 00 07 00 0C 02 77 02 8B 18 00 10 F0 03 0C 20 00 06 0B 0B 33 0E 1C 2A 38 46 54 62 69 70 77 79 7B 7D 7E 01 02 01 00 09 40 09 BE 19 FC 19 FA 19 F8 1A 38 1A 78 1A B6 2A F6 2B 34 2B 74 3B 74 6B F4 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    29 B0 00 27 F2
    29 F2 00
    29 B0 00 2E F2
    29 F2 55
    29 60 08 00
    29 B0 00 28 68
    29 68 02
    29 B0 00 02 90
    29 90 1C
    29 53 20
    29 51 03 FF
    29 F7 0F
    29 F0 A5 A5
    FF 6E
    FE 00 00 00
    29 29 00
</DSIInitSequence>
<DSITermSequence> 05 28 00
    FF 14
    05 10 00
    FF 78
</DSITermSequence>
<Group id='Backlight Configuration'>
    <BacklightSteps>100</BacklightSteps>
    <BacklightType>3</BacklightType>
</Group>"})
