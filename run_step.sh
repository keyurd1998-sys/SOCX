#!/usr/bin/env bash
# ==============================================================================
# Top-Level Runner for SOCX DFT Flow (delegates to scan/run_step.sh)
# Usage:
#   ./run_step.sh 1
#   ./run_step.sh 1 2 3
#   ./run_step.sh all
# ==============================================================================
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "${SCRIPT_DIR}/scan/run_step.sh" "$@"
