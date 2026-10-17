#!/usr/bin/env bash
# ==============================================================================
# Step-by-Step Genus DFT Runner for TOP (Scan Insertion & Compression)
# Usage:
#   ./run_step.sh 1
#   ./run_step.sh 1 2 3
#   ./run_step.sh all
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"
cd "$SCRIPT_DIR"

if [ -d "/home/vlsi/keyurd1998-sys/LAB/GENUS_LABS/Normal_runs/Basic_Digital_Test_RAK_21.1/LIBS" ]; then
    export CADENCE_DFT_LIB="/home/vlsi/keyurd1998-sys/LAB/GENUS_LABS/Normal_runs/Basic_Digital_Test_RAK_21.1/LIBS"
elif [ -d "/home/admin/DFT/Library" ]; then
    export CADENCE_DFT_LIB="/home/admin/DFT/Library"
fi

mkdir -p logs reports dbs netlists "${ROOT_DIR}/atpg" "${ROOT_DIR}/gls"

if [ $# -eq 0 ] || [ "$1" = "help" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "Usage: $0 <step_number(s) | all>"
    echo "Steps: 1 to 9"
    echo ""
    echo "Fixed DFT Architecture:"
    echo "  Scan Channels:    2 (scan_in_0/1, scan_out_0/1)"
    echo "  Insertion Ratio:  80"
    echo "  Analysis Ratios:  70, 80"
    echo ""
    echo "Examples:"
    echo "  ./run_step.sh all"
    echo "  ./run_step.sh 3"
    exit 0
fi

if ! command -v genus &> /dev/null; then
    echo "ERROR: 'genus' binary not found in PATH."
    exit 1
fi

echo "=================================================================="
echo " Starting SOCX (TOP) Scan Synthesis Flow (Genus)"
echo " Fixed Configuration:"
echo "   - Scan Channels:    2 (scan_in_0/1, scan_out_0/1)"
echo "   - Insertion Ratio:  80"
echo "   - Analysis Ratios:  70, 80"
echo "=================================================================="

run_step() {
    local step="$1"
    local script=""
    local desc=""

    case "$step" in
        1) script="01_elaborate.tcl";                     desc="Elaboration & Health Check" ;;
        2) script="02_dft_setup_tdrc.tcl";               desc="DFT Setup & Pre-DFT DRC Check" ;;
        3) script="03_drc_fix.tcl";                      desc="DFT DRC Violation Fixing" ;;
        4) script="04_scan_mapping.tcl";                 desc="Generic Synthesis & Scan Mapping" ;;
        5) script="05_pre_tpi_compression_analysis.tcl"; desc="Pre-TPI Compression Analysis" ;;
        6) script="06_test_point_insertion.tcl";         desc="Modus Test Point Insertion (TPI)" ;;
        7) script="07_post_tpi_compression_analysis.tcl";desc="Post-TPI Compression Analysis" ;;
        8) script="08_insert_compression.tcl";           desc="Scan Compression Insertion" ;;
        9) script="09_export.tcl";                       desc="Export Netlist, SDC, SCANDEF, Reports & ATPG" ;;
        *)
            echo "ERROR: Invalid step '$step'. Valid steps are 1 through 9, or 'all'."
            exit 1
            ;;
    esac

    local log="logs/${script%.tcl}.log"
    rm -f "${log}"* "${log%.log}.cmd"*

    echo "==> Step $step: $desc"
    genus -overwrite -f "$script" -log "$log"
    echo "==> Step $step completed. Log: $log"
}

for arg in "$@"; do
    if [ "$arg" = "all" ]; then
        for s in {1..9}; do
            run_step "$s"
        done
    else
        run_step "$arg"
    fi
done
