Name (PCFG,
    Buffer() {"<?xml version='1.0' encoding='utf-8'?>
<PanelName>R66451 Visionox</PanelName>
<PanelDescription>R66451 Visionox Single DSI DSC Command Mode Amoled Panel (1440x2560 24bpp)</PanelDescription>
<Group id='EDID Configuration'>
    <ManufactureID>0x104D</ManufactureID>
    <ProductCode>7280</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1B</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>3</EDIDRevision>
    <VideoInputDefinition>0x80</VideoInputDefinition>
    <HorizontalScreenSize>0x07</HorizontalScreenSize>
    <VerticalScreenSize>0x0C</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xA5</Red.GreenBits>
    <Blue.WhiteBits>0x58</Blue.WhiteBits>
    <RedX>0xA6</RedX>
    <RedY>0x54</RedY>
    <GreenX>0x33</GreenX>
    <GreenY>0xB3</GreenY>
    <BlueX>0x26</BlueX>
    <BlueY>0x12</BlueY>
    <WhiteX>0x4F</WhiteX>
    <WhiteY>0x54</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x44</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x93</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>1080</HorizontalActive>
    <HorizontalFrontPorch>96</HorizontalFrontPorch>
    <HorizontalBackPorch>40</HorizontalBackPorch>
    <HorizontalSyncPulse>32</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>2340</VerticalActive>
    <VerticalFrontPorch>25</VerticalFrontPorch>
    <VerticalBackPorch>4</VerticalBackPorch>
    <VerticalSyncPulse>1</VerticalSyncPulse>
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
    <DSITrafficMode>1</DSITrafficMode>
    <DSICPhyMode>True</DSICPhyMode>
    <DSICmdSwapInterface>False</DSICmdSwapInterface>
    <DSITECheckEnable>True</DSITECheckEnable>
    <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
    <DSITEvSyncStartPos>2340</DSITEvSyncStartPos>
    <DSITEvSyncInitVal>2340</DSITEvSyncInitVal>
    <DSIDSCEnable>False</DSIDSCEnable>
    <DSIDSCMajorVersion>1</DSIDSCMajorVersion>
    <DSIDSCMinorVersion>1</DSIDSCMinorVersion>
    <DSIDSCScrVersion>0</DSIDSCScrVersion>
    <DSIDSCProfileID>4</DSIDSCProfileID>
    <DSIDSCSliceWidth>540</DSIDSCSliceWidth>
    <DSIDSCSliceHeight>20</DSIDSCSliceHeight>
    <DSIDSCSlicePerPacket>2</DSIDSCSlicePerPacket>
    <DSILanes>4</DSILanes>
      <DSIHsaHseAfterVsVe>False</DSIHsaHseAfterVsVe>
      <DSILowPowerModeInHFP>False</DSILowPowerModeInHFP>
      <DSILowPowerModeInHBP>False</DSILowPowerModeInHBP>
      <DSILowPowerModeInHSA>False</DSILowPowerModeInHSA>
      <DSILowPowerModeInBLLPEOF>True</DSILowPowerModeInBLLPEOF>
      <DSILowPowerModeInBLLP>True</DSILowPowerModeInBLLP>
      <DSIRefreshRate>0x3C0000</DSIRefreshRate>
    <DSICmdUsingTrigger>False</DSICmdUsingTrigger>
    <DSIInitMasterTime>128</DSIInitMasterTime>
    <DSIControllerMapping>
      00
    </DSIControllerMapping>
</Group>
<DSIInitSequence>
     39 b0 00
     39 eb 00 00
     39 f7 00
     39 b0 00
     39 d8 00 00 00 00 00 00 00 00 00 5b 00 5b 00 5b 00 5b 00 5b
     39 b0 80
     39 e6 00
     39 b0 00
     39 b6 6c 00 06 23 af
     39 b4 20
     39 cf 64 0b 00 00 00 00 00 00 08 00 0b 77 01 01 01 01 01 01 04 04 04 04 04 05
     39 b0 04
     39 f7 01
     39 df 50 40
     39 f3 50 00 00 00 00
     39 f2 11
     39 f3 01 00 00 00 01
     39 f4 00 02
     39 f2 19
     39 df 50 42
     39 35 00
     39 2a 00 00 04 37
     39 2b 00 00 09 23
     05 11
     ff 78
     05 29
</DSIInitSequence>
<DSITermSequence>
     05 28
     ff 14
     05 10
     ff 78
</DSITermSequence>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL_RESET, 0, 30</Display1Reset1Info>
</Group>
<Group id='Backlight Configuration'>
    <BacklightType>3</BacklightType>
    <BacklightBitWidth>12</BacklightBitWidth>
</Group>"})
