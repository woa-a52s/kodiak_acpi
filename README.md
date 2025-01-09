# KodiakWP ACPI bindings

Reverse-engineered and disassembled IDP07280 ACPI tables.

The following project files are not the original Qualcomm sc7280 platform source.
DSDT table has been manually disassembled and modified. Other SoC tables (including DSDT) were modified using DragonBoard 410c ACPI source (including other publicly available sources).

## Directory structure

- 7325/common directory contains shared ACPI across multiple sc7280 variants.
- 7325/7325_IDP directory contains board-specific bindings for IDP sc7280 hardware platform.
- 7325/Devices directory contains devices using SD 778G SoC and share DSDT bindings from 7325_IDP and common directories

## Build
1. In build_acpi.bat file change the asl.exe path to yours:
```
SET ASL_EXECUTABLE=/home/arminas/Documents/kodiak_acpi/bin/asl.exe
```

2. To build DSDT only:
```
.\build_acpi.bat -p 7325 -d qrd7325
```

3. To only build AeoB files:
```
.\build_acpi.bat -p 7325 -d qrd7325 -aeob
```

4. To build ACPI tables (DSDT and other SoC tables):
```
.\build_acpi.bat -p 7325 -d qrd7325 -acpi
```

5. To build everything (DSDT, AeoB, SoC ACPI):
```
.\build_acpi.bat -p 7325 -d qrd7325 -all
```

 - This project can also be built on Linux OS using Wine. Just pass the `wine` command before `build_acpi.bat`:
 ```
 wine build_acpi.bat -p 7325 -d qrd7325
 ```
