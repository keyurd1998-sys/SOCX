# Stage 0: Pre-Scan Design Rule Checking (DRC)

Welcome to **Stage 0** of the SOCX DFT flow! This stage is the essential first diagnostic step before modifying the netlist or inserting scan chains. Here, you will use **Cadence Genus Synthesis Solution** to analyze raw RTL for testability violations.

---

## 📑 Table of Contents

1. [Why Pre-Scan DRC Checking Matters](#-why-pre-scan-drc-checking-matters)
2. [What Makes RTL Test-Unfriendly?](#-what-makes-rtl-test-unfriendly)
3. [Stage Overview & Workflow](#-stage-overview--workflow)
4. [How to Run This Stage](#-how-to-run-this-stage)
5. [Line-by-Line Script Breakdown (`drc_check.tcl`)](#-line-by-line-script-breakdown-drc_checktcl)
6. [Detailed Analysis of `drc_violations.rpt`](#-detailed-analysis-of-drc_violationsrpt)
7. [Understanding Rule Codes (`ASYNC-02` and `CLOCK-02`)](#-understanding-rule-codes-async-02-and-clock-02)
8. [Summary & Key Takeaways](#-summary--key-takeaways)
9. [Next Steps: Moving to Stage 1](#-next-steps-moving-to-stage-1)

---

## 💡 Why Pre-Scan DRC Checking Matters

Before Cadence Genus can replace standard flip-flops with scan flip-flops and stitch them into a continuous shift register, every sequential cell in the design must satisfy **scan design rules**:

1. **Clock Controllability**: Every flip-flop's clock pin must be directly pulsed from an external primary test clock input during scan shifting.
2. **Asynchronous Reset/Set Inactivity**: All asynchronous reset and preset pins must remain inactive (disabled) while test patterns are being shifted through the scan chain. If a reset unexpectedly asserts during shift, test data is corrupted.
3. **No Race Conditions or Clock Glitches**: Internal clock gating and multiplexing logic must be held in a stable, transparent state during test mode.

Running `check_dft_rules` at the RTL elaboration stage reveals all testability bottlenecks without running a full gate-level synthesis.

---

## ⚠️ What Makes RTL Test-Unfriendly?

Real-world functional RTL often contains architectural structures that are great for low-power or functionality, but detrimental to DFT:

```text
Functional Design Construct                DFT Problem
───────────────────────────                ───────────
• Gated Clocks (Clock Gating Cells)   -->  Clock is disabled during shift; flops cannot shift.
• Internally Divided Clocks (Counters) --> Tester cannot control clock edges directly.
• Inverted Asynchronous Resets       -->  Resets may be permanently tied active in test mode.
• Asynchronous Crossings (FIFO)       -->  Polarity mismatch disables scan shifting.
```

---

## 🔄 Stage Overview & Workflow

```text
  [RTL Sources: *.v, *.sv] + [Timing Library: slow.lib]
                             │
                             ▼
                 [Genus: RTL Elaboration]
                             │
                             ▼
             [Define Test Signals & Test Clock]
                             │
                             ▼
                  [Run 'check_dft_rules']
                             │
                             ▼
              [Output: drc_violations.rpt]
           (26 Violations Found, 0% Scannable)
```

---

## 🚀 How to Run This Stage

### Option A: Interactive Tcl Shell / GUI Mode
```bash
cd DFT/0_DRC_CHECK
genus
```
Inside the Genus shell:
```tcl
genus@root:> source drc_check.tcl
```

### Option B: Batch Mode (Command Line)
```bash
cd DFT/0_DRC_CHECK
genus -files drc_check.tcl -log genus_drc.log
```

---

## 📜 Line-by-Line Script Breakdown (`drc_check.tcl`)

Below is the complete explanation of each section in [drc_check.tcl](drc_check.tcl):

### 1. Environment & Library Paths Setup
```tcl
set DESIGN_NAME "TOP"                      ;# Top module name
set HDL_PATH    "../../RTL"                ;# Path to Verilog / SystemVerilog RTL files
set LIB_PATH    "../../../Library/timing"  ;# Path to .lib timing library
set LIB_LIST    "slow.lib"                 ;# Target corner library
```
- **Explanation**: Points Genus to the design sources and standard cell timing models (`slow.lib`, which represents the worst-case PVT operating corner).

### 2. Setting Database Search Paths
```tcl
set_db init_lib_search_path $LIB_PATH
set_db init_hdl_search_path $HDL_PATH
read_libs $LIB_LIST
```
- **Explanation**: Registers search paths into Genus database (`set_db`) and loads standard-cell timing/functionality definitions into memory with `read_libs`.

### 3. RTL Ingestion & Parameterized Elaboration
```tcl
read_hdl -sv [glob "$HDL_PATH/*.sv"] 
read_hdl -sv [glob "$HDL_PATH/*.v"] 

elaborate $DESIGN_NAME -parameters {8 4 16 2048 11}
check_design -unresolved
set_db auto_ungroup none
```
- **`read_hdl -sv`**: Parses all SystemVerilog and Verilog files in the RTL directory.
- **`elaborate $DESIGN_NAME -parameters {8 4 16 2048 11}`**: Builds the hierarchical generic design tree and resolves module parameter overrides:
  - `DATA_WIDTH = 8`
  - `ADDR_WIDTH = 4`
  - `RF_DEPTH = 16` (Register file depth)
  - `FIFO_DEPTH = 2048` (Async FIFO depth)
  - `FIFO_PTR_WIDTH = 11` ($\log_2(2048) = 11$)
- **`check_design -unresolved`**: Verifies that no sub-modules or black-boxes are missing.
- **`set_db auto_ungroup none`**: Preserves module hierarchy boundaries for easier debugging.

### 4. Scan Style Configuration
```tcl
set_db dft_scan_style muxed_scan
```
- **Explanation**: Specifies standard **MUXed Scan** style (multiplexed D-flip-flops with `ScanEnable` and `ScanIn` pins).

### 5. Defining Test Control Signals
```tcl
# Define Scan Enable (Shift Enable)
define_test_signal \
  -function shift_enable \
  -active high \
  -create_port \
  -default_shift_enable \
  ScanEnable

# Define Test Mode Control
define_test_signal \
  -function test_mode \
  -active high \
  -create_port \
  TestMode

# Define Asynchronous Reset
define_test_signal \
  -function async_set_reset \
  -active low \
  [get_ports RST_N]
```
- **`define_test_signal -function shift_enable`**: Declares that `ScanEnable` will toggle between shift mode (`1`) and capture mode (`0`). `-create_port` creates the top-level port if it does not already exist in RTL.
- **`define_test_signal -function test_mode`**: Declares `TestMode` as the global control signal used to gate asynchronous pins and bypass internal clocks during test.
- **`define_test_signal -function async_set_reset`**: Tells the DRC checker that `RST_N` is an active-low asynchronous reset pin.

### 6. Defining Scan Clocks
```tcl
define_test_clock \
    -name ScanClock \
    -function test_clock \
    -period 20000 \
    -controllable \
    [get_ports REF_CLK]
```
- **Explanation**: Informs the DFT engine that `REF_CLK` is a primary test clock with a period of 20,000 ps (50 MHz). The `-controllable` flag tells the tool that the ATE tester directly drives this clock port.

### 7. Running Rule Checks & Exporting Report
```tcl
check_dft_rules > drc_violations.rpt
```
- **Explanation**: Executes the formal DFT rule validation engine and redirects all findings to [drc_violations.rpt](drc_violations.rpt).

---

## 📊 Detailed Analysis of `drc_violations.rpt`

When you inspect [drc_violations.rpt](drc_violations.rpt), you will see the following executive summary:

```text
Detected 26 DFT rule violation(s)
	Summary of check_dft_rules
	**************************
	Number of usable scan cells: 44
Clock Rule Violations:
---------------------
	  Internally driven clock net: 0
	      Tied constant clock net: 2
	           Undriven clock net: 0
	Conflicting async & clock net: 0
	              Misc. clock net: 0

Async. set/reset Rule Violations:
--------------------------------
	Internally driven async net: 0
	      Tied active async net: 24
	         Undriven async net: 0
	            Misc. async net: 0

   Total number of DFT violations: 26

Total number of Test Clock Domains: 2
  DFT Test Clock Domain: ScanClock
  DFT Test Clock Domain: UART_CLK
	Test Clock 'UART_CLK' (Positive edge) has   3 registers
Number of user specified non-Scan registers:   0
    Number of registers that fail DFT rules: 8542
    Number of registers that pass DFT rules:   3
Percentage of total registers that are scannable:  0%
```

---

## 🔍 Understanding Rule Codes (`ASYNC-02` and `CLOCK-02`)

### 1. `ASYNC-02`: Async Signal Driven to Constant Active Value
- **What Happened**: 24 separate violations affecting **8,542 registers** (including 8,192 registers in the 2048-depth Async FIFO memory `FIFO_MEM_reg[0..2047][0..7]`, 137 registers in `Register_File`, and registers in UART FSMs).
- **Root Cause**: During test mode, the asynchronous clear/set pins (`aclr`) are evaluated as held in their active state or experiencing polarity inversion through combinatorial logic without being gated by `TestMode`. As a result, the flip-flops would remain permanently reset during test shifting, corrupting all scan data.
- **Affected Submodules**:
  - `fifo_mem` (8,192 flip-flops)
  - `Register_File` (137 flip-flops)
  - `SYS_CTRL` (24 flip-flops)
  - `BIT_SYNC` & `fifo_wr` / `fifo_rd` (88 flip-flops)
  - `UART_TX` & `UART_RX` submodules (51 flip-flops)
  - `ALU_16B` (17 flip-flops)

### 2. `CLOCK-02`: Clock Signal Driven to a Constant Value
- **Violation #0**: Net `z` on instance `U0_Integer_Clock_Divider_TX/mux_o_div_clk_69_7` (affects 71 registers).
  - **Root Cause**: The clock divider output multiplexer is driven by dynamic control logic that is unconstrained during test mode, causing Genus to evaluate the clock net as constant/undriven.
- **Violation #1**: Net `GATED_CLK` on instance `U0_CLK_GATE/U0_TLATNCAX12M/ECK` (affects 17 registers).
  - **Root Cause**: Integrated clock gating (ICG) latch enable is not forced open during scan shift, blocking the clock pulse from reaching downstream flip-flops.

---

## 🎯 Summary & Key Takeaways

| Metric | Stage 0 Value | Target for Scan Insertion |
|---|---|---|
| Total DFT Rule Violations | **26** | **0** |
| Usable Scan Cells | 44 | ~8,545 |
| Scannable Registers % | **0%** | **100%** |
| Passing Registers | 3 | 8,545 |
| Failing Registers | 8,542 | 0 |

> **Key Takeaway**: The raw RTL is functionally sound, but structurally impossible to test in silicon without DFT repair logic. 

---

## ➡️ Next Steps: Moving to Stage 1

In **Stage 1 (`1_DRC_FIX`)**, you will see how Cadence Genus automatically repairs all 26 violations by synthesizing test-bypass multiplexers controlled by `TestMode`, restoring **100% scannability** across all 8,545 registers.

👉 **Proceed to Stage 1:** [../1_DRC_FIX/README.md](../1_DRC_FIX/README.md)
