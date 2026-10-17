set SCRIPT_DIR [file dirname [file normalize [info script]]]
source "$SCRIPT_DIR/00_setup_env.tcl"

set STEP_RPT_DIR "$REPORTS_DIR/02_tdrc"
file mkdir $STEP_RPT_DIR
file mkdir $DBS_DIR

read_db "$DBS_DIR/01_elaborated.db"

# Read functional timing constraints
if {[catch {read_sdc $SDC_FILE} err]} {
    puts "INFO: read_sdc note ($err). Sourcing constraints directly: $SDC_FILE"
    source $SDC_FILE
}

# Configure scan style and test signals
set_db root: .dft_scan_style muxed_scan
set_db root: .dft_prefix DFT_
set_db root: .dft_identify_top_level_test_clocks true
set_db root: .dft_identify_test_signals true
set_db root: .dft_identify_internal_test_clocks false
set_db root: .use_scan_seqs_for_non_dft false

# Standard DFT test signals & clocks
define_test_signal -function shift_enable -name scan_en -active high -ideal -create_port SCAN_ENABLE
define_test_signal -function test_mode -name test_mode -active high -create_port test_mode
define_test_signal -function async_set_reset -active low [get_ports RST_N]

define_test_clock -name ScanClock -function test_clock -period 20000 -controllable [get_ports REF_CLK]
define_test_clock -name UART_TestClock -function test_clock -period 20000 -controllable [get_ports UART_CLK]
set_compatible_test_clocks -all

# Run Pre-DFT Testability Design Rule Check (TDRC)
puts "INFO: Running initial pre-DFT rule check..."
check_dft_rules       > "$STEP_RPT_DIR/${DESIGN}_dft_rules_pre_fix.rpt"
report_dft_violations > "$STEP_RPT_DIR/${DESIGN}_dft_violations_pre_fix.rpt"

# Save checkpoint database
set DB_FILE "$DBS_DIR/02_tdrc.db"
write_db -all_root_attributes -to_file $DB_FILE

puts "INFO: Step 2 DFT setup & pre-DFT TDRC completed successfully. Checkpoint saved: $DB_FILE"
exit
