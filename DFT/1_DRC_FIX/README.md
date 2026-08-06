# DFT Rule Fix Stage

This stage fixes the violations reported by the previous DFT check. The script takes the same RTL and applies test-friendly fixes using the built-in DFT violation repair commands.

## Purpose

Some violations are not design bugs; they are testability issues. The tool can sometimes repair them by controlling asynchronous behavior during test mode. In this repository, the script fixes:

- asynchronous reset violations
- asynchronous set violations
- clock-related violations

## Key script

The main script is [drc_fix.tcl](drc_fix.tcl).

## How to run

### Interactive mode

```bash
cd DFT/1_DRC_FIX
genus
```

Inside Genus:

```tcl
genus@root:> source drc_fix.tcl
```

### Batch mode

```bash
genus -files drc_fix.tcl
```

## Important Tcl concepts

### Repairing async reset issues

```tcl
fix_dft_violations -async_reset -test_control TestMode
```

This command helps the tool correct reset behavior so test logic can be inserted safely under test mode.

### Repairing clock issues

```tcl
fix_dft_violations -clock -test_control TestMode
```

Clock-related violations are commonly caused by test clocks or unconstrained clock domains. This command gives Genus a test-aware way to fix the issue.

### Final verification

```tcl
check_dft_rules > drc_violations_after_fix.rpt
```

This final report shows whether the fixes were successful.

## Expected outputs

- [drc_violations_after_fix.rpt](drc_violations_after_fix.rpt)

## Learning note

This stage is a bridge between DFT analysis and practical scan insertion. The goal is not to change the functional logic, but to make the design acceptable to the test insertion flow.
