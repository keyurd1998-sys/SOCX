# SOCX DFT Implementation and Verification

![Synthesis](https://img.shields.io/badge/Synthesis-Cadence%20Genus-007ACC)
![ATPG](https://img.shields.io/badge/ATPG-Cadence%20Modus-007ACC)
![GLS](https://img.shields.io/badge/GLS-Cadence%20Xcelium-007ACC)
![Stuck-At Coverage](https://img.shields.io/badge/Stuck--At%20Coverage-99.71%25-brightgreen)
![Delay Coverage](https://img.shields.io/badge/Delay%20Coverage-86.49%25-green)
![GLS Verification](https://img.shields.io/badge/GLS%20Status-100%25%20Passed-brightgreen)
![Timing](https://img.shields.io/badge/Timing-Met%20(0%20Violations)-brightgreen)
![Compression](https://img.shields.io/badge/Compression-80x-orange)

## Overview
This project implements an end-to-end Design-for-Test (DFT) flow for the SOCX (TOP) SoC controller block. The flow covers RTL elaboration, testability design rule repair, scan chain stitching, ATPG-guided test point insertion, XOR-based scan compression, timing closure, ATPG pattern generation, and gate-level pattern simulation using Cadence tools.

## Tools Used
- Synthesis & DFT: Cadence Genus 25.10
- ATPG: Cadence Modus 25.10
- Simulation: Cadence Xcelium (xrun) 25.09
- Library: Standard Cell 45nm / Generic DFT Library

## Execution Flow

1. Scan Synthesis and Compression:
```bash
cd scan
./run_step.sh all
```

2. ATPG Pattern Generation:
```bash
cd ../atpg
./run_atpg.sh stuck_at
./run_atpg.sh delay
```

3. Gate-Level Pattern Simulation:
```bash
cd ../gls
./run_gls.sh parallel
./run_gls.sh delay parallel
```

## Key Results Summary

### Synthesis and DFT Quality of Results
- Sequential Scan Instances: 8,657 flip-flops
- Total Leaf Instances: 27,057 gates
- Scan Compression Architecture: 2 scan channels, 80x compression ratio, XOR compactor, wide-1 channel masking
- Timing Closure: Total Negative Slack (TNS) = 0.0 ps, 0 violating paths across all clock groups (ALU_CLK, REF_CLK, UART_CLK)

### ATPG Coverage Results
- Stuck-At Test Coverage: 99.71% (Fault Coverage: 96.24%, ATPG Effectiveness: 99.72%)
- Stuck-At Tested Faults: 243,907 out of 244,817 testmode faults
- Transition Delay Dynamic Test Coverage: 86.49% (ATPG Effectiveness: 98.44%)
- Transition Delay Tested Faults: 188,851 dynamic faults

### Gate-Level Simulation Verification
- Stuck-At Pattern Simulation: 2,932 tests passed, 0 failed, 24,921,879 compares, 0 miscompares (100% pass)
- Transition Delay Pattern Simulation: 8,245 tests passed, 0 failed, 70,041,275 compares, 0 miscompares (100% pass)
