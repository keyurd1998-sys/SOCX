# Stage 1: Automated DFT Rule Violation Repair

Welcome to **Stage 1** of the SOCX DFT flow! In this stage, you will learn how **Cadence Genus Synthesis Solution** automatically repairs the 26 testability violations detected in Stage 0, transforming a non-testable design into a **100% scannable** architecture.

---

## 📑 Table of Contents

1. [The Philosophy of Automated DFT Repair](#-the-philosophy-of-automated-dft-repair)
2. [How Genus Fixes DRC Violations Under the Hood](#-how-genus-fixes-drc-violations-under-the-hood)
3. [Stage Overview & Workflow](#-stage-overview--workflow)
4. [How to Run This Stage](#-how-to-run-this-stage)
5. [Line-by-Line Script Breakdown (`drc_fix.tcl`)](#-line-by-line-script-breakdown-drc_fixtcl)
6. [Detailed Analysis of `drc_violations_after_fix.rpt`](#-detailed-analysis-of-drc_violations_after_fixrpt)
7. [Comparison: Stage 0 (Before Fix) vs. Stage 1 (After Fix)](#-comparison-stage-0-before-fix-vs-stage-1-after-fix)
8. [Summary & Key Takeaways](#-summary--key-takeaways)
9. [Next Steps: Moving to Stage 2](#-next-steps-moving-to-stage-2)

---

## 💡 The Philosophy of Automated DFT Repair

In Stage 0, we discovered that 8,542 registers (99.96% of the design) failed DFT rules due to uncontrollable clocks and active asynchronous resets.

There are two ways to solve these violations:
1. **Manual RTL Redesign**: Modify the original Verilog/SystemVerilog source files to insert test multiplexers around every clock divider and reset branch.
   - *Downside*: Risky, error-prone, clutters functional RTL code, and can introduce functional bugs.
2. **Tool-Driven Automated Repair (`fix_dft_violations`)**: Let Cadence Genus automatically insert test-gating multiplexers into the generic netlist during synthesis, controlled by the `TestMode` signal.
   - *Advantage*: Zero risk to functional RTL, fully automated, and standard practice in semiconductor design houses.

---

## ⚙️ How Genus Fixes DRC Violations Under the Hood

### 1. Asynchronous Reset Repair (`-async_reset`)
Functional RTL often generates internal reset pulses or uses active-low resets that become active during test mode. Genus inserts an OR/AND gate or MUX controlled by `TestMode`:

```text
  Functional Reset Net ─────+
                            │   +---+
                            ├───| 0 |
                                |   |-----> Flip-Flop Async Reset Pin (aclr)
  Inactive State (e.g. 1) ──────| 1 |
                                +---+
                                  │
                              TestMode
```
- When `TestMode = 0` (Normal Functional Mode): Functional reset controls the flop.
- When `TestMode = 1` (DFT Test Mode): The reset pin is tied to its inactive state (`1`), preventing unexpected resets during scan shift.

### 2. Clock Bypass Repair (`-clock`)
For internally divided clocks (e.g., in `Integer_Clock_Divider`) or gated clocks (in `CLK_GATE`), Genus inserts a test clock bypass multiplexer:

```text
  Internal Divided Clock ───+
                            │   +---+
                            ├───| 0 |
                                |   |-----> Clock Distribution Net to Flops
  Primary Test Clock ───────────| 1 |
  (e.g., ScanClock)             +---+
                                  │
                              TestMode
```
- When `TestMode = 1`: The primary tester clock directly drives all downstream flip-flops, giving ATE 100% deterministic clock edge control.

---

## 🔄 Stage Overview & Workflow

```text
  [RTL Sources] + [slow.lib]
        │
        ▼
  [Genus Elaboration]
        │
        ▼
  [Define Test Signals & Clocks]
        │
        ▼
  [Initial 'check_dft_rules' (26 Violations)]
        │
        ▼
  [fix_dft_violations -async_reset -test_control TestMode]
  [fix_dft_violations -async_set   -test_control TestMode]
  [fix_dft_violations -clock       -test_control TestMode]
        │
        ▼
  [Re-run 'check_dft_rules']
        │
        ▼
  [Output: drc_violations_after_fix.rpt]
  (0 Violations Found, 100% Scannable!)
```

---

## 🚀 How to Run This Stage

### Option A: Interactive Tcl Shell / GUI Mode
```bash
cd DFT/1_DRC_FIX
genus
```
Inside the Genus shell:
```tcl
genus@root:> source drc_fix.tcl
```

### Option B: Batch Mode (Command Line)
```bash
cd DFT/1_DRC_FIX
genus -files drc_fix.tcl -log genus_fix.log
```

---

## 📜 Line-by-Line Script Breakdown (`drc_fix.tcl`)

Below is the complete explanation of each command in [drc_fix.tcl](drc_fix.tcl):

### 1. Environment & Setup
```tcl
set DESIGN_NAME "TOP"                      ;# Top module name
set HDL_PATH    "../../RTL"                ;# RTL file path
set LIB_PATH    "../../../Library/timing"  ;# Library search path
set LIB_LIST    "slow.lib"                 ;# Target timing library

set_db init_lib_search_path $LIB_PATH
set_db init_hdl_search_path $HDL_PATH
read_libs $LIB_LIST
```
- Identical to Stage 0: sets up paths and loads `slow.lib`.

### 2. RTL Ingestion & Elaboration
```tcl
read_hdl -sv [glob "$HDL_PATH/*.sv"] 
read_hdl -sv [glob "$HDL_PATH/*.v"] 

elaborate $DESIGN_NAME -parameters {8 4 16 2048 11}
check_design -unresolved
set_db auto_ungroup none
```
- Elaborates the parameterized SOCX design hierarchy without ungrouping.

### 3. Test Signal and Clock Configuration
```tcl
set_db dft_scan_style muxed_scan

define_test_signal \
  -function shift_enable \
  -active high \
  -create_port \
  -default_shift_enable \
  ScanEnable

define_test_signal \
  -function test_mode \
  -active high \
  -create_port \
  TestMode

define_test_signal \
  -function async_set_reset \
  -active low \
  [get_ports RST_N]

define_test_clock \
    -name ScanClock \
    -function test_clock \
    -period 20000 \
    -controllable \
    [get_ports REF_CLK]
```

### 4. Running Pre-Fix Diagnostic Check
```tcl
check_dft_rules
```
- Verifies initial rule status in the console log (confirms 26 violations).

### 5. Automated Violation Repair Commands
```tcl
# Fix asynchronous reset violations
fix_dft_violations -async_reset -test_control TestMode

# Fix asynchronous set violations
fix_dft_violations -async_set -test_control TestMode

# Fix clock controllability violations
fix_dft_violations -clock -test_control TestMode
```
- **`-async_reset`**: Directs Genus to insert test-gating logic on all asynchronous reset nets that violated `ASYNC-02`.
- **`-async_set`**: Handles any asynchronous preset nets.
- **`-clock`**: Inserts clock-bypass multiplexers on internally generated, gated, or undivided clock branches that violated `CLOCK-02`.
- **`-test_control TestMode`**: Specifies that the `TestMode` port is the primary control signal enabling these bypass multiplexers when set to `1`.

### 6. Verification and Exporting Clean Report
```tcl
check_dft_rules > drc_violations_after_fix.rpt
```
- Re-evaluates design rules after the fixes are synthesized into the netlist and dumps the verified clean status.

---

## 📊 Detailed Analysis of `drc_violations_after_fix.rpt`

Let's inspect [drc_violations_after_fix.rpt](drc_violations_after_fix.rpt):

```text
Detected 0 DFT rule violation(s)
	Summary of check_dft_rules
	**************************
	Number of usable scan cells: 44
Clock Rule Violations:
---------------------
	  Internally driven clock net: 0
	      Tied constant clock net: 0
	           Undriven clock net: 0
	Conflicting async & clock net: 0
	              Misc. clock net: 0

Async. set/reset Rule Violations:
--------------------------------
	Internally driven async net: 0
	      Tied active async net: 0
	         Undriven async net: 0
	            Misc. async net: 0

   Total number of DFT violations: 0

Total number of Test Clock Domains: 2
  DFT Test Clock Domain: ScanClock
	Test Clock 'ScanClock' (Positive edge) has 8428 registers
  DFT Test Clock Domain: UART_CLK
	Test Clock 'UART_CLK' (Positive edge) has 117 registers
Number of user specified non-Scan registers:   0
    Number of registers that fail DFT rules:   0
    Number of registers that pass DFT rules: 8545
Percentage of total registers that are scannable: 100%
```

### Key Highlights:
1. **Total Violations = 0**: All 24 async violations and 2 clock violations are completely resolved.
2. **Registers Passing DFT Rules = 8,545**: Every single sequential element in the SoC is now capable of scan insertion.
3. **Scannability = 100%**: Zero registers fail DFT rules.
4. **Clock Domain Breakdown**:
   - `ScanClock` Domain: **8,428 registers** (driven by reference clock / system clock).
   - `UART_CLK` Domain: **117 registers** (UART baud-rate and interface logic).

---

## ⚖️ Comparison: Stage 0 (Before Fix) vs. Stage 1 (After Fix)

| Attribute / Parameter | Stage 0 (Raw RTL Check) | Stage 1 (Automated Fix) | Impact on Design |
|---|---|---|---|
| **Total Violations** | 26 | **0** | Clean signoff for scan insertion |
| **Clock Violations** | 2 | **0** | Clock nets fully controllable by ATE |
| **Async Reset Violations** | 24 | **0** | Resets safely deactivated during shift |
| **Passing Registers** | 3 | **8,545** | Full visibility into all internal state |
| **Failing Registers** | 8,542 | **0** | No un-testable blind spots |
| **Scannability** | **0%** | **100%** | Ready for full-scan synthesis |

---

## 🎯 Summary & Key Takeaways

1. Automated DFT violation repair with `fix_dft_violations` eliminates manual RTL surgery.
2. The `TestMode` port cleanly isolates functional operation from ATE manufacturing test mode.
3. With 100% scannability achieved, the design is now fully qualified for scan chain synthesis and ATPG pattern generation.

---

## ➡️ Next Steps: Moving to Stage 2

In **Stage 2 (`2_SCAN_INITIAL`)**, you will synthesize the design to technology gates (`slow.lib`), configure **80 parallel scan chains**, stitch all 8,545 flip-flops, and generate your first full-scan ATPG test vectors using **Cadence Modus**!

👉 **Proceed to Stage 2:** [../2_SCAN_INITIAL/README.md](../2_SCAN_INITIAL/README.md)
