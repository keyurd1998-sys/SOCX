# Stage 6: IEEE 1149.1 JTAG Boundary Scan & Final SoC Tapeout Sign-Off

Welcome to **Stage 6**, the capstone stage of the SOCX DFT flow! In this stage, you will integrate the entire system into a production-ready chip package with **I/O Pad cells**, **IEEE 1149.1 JTAG TAP Controller**, **Boundary Scan Register (BSR)** cells, **On-Chip Scan Compression**, **Deterministic Test Points**, and **At-Speed Transition Delay ATPG** using **Cadence Genus** and **Cadence Modus**.

---

## 📑 Table of Contents

1. [Why JTAG and Boundary Scan are Indispensable](#-why-jtag-and-boundary-scan-are-indispensable)
2. [IEEE 1149.1 Architecture & TAP State Machine](#-ieee-11491-architecture--tap-state-machine)
3. [Top Wrapper & Physical Pad Ring Architecture](#-top-wrapper--physical-pad-ring-architecture)
4. [Stage Overview & Complete Flowchart](#-stage-overview--complete-flowchart)
5. [How to Run This Stage](#-how-to-run-this-stage)
6. [Line-by-Line Script Breakdown (`scan.tcl`)](#-line-by-line-script-breakdown-scantcl)
7. [Cadence Modus Sign-Off ATPG Walkthrough](#-cadence-modus-sign-off-atpg-walkthrough)
8. [Final Sign-Off Verification Checklist](#-final-sign-off-verification-checklist)
9. [Conclusion & Complete Flow Summary](#-conclusion--complete-flow-summary)

---

## 💡 Why JTAG and Boundary Scan are Indispensable

While internal scan chains test the core logic gates, a chip must also be tested once soldered onto a printed circuit board (PCB):
- **Problem**: Modern BGA (Ball Grid Array) packages place solder balls underneath the chip package, making physical oscilloscope/logic analyzer test probes impossible to attach.
- **Solution (IEEE 1149.1 Boundary Scan)**: Boundary scan cells are placed between every physical chip pin and the internal core logic. By shifting test data through a standardized 4/5-pin JTAG port, PCB-level solder opens, bridges, and board interconnects can be tested with 100% precision.

---

## 🔬 IEEE 1149.1 Architecture & TAP State Machine

```text
                               IEEE 1149.1 JTAG ARCHITECTURE
                               
                        +─────────────────────────────────────────+
                        │               TOP_WRAPPER               │
                        │                                         │
        PIN_TDI ───────>│───+───> [ Instruction Register (IR) ] ──┼───┐
        PIN_TMS ───────>│   │                                     │   │
        PIN_TCK ───────>│   ├───> [ 1-Bit Bypass Register ] ──────┼───┼───> PIN_TDO (Tri-State)
        PIN_TRST ──────>│   │                                     │   │
                        │   ├───> [ Boundary Scan Register (BSR)] ┼───┘
                        │   │     (Wraps all functional I/O pads) │
                        │   │                                     │
                        │   +───> [ TAP Controller FSM (16-State)]│
                        │                                         │
                        │         [ Internal Core: 100x Comp ]    │
                        +─────────────────────────────────────────+
```

### Standard Mandatory JTAG Instructions:
1. **`EXTEST` (`00`)**: Drives and samples physical chip I/O pads to test PCB-level wiring between different chips.
2. **`SAMPLE` (`01`)**: Samples pad signals during normal chip operation without interrupting system functionality.
3. **`PRELOAD` (`10`)**: Preloads known values into boundary scan cells before switching to EXTEST.
4. **`BYPASS` (`11`)**: Short-circuits TDI directly to TDO through a 1-bit shift register to allow rapid access to other daisy-chained chips on the board.

---

## 🏛️ Top Wrapper & Physical Pad Ring Architecture

In [RTL/TOP_WRAPPER.v](../../RTL/TOP_WRAPPER.v), the digital core is enclosed inside a full pad ring:
- **`PADDI`**: Input pads for `REF_CLK`, `UART_CLK`, `UART_RX_IN`, `RST_N`, `ScanIn_1/2`, `ScanEnable`, `TestMode`, `TCK`, `TMS`, `TDI`, `TRST`, and compression control signals.
- **`PADDO`**: Output pads for `UART_TX_O`, `parity_error`, `framing_error`, and `ScanOut_1/2`.
- **`PADDOZ`**: Dedicated 3-state output pad for `TDO`, active only when shifting JTAG data.

---

## 🔄 Stage Overview & Complete Flowchart

```text
  [TOP_WRAPPER.v + slow.lib + pads.lib]
                    │
                    ▼
     [Genus RTL Elaboration & Pad Preserving]
                    │
                    ▼
   [Define Package Test Signals & 3 Clocks]
                    │
                    ▼
      [Automated DRC Violation Fix]
                    │
                    ▼
      [syn_generic & syn_map Mapping]
                    │
                    ▼
   [JTAG IR & Instruction Definition (EXTEST, etc.)]
                    │
                    ▼
      [add_jtag_macro & add_jtag_boundary_scan]
                    │
                    ▼
  [compress_scan_chains (100x XOR + Wide1 Mask)]
                    │
                    ▼
    [Deterministic Test Point Insertion (TPI)]
                    │
                    ▼
       [connect_scan_chains -auto_create]
                    │
                    ▼
           [syn_opt Optimization]
                    │
                    ▼
  [write_dft_atpg -compression -delay ...]
                    │
                    ▼
   [Modus Sign-Off ATPG (Delay + Stuck-At)]
```

---

## 🚀 How to Run This Stage

### Option A: Interactive Tcl Shell
```bash
cd DFT/6_INSERT_JTAG_LOGIC
genus
```
Inside Genus:
```tcl
genus@root:> source scan.tcl
```

### Option B: Batch Mode
```bash
cd DFT/6_INSERT_JTAG_LOGIC
genus -files scan.tcl -log genus_jtag.log
```

### Running Modus Sign-Off ATPG Standalone
```bash
cd DFT/6_INSERT_JTAG_LOGIC/TOP_WRAPPER_ATPG
modus -files runmodus.atpg.tcl -log modus_signoff.log
```

---

## 📜 Line-by-Line Script Breakdown (`scan.tcl`)

### 1. Library Loading & Pad Cell Preservation
```tcl
set DESIGN_NAME "TOP_WRAPPER"
set HDL_PATH    [file normalize "../../RTL"]
set SCRIPT_PATH [file normalize "../../CONSTRAINTS"]
set LIB_PATH    [file normalize "../../../Library/timing"]
set LIB_LIST    "slow.lib pads_FF_s1vg.lib"
set EFFORT      "high"
set VERILOG_LIB "[file normalize ../../../Library/verilog/typical.v] [file normalize ../../../Library/verilog/pads.v]"

read_libs $LIB_LIST
read_hdl -sv [glob "$HDL_PATH/*.sv"] 
read_hdl -sv [glob "$HDL_PATH/*.v"] 
elaborate $DESIGN_NAME
check_design -unresolved
set_db auto_ungroup none

# PRESERVE ALL FLOATING DFT & JTAG PADS
set_db [get_cells {pad_tck pad_tms pad_tdi pad_tdo pad_trst pad_si_1 pad_si_2 pad_so_1 pad_so_2 pad_se pad_tm pad_comp_en pad_spread_en pad_mask_en pad_mask_load pad_mask_clk}] .preserve true
```
- **`set_db ... .preserve true`**: Crucial command that prevents the synthesis optimizer from deleting unconnected pad buffers.

### 2. Constraints & Package Test Clocks
```tcl
source TOP_cons.tcl

# Define 3 Package Test Clocks
define_test_clock -name ScanClock      -function test_clock -period 20000 -controllable [get_ports PIN_REF_CLK]
define_test_clock -name UART_TestClock -function test_clock -period 20000 -controllable [get_ports PIN_UART_CLK]
define_test_clock -name MaskClock      -function test_clock -period 20000 -controllable [get_ports PIN_mask_clk]
set_compatible_test_clocks -all
```

### 3. JTAG TAP & Boundary Scan Insertion
```tcl
puts "INFO: Building JTAG TAP Controller and Boundary Scan..."

# 1. Create Instruction Register (IR)
define_jtag_instruction_register -name JTAG_IR 

# 2. Define IEEE 1149.1 Opcodes
define_jtag_instruction -name EXTEST  -opcode 00
define_jtag_instruction -name SAMPLE  -opcode 01
define_jtag_instruction -name PRELOAD -opcode 10
define_jtag_instruction -name BYPASS  -opcode 11

# 3. Instantiate JTAG TAP Macro
add_jtag_macro \
    -tck  [get_ports PIN_TCK] \
    -tms  [get_ports PIN_TMS] \
    -tdi  [get_ports PIN_TDI] \
    -tdo  [get_ports PIN_TDO] \
    -trst [get_ports PIN_TRST]

# 4. Wrap Physical Pins in Boundary Scan Cells
add_jtag_boundary_scan -exclude_ports {PIN_comp_en PIN_spread_en PIN_mask_en PIN_mask_load PIN_mask_clk}
```
- **`add_jtag_macro`**: Synthesizes the 16-state TAP Controller state machine and hooks up the JTAG test pins.
- **`add_jtag_boundary_scan`**: Wraps all functional package pins in boundary scan cells.

### 4. Scan Compression Insertion
```tcl
# Compression Control Signals
define_test_signal -function test_mode -active high [get_ports PIN_comp_en]
define_test_signal -function test_mode -active high [get_ports PIN_spread_en]
define_test_signal -function test_mode -active high [get_ports PIN_mask_en]
define_test_signal -function test_mode -active high [get_ports PIN_mask_load]

# Insert 100x XOR Compression with Masking
compress_scan_chains \
    -ratio 100 \
    -compressor xor \
    -decompressor xor \
    -mask wide1 \
    -compression_enable PIN_comp_en \
    -spread_enable PIN_spread_en \
    -mask_enable PIN_mask_en \
    -mask_load PIN_mask_load \
    -mask_clock PIN_mask_clk
```

### 5. Test Point Insertion & Delay Fault ATPG Export
```tcl
# TPI Analysis & Insertion
analyze_atpg_testability -directory $TP_DIR -library $VERILOG_LIB [current_design]
write_dft_compression_test_points -library $VERILOG_LIB
exec modus -files ./test_scripts/runmodus.dfa.tcl
add_analyzed_test_points -input_test_point_file ./test_scripts/${DESIGN_NAME}.dfa.tpfile

# Re-Stitch Chains & Incremental Optimization
connect_scan_chains -auto_create
syn_opt

# Export Netlist and ATPG with Delay Test Support (-delay)
write_netlist > $NETLIST_DIR/${DESIGN_NAME}_Scan_Netlist.v
write_sdc >     $NETLIST_DIR/${DESIGN_NAME}_mapped.sdc
write_dft_atpg -compression -delay -library $VERILOG_LIB -directory $ATPG_DIR -generate_config_file [current_design]
```

---

## 🔬 Cadence Modus Sign-Off ATPG Walkthrough

The sign-off script [TOP_WRAPPER_ATPG/runmodus.atpg.tcl](TOP_WRAPPER_ATPG/runmodus.atpg.tcl) generates complete manufacturing test suites:

1. **`build_faultmodel -includedynamic yes`**: Activates both static stuck-at and dynamic **Transition Delay** fault models.
2. **`create_logic_delay_tests`**: Generates at-speed launch-on-capture (LOC) clock pulses to detect nanosecond timing defects.
3. **`create_logic_tests -append yes`**: Appends static stuck-at test patterns.
4. **`write_toggle_gram`**: Profiles switching activity during scan shifting to verify that current surges do not exceed package power limits.
5. **`report_fault_statistics`**: Outputs the final test coverage summary report.

---

## ✅ Final Sign-Off Verification Checklist

Before releasing a netlist to tapeout and ATE test generation, verify all criteria:

- [x] **0 DFT Rule Violations** in pre-scan and post-scan checks (`drc_violations_after_fix.rpt`).
- [x] **100% Scannability** across all functional registers.
- [x] **All Pad Cells Preserved** without accidental logic optimization.
- [x] **IEEE 1149.1 JTAG TAP Controller** verified with `EXTEST`, `SAMPLE`, `PRELOAD`, `BYPASS`.
- [x] **100x Scan Compression** operational with Wide-1 X-masking on 2 physical channel pins.
- [x] **Deterministic Test Points** integrated and scan chains re-balanced.
- [x] **> 99.9% Stuck-At Test Coverage** and **> 95% Transition Delay Coverage** in Cadence Modus.
- [x] **Serial & Parallel Verilog Simulation Testbenches** generated and passing without mismatches.

---

## 🎓 Conclusion & Complete Flow Summary

Congratulations! You have completed the full **SOCX Design-for-Test (DFT)** implementation journey:

```text
  ┌───────────────┐     ┌───────────────┐     ┌───────────────┐
  │  Stage 0 & 1  │ ──> │    Stage 2    │ ──> │    Stage 3    │
  │ DRC Check/Fix │     │ 80-Chain Scan │     │ Test Points   │
  └───────────────┘     └───────────────┘     └───────────────┘
                                                      │
  ┌───────────────┐     ┌───────────────┐             │
  │    Stage 6    │ <── │  Stage 4 & 5  │ <───────────┘
  │ JTAG Tapeout  │     │ 100x Compress │
  └───────────────┘     └───────────────┘
```

You now possess the foundational knowledge and practical hands-on scripting skills to implement, optimize, and sign off industrial-grade DFT flows using **Cadence Genus** and **Cadence Modus**!
