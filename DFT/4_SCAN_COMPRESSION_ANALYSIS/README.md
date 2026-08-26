# Stage 4: Scan Compression Analysis and Trade-Off Exploration

Welcome to **Stage 4** of the SOCX DFT flow! In this stage, you will use **Cadence Genus** to analyze on-chip **Scan Compression architectures** across multiple compression ratios ($60\times$ to $200\times$) and determine the optimal trade-off between test time, data volume, and silicon area overhead.

---

## 📑 Table of Contents

1. [The Challenge of Limited Tester Pins](#-the-challenge-of-limited-tester-pins)
2. [How On-Chip Scan Compression Works](#-how-on-chip-scan-compression-works)
3. [Multi-Clock Domain Shift Compatibility](#-multi-clock-domain-shift-compatibility)
4. [How to Run This Stage](#-how-to-run-this-stage)
5. [Line-by-Line Script Breakdown (`scan.tcl`)](#-line-by-line-script-breakdown-scantcl)
6. [In-Depth Analysis of `TOP_scan_compressibility.rpt`](#-in-depth-analysis-of-top_scan_compressibilityrpt)
7. [Why 100x Compression is the Optimal Sweet Spot](#-why-100x-compression-is-the-optimal-sweet-spot)
8. [Summary & Key Takeaways](#-summary--key-takeaways)
9. [Next Steps: Moving to Stage 5](#-next-steps-moving-to-stage-5)

---

## 💡 The Challenge of Limited Tester Pins

In Stage 2, we used 80 parallel scan chains (`ScanIn_1..80` and `ScanOut_1..80`), requiring **160 dedicated package pins** just for scan data!
In practical IC packaging:
- A chip package rarely has 160 spare pins for testing. Most low-cost packages can only spare **2 to 4 pin pairs** for scan test.
- If we stitch all 8,545 flip-flops into just **2 physical scan chains**, the channel length explodes to **4,248 flip-flops per chain**.
- Shifting 4,248 flip-flops for every test pattern requires over **10.4 million test clock cycles**, making ATE testing prohibitively expensive.

**The Solution: On-Chip Scan Compression (EDT / XOR Compressor-Decompressor).**

---

## 🔬 How On-Chip Scan Compression Works

Scan compression allows a small number of external tester channels (e.g., 2 `ScanIn` pins) to drive hundreds of short internal scan chains simultaneously:

```text
                           ON-CHIP SCAN COMPRESSION ARCHITECTURE
                           
                 +────────────────────────────────────────────────────────+
                 │                                                        │
                 │   +──────────────+     +──────────────────────────+    │
                 │   │              │────>│ Internal Chain 1 (43 FF) │───┐│
                 │   │   On-Chip    │────>│ Internal Chain 2 (43 FF) │───┼┤
  ScanIn_1 ─────>│──>│ Decompressor │ .   │           ...            │   ││   +────────────+
  ScanIn_2 ─────>│──>│  (XOR Tree)  │────>│ Internal Chain K (43 FF) │───┼┼──>│  On-Chip   │───> ScanOut_1
                 │   │              │     +──────────────────────────+   ││   │ Compressor │───> ScanOut_2
                 │   +──────────────+                  ▲                 ││   │ (XOR Tree) │
                 │                                     │                 ││   +────────────+
                 │                        [Wide-1 X-Masking Logic]───────┴┘
                 +────────────────────────────────────────────────────────+
```

1. **On-Chip Decompressor (XOR Network)**: Expands 2 incoming serial bitstreams into 200 short internal scan chains.
2. **Short Internal Chains**: Channel length drops from 4,248 down to only **43 flip-flops**!
3. **On-Chip Compressor (XOR Tree)**: Compacts the 200 chain outputs back into 2 outgoing `ScanOut` tester channels.
4. **X-Masking**: Prevents unknown states (`X`) from propagating into the compressor XOR tree and masking valid fault signatures.

---

## 🕒 Multi-Clock Domain Shift Compatibility

The SOCX design contains two distinct clock domains: `REF_CLK` (System Clock) and `UART_CLK` (UART Clock).
To allow both clock domains to shift simultaneously during compressed test mode, Genus requires:

```tcl
set_compatible_test_clocks -all
```
This tells the synthesis tool that clock skews between test clocks are managed during scan shifting, allowing flip-flops across different clock domains to share the decompressor/compressor network.

---

## 🚀 How to Run This Stage

### Option A: Interactive Tcl Shell
```bash
cd DFT/4_SCAN_COMPRESSION_ANALYSIS
genus
```
Inside Genus:
```tcl
genus@root:> source scan.tcl
```

### Option B: Batch Mode
```bash
cd DFT/4_SCAN_COMPRESSION_ANALYSIS
genus -files scan.tcl -log genus_comp_analysis.log
```

---

## 📜 Line-by-Line Script Breakdown (`scan.tcl`)

### 1. Working Directories & Multi-Clock Setup
```tcl
set DESIGN_NAME "TOP"
set WORK_DIR    "${DESIGN_NAME}_Scan"
set REPORT_DIR  "$WORK_DIR/Report"
set COMP_REPORT_DIR "Compression_Report"
set COMP_DIR    "Compression_Analysis"

file mkdir $WORK_DIR
file mkdir $REPORT_DIR
file mkdir $COMP_REPORT_DIR
file mkdir $COMP_DIR
```

### 2. Defining 2 External Scan Channels
```tcl
set NUM_SCAN_CHAINS 2

for {set i 1} {$i <= $NUM_SCAN_CHAINS} {incr i} {
    create_port -direction in  -name ScanIn_$i 
    create_port -direction out -name ScanOut_$i 
    define_scan_chain -name chain_$i -sdi [get_ports ScanIn_$i] -sdo [get_ports ScanOut_$i]
}
```
- Restricts external test I/O to only 2 `ScanIn` and 2 `ScanOut` ports.

### 3. Declaring Both Test Clocks & Multi-Clock Compatibility
```tcl
# Master System Test Clock
define_test_clock -name ScanClock -function test_clock -period 20000 -controllable [get_ports REF_CLK]

# Dedicated UART Test Clock (Matched Period)
define_test_clock -name UART_TestClock -function test_clock -period 20000 -controllable [get_ports UART_CLK]

# Enable synchronous shifting across domains
set_compatible_test_clocks -all
```

### 4. Running Compressibility Sweep Analysis
```tcl
puts "INFO: Starting Scan Compressibility Analysis Setup..."

analyze_scan_compressibility \
    -ratios {60 80 100 120 150 200} \
    -compressor xor \
    -compression_method compress_scan_chains \
    -library $VERILOG_LIB \
    -directory $COMP_DIR 

report_scan_compressibility -directory $COMP_DIR > $COMP_REPORT_DIR/${DESIGN_NAME}_scan_compressibility.rpt
```
- **`-ratios {60 80 100 120 150 200}`**: Sweeps 6 target compression configurations.
- **`-compressor xor`**: Uses standard XOR spatial compression logic.
- **`report_scan_compressibility`**: Dumps the complete comparative trade-off matrix.

---

## 📊 In-Depth Analysis of `TOP_scan_compressibility.rpt`

Let's examine the actual results generated in [Compression_Report/TOP_scan_compressibility.rpt](Compression_Report/TOP_scan_compressibility.rpt):

```text
----------------------------------------
 Results of analyze_scan_compressibility
----------------------------------------
	Design       - TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11
	Decompressor - xor
	Compressor   - xor
	Mask         - wide1

Achieved compression table with fullscan top-off vectors
--------------------------------------------------------
IC    TATR   TDVR    ATCov.   CL       PAT-comp  PAT-fs    Cycles        Runtime    Gatecount    Area
-----------------------------------------------------------------------------------------------------
fs    1.0    1.0     99.99%   4248     -         2461      10475125      00:00:45   -            -
60    21.9   21.9    99.99%   71       3949      39        477386        00:01:16   737          1637.154  
80    21.9   21.9    99.99%   54       4205      51        478668        00:01:24   965          2143.998  
100   22.4   22.4    99.99%   43       4012      61        467543        00:01:27   1205         2678.202  
120   20.6   20.6    99.99%   36       4073      76        509092        00:01:36   1433         3184.362  
150   2.7    2.7     99.99%   29       3457      860       3911780       00:05:13   1781         3958.650  
200   8.2    8.2     99.99%   22       4610      255       1269737       00:02:19   2345         5211.396  

Achieved compression table without fullscan top-off vectors
-----------------------------------------------------------
IC    TATR   TDVR    ATCov.   CL       PAT-comp  PAT-fs    Cycles    Gatecount    Area
--------------------------------------------------------------------------------------
fs    1.0    1.0     99.99%   4248     -         2461      10475125      -       -    
60    34.4   34.4    99.93%   71       3949      -         304831        737     1637.154   
80    41.3   41.3    99.92%   54       4205      -         253359        965     2143.998   
100   53.0   53.0    99.90%   43       4012      -         197672        1205    2678.202   
120   60.7   60.7    99.87%   36       4073      -         172463        1433    3184.362   
150   85.4   85.4    95.94%   29       3457      -         122594        1781    3958.650   
200   79.9   79.9    99.72%   22       4610      -         131098        2345    5211.396   
```

### Table Column Definitions:
- **`IC`**: Inserted Compression Ratio ($60\times$, $80\times$, $100\times$, etc.; `fs` = uncompressed Full-Scan).
- **`TATR`**: Test Application Time Reduction factor ($\text{Cycles}_{fs} / \text{Cycles}_{comp}$).
- **`TDVR`**: Test Data Volume Reduction factor.
- **`ATCov.`**: ATPG Fault Coverage percentage.
- **`CL`**: Maximum Channel Length (number of flip-flops in the longest internal chain).
- **`PAT-comp` / `PAT-fs`**: Number of compressed patterns vs uncompressed top-off patterns.
- **`Cycles`**: Total ATE clock cycles required.
- **`Gatecount` & `Area`**: Additional XOR / masking silicon gate overhead.

---

## 🏆 Why 100x Compression is the Optimal Sweet Spot

Evaluating the trade-off metrics:

1. **Test Time Reduction (TATR)**:
   - Full-scan requires **10,475,125 cycles**.
   - At **100x ratio**, test cycles drop to **467,543 cycles** (with top-off) and **197,672 cycles** (without top-off), representing an outstanding **$22.4\times$ to $53.0\times$ speedup**!
2. **Channel Length (`CL`)**:
   - Internal chain length drops from 4,248 flops down to just **43 flops**.
3. **High Fault Coverage (`ATCov.`)**:
   - Maintains **99.99%** test coverage with top-off and **99.90%** pure compressed coverage.
4. **Silicon Area Overhead**:
   - Requires only **1,205 gates** ($2,678 \ \mu m^2$), which is $< 1\%$ of the total SoC area.
   - Pushing to $150\times$ or $200\times$ provides diminishing returns with significant area penalties ($2,345$ gates) and coverage drops.

---

## 🎯 Summary & Key Takeaways

1. Scan compression solves the tester pin bottleneck by expanding 2 external channels into 200 short internal chains.
2. `analyze_scan_compressibility` provides a quantitative data-driven basis for choosing the optimal compression ratio before committing to gate insertion.
3. The **$100\times$ compression architecture** was selected as the golden implementation target.

---

## ➡️ Next Steps: Moving to Stage 5

In **Stage 5 (`5_INSERT_SCAN_COMPRESSION_LOGIC`)**, you will take the selected $100\times$ architecture and physically insert the XOR decompressor, wide1 masking logic, and XOR compressor into the synthesized gate netlist.

👉 **Proceed to Stage 5:** [../5_INSERT_SCAN_COMPRESSION_LOGIC/README.md](../5_INSERT_SCAN_COMPRESSION_LOGIC/README.md)
