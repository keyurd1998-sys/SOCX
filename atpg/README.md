# Modus ATPG Flow

## Overview
This directory contains the Cadence Modus ATPG flow for generating Stuck-At and Transition Delay test patterns targeting the compressed gate-level netlist of the TOP design. The flow runs structural test verification (TSV rules), builds fault models, generates compact test patterns, and exports simulation testbenches and vectors.

## Execution Commands

Run Stuck-At ATPG:
```bash
./run_atpg.sh stuck_at
```

Run Transition Delay ATPG:
```bash
./run_atpg.sh delay
```

Run both ATPG modes:
```bash
./run_atpg.sh all
```

## Results Snippets

### 1. Stuck-At ATPG (stuck_at_fault_summary.rpt)
```text
Testmode Fault Statistics (COMPRESSION):
    Total Static Faults:            244,817
    Tested Faults:                  243,907
    Redundant Faults:                   212
    Untested Faults:                    697

Coverage Metrics:
    Static Test Coverage:            99.71%
    Static Fault Coverage:           96.24%
    Static ATPG Effectiveness:       99.72%

Pattern Summary:
    Total Test Sequences:             2,932
```

### 2. Transition Delay ATPG (delay_fault_summary.rpt)
```text
Testmode Dynamic Fault Statistics (COMPRESSION):
    Total Dynamic Faults:           218,398
    Tested Dynamic Faults:          188,851
    Redundant Faults:                    40
    Untested Faults:                 29,507

Coverage Metrics:
    Dynamic Test Coverage:           86.49%
    Dynamic Fault Coverage:          74.57%
    Dynamic ATPG Effectiveness:      98.44%

Pattern Summary:
    Total Test Sequences:             8,245
```

## Generated Outputs
- reports/: Detailed coverage tables, untested fault lists, and cycle statistics
- patterns/verilog_serial/: Serial cycle-by-cycle Verilog testbench and vectors
- patterns/verilog_parallel/: Parallel broadside Verilog testbench and vectors
