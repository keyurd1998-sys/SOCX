#!/usr/bin/env bash
# ==============================================================================
# Modus ATPG Runner for TOP (SOCX)
# Usage:
#   ./run_atpg.sh stuck_at   # Run Stuck-At ATPG
#   ./run_atpg.sh delay      # Run Transition Delay ATPG
#   ./run_atpg.sh all        # Run both Stuck-At and Delay ATPG
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

run_mode() {
    local mode="$1"
    echo "=================================================================="
    echo " Running Modus ATPG for mode: $mode"
    echo "=================================================================="
    rm -rf "$mode/logs" "$mode/reports" "$mode/patterns" "$mode/testresults" "$mode/tbdata"
    mkdir -p "$mode/reports" "$mode/logs" "$mode/patterns" "$mode/testresults"
    (
        cd "$mode"
        ATPG_MODE="$mode" modus -file ../atpg.tcl -log "logs/runmodus_${mode}.log"
    )
    echo "==> Completed Modus ATPG for $mode. Log: $mode/logs/runmodus_${mode}.log"
}

case "${1:-stuck_at}" in
    stuck_at)
        run_mode stuck_at
        ;;
    delay)
        run_mode delay
        ;;
    all)
        run_mode stuck_at
        run_mode delay
        ;;
    *)
        echo "Usage: $0 <stuck_at | delay | all>"
        exit 1
        ;;
esac
