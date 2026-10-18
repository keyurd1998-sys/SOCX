# Scan Synthesis and Compression Flow

## Overview
The scan flow performs logic synthesis, testability design rule check (TDRC) violation repair, scan flop replacement, ATPG-guided test point insertion (TPI), XOR scan compression insertion, and timing optimization using Cadence Genus.

## Flow Steps

- Step 1 (01_elaborate.tcl): RTL elaboration and library loading
- Step 2 (02_dft_setup_tdrc.tcl): Test clocks and test control signal definitions, pre-DFT DRC check
- Step 3 (03_drc_fix.tcl): Automated DRC violation fixing for async resets, sets, and clock gating
- Step 4 (04_scan_mapping.tcl): Generic synthesis and scan flip-flop mapping
- Step 5 (05_pre_tpi_compression_analysis.tcl): Baseline scan compressibility analysis (ratios 70 & 80)
- Step 6 (06_test_point_insertion.tcl): Modus ATPG-guided test point insertion and post-TPI logic optimization
- Step 7 (07_post_tpi_compression_analysis.tcl): Post-TPI compressibility analysis verifying coverage gains
- Step 8 (08_insert_compression.tcl): Scan chain stitching and 80x compression insertion with incremental timing optimization
- Step 9 (09_export.tcl): Netlist, SDC constraints, SCANDEF, and ATPG workspace export

## Execution Commands

Run all 9 steps in sequence:
```bash
./run_step.sh all
```

Run specific steps individually:
```bash
./run_step.sh 1
./run_step.sh 2 3 4
./run_step.sh 8 9
```

## Results Snippet

From post-DFT synthesis report (TOP_qor.rpt):

```text
Timing Summary:
    Cost Group       Critical Path Slack    TNS    Violating Paths
    --------------------------------------------------------------
    ALU_CLK                 11406.4 ps      0.0           0
    REF_CLK                  9468.0 ps      0.0           0
    UART_CLK               212011.9 ps      0.0           0
    UART_RX_CLK            215541.0 ps      0.0           0
    UART_TX_CLK            270380.5 ps      0.0           0
    --------------------------------------------------------------
    Total                                   0.0           0

Instance Count:
    Leaf Instances:                 27,057
    Sequential Instances:            8,657
    Combinational Instances:        18,400

Scan Compression:
    Scan Channels:                       2 (scan_in_0/1, scan_out_0/1)
    Compression Ratio:                  80
    Architecture:        XOR compactor with wide-1 channel masking
```
