# =========================================================
# Clock Definitions
# =========================================================
set CLK1 PIN_REF_CLK
set CLK1_PERIOD 20.0

set CLK2 PIN_UART_CLK
set CLK2_PERIOD 271.267

create_clock -name $CLK1 -period $CLK1_PERIOD -waveform [list 0 [expr $CLK1_PERIOD/2.0]] [get_ports $CLK1]
create_clock -name $CLK2 -period $CLK2_PERIOD -waveform [list 0 [expr $CLK2_PERIOD/2.0]] [get_ports $CLK2]

# =========================================================
# Generated Clocks (Pushed down into u_core/)
# =========================================================
create_generated_clock -name UART_RX_CLK \
    -source [get_ports $CLK2] \
    -divide_by 1 \
    [get_pins u_core/U1_Integer_Clock_Divider_RX/o_div_clk]

create_generated_clock -name UART_TX_CLK \
    -source [get_ports $CLK2] \
    -divide_by 32 \
    [get_pins u_core/U0_Integer_Clock_Divider_TX/o_div_clk]

create_generated_clock -name ALU_CLK \
    -source [get_ports $CLK1] \
    -divide_by 1 \
    -combinational \
    [get_pins u_core/U0_CLK_GATE/GATED_CLK]

# =========================================================
# Clock Uncertainty & Grouping
# =========================================================
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW  0.1

foreach_in_collection clk [all_clocks] {
    set_clock_uncertainty -setup $CLK_SETUP_SKEW $clk
    set_clock_uncertainty -hold $CLK_HOLD_SKEW $clk
}

set_clock_groups -asynchronous \
    -group [list [get_clocks $CLK1] [get_clocks ALU_CLK]] \
    -group [list [get_clocks $CLK2] [get_clocks UART_TX_CLK] [get_clocks UART_RX_CLK]]

# =========================================================
# Input & Output Delays (Mapped to physical PIN_ ports)
# =========================================================
set in2_delay  [expr 0.2 * $CLK2_PERIOD]
set out2_delay [expr 0.2 * $CLK2_PERIOD]

set_input_delay $in2_delay -clock $CLK2 [get_ports PIN_UART_RX_IN]

set_output_delay $out2_delay -clock UART_TX_CLK [get_ports PIN_UART_TX_O]
set_output_delay $out2_delay -clock $CLK2 [get_ports PIN_parity_error]
set_output_delay $out2_delay -clock $CLK2 [get_ports PIN_framing_error]

set_input_delay 0.5 -clock $CLK1 [get_ports PIN_RST_N]

# =========================================================
# Global DRC Constraints
# =========================================================
set_input_transition 0.5 [all_inputs]
set_load 10.0 [all_outputs]
set_max_transition 1.5 [current_design]
set_max_capacitance 50.0 [current_design]