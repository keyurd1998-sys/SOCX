set SCRIPT_DIR [file dirname [file normalize [info script]]]
source "$SCRIPT_DIR/00_setup_env.tcl"

set STEP_RPT_DIR "$REPORTS_DIR/03_drc_fix"
file mkdir $STEP_RPT_DIR
file mkdir $DBS_DIR

read_db "$DBS_DIR/02_tdrc.db"

puts "INFO: Applying DFT violation fixes under test_mode control..."

# Fix DRC violations (resolves async reset & internal clock gating/divider violations)
fix_dft_violations -async_reset -test_control test_mode
fix_dft_violations -async_set   -test_control test_mode
fix_dft_violations -clock       -test_control test_mode

# Run post-fix Testability Design Rule Check (TDRC)
check_dft_rules       > "$STEP_RPT_DIR/${DESIGN}_dft_rules_post_fix.rpt"
report_dft_violations > "$STEP_RPT_DIR/${DESIGN}_dft_violations_post_fix.rpt"

# Save checkpoint database
set DB_FILE "$DBS_DIR/03_drc_fixed.db"
write_db -all_root_attributes -to_file $DB_FILE

puts "INFO: Step 3 DRC fix completed successfully. Checkpoint saved: $DB_FILE"
exit
