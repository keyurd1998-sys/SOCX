# Scan Compression Logic Insertion Stage

This stage takes the scan architecture and inserts the actual compression logic. The purpose is to make the scan chain more compact and reduce the number of test pins needed for ATPG.

## Purpose

Unlike the previous analysis stage, this step implements the compression strategy. It creates the scan compression structure and writes the ATPG setup so the design can be tested in a compressed way.

## Key script

The main script is [scan.tcl](scan.tcl).

## How to run

### Interactive mode

```bash
cd DFT/5_INSERT_SCAN_COMPRESSION_LOGIC
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

### Create scan compression structure

```tcl
compress_scan_chains \
    -ratio 100 \
    -compressor xor \
    -decompressor xor \
    -mask wide1 \
    -auto_create
```

This inserts the compression logic needed to reduce scan test data volume.

### Generate ATPG configuration

```tcl
write_dft_atpg -compression -library $VERILOG_LIB -directory $ATPG_DIR -generate_config_file [current_design]
```

This command creates the ATPG data needed by Modus.

### Run Modus ATPG

```tcl
exec modus -files $ATPG_DIR/runmodus.atpg.tcl
```

This launches ATPG generation for the compressed scan architecture.

## Expected outputs

- compressed scan-inserted netlist
- ATPG scripts and configuration files
- scan chain and setup reports

## Learning note

This is where the analysis results become a real implementation step. The design now includes the extra logic needed to support compressed test access.
