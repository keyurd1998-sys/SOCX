# SOCX - Scan Compression & Test Point Insertion (Cadence Genus & Modus)

Complete, fully chained Design-for-Test (DFT) flow for the **SOCX** System-on-Chip Controller (`TOP`).

The architecture focuses exclusively on **Scan Compression** and **ATPG-Guided Test Point Insertion (TPI)**, featuring full pre-TPI and post-TPI compression analysis on **2 scan channels** with target **80x compression**. All steps are fully chained via persistent checkpoint databases (`read_db`/`write_db`) without any redundant elaboration.

---

## Architecture Overview

1. **Database Chaining (Zero Redundancy):**
   - Each step loads the checkpoint database produced by the previous step via `read_db` and saves its output via `write_db`.
   - Eliminates all repeated elaboration, re-synthesis, and disconnected script runs.

2. **Full Scan & Automated DRC Fixing (Step 2):**
   - Active-low reset (`RST_N`) and dual test clocks (`REF_CLK` at 50 MHz, `UART_CLK` at ~3.68 MHz) are declared with clock compatibility.
   - Built-in DFT rule violations on internally generated clocks and synchronizer resets are automatically resolved using `fix_dft_violations` under `test_mode` control, achieving 100% scan rule compliance.

3. **Pre-TPI Compression Analysis (Step 4):**
   - ATPG-guided scan compressibility evaluation (`analyze_scan_compressibility`) measuring baseline coverage and test data volume reduction (TDVR) across ratios **70 and 80** on 2 scan channels.

4. **Modus ATPG-Guided Test Point Insertion (Step 5):**
   - Modus fault analysis identifies up to 100 control and observe test points.
   - Inserted into the mapped netlist to resolve random-pattern resistant faults and eliminate compression bottlenecks.

5. **Post-TPI Compression Analysis (Step 6):**
   - Evaluates compression configurations (ratios **70 and 80**) via `analyze_scan_compressibility` on the design with test points inserted across 2 scan channels.
   - Quantifies the test coverage boost, pattern count reduction, and compression scalability achieved by TPI.

6. **Final Scan Compression Insertion (Step 7):**
   - **2 Scan Channels:** `scan_in_0`, `scan_in_1`, `scan_out_0`, `scan_out_1`.
   - Broadcast decompressor and XOR compressor with wide1 channel masking.
   - Configured with fixed target compression ratio **80**.

7. **Timing & ATPG Export (Step 8):**
   - Post-DFT QoR and slack timing reports.
   - Exported compressed gate-level Verilog netlist (`scan/netlists/TOP_compressed.v`).
   - Automated export of Modus Compressed ATPG workspaces (`atpg/stuck_at` & `atpg/delay`).

---

## Repository Structure

```
SOCX/
├── run_step.sh                             # Top-level runner (delegates to scan/run_step.sh)
├── CONSTRAINTS/                            # Functional constraints (cons.tcl)
├── RTL/                                    # SOC Controller RTL modules (TOP.sv, ALU, UART, FIFO, etc.)
│
├── scan/                                   # Scan Synthesis & Compression Flow (Genus)
│   ├── run_step.sh                         # Step runner for Genus DFT flow (steps 1-8 or all)
│   ├── 00_setup_env.tcl                    # Environment paths, library, 2 scan channels & ratio 80
│   ├── 01_elaborate.tcl                    # Step 1: RTL elaboration and health check
│   ├── 02_dft_setup_tdrc.tcl               # Step 2: Test clocks, scan enable, DRC fix & pre-DFT TDRC
│   ├── 03_scan_mapping.tcl                 # Step 3: Generic synthesis and scan flop mapping
│   ├── 04_pre_tpi_compression_analysis.tcl # Step 4: Pre-TPI compression analysis (ratios 70, 80)
│   ├── 05_test_point_insertion.tcl         # Step 5: Modus ATPG-guided test point insertion (max 100 TPs)
│   ├── 06_post_tpi_compression_analysis.tcl# Step 6: Post-TPI compression analysis (ratios 70, 80)
│   ├── 07_insert_compression.tcl           # Step 7: Scan compression insertion (Ratio 80, 2 Channels)
│   ├── 08_export.tcl                       # Step 8: Export netlists, SDC, reports & ATPG scripts
│   ├── dbs/                                # Checkpoint databases (01 through 08)
│   ├── logs/                               # Execution logs for each step
│   ├── reports/                            # DRC, area, timing, preview, and scan reports
│   └── netlists/                           # Final gate-level netlists & SCANDEF
│
├── atpg/                                   # Automatic Test Pattern Generation (Modus)
│   ├── run_atpg.sh                         # Modus ATPG runner script
│   ├── stuck_at/                           # Stuck-At ATPG workspace (exported by Step 8)
│   ├── delay/                              # Transition Delay ATPG workspace (exported by Step 8)
│   ├── logs/                               # ATPG execution logs
│   └── reports/                            # ATPG coverage & fault reports
│
├── gls/                                    # Gate-Level Simulation (Xcelium / VCS / Icarus)
│   ├── run_gls.sh                          # Gate-level simulation runner
│   ├── tb/                                 # Testbench (TOP_tb.v)
│   ├── logs/                               # Simulation logs
│   └── waves/                              # Simulation waveform databases
│
├── SYNTHESIS/                              # Legacy baseline synthesis reference
└── DFT/                                    # Legacy unchained DFT reference runs
```

---

## Quick Start Guide

### Step 1: Run Scan Synthesis in Genus (`scan/`)
You can run directly from the root using `./run_step.sh` or from `scan/`:
```bash
# Run all steps (Fixed: 2 scan channels, Ratio 80, Analysis 70 & 80):
./run_step.sh all

# Or run individual steps sequentially:
./run_step.sh 1    # Elaboration & Checkpoint 01_elaborated.db
./run_step.sh 2    # DFT Setup, DRC Fix & Pre-DFT TDRC
./run_step.sh 3    # Generic Synthesis & Scan Mapping
./run_step.sh 4    # Pre-TPI Compression Analysis (Ratios 70, 80)
./run_step.sh 5    # Modus Test Point Insertion (TPI)
./run_step.sh 6    # Post-TPI Compression Analysis (Ratios 70, 80)
./run_step.sh 7    # Scan Compression Insertion (Ratio 80, 2 Channels)
./run_step.sh 8    # Export Netlist, SDC, SCANDEF, Reports & Modus ATPG
```

---

### Step 2: Run ATPG in Cadence Modus (`atpg/`)
Step 8 automatically exports the Modus ATPG scripts to `atpg/stuck_at/` and `atpg/delay/`. Run them via:
```bash
cd atpg

# Run Stuck-At ATPG:
./run_atpg.sh stuck_at

# Run Transition Delay ATPG:
./run_atpg.sh delay

# Run both:
./run_atpg.sh all
```

---

### Step 3: Run Gate-Level Simulation (`gls/`)
Verify the post-scan compressed netlist with testbenches using:
```bash
cd gls
./run_gls.sh
```
