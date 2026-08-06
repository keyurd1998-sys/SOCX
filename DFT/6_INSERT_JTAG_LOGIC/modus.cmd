# Cadence Modus
#   Cadence(R) Modus(TM) DFT Software Solution, Version 25.10-p027_1, built Mar 13 2025 (linux26_64)
#   Date: Thursday, August 06, 2026
source TOP_WRAPPER_ATPG/runmodus.atpg.tcl
report_fault_statistics > $WORKDIR/final_coverage_summary.rpt
report_fault_statistics
exit
