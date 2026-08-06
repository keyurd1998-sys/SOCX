# Scan Compression Analysis Stage

This stage studies how much the scan chain structure can be compressed. Compression helps reduce the number of scan pins required and can make test access more efficient.

## Purpose

Scan compression is useful when a design has many scan chains and a limited number of external test pins. The analysis stage evaluates possible compression ratios and creates reports that guide later implementation.

## Key script

The main script is [scan.tcl](scan.tcl).

## How to run

### Interactive mode

```bash
cd DFT/4_SCAN_COMPRESSION_ANALYSIS
genus
```

Inside Genus:

```tcl
genus@root:> source scan.tcl
```

### Batch mode

```bash
genus -files scan.tcl
```

## Important Tcl concepts

### Analyze compressibility

```tcl
analyze_scan_compressibility \
    -ratios {60 80 100 120 150 200} \
    -compressor xor \
    -compression_method compress_scan_chains \
    -library $VERILOG_LIB \
    -directory $COMP_DIR
```

This evaluates several compression ratios to understand the trade-off between test-access efficiency and implementation complexity.

### Produce a report

```tcl
report_scan_compressibility -directory $COMP_DIR > $COMP_REPORT_DIR/${DESIGN_NAME}_scan_compressibility.rpt
```

This file is the main artifact of the analysis stage. It tells you which compression options are feasible and useful.

## Expected outputs

- compression analysis folder
- compression report file
- scan-related analysis data

## Learning note

Compression analysis is often used in advanced test architectures. It shows how a design can be made more test-efficient without sacrificing fault coverage too much.
