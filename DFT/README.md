# SOCX Design-for-Test (DFT) Implementation Flow Guide

Welcome to the **SOCX Design-for-Test (DFT)** repository! This repository provides an end-to-end, production-grade educational walkthrough of DFT implementation using industry-standard **Cadence EDA Tools** (**Cadence Genus Synthesis Solution** and **Cadence Modus DFT Software Solution**).

Whether you are an undergraduate student, graduate researcher, or an engineer stepping into ASIC test engineering, this guide will help you understand **why** DFT is indispensable, **how** scan chains and test logic are inserted, and **how** ATPG test vectors are generated and verified.

---

## 📑 Table of Contents

1. [Introduction to Design-for-Test (DFT)](#-introduction-to-design-for-test-dft)
2. [Why DFT is Critical in Silicon Manufacturing](#-why-dft-is-critical-in-silicon-manufacturing)
3. [Core DFT Concepts Explained](#-core-dft-concepts-explained)
4. [The 7-Stage DFT Progression Flow](#-the-7-stage-dft-progression-flow)
5. [Target SoC Architecture & Test Strategy](#-target-soc-architecture--test-strategy)
6. [Prerequisites & EDA Tool Setup](#-prerequisites--eda-tool-setup)
7. [Quick-Start Execution Cheat-Sheet](#-quick-start-execution-cheat-sheet)
8. [Directory Map & Navigation](#-directory-map--navigation)
9. [Interpreting Outputs & Reports](#-interpreting-outputs--reports)
10. [Troubleshooting & Common Pitfalls](#-troubleshooting--common-pitfalls)

---

## 🎯 Introduction to Design-for-Test (DFT)

In digital VLSI design, verifying that an RTL model simulates correctly or that a synthesized gate netlist meets timing is only half the battle. When millions or billions of physical transistors are fabricated onto silicon, manufacturing defects (e.g., dust particles, metal bridging, open vias, lithography variations) will cause some chips to fail.

**Design-for-Test (DFT)** is a set of hardware design techniques and EDA automation workflows that add specialized test structures (such as scan flip-flops, test multiplexers, test points, compression logic, and JTAG TAP controllers) into the chip architecture. These structures allow **Automated Test Equipment (ATE)** testers to quickly and deterministically screen out defective silicon dies before packaging and shipping to customers.

```text
       +-------------------------------------------------------------+
       |                     ASIC Design Flow                        |
       |                                                             |
       |   +---------+       +-------------------+       +-------+   |
       |   |   RTL   |  -->  | Logic Synthesis   |  -->  |  P&R  |   |
       |   | Design  |       | & DFT Insertion   |       | (PnR) |   |
       |   +---------+       +---------+---------+       +---+---+   |
       +-------------------------------|---------------------|-------+
                                       |                     |
                                       v                     v
                             +-------------------+     +-----------+
                             | Modus ATPG Flow   |     | Fabricated|
                             | (Patterns: WGL/V) |     |  Silicon  |
                             +---------+---------+     +-----+-----+
                                       |                     |
                                       +---------> + <-------+
                                                   |
                                                   v
                                       +-----------------------+
                                       |  ATE Physical Tester  |
                                       |   (Pass / Fail Die)   |
                                       +-----------------------+
```

---

## 💡 Why DFT is Critical in Silicon Manufacturing

1. **Defect Detection vs. Functional Testing**:
   - Running full functional software/firmware on an ATE tester is extremely slow, expensive, and cannot achieve high fault coverage (typically < 70%).
   - DFT with scan chains achieves **> 99.5% test coverage** in a fraction of a second per die.

2. **Cost of Testing**:
   - ATE tester time is charged by the second. DFT techniques like **Scan Compression** compress test data volume (TDV) and test application time (TAT) by **20x to 100x**, saving millions of dollars in production.

3. **Observability & Controllability**:
   - Without DFT, an internal flip-flop deep inside a 32-bit state machine might require millions of clock cycles to set to a known state (`controllability`) and observe its output (`observability`).
   - Scan chains transform all internal sequential flip-flops into a giant shift register, providing **100% direct controllability and observability**.

---

## 🔬 Core DFT Concepts Explained

### 1. MUXed-Scan Flip-Flop
A standard D-flip-flop is replaced with a scan flip-flop (SDFF) containing an input multiplexer controlled by a `ScanEnable` (SE) signal:

```text
                  +---+
   ScanIn (SDI) --| 1 |
                  |   |-----[ D-FF ]-----> Data Out (Q / SDO)
    Data In (D) --| 0 |       ^
                  +---+       | Clock
                    |
               ScanEnable (SE)
```

- **Shift Mode (`SE = 1`)**: Flip-flops act as a serial shift register. Test patterns are shifted in (`ScanIn`), and previous results are shifted out (`ScanOut`).
- **Capture Mode (`SE = 0`)**: Flip-flops capture the combinational logic responses under the operational clock.

### 2. Fault Models
- **Stuck-At Fault Model (Static)**: Models physical shorts to VDD (Stuck-At-1, SA1) or GND (Stuck-At-0, SA0). Tested at low frequency (DC ATPG).
- **Transition Delay Fault Model (At-Speed/AC ATPG)**: Models slow gate transitions (slow-to-rise or slow-to-fall). Tested at nominal functional frequency using launch-on-capture (LOC) or launch-on-shift (LOS) pulses.

### 3. Test Points (TPI - Test Point Insertion)
- **Control Points (CP)**: Injected logic gates (AND/OR/MUX) to force hard-to-control internal nodes to `0` or `1` during test mode.
- **Observation Points (OP)**: Injected flip-flops or XOR taps to capture hard-to-observe logic states.

### 4. Scan Compression (EDT / XOR Compressor-Decompressor)
- **Decompressor**: Expands a few external tester channels (e.g., 2 `ScanIn` pins) into hundreds of internal short scan chains using linear XOR networks.
- **Compressor**: Compacts the outputs of internal chains back into a few external tester channels (`ScanOut` pins).
- **X-Masking**: Masks unknown states (`X`) generated by uninitialized memories or analog blocks before they reach the compressor.

### 5. IEEE 1149.1 Standard (JTAG & Boundary Scan)
- Standardized 4/5-wire interface (`TCK`, `TMS`, `TDI`, `TDO`, `TRST*`) connected to a 16-state **TAP Controller FSM**.
- Wraps chip I/O package pads in **Boundary Scan Register (BSR)** cells to test PCB-level solder joints and package interconnects without physical test probes.

---

## 🚀 The 7-Stage DFT Progression Flow

This repository is structured into 7 sequential stages that reflect the real-world evolution of DFT in an industrial chip tapeout:

```text
  [0_DRC_CHECK] ──> [1_DRC_FIX] ──> [2_SCAN_INITIAL] ──> [3_SCAN_WITH_ATPG_ANALYSIS_N_TPI]
                                                                    │
  [6_INSERT_JTAG_LOGIC] <── [5_INSERT_SCAN_COMPRESSION_LOGIC] <─── [4_SCAN_COMPRESSION_ANALYSIS]
```

| Stage Directory | Goal / Activity | Cadence Tool | Key Script | Major Output Artifacts |
|---|---|---|---|---|
| [**0_DRC_CHECK**](0_DRC_CHECK) | Initial testability check on RTL | Genus | `drc_check.tcl` | `drc_violations.rpt` (identifies 26 clock/reset rule violations) |
| [**1_DRC_FIX**](1_DRC_FIX) | Automatically repair DFT violations | Genus | `drc_fix.tcl` | `drc_violations_after_fix.rpt` (0 violations, 100% scannability) |
| [**2_SCAN_INITIAL**](2_SCAN_INITIAL) | Synthesize design & stitch 80 scan chains | Genus & Modus | `scan.tcl` | `TOP_Scan_Netlist.v`, `Scan_Chain_Report.rpt`, ATPG test database |
| [**3_SCAN_WITH_ATPG_ANALYSIS_N_TPI**](3_SCAN_WITH_ATPG_ANALYSIS_N_TPI) | Analyze testability & insert deterministic test points | Genus & Modus | `scan.tcl` | `runmodus.dfa.tcl`, `TOP.dfa.tpfile`, optimized test pattern count |
| [**4_SCAN_COMPRESSION_ANALYSIS**](4_SCAN_COMPRESSION_ANALYSIS) | Explore 60x, 80x, 100x, 120x, 150x, 200x compression | Genus | `scan.tcl` | `TOP_scan_compressibility.rpt` (TATR / TDVR comparison table) |
| [**5_INSERT_SCAN_COMPRESSION_LOGIC**](5_INSERT_SCAN_COMPRESSION_LOGIC) | Implement 100x XOR compressor/decompressor with X-masking | Genus & Modus | `scan.tcl` | Compressed netlist, `runmodus.atpg.tcl`, compressed test vectors |
| [**6_INSERT_JTAG_LOGIC**](6_INSERT_JTAG_LOGIC) | Complete SoC integration: TAP controller, Boundary Scan, and I/O pads | Genus & Modus | `scan.tcl` | `TOP_WRAPPER_Scan_Netlist.v`, Delay/Stuck-at ATPG patterns, `final_coverage_summary.rpt` |

---

## 🏛️ Target SoC Architecture & Test Strategy

The design under test is **SOCX**, an integrated microcontroller subsystem containing:
- **SYS_CTRL**: Main system controller FSM.
- **ALU_16B**: 16-bit multi-function Arithmetic and Logic Unit.
- **Register_File**: 16x8-bit register memory.
- **Async_fifo**: Multi-clock domain asynchronous FIFO (2048-depth).
- **UART (TX & RX)**: Full duplex serial communication engine with configurable parity.
- **Integer_Clock_Divider**: Configurable clock divider generating internal subsystem clocks.
- **CLK_GATE & Synchronizers**: Clock gating latches (`CLK_GATE`), bit synchronizers (`BIT_SYNC`), data synchronizers (`DATA_SYNC`), reset synchronizers (`RST_SYNC`).
- **TOP_WRAPPER**: Physical pad ring with input pads (`PADDI`), output pads (`PADDO`), and tri-state pads (`PADDOZ`).

### Multi-Clock Test Configuration
The design has two primary asynchronous functional clock domains:
1. `REF_CLK` (System Reference Clock, 50 MHz / 20 ns)
2. `UART_CLK` (Baud-rate generator clock)

In DFT shift mode, both clocks are controlled via tester pins and declared compatible using:
```tcl
set_compatible_test_clocks -all
```
This enables all 8,545+ registers across all clock domains to shift synchronously during test patterns.

---

## 🛠️ Prerequisites & EDA Tool Setup

### Required Tools
- **Cadence Genus Synthesis Solution** (Version 21.1+ / 25.10+)
- **Cadence Modus DFT Software Solution** (Version 21.1+ / 25.10+)

### Library Dependencies
The scripts reference target technology timing and simulation models:
- **Timing Libraries (`.lib`)**: `slow.lib` (standard cells), `pads_FF_s1vg.lib` (I/O pads)
- **Verilog Simulation Models (`.v`)**: `typical.v` (gate simulation library), `pads.v` (pad models)

Make sure the relative path `../../../Library` exists or update `LIB_PATH` in the Tcl scripts to point to your lab's technology library path.

---

## ⚡ Quick-Start Execution Cheat-Sheet

You can run each stage either interactively (with GUI/Tcl shell) or in batch mode.

### 1. Stage 0: DRC Check
```bash
cd DFT/0_DRC_CHECK
genus -files drc_check.tcl -log genus_drc.log
```

### 2. Stage 1: DRC Fix
```bash
cd DFT/1_DRC_FIX
genus -files drc_fix.tcl -log genus_fix.log
```

### 3. Stage 2: Initial Scan Insertion & ATPG
```bash
cd DFT/2_SCAN_INITIAL
genus -files scan.tcl -log genus_scan.log
```

### 4. Stage 3: ATPG Test Point Insertion (TPI)
```bash
cd DFT/3_SCAN_WITH_ATPG_ANALYSIS_N_TPI
genus -files scan.tcl -log genus_tpi.log
```

### 5. Stage 4: Scan Compression Analysis
```bash
cd DFT/4_SCAN_COMPRESSION_ANALYSIS
genus -files scan.tcl -log genus_comp_analysis.log
```

### 6. Stage 5: Scan Compression Logic Insertion
```bash
cd DFT/5_INSERT_SCAN_COMPRESSION_LOGIC
genus -files scan.tcl -log genus_comp_insert.log
```

### 7. Stage 6: JTAG & Boundary Scan Integration
```bash
cd DFT/6_INSERT_JTAG_LOGIC
genus -files scan.tcl -log genus_jtag.log
```

---

## 🗺️ Directory Map & Navigation

```text
SOCX/DFT/
├── README.md                                  <-- Master DFT Guide (You are here)
├── 0_DRC_CHECK/                               <-- Stage 0: Pre-scan rule check
│   ├── README.md                              <-- Detailed Stage 0 walkthrough
│   ├── drc_check.tcl                          <-- Genus DRC check script
│   └── drc_violations.rpt                     <-- Initial 26 violations report
├── 1_DRC_FIX/                                 <-- Stage 1: Automated violation repair
│   ├── README.md                              <-- Detailed Stage 1 walkthrough
│   ├── drc_fix.tcl                            <-- Genus DRC fix script
│   └── drc_violations_after_fix.rpt           <-- Clean 0 violations report
├── 2_SCAN_INITIAL/                            <-- Stage 2: Full scan (80 chains)
│   ├── README.md                              <-- Detailed Stage 2 walkthrough
│   ├── scan.tcl                               <-- Scan synthesis script
│   ├── TOP_Scan/                              <-- Generated netlist & reports
│   └── TOP_ATPG/                              <-- Generated Modus ATPG files
├── 3_SCAN_WITH_ATPG_ANALYSIS_N_TPI/           <-- Stage 3: Test Point Insertion
│   ├── README.md                              <-- Detailed Stage 3 walkthrough
│   ├── scan.tcl                               <-- TPI synthesis & Modus script
│   ├── test_scripts/                          <-- Generated DFA scripts & tpfile
│   └── TOP_TP/                                <-- Test point analysis database
├── 4_SCAN_COMPRESSION_ANALYSIS/               <-- Stage 4: Compressibility sweep
│   ├── README.md                              <-- Detailed Stage 4 walkthrough
│   ├── scan.tcl                               <-- Compression analysis script
│   └── Compression_Report/                    <-- Compression ratio trade-off table
├── 5_INSERT_SCAN_COMPRESSION_LOGIC/           <-- Stage 5: 100x Compressor insertion
│   ├── README.md                              <-- Detailed Stage 5 walkthrough
│   ├── scan.tcl                               <-- Compression insertion script
│   └── TOP_ATPG/                              <-- Compressed ATPG run & vectors
└── 6_INSERT_JTAG_LOGIC/                       <-- Stage 6: Full JTAG SoC integration
    ├── README.md                              <-- Detailed Stage 6 walkthrough
    ├── scan.tcl                               <-- Complete JTAG & Boundary Scan script
    ├── TOP_WRAPPER_Scan/                      <-- Synthesized wrapper netlist
    └── TOP_WRAPPER_ATPG/                      <-- Final sign-off ATPG database
```

---

## 📊 Interpreting Outputs & Reports

When reviewing DFT results across stages, look for these critical metrics:

1. **Scannability Percentage (`check_dft_rules`)**:
   - Must be **100%** before proceeding to scan synthesis. Any non-scannable register reduces test coverage.
2. **Channel Length (`CL`) & Scan Chain Balance**:
   - The longest scan chain dictates the number of shift cycles per pattern:
     $$\text{Shift Cycles} = \text{Max Chain Length} + 1$$
3. **Test Application Time Reduction (TATR) & Test Data Volume Reduction (TDVR)**:
   - Measures how much faster and smaller the test patterns are compared to uncompressed full-scan.
4. **Test Coverage (`ATCov.`)**:
   - Standard stuck-at coverage should exceed **99.5%**.

---

## ❓ Troubleshooting & Common Pitfalls

| Issue | Root Cause | Solution |
|---|---|---|
| `ASYNC-02` DFT Violation | Asynchronous reset/set pin held constant or has polarity conflict during shift. | Add `fix_dft_violations -async_reset -test_control TestMode`. |
| `CLOCK-02` DFT Violation | Internally generated clock (e.g., from clock divider mux) cannot be controlled by ATE during test. | Add `fix_dft_violations -clock -test_control TestMode` and define test clocks explicitly. |
| Incompatible Clock Domains during Shift | Registers on `REF_CLK` and `UART_CLK` cannot shift simultaneously. | Use `set_compatible_test_clocks -all` in Genus. |
| Pad cells deleted during synthesis | Synthesis optimization removes unused or unconnected pad buffers. | Add `set_db [get_cells {pad_*}] .preserve true` before `syn_map`. |
| Modus license checkout error | Modus ATPG requires `modus_atpg` license feature. | Check license environment variable (`CDS_LIC_REPORT=yes` and `LM_LICENSE_FILE`). |

---

## 📖 Recommended Study Roadmap for Beginners

To get the most out of this repository:
1. Read the **Stage 0** document to learn how DFT rules catch un-testable RTL constructs.
2. Follow **Stage 1** to observe how test multiplexers solve clock/reset controllability.
3. Walk through **Stage 2** to master basic scan synthesis and ATPG pattern generation.
4. Advance through **Stages 3 & 4** to understand test points and compression trade-offs.
5. Finish with **Stages 5 & 6** to master industrial-grade compression and IEEE 1149.1 JTAG integration.

👉 **Start here:** [0_DRC_CHECK/README.md](0_DRC_CHECK/README.md)
