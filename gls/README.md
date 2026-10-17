# Gate-Level Simulation (GLS) for TOP (SOCX)

This directory provides gate-level simulation for verifying the synthesized post-scan compressed netlist (`scan/netlists/TOP_compressed.v`).

## Directory Structure
- `tb/`: Testbench files (`TOP_tb.v`).
- `logs/`: Simulation execution logs.
- `waves/`: Waveform dump files (VCD/SHM/FSDB).
- `run_gls.sh`: Unified runner supporting Cadence Xcelium (`xrun`), Synopsys VCS (`vcs`), and Icarus Verilog (`iverilog`).

## Usage
```bash
./run_gls.sh                 # Runs default testbench tb/TOP_tb.v
./run_gls.sh tb/custom_tb.v  # Runs custom testbench
```
