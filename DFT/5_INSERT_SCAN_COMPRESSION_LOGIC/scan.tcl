# =========================================================
# Top Design and Library Setup
# =========================================================
set DESIGN_NAME "TOP"                      ;# Top module name
set HDL_PATH    [file normalize "../../RTL"]        
set SCRIPT_PATH [file normalize "../../CONSTRAINTS"]               
set LIB_PATH    [file normalize "../../../Library/timing"]             
set LIB_LIST    "slow.lib"
set EFFORT      "high"                     
set VERILOG_LIB [file normalize "../../../Library/verilog/typical.v"]

# =========================================================
# Work Directory Setup
# =========================================================
set WORK_DIR "${DESIGN_NAME}_Scan"          ;# Output root directory
file mkdir $WORK_DIR                         ;# Create Output Dir

set REPORT_DIR "$WORK_DIR/Report"
file mkdir $WORK_DIR/Report                  ;# Create report folder

set NETLIST_DIR "$WORK_DIR/Netlist"
file mkdir $WORK_DIR/Netlist                 ;# Create NETLIST folder

set ATPG_DIR    "${DESIGN_NAME}_ATPG"
file mkdir $ATPG_DIR                           ;# Create ATPG folder

set TP_DIR      "${DESIGN_NAME}_TP"
file mkdir $TP_DIR                       ;# Create Test Point folder

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

# =========================================================
# Define Test Clocks
# =========================================================
# 1. Define Master REF_CLK for testing
define_test_clock \
    -name ScanClock \
    -function test_clock \
    -period 20000 \
    -controllable \
    [get_ports REF_CLK]

# 2. explicitly Define UART_CLK for testing (Match the period!)
define_test_clock \
    -name UART_TestClock \
    -function test_clock \
    -period 20000 \
    -controllable \
    [get_ports UART_CLK]

# =========================================================
# MULTI-CLOCK COMPATIBILITY FIX
# =========================================================
# Tell Genus that all test clocks can be treated as synchronous during test shifting
set_compatible_test_clocks -all

# =========================================================
# Define Scan Chains
# =========================================================

set NUM_SCAN_CHAINS 2

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
# Chain Configuration
# =========================================================
set_db [current_design] .dft_min_number_of_scan_chains $NUM_SCAN_CHAINS

# =========================================================
# build Scan Chains
# =========================================================
connect_scan_chains -auto_create

# =========================================================
# Insert compression Logic
# =========================================================
compress_scan_chains \
    -ratio 150 \
    -compressor xor \
    -decompressor xor \
    -mask wide1 \
    -auto_create

# =========================================================
# Report Scan 
# =========================================================
report_scan_chains > $REPORT_DIR/Scan_Chain_Report.rpt
report_scan_setup > $REPORT_DIR/Scan_Setup_Report.rpt

# =========================================================
# Run Incremental Optimization 
# =========================================================
set_db syn_opt_effort $EFFORT
syn_opt                                      ;# Fix electrical & timing violations

# =========================================================
# Export Design, SDC & SPF
# =========================================================
write_netlist > $NETLIST_DIR/${DESIGN_NAME}_Scan_Netlist.v
write_sdc >     $NETLIST_DIR/${DESIGN_NAME}_mapped.sdc
write_dft_atpg -compression -library $VERILOG_LIB -directory $ATPG_DIR -generate_config_file [current_design]

# =========================================================
# RUN ATPG
# =========================================================
puts "Running Modus ATPG..."
exec modus -files $ATPG_DIR/runmodus.atpg.tcl

# =========================================================
# Reports Generation
# =========================================================
report_timing >           $REPORT_DIR/${DESIGN_NAME}_timing_worst_path.rpt  
report_timing -nworst 10 >$REPORT_DIR/${DESIGN_NAME}_timing_worst_negative.rpt
report_qor >              $REPORT_DIR/${DESIGN_NAME}_qor.rpt                       
report_area >             $REPORT_DIR/${DESIGN_NAME}_area_summary.rpt            
report_area -detail >     $REPORT_DIR/${DESIGN_NAME}_area_hierarchical.rpt 
report_power >            $REPORT_DIR/${DESIGN_NAME}_power_summary.rpt          
report_gates >            $REPORT_DIR/${DESIGN_NAME}_gates_count.rpt            
report_hierarchy >        $REPORT_DIR/${DESIGN_NAME}_hierarchy.rpt       
report_clocks >           $REPORT_DIR/${DESIGN_NAME}_clocks.rpt     