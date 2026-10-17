# SOCX - Scan Compression & Test Point Insertion (Cadence Genus & Modus)

Complete, fully chained Design-for-Test (DFT) flow for the **SOCX** System-on-Chip Controller (`TOP`).

The architecture focuses exclusively on **Scan Compression** and **ATPG-Guided Test Point Insertion (TPI)**, featuring full pre-TPI and post-TPI compression analysis on **2 scan channels** with target **80x compression**. All steps are fully chained via persistent checkpoint databases (`read_db`/`write_db`) without any redundant elaboration.

---

## Architecture Overview

1. **Database Chaining (Zero Redundancy):**
   - Each step loads the checkpoint database produced by the previous step via `read_db` and saves its output via `write_db`.
   - Eliminates all repeated elaboration, re-synthesis, and disconnected script runs.

2. **DFT Setup & Initial DRC Check (Step 2):**
   - Active-low reset (`RST_N`) and dual test clocks (`REF_CLK` at 50 MHz, `UART_CLK` at ~3.68 MHz) are declared with clock compatibility.
   - Initial DRC check detects violations caused by internal clock gating/dividers and reset synchronizers.

3. **Dedicated DRC Violation Fixing (Step 3):**
   - Resolves all asynchronous reset, asynchronous set, and internal clock gating/divider rule violations automatically using `fix_dft_violations` under `test_mode` control.
   - Verifies that 100% of registers are scannable (0 violations remaining).

4. **Generic Synthesis & Scan Mapping (Step 4):**
   - Maps generic logic gates to target technology cells and replaces standard registers with scan flip-flops.

5. **Pre-TPI Compression Analysis (Step 5):**
   - ATPG-guided scan compressibility evaluation (`analyze_scan_compressibility`) measuring baseline coverage and test data volume reduction (TDVR) across ratios **70 and 80** on 2 scan channels.

6. **Modus ATPG-Guided Test Point Insertion (Step 6):**
   - Modus fault analysis identifies up to 100 control and observe test points.
   - Inserted into the mapped netlist to resolve random-pattern resistant faults and eliminate compression bottlenecks.

7. **Post-TPI Compression Analysis (Step 7):**
   - Evaluates compression configurations (ratios **70 and 80**) via `analyze_scan_compressibility` on the design with test points inserted across 2 scan channels.
   - Quantifies the test coverage boost, pattern count reduction, and compression scalability achieved by TPI.

8. **Final Scan Compression Insertion (Step 8):**
   - **2 Scan Channels:** `scan_in_0`, `scan_in_1`, `scan_out_0`, `scan_out_1`.
   - Broadcast decompressor and XOR compressor with wide1 channel masking.
   - Configured with fixed target compression ratio **80**.

9. **Timing & ATPG Export (Step 9):**
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
│   ├── run_step.sh                         # Step runner for Genus DFT flow (steps 1-9 or all)
│   ├── 00_setup_env.tcl                    # Environment paths, library, 2 scan channels & ratio 80
│   ├── 01_elaborate.tcl                    # Step 1: RTL elaboration and health check (writes 01_elaborated.db)
│   ├── 02_dft_setup_tdrc.tcl               # Step 2: Test clocks, scan enable & pre-DFT TDRC (writes 02_tdrc.db)
│   ├── 03_drc_fix.tcl                      # Step 3: Dedicated DRC fix script (writes 03_drc_fixed.db)
│   ├── 04_scan_mapping.tcl                 # Step 4: Generic synthesis and scan mapping (writes 04_mapped.db)
│   ├── 05_pre_tpi_compression_analysis.tcl # Step 5: Pre-TPI compression analysis (ratios 70, 80) (writes 05_pre_tpi_analyzed.db)
│   ├── 06_test_point_insertion.tcl         # Step 6: Modus ATPG-guided TPI (max 100 TPs) (writes 06_tpi.db)
│   ├── 07_post_tpi_compression_analysis.tcl# Step 7: Post-TPI compression analysis (ratios 70, 80) (writes 07_post_tpi_analyzed.db)
│   ├── 08_insert_compression.tcl           # Step 8: Scan compression insertion (Ratio 80, 2 Channels) (writes 08_compressed.db)
│   ├── 09_export.tcl                       # Step 9: Export netlists, SDC, reports & ATPG scripts (writes 09_final.db)
│   ├── dbs/                                # Checkpoint databases (.db)
│   ├── logs/                               # Execution logs for each step
│   ├── reports/                            # DRC, area, timing, preview, and scan reports
│   └── netlists/                           # Final gate-level netlists & SCANDEF
│
├── atpg/                                   # Automatic Test Pattern Generation (Modus)
│   ├── run_atpg.sh                         # Modus ATPG runner script
│   ├── stuck_at/                           # Stuck-At ATPG workspace (exported by Step 9)
│   ├── delay/                              # Transition Delay ATPG workspace (exported by Step 9)
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
# Run all steps end-to-end:
./run_step.sh all

# Or run individual steps sequentially:
./run_step.sh 1    # Step 1: Elaboration & Checkpoint 01_elaborated.db
./run_step.sh 2    # Step 2: DFT Setup & Initial TDRC Check (02_tdrc.db)
./run_step.sh 3    # Step 3: Dedicated DRC Fix (03_drc_fixed.db)
./run_step.sh 4    # Step 4: Generic Synthesis & Scan Mapping (04_mapped.db)
./run_step.sh 5    # Step 5: Pre-TPI Compression Analysis (05_pre_tpi_analyzed.db)
./run_step.sh 6    # Step 6: Modus Test Point Insertion (06_tpi.db)
./run_step.sh 7    # Step 7: Post-TPI Compression Analysis (07_post_tpi_analyzed.db)
./run_step.sh 8    # Step 8: Scan Compression Insertion (Ratio 80, 2 Channels) (08_compressed.db)
./run_step.sh 9    # Step 9: Export Netlist, SDC, SCANDEF, Reports & Modus ATPG (09_final.db)
```

---

### Step 2: Run ATPG in Cadence Modus (`atpg/`)
Step 9 automatically exports the Modus ATPG scripts to `atpg/stuck_at/` and `atpg/delay/`. Run them via:
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
