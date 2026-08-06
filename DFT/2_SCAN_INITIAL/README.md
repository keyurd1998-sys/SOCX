# Initial Scan Insertion Stage

This stage creates the first scan-ready implementation. It defines test signals, test clocks, scan chains, and then stitches those chains into the design.

## Purpose

Scan insertion is the foundation of most digital test flows. Once scan chains are present, ATPG tools can shift values into and out of the design to detect defects.

## Key script

The main script is [scan.tcl](scan.tcl).

## How to run

### Interactive mode

```bash
cd DFT/2_SCAN_INITIAL
genus
```

Inside Genus:

```tcl
genus@root:> source scan.tcl
```

### Batch mode

```bash
genus -files scan.tcl
```

## Important Tcl concepts

### Define scan test signals

```tcl
define_test_signal \
-function shift_enable \
-active high \
-create_port \
-default_shift_enable \
ScanEnable
```

This tells the tool which signal acts as the scan shift-enable. It is used during scan shifting and capture operations.

### Define the scan test clock

```tcl
define_test_clock \
    -name ScanClock \
    -function test_clock \
    -period 20000 \
    -controllable \
    [get_ports REF_CLK]
```

This creates a dedicated test clock for scan mode. The period is chosen to support deterministic shifting and capture.

### Create scan chains

```tcl
set NUM_SCAN_CHAINS 80
for {set i 1} {$i <= $NUM_SCAN_CHAINS} {incr i} {
    create_port -direction in -name ScanIn_$i
    create_port -direction out -name ScanOut_$i
    define_scan_chain -name chain_$i -sdi [get_ports ScanIn_$i] -sdo [get_ports ScanOut_$i]
}
```

This loop creates a large number of scan chain interfaces so the tool can connect flops into serial scan paths.

### Connect and report scan chains

```tcl
connect_scan_chains -auto_create
report_scan_chains > $REPORT_DIR/Scan_Chain_Report.rpt
report_scan_setup > $REPORT_DIR/Scan_Setup_Report.rpt
```

These commands physically connect the scan structure and produce reports showing how the chains are organized.

## Expected outputs

- a new scan-ready netlist
- scan chain reports
- scan setup information
- synthesized or mapped test-ready netlist in the generated work folder

## Learning note

This is the first real DFT implementation stage. After this step, the design is no longer just functionally correct; it is also test-inserted.
