# DFT Rule Check Stage

This stage performs the first DFT sanity check. The script reads the RTL, elaborates the design, defines test control signals, and then runs the DFT rule checker.

## Purpose

Before any scan logic is inserted, the tool checks whether the current design is structurally compatible with test insertion. This helps catch issues such as:

- missing test control signals
- asynchronous reset behavior that is not test-friendly
- clocking structures that can confuse ATPG and scan insertion

## Key script

The main script is [drc_check.tcl](drc_check.tcl).

## How to run

### Interactive mode

```bash
cd DFT/0_DRC_CHECK
genus
```

Inside Genus:

```tcl
genus@root:> source drc_check.tcl
```

### Batch mode

```bash
genus -files drc_check.tcl
```

## Important Tcl concepts

### RTL read and elaboration

```tcl
read_hdl -sv [glob "$HDL_PATH/*.sv"] 
read_hdl -sv [glob "$HDL_PATH/*.v"] 
elaborate $DESIGN_NAME -parameters {8 4 16 2048 11}
```

These commands load the Verilog/SystemVerilog sources and build the design hierarchy. The parameter list is important because it matches the configured width and memory depth used in the RTL.

### Define basic test controls

```tcl
define_test_signal \n-function shift_enable \n-active high \n-create_port \n-default_shift_enable \nScanEnable
```

This tells Genus which signal should behave as the scan shift-enable. Without it, the tool cannot meaningfully insert scan logic.

### Rule checking

```tcl
check_dft_rules > drc_violations.rpt
```

This is the main output-producing command. The report captures any DFT rule violations that must be fixed before scan insertion can proceed.

## Expected outputs

- [drc_violations.rpt](drc_violations.rpt)

## Learning note

Think of this stage as a diagnostic step. It does not yet add test logic; it tells you whether the design is ready for test insertion.
