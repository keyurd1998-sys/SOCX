set DESIGN "TOP"

set SCAN_DIR     [file dirname [file normalize [info script]]]
set ROOT_DIR     [file normalize "$SCAN_DIR/.."]
set BLOCK_DIR    $ROOT_DIR

set DBS_DIR      "$SCAN_DIR/dbs"
set REPORTS_DIR  "$SCAN_DIR/reports"
set NETLISTS_DIR "$SCAN_DIR/netlists"
set LOGS_DIR     "$SCAN_DIR/logs"

set ATPG_DIR     "$ROOT_DIR/atpg"
set GLS_DIR      "$ROOT_DIR/gls"

# Technology Library search path setup (local RAK path, container fallback, or VM)
if {[file exists "/home/vlsi/keyurd1998-sys/LAB/GENUS_LABS/Normal_runs/Basic_Digital_Test_RAK_21.1/LIBS/timing/slow.lib"]} {
    set LIB_DIR "/home/vlsi/keyurd1998-sys/LAB/GENUS_LABS/Normal_runs/Basic_Digital_Test_RAK_21.1/LIBS"
} elseif {[file exists "/home/admin/DFT/Library/timing/slow.lib"]} {
    set LIB_DIR "/home/admin/DFT/Library"
} elseif {[file exists "/home/vlsi/Library/timing/slow.lib"]} {
    set LIB_DIR "/home/vlsi/Library"
} else {
    set LIB_DIR "/home/admin/DFT/Library"
}

set TIMING_LIB "$LIB_DIR/timing/slow.lib"
set LEF_FILE   "$LIB_DIR/lef/all.lef"
set ATPG_LIB   "$LIB_DIR/atpg/stdcell.v"

set RTL_DIR         "$BLOCK_DIR/RTL"
set CONSTRAINTS_DIR "$BLOCK_DIR/CONSTRAINTS"
set SDC_FILE        "$CONSTRAINTS_DIR/cons.tcl"

if {![file exists "$RTL_DIR/TOP.sv"]} {
    puts "ERROR: TOP RTL source files not found under $RTL_DIR."
    exit 1
}

puts "=================================================================="
puts " DFT Environment Setup:"
puts "   Target Design:  $DESIGN"
puts "   Scan Directory: $SCAN_DIR"
puts "   Library:        $TIMING_LIB"
puts "=================================================================="
