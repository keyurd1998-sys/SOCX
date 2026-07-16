# =========================================================
# 1. Top Design and Library Setup
# =========================================================
set DESIGN_NAME "TOP"                          ;# Top module name
set HDL_PATH    "../RTL"                       ;# RTL file path
set SCRIPT_PATH "../CONSTRAINTS"               ;# Script path
set LIB_PATH    "../../Library/timing"         ;# Library path
set LIB_LIST    "slow.lib"
set EFFORT      "high"                         ;# Synthesis effort level

# =========================================================
# 2. Work Directory Setup
# =========================================================
set WORK_DIR "${DESIGN_NAME}_Synth"          
file mkdir $WORK_DIR                         
file mkdir $WORK_DIR/Report                  
file mkdir $WORK_DIR/Netlist                 

set REPORT_DIR "$WORK_DIR/Report"
set NETLIST_DIR "$WORK_DIR/Netlist"

# =========================================================
# 3. Search Path for RTL, LIBRARY & SCRIPTS
# =========================================================
set_db init_lib_search_path $LIB_PATH
set_db init_hdl_search_path $HDL_PATH
set_db script_search_path   $SCRIPT_PATH 

# Read Library File
read_libs $LIB_LIST

# =========================================================
# 4. RTL Read and Elaboration
# =========================================================
read_hdl -sv [glob "$HDL_PATH/*.sv"] 
read_hdl -sv [glob "$HDL_PATH/*.v"] 

# Build design tree & resolve parameters
elaborate $DESIGN_NAME -parameters {8 4 16 2048 11}                       
check_design -unresolved                     
set_db auto_ungroup none

# =========================================================
# 5. GTECH Mapping
# =========================================================
set_db syn_generic_effort $EFFORT
syn_generic

# Export GTECH Netlist (Pre-technology logic gates)
write_netlist -generic > $NETLIST_DIR/${DESIGN_NAME}_GTECH_Netlist.v

# =========================================================
# 6. Read Constraints & Linting
# =========================================================
source cons.tcl                              

# Lint the SDC constraints to catch missing constraints 
check_timing_intent -verbose > $REPORT_DIR/${DESIGN_NAME}_timing_lint.rpt

# =========================================================
# 7. TECH Mapping & Gate Optimization
# =========================================================
set_db syn_map_effort $EFFORT
syn_map                                      ;# Map generic cells to library gates

set_db syn_opt_effort $EFFORT
syn_opt                                      ;# Fix electrical & timing violations

# =========================================================
# 8. Export Mapped Netlist & SDC
# =========================================================
write_netlist > $NETLIST_DIR/${DESIGN_NAME}_Netlist.v
write_sdc     > $NETLIST_DIR/${DESIGN_NAME}_mapped.sdc

# =========================================================
# 9. Reports Generation
# =========================================================
report_timing >            $REPORT_DIR/${DESIGN_NAME}_timing_worst_path.rpt  
report_timing -nworst 10 > $REPORT_DIR/${DESIGN_NAME}_timing_worst_negative.rpt
report_qor >               $REPORT_DIR/${DESIGN_NAME}_qor.rpt                       
report_area >              $REPORT_DIR/${DESIGN_NAME}_area_summary.rpt            
report_area -detail >      $REPORT_DIR/${DESIGN_NAME}_area_hierarchical.rpt 
report_power >             $REPORT_DIR/${DESIGN_NAME}_power_summary.rpt          
report_gates >             $REPORT_DIR/${DESIGN_NAME}_gates_count.rpt            
report_hierarchy >         $REPORT_DIR/${DESIGN_NAME}_hierarchy.rpt       
report_clocks >            $REPORT_DIR/${DESIGN_NAME}_clocks.rpt