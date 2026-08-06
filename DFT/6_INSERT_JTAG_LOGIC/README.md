# JTAG and Boundary Scan Insertion Stage

This stage adds IEEE 1149.1-compatible JTAG infrastructure to the design. It introduces a TAP controller, instruction register, and boundary scan logic so the chip can be tested through standard test pins.

## Purpose

JTAG is widely used for manufacturing test, debug, and board-level testing. In this repository, the flow adds boundary scan and test control logic around the wrapper pins.

## Key script

The main script is [scan.tcl](scan.tcl).

## How to run

### Interactive mode

```bash
cd DFT/6_INSERT_JTAG_LOGIC
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

### JTAG instruction register

```tcl
define_jtag_instruction_register -name JTAG_IR
```

This creates the instruction register used by the JTAG TAP controller.

### Define standard JTAG instructions

```tcl
define_jtag_instruction -name EXTEST -opcode 00
define_jtag_instruction -name SAMPLE -opcode 01
define_jtag_instruction -name PRELOAD -opcode 10
define_jtag_instruction -name BYPASS -opcode 11
```

These standard instructions make the JTAG logic compatible with common test environments.

### Insert the JTAG macro

```tcl
add_jtag_macro \
    -tck  [get_ports PIN_TCK] \
    -tms  [get_ports PIN_TMS] \
    -tdi  [get_ports PIN_TDI] \
    -tdo  [get_ports PIN_TDO] \
    -trst [get_ports PIN_TRST]
```

This connects the TAP controller to the wrapper pins.

### Add boundary scan logic

```tcl
add_jtag_boundary_scan -exclude_ports {PIN_comp_en PIN_spread_en PIN_mask_en PIN_mask_load PIN_mask_clk}
```

This wraps the relevant I/O pins in boundary-scan cells so they can be controlled and observed through JTAG.

## Expected outputs

- JTAG-enabled netlist
- scan chain and setup reports
- ATPG files for the final testable wrapper design

## Learning note

This is the most advanced DFT stage in the repository. It connects the design to external test infrastructure and prepares it for standard boundary-scan and debug workflows.
