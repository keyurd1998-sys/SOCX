# ####################################################################

#  Created by Genus(TM) Synthesis Solution 25.10-p002_1 on Wed Aug 26 16:58:04 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design TOP_WRAPPER

create_clock -name "PIN_REF_CLK" -period 20.0 -waveform {0.0 10.0} [get_ports PIN_REF_CLK]
create_clock -name "PIN_UART_CLK" -period 271.267 -waveform {0.0 135.6335} [get_ports PIN_UART_CLK]
create_generated_clock -name "UART_RX_CLK" -divide_by 1     -source [get_ports PIN_UART_CLK]   [get_pins u_core/U1_Integer_Clock_Divider_RX/o_div_clk] 
create_generated_clock -name "UART_TX_CLK" -divide_by 32     -source [get_ports PIN_UART_CLK]   [get_pins u_core/U0_Integer_Clock_Divider_TX/o_div_clk] 
create_generated_clock -name "ALU_CLK" -divide_by 1     -source [get_ports PIN_REF_CLK] -combinational  [get_pins u_core/U0_CLK_GATE/GATED_CLK] 
set_load -pin_load 10.0 [get_ports PIN_UART_TX_O]
set_load -pin_load 10.0 [get_ports PIN_parity_error]
set_load -pin_load 10.0 [get_ports PIN_framing_error]
set_load -pin_load 10.0 [get_ports PIN_ScanOut_1]
set_load -pin_load 10.0 [get_ports PIN_ScanOut_2]
set_load -pin_load 10.0 [get_ports PIN_TDO]
set_clock_groups -name "clock_groups_PIN_REF_CLK_ALU_CLK_to_PIN_UART_CLK_UART_TX_CLK_UART_RX_CLK" -asynchronous -group [list \
  [get_clocks PIN_REF_CLK]  \
  [get_clocks ALU_CLK] ] -group [list \
  [get_clocks PIN_UART_CLK]  \
  [get_clocks UART_TX_CLK]  \
  [get_clocks UART_RX_CLK] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks PIN_UART_CLK] -add_delay 54.2534 [get_ports PIN_UART_RX_IN]
set_output_delay -clock [get_clocks UART_TX_CLK] -add_delay 54.2534 [get_ports PIN_UART_TX_O]
set_output_delay -clock [get_clocks PIN_UART_CLK] -add_delay 54.2534 [get_ports PIN_parity_error]
set_output_delay -clock [get_clocks PIN_UART_CLK] -add_delay 54.2534 [get_ports PIN_framing_error]
set_input_delay -clock [get_clocks PIN_REF_CLK] -add_delay 0.5 [get_ports PIN_RST_N]
set_max_transition 1.5 [current_design]
set_max_capacitance 50.0 [current_design]
set_input_transition 0.5 [get_ports PIN_REF_CLK]
set_input_transition 0.5 [get_ports PIN_UART_CLK]
set_input_transition 0.5 [get_ports PIN_UART_RX_IN]
set_input_transition 0.5 [get_ports PIN_RST_N]
set_input_transition 0.5 [get_ports PIN_ScanIn_1]
set_input_transition 0.5 [get_ports PIN_ScanIn_2]
set_input_transition 0.5 [get_ports PIN_ScanEnable]
set_input_transition 0.5 [get_ports PIN_TestMode]
set_input_transition 0.5 [get_ports PIN_TCK]
set_input_transition 0.5 [get_ports PIN_TMS]
set_input_transition 0.5 [get_ports PIN_TDI]
set_input_transition 0.5 [get_ports PIN_TRST]
set_input_transition 0.5 [get_ports PIN_comp_en]
set_input_transition 0.5 [get_ports PIN_spread_en]
set_input_transition 0.5 [get_ports PIN_mask_en]
set_input_transition 0.5 [get_ports PIN_mask_load]
set_input_transition 0.5 [get_ports PIN_mask_clk]
set_wire_load_mode "enclosed"
set_dont_touch [get_cells pad_comp_en]
set_dont_touch [get_cells pad_mask_clk]
set_dont_touch [get_cells pad_mask_en]
set_dont_touch [get_cells pad_mask_load]
set_dont_touch [get_cells pad_rst_n]
set_dont_touch [get_cells pad_se]
set_dont_touch [get_cells pad_si_1]
set_dont_touch [get_cells pad_si_2]
set_dont_touch [get_cells pad_so_1]
set_dont_touch [get_cells pad_so_2]
set_dont_touch [get_cells pad_spread_en]
set_dont_touch [get_cells pad_tck]
set_dont_touch [get_cells pad_tdi]
set_dont_touch [get_cells pad_tdo]
set_dont_touch [get_cells pad_tm]
set_dont_touch [get_cells pad_tms]
set_dont_touch [get_cells pad_trst]
set_clock_uncertainty -setup 0.2 [get_clocks PIN_REF_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks PIN_REF_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks PIN_UART_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks PIN_UART_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks UART_RX_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks UART_TX_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks ALU_CLK]
