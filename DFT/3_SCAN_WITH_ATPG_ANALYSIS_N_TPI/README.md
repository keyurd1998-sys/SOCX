# ATPG Analysis and Test Point Insertion Stage

This stage builds on scan insertion by analyzing testability and inserting test points where needed. The goal is to improve the ability of ATPG tools to detect faults.

## Purpose

Some internal nodes are difficult for ATPG to observe or control. Test points help the tool reach those nodes more effectively. In this flow, the script analyzes testability, generates deterministic test-point scripts, and inserts the chosen test points.

## Key script

The main script is [scan.tcl](scan.tcl).

## How to run

### Interactive mode

```bash
cd DFT/3_SCAN_WITH_ATPG_ANALYSIS_N_TPI
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

### ATPG analysis

```tcl
analyze_atpg_testability -directory $TP_DIR -library $VERILOG_LIB [current_design]
```

This command evaluates how testable the design is. It identifies areas where ATPG may struggle.

### Generate deterministic test-point scripts

```tcl
write_dft_deterministic_test_points -library $VERILOG_LIB
```

The tool writes scripts and files that describe the recommended test points.

### Insert the test points

```tcl
add_analyzed_test_points -input_test_point_file ./test_scripts/${DESIGN_NAME}.dfa.tpfile
```

This step modifies the design so the selected test points are actually present in the netlist.

### Run Modus analysis

```tcl
exec modus -files ./test_scripts/runmodus.dfa.tcl
```

This launches ATPG analysis from the command line. The result is used to improve the testability of the design.

## Expected outputs

- test-point analysis files in the test scripts folder
- ATPG-related output in the generated ATPG folder
- updated scan-ready netlist with inserted test points

## Learning note

This stage teaches an important practical lesson: ATPG is not only about inserting scan chains. It is also about making the design easier to test by improving observability and controllability.
