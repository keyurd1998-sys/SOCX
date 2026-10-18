#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

NETLIST="../../../../scan/netlists/TOP_compressed.v"
STDCELL="/home/admin/DFT/Library/atpg/stdcell.v"

TB="VER.COMPRESSION.TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_stuck_at.mainsim.v"
TS1="VER.COMPRESSION.TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_stuck_at.data.scan.ex1.ts1.verilog"
TS2="VER.COMPRESSION.TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_stuck_at.data.logic.ex1.ts2.verilog"

xrun \
  +access+rwc \
  +xm64bit \
  +xmtimescale+1ns/1ps \
  +xmoverride_timescale \
  +xmseq_udp_delay+2ps \
  +HEARTBEAT \
  +FAILSET \
  "+TESTFILE1=$TS1" \
  "+TESTFILE2=$TS2" \
  -v "$STDCELL" \
  "$NETLIST" \
  "$TB" \
  -l sim_parallel.log
