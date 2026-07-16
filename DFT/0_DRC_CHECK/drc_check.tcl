# =========================================================
# Top Design and Library Setup
# =========================================================
set DESIGN_NAME "TOP"                      ;# Top module name
set HDL_PATH    "../../RTL"                ;# RTL file path
set SCRIPT_PATH "../../CONSTRAINTS"               ;# Script path
set LIB_PATH    "../../../Library/timing"             ;# Library path
set LIB_LIST "slow.lib"
set EFFORT      "high"                     ;# Synthesis effort level

# =========================================================
# Search Path for RTL, LIBRARY & SCRIPTS
# =========================================================
set_db init_lib_search_path $LIB_PATH
set_db init_hdl_search_path $HDL_PATH
set_db script_search_path   $SCRIPT_PATH 

# =========================================================
# Read Library File
# =========================================================
read_libs $LIB_LIST

# =========================================================
# RTL Read and Elaboration
# =========================================================
read_hdl -sv [glob "$HDL_PATH/*.sv"] 
read_hdl -sv [glob "$HDL_PATH/*.v"] 

elaborate $DESIGN_NAME -parameters {8 10 16 2048 11}                       ;# Build design tree & resolve parameters
check_design -unresolved                     ;# Check for missing sub-modules
set_db auto_ungroup none

# =========================================================
# Read Constraints
# =========================================================
source cons.tcl                              

# Lint the SDC constraints to catch missing constraints 
check_timing_intent -verbose > $REPORT_DIR/${DESIGN_NAME}_timing_lint.rpt

# =========================================================
# Set Scan Configuration
# =========================================================
set_db dft_scan_style muxed_scan

# =========================================================
# Define Test signal
# =========================================================
# Create scan enable
define_test_signal \
-function shift_enable \
-active high \
-create_port \
-default_shift_enable \
ScanEnable

# Create test mode
define_test_signal \
-function test_mode \
-active high \
-create_port \
TestMode

#Define  Asynchronous Reset/Set
define_test_signal \
-function async_set_reset \
-active low \
[get_ports RST_N]

# Define Scan Clock
define_test_clock \
    -name ScanClock \
    -function test_clock \
    -period 20000 \
    -controllable \
    [get_ports REF_CLK]

# =========================================================
# Define Scan Chains
# =========================================================

set NUM_SCAN_CHAINS 4

for {set i 1} {$i <= $NUM_SCAN_CHAINS} {incr i} {
create_port \
    -direction in \
    -name ScanIn_$i 

create_port \
    -direction out \
    -name ScanOut_$i 

define_scan_chain \
        -name chain_$i \
        -sdi [get_ports ScanIn_$i] \
        -sdo [get_ports ScanOut_$i]
    }

# =========================================================
# Check DRC Violation
# =========================================================
check_dft_rules > drc_violations.rpt
