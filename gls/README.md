# Gate-Level Simulation (GLS) Flow

## Overview
This directory contains the gate-level test pattern simulation flow using Cadence Xcelium (xrun). The simulation executes Modus-generated Verilog testbenches against the compressed gate-level netlist to verify that test patterns operate correctly without unknown (X) states, timing races, or scan shifting errors.

## Simulation Modes

- Parallel Simulation: Directly forces flip-flop states via Verilog hierarchical references in 1 cycle. Runs in seconds for fast sanity checks.
- Serial Simulation: Shifts test bits through the primary scan pins cycle by cycle. Replicates exact physical ATE tester operations.

## Execution Commands

Run Stuck-At simulations:
```bash
./run_gls.sh parallel        # Fast parallel check (default)
./run_gls.sh serial          # Full serial shift simulation
```

Run Transition Delay simulations:
```bash
./run_gls.sh delay parallel  # Fast parallel check
./run_gls.sh delay serial    # Full serial shift simulation
```

## Simulation Results Snippets

From Xcelium simulation logs (gls/logs/):

### 1. Stuck-At Parallel Simulation (gls_stuck_at_parallel.log)
```text
Cumulative Results:
    Number of Files Simulated:           2
    Total Number of Cycles:         20,763
    Total Number of Tests:           2,932
      - Total Passed Tests:          2,932
      - Total Failed Tests:              0
    Total Number of Compares:   24,921,879
      - Total Good Compares:    24,921,879
      - Total Miscompares:               0

Status: 100% PASSED (0 miscompares)
Simulation Time: 29 seconds
```

### 2. Transition Delay Parallel Simulation (gls_delay_parallel.log)
```text
Cumulative Results:
    Number of Files Simulated:           2
    Total Number of Cycles:         49,459
    Total Number of Tests:           8,245
      - Total Passed Tests:          8,245
      - Total Failed Tests:              0
    Total Number of Compares:   70,041,275
      - Total Good Compares:    70,041,275
      - Total Miscompares:               0

Status: 100% PASSED (0 miscompares)
Simulation Time: 58 seconds
```
