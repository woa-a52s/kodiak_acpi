# Kodiak WP ACPI bindings

Disassembled IDP07280 DSDT acpi table.

***This is not from a leaked source. Every .asl file was hand-edited/"reverse-engineered". DragonBoard 410c ACPI source was used as a reference for editing kodiak ASL templates.***

Some remarks/comments in the ASL bindings may contain errors.

## Build
1. In build_acpi.bat file change the asl.exe path to yours:
```
SET ASL_EXECUTABLE=/home/arminas/Documents/kodiak_acpi_src/bin/asl.exe
```

2. To build:
```
.\build_acpi.bat -plat 7325 -var QRD
```
 - Can also be used on Linux with Wine:
 ```
 wine build_acpi.bat -plat 7325 -var QRD
 ```
