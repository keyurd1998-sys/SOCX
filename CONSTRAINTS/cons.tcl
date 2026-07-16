# =========================================================
# 1. CLOCK DEFINITIONS
# =========================================================
# REF CLOCK (50MHz -> 20ns)
set CLK1 REF_CLK
set CLK1_PERIOD 20.0

# UART CLOCK (~3.68MHz -> 271.267ns)
set CLK2 UART_CLK
set CLK2_PERIOD 271.267

# =========================================================
# 2. MASTER CLOCKS
# =========================================================
create_clock -name $CLK1 -period $CLK1_PERIOD -waveform [list 0 [expr $CLK1_PERIOD/2.0]] [get_ports REF_CLK]
create_clock -name $CLK2 -period $CLK2_PERIOD -waveform [list 0 [expr $CLK2_PERIOD/2.0]] [get_ports UART_CLK]

# =========================================================
# 3. GENERATED CLOCKS
# =========================================================
# UART RX (Divided by Configurable Ratio, assuming 1 for worst-case/fastest clock)
create_generated_clock -name UART_RX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 1 \
    [get_pins U1_Integer_Clock_Divider_RX/o_div_clk]

# UART TX (Divided by 32)
create_generated_clock -name UART_TX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 32 \
    [get_pins U0_Integer_Clock_Divider_TX/o_div_clk]

# ALU GATED CLOCK (Combinational Clock Gating)
create_generated_clock -name ALU_CLK \
    -source [get_ports REF_CLK] \
    -divide_by 1 \
    -combinational \
    [get_pins U0_CLK_GATE/GATED_CLK]

# =========================================================
# 4. CLOCK UNCERTAINTY (Jitter and margin)
# =========================================================
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW  0.1

foreach_in_collection clk [all_clocks] {
    set_clock_uncertainty -setup $CLK_SETUP_SKEW $clk
    set_clock_uncertainty -hold $CLK_HOLD_SKEW $clk
}

# =========================================================
# 5. CLOCK RELATIONSHIPS (Asynchronous Clock Groups)
# =========================================================
# Since RTL has Async FIFOs and 2-flop synchronizers, we declare these groups asynchronous
set_clock_groups -asynchronous \
    -group [list [get_clocks $CLK1] [get_clocks ALU_CLK]] \
    -group [list [get_clocks $CLK2] [get_clocks UART_TX_CLK] [get_clocks UART_RX_CLK]]

# =========================================================
# 6. I/O DELAYS (Setup internal margins for external logic)
# =========================================================
set in2_delay  [expr 0.2 * $CLK2_PERIOD]
set out2_delay [expr 0.2 * $CLK2_PERIOD]

# UART Inputs
set_input_delay $in2_delay -clock UART_CLK [get_ports UART_RX_IN]

# UART Outputs
set_output_delay $out2_delay -clock UART_TX_CLK [get_ports UART_TX_O]
set_output_delay $out2_delay -clock UART_CLK [get_ports parity_error]
set_output_delay $out2_delay -clock UART_CLK [get_ports framing_error]

# Reset Input (Assuming synchronous de-assertion to REF_CLK as primary, though synced internally)
set_input_delay 0.5 -clock $CLK1 [get_ports RST_N]

# =========================================================
# 7. ENVIRONMENTAL CONSTRAINTS & DRCS
# =========================================================
# Set default driving cell for all inputs (simulates a standard buffer driving your block)
# Note: Replace "BUFX4" with a standard buffer name from your specific technology library (e.g., slow.lib)
# If unknown, use set_input_transition instead.
set_input_transition 0.5 [all_inputs]

# Set expected load on all output ports (e.g., 10pF)
set_load 10.0 [all_outputs]

# Prevent extreme buffering/transition times
set_max_transition 1.5 [current_design]
set_max_capacitance 50.0 [current_design]