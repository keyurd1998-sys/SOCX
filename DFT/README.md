# DFT Flow Guide

This directory collects the Design-for-Test (DFT) stages used to make the design testable after fabrication. The flow starts by checking whether the RTL is suitable for scan insertion, then moves to scan chain creation, ATPG analysis, compression exploration, and finally JTAG-based test infrastructure.

## Why DFT matters

A chip can be functionally correct in simulation but still be very hard to test in silicon. DFT adds test structures such as scan chains and test control logic so automated test equipment can detect stuck-at and related faults after manufacturing.

## Learning path

1. Start with the DRC check stage to learn what the tool considers unsafe.
2. Move to the DRC fix stage to understand how violations are corrected.
3. Study initial scan insertion before moving to ATPG and test-point analysis.
4. Explore compression and JTAG stages once the basic scan flow is understood.

## Common commands

### Run Genus interactively

```bash
cd DFT/2_SCAN_INITIAL
genus
```

Inside Genus:

```tcl
genus@root:> source scan.tcl
```

### Run Genus in batch mode

```bash
cd DFT/2_SCAN_INITIAL
genus -files scan.tcl
```

## Expected outputs

Each stage writes reports and netlists into its own work directories. Typical outputs include:

- scan chain reports
- ATPG configuration files
- gate-level netlists
- DFT violation reports
- compressed scan analysis reports

## Recommended order

- [0_DRC_CHECK](0_DRC_CHECK)
- [1_DRC_FIX](1_DRC_FIX)
- [2_SCAN_INITIAL](2_SCAN_INITIAL)
- [3_SCAN_WITH_ATPG_ANALYSIS_N_TPI](3_SCAN_WITH_ATPG_ANALYSIS_N_TPI)
- [4_SCAN_COMPRESSION_ANALYSIS](4_SCAN_COMPRESSION_ANALYSIS)
- [5_INSERT_SCAN_COMPRESSION_LOGIC](5_INSERT_SCAN_COMPRESSION_LOGIC)
- [6_INSERT_JTAG_LOGIC](6_INSERT_JTAG_LOGIC)
