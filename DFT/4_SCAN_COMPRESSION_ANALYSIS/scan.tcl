# =========================================================
# Top Design and Library Setup
# =========================================================
set DESIGN_NAME "TOP"                      ;# Top module name
set HDL_PATH    "../../RTL"        ;# RTL file path
set SCRIPT_PATH "../../CONSTRAINTS"               ;# Script path
set LIB_PATH    "../../../Library/timing"             ;# Library path
set LIB_LIST "slow.lib"
set EFFORT      "high"                     ;# Synthesis effort level
set VERILOG_LIB "../../../Library/verilog/typical.v"

# =========================================================
# Work Directory Setup
# =========================================================
set WORK_DIR "${DESIGN_NAME}_Scan"          ;# Output root directory
file mkdir $WORK_DIR                         ;# Create Output Dir

set REPORT_DIR "$WORK_DIR/Report"
file mkdir $WORK_DIR/Report                  ;# Create report folder

set COMP_DIR "Compression_Analysis"
file mkdir $COMP_DIR

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

elaborate $DESIGN_NAME -parameters {8 4 16 2048 11}                      ;# Build design tree & resolve parameters
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
# Check DRC Violation
# =========================================================
check_dft_rules

# =========================================================
# Fix DRC Violation
# =========================================================

#fix async reset violation
fix_dft_violations -async_reset -test_control TestMode

#fix async set violation
fix_dft_violations -async_set -test_control TestMode

#fix clock violation
fix_dft_violations -clock -test_control TestMode

# =========================================================
# GTECH mapping 
# =========================================================
set_db syn_generic_effort $EFFORT
syn_generic


# =========================================================
# TECH mapping
# =========================================================
set_db syn_map_effort $EFFORT
syn_map                                      ;# Map generic cells to library gates

# =========================================================
# Analyze Scan Compressibility
# =========================================================
puts "INFO: Starting Scan Compressibility Analysis Setup..."

# We sweep compression ratios of 50x, 60x, and 70x assuming 2 scan I/O pins.
analyze_scan_compressibility \
    -scanins 2 \
    -ratios {60 70 80} \
    -compressor xor \
    -compression_method compress_scan_chains \
    -library $VERILOG_LIB \
    -directory $COMP_DIR 

report_scan_compressibility -directory $COMP_DIR > $REPORT_DIR/${DESIGN_NAME}_scan_compressibility.rpt

puts "INFO: Compressibility analysis complete."
