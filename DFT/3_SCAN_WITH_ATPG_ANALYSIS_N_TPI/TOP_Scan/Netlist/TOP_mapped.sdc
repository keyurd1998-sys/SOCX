# ####################################################################

#  Created by Genus(TM) Synthesis Solution 25.10-p002_1 on Thu Jul 16 13:24:26 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11

create_clock -name "REF_CLK" -period 20.0 -waveform {0.0 10.0} [get_ports REF_CLK]
create_clock -name "UART_CLK" -period 271.267 -waveform {0.0 135.6335} [get_ports UART_CLK]
create_generated_clock -name "UART_RX_CLK" -divide_by 1     -source [get_ports UART_CLK]   [get_pins U1_Integer_Clock_Divider_RX/o_div_clk] 
create_generated_clock -name "UART_TX_CLK" -divide_by 32     -source [get_ports UART_CLK]   [get_pins U0_Integer_Clock_Divider_TX/o_div_clk] 
create_generated_clock -name "ALU_CLK" -divide_by 1     -source [get_ports REF_CLK] -combinational  [get_pins U0_CLK_GATE/GATED_CLK] 
set_load -pin_load 10.0 [get_ports UART_TX_O]
set_load -pin_load 10.0 [get_ports parity_error]
set_load -pin_load 10.0 [get_ports framing_error]
set_clock_groups -name "clock_groups_REF_CLK_ALU_CLK_to_UART_CLK_UART_TX_CLK_UART_RX_CLK" -asynchronous -group [list \
  [get_clocks REF_CLK]  \
  [get_clocks ALU_CLK] ] -group [list \
  [get_clocks UART_CLK]  \
  [get_clocks UART_TX_CLK]  \
  [get_clocks UART_RX_CLK] ]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks UART_CLK] -add_delay 54.2534 [get_ports UART_RX_IN]
set_output_delay -clock [get_clocks UART_TX_CLK] -add_delay 54.2534 [get_ports UART_TX_O]
set_output_delay -clock [get_clocks UART_CLK] -add_delay 54.2534 [get_ports parity_error]
set_output_delay -clock [get_clocks UART_CLK] -add_delay 54.2534 [get_ports framing_error]
set_input_delay -clock [get_clocks REF_CLK] -add_delay 0.5 [get_ports RST_N]
set_max_transition 1.5 [current_design]
set_max_capacitance 50.0 [current_design]
set_input_transition 0.5 [get_ports RST_N]
set_input_transition 0.5 [get_ports UART_CLK]
set_input_transition 0.5 [get_ports REF_CLK]
set_input_transition 0.5 [get_ports UART_RX_IN]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.2 [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks REF_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks UART_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks UART_RX_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks UART_RX_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks UART_TX_CLK]
set_clock_uncertainty -setup 0.2 [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks ALU_CLK]
