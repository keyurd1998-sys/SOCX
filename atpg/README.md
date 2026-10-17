# Modus ATPG for TOP (SOCX)

This directory contains Cadence Modus ATPG runs for the compressed gate-level netlist of `TOP`.

## Directory Structure
- `stuck_at/`: Stuck-At ATPG workspace exported by Genus step `08_export.tcl`.
- `delay/`: Transition Delay ATPG workspace exported by Genus step `08_export.tcl`.
- `logs/`: ATPG execution logs.
- `reports/`: ATPG fault coverage and pattern summary reports.

## Running ATPG
```bash
./run_atpg.sh stuck_at   # Run Stuck-At ATPG
./run_atpg.sh delay      # Run Transition Delay ATPG
./run_atpg.sh all        # Run both Stuck-At and Delay ATPG
```
