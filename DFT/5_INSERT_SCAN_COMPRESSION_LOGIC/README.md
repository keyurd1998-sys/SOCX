# Stage 5: Scan Compression Logic Insertion and Compressed ATPG

Welcome to **Stage 5** of the SOCX DFT flow! In this stage, you will implement the optimal **$100\times$ on-chip scan compression architecture** selected in Stage 4, synthesize the compression hardware (XOR decompressor, wide-1 X-masking, and XOR compressor), and generate compressed test patterns using **Cadence Modus**.

---

## 📑 Table of Contents

1. [From Analysis to Physical Implementation](#-from-analysis-to-physical-implementation)
2. [Compression Hardware Architecture (100x XOR + Wide1 Mask)](#-compression-hardware-architecture-100x-xor--wide1-mask)
3. [Stage Overview & Complete Flowchart](#-stage-overview--complete-flowchart)
4. [How to Run This Stage](#-how-to-run-this-stage)
5. [Line-by-Line Script Breakdown (`scan.tcl`)](#-line-by-line-script-breakdown-scantcl)
6. [Cadence Modus Compressed ATPG Walkthrough](#-cadence-modus-compressed-atpg-walkthrough)
7. [In-Depth Report & Metric Interpretation](#-in-depth-report--metric-interpretation)
8. [Summary & Key Takeaways](#-summary--key-takeaways)
9. [Next Steps: Moving to Stage 6](#-next-steps-moving-to-stage-6)

---

## 💡 From Analysis to Physical Implementation

In Stage 4, compressibility analysis proved that a **100x compression ratio** reduces test application time by **$22.4\times$ to $53.0\times$** while maintaining **> 99.9%** fault coverage with only 1,205 gates of area overhead.

In Stage 5, we use the `compress_scan_chains` command in Cadence Genus to physically instantiate this compression logic into the gate netlist.

---

## 🔬 Compression Hardware Architecture (100x XOR + Wide1 Mask)

```text
               100x COMPRESSED SCAN ARCHITECTURE
               
               +───────────────────────────────────────────────────────────+
               │                                                           │
ScanIn_1 ─────>│──+───> [ XOR Decompressor ] ──> Internal Chains (1..200)  │
ScanIn_2 ─────>│──┘                              (Each Chain: ~43 Flops)   │
               │                                            │              │
               │                                            ▼              │
               │                                  [ Wide-1 Masking Logic ] │
               │                                            │              │
               │                                            ▼              │
ScanOut_1 <────│──────── [ XOR Compressor ] <───────────────┘              │
ScanOut_2 <────│─────────┘                                                 │
               +───────────────────────────────────────────────────────────+
```

### Key Components:
1. **2 External Tester Channels**: Stimulus is delivered serially across `ScanIn_1` and `ScanIn_2`.
2. **XOR Decompressor Network**: Linear combinational expansion network driving 200 short internal scan chains.
3. **200 Internal Scan Chains**: Max channel length is reduced from 4,248 flops down to only **43 flip-flops**!
4. **Wide-1 X-Masking**: Selectively masks uninitialized or unknown states (`X`) on any internal scan chain to ensure the XOR compressor produces deterministic fault signatures.
5. **XOR Spatial Compressor**: Compacts the 200 internal chain outputs back into 2 external `ScanOut_1` and `ScanOut_2` channels.

---

## 🔄 Stage Overview & Complete Flowchart

```text
  [RTL + Constraints + slow.lib]
                │
                ▼
      [Genus RTL Elaboration]
                │
                ▼
  [Define 2 Scan Channels & Test Clocks]
                │
                ▼
    [Automated DRC Violation Fix]
                │
                ▼
       [syn_generic & syn_map]
                │
                ▼
  [compress_scan_chains -ratio 100 ...]  <── (Instantiates Compressor & Masking)
                │
                ▼
      [syn_opt Optimization]
                │
                ▼
  [write_dft_atpg -compression ...]       <── (Generates Modus Compressed ATPG setup)
                │
                ▼
  [Modus ATPG: runmodus.atpg.tcl]         <── (Generates Compressed Test Patterns)
```

---

## 🚀 How to Run This Stage

### Option A: Interactive Tcl Shell
```bash
cd DFT/5_INSERT_SCAN_COMPRESSION_LOGIC
genus
```
Inside Genus:
```tcl
genus@root:> source scan.tcl
```

### Option B: Batch Mode
```bash
cd DFT/5_INSERT_SCAN_COMPRESSION_LOGIC
genus -files scan.tcl -log genus_comp_insert.log
```

### Running Modus ATPG Standalone
```bash
cd DFT/5_INSERT_SCAN_COMPRESSION_LOGIC/TOP_ATPG
modus -files runmodus.atpg.tcl -log modus_compressed_atpg.log
```

---

## 📜 Line-by-Line Script Breakdown (`scan.tcl`)

### 1. External Scan Ports & Test Clocks Setup
```tcl
set DESIGN_NAME "TOP"
set WORK_DIR    "${DESIGN_NAME}_Scan"
set REPORT_DIR  "$WORK_DIR/Report"
set NETLIST_DIR "$WORK_DIR/Netlist"
set ATPG_DIR    "${DESIGN_NAME}_ATPG"

# Define 2 Physical External Channels
set NUM_SCAN_CHAINS 2
for {set i 1} {$i <= $NUM_SCAN_CHAINS} {incr i} {
    create_port -direction in  -name ScanIn_$i 
    create_port -direction out -name ScanOut_$i 
    define_scan_chain -name chain_$i -sdi [get_ports ScanIn_$i] -sdo [get_ports ScanOut_$i]
}

# Multi-Clock Configuration
define_test_clock -name ScanClock      -function test_clock -period 20000 -controllable [get_ports REF_CLK]
define_test_clock -name UART_TestClock -function test_clock -period 20000 -controllable [get_ports UART_CLK]
set_compatible_test_clocks -all
```

### 2. DRC Violation Repair & Tech Mapping
```tcl
check_dft_rules
fix_dft_violations -async_reset -test_control TestMode
fix_dft_violations -async_set -test_control TestMode
fix_dft_violations -clock -test_control TestMode

syn_generic
syn_map
```

### 3. Inserting Scan Compression Hardware
```tcl
set_db [current_design] .dft_min_number_of_scan_chains $NUM_SCAN_CHAINS
connect_scan_chains -auto_create

compress_scan_chains \
    -ratio 100 \
    -compressor xor \
    -decompressor xor \
    -mask wide1 \
    -auto_create
```
- **`-ratio 100`**: Targets a $100\times$ compression factor.
- **`-compressor xor` / `-decompressor xor`**: Uses standard XOR tree logic networks.
- **`-mask wide1`**: Builds Wide-1 X-masking registers to prevent `X`-propagation from corrupting compressor outputs.
- **`-auto_create`**: Automatically configures the 200 internal short scan chains and connects them to the decompressor and compressor.

### 4. Incremental Optimization & ATPG Export
```tcl
set_db syn_opt_effort $EFFORT
syn_opt

write_netlist > $NETLIST_DIR/${DESIGN_NAME}_Scan_Netlist.v
write_sdc >     $NETLIST_DIR/${DESIGN_NAME}_mapped.sdc

# Export compressed ATPG data for Cadence Modus
write_dft_atpg -compression -library $VERILOG_LIB -directory $ATPG_DIR -generate_config_file [current_design]

# Launch Modus ATPG
puts "Running Modus ATPG..."
exec modus -files $ATPG_DIR/runmodus.atpg.tcl
```

---

## 🔬 Cadence Modus Compressed ATPG Walkthrough

The exported Modus script [TOP_ATPG/runmodus.atpg.tcl](TOP_ATPG/runmodus.atpg.tcl) configures multiple test modes:

1. **`build_testmode -testmode COMPRESSION_DECOMP`**: Primary mode using both the on-chip XOR decompressor and compressor.
2. **`build_testmode -testmode COMPRESSION`**: Secondary compressed mode for direct channel shifting.
3. **`build_testmode -testmode FULLSCAN`**: Uncompressed legacy mode used for top-off patterns to achieve 100% total fault coverage.
4. **`verify_test_structures`**: Verifies scan chains, mask control registers, and compressor XOR observability paths.
5. **`create_logic_tests`**: Generates compact test patterns targeting static stuck-at faults.
6. **`write_vectors -scanformat serial / parallel`**: Outputs Verilog testbenches for post-synthesis gate-level simulation.

---

## 📊 In-Depth Report & Metric Interpretation

| Metric | Stage 2 (Uncompressed) | Stage 5 (Compressed 100x) | Improvement |
|---|---|---|---|
| **External Scan Channels** | 80 In / 80 Out (160 Pins) | **2 In / 2 Out (4 Pins)** | **97.5% fewer package pins** |
| **Max Channel Length (CL)** | 107 Flops | **43 Flops** | **60% shorter shift path** |
| **Total Test Cycles** | ~10.4 Million | **~467 Thousand** | **22.4x Faster ATE Execution** |
| **Stuck-At Fault Coverage** | 99.99% | **99.99%** | **Identical High Quality** |
| **Hardware Overhead** | Baseline | +1,205 Gates ($< 1\%$) | Minimal silicon cost |

---

## 🎯 Summary & Key Takeaways

1. The **100x scan compression logic** was successfully synthesized and verified.
2. Only **4 tester pins** (`ScanIn_1/2`, `ScanOut_1/2`) are required to achieve **> 99.9% fault coverage**.
3. ATE test time is reduced from millions of cycles down to under 500k cycles, drastically slashing manufacturing test costs.

---

## ➡️ Next Steps: Moving to Stage 6

Now that our core logic is fully testable and compressed, we need to integrate the core into a real ASIC package with **I/O Pad cells**, **Delay Fault Testing**, and **IEEE 1149.1 JTAG Boundary Scan** for board-level test access.

👉 **Proceed to Stage 6:** [../6_INSERT_JTAG_LOGIC/README.md](../6_INSERT_JTAG_LOGIC/README.md)
