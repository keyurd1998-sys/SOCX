#=========================================================
# CLOCK DEFINITIONS
#=========================================================

# REF CLOCK (50MHz)
set CLK1 REF_CLK
set CLK1_PERIOD 20

# UART CLOCK
set CLK2 UART_CLK
set CLK2_PERIOD 271.267

#=========================================================
# CLOCK UNCERTAINTY
#=========================================================

set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW  0.1

#=========================================================
# MASTER CLOCKS
#=========================================================

create_clock \
    -name $CLK1 \
    -period $CLK1_PERIOD \
    -waveform [list 0 [expr $CLK1_PERIOD/2]] \
    [get_ports REF_CLK]

set_clock_uncertainty \
    -setup $CLK_SETUP_SKEW \
    [get_clocks $CLK1]

set_clock_uncertainty \
    -hold $CLK_HOLD_SKEW \
    [get_clocks $CLK1]

create_clock \
    -name $CLK2 \
    -period $CLK2_PERIOD \
    -waveform [list 0 [expr $CLK2_PERIOD/2]] \
    [get_ports UART_CLK]

set_clock_uncertainty \
    -setup $CLK_SETUP_SKEW \
    [get_clocks $CLK2]

set_clock_uncertainty \
    -hold $CLK_HOLD_SKEW \
    [get_clocks $CLK2]

#=========================================================
# GENERATED CLOCKS
#=========================================================

# UART RX
create_generated_clock \
    -name UART_RX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 1 \
    [get_pins U1_Integer_Clock_Divider_RX/o_div_clk]

set_clock_uncertainty \
    -setup $CLK_SETUP_SKEW \
    [get_clocks UART_RX_CLK]

set_clock_uncertainty \
    -hold $CLK_HOLD_SKEW \
    [get_clocks UART_RX_CLK]

# UART TX
create_generated_clock \
    -name UART_TX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 32 \
    [get_pins U0_Integer_Clock_Divider_TX/o_div_clk]

set_clock_uncertainty \
    -setup $CLK_SETUP_SKEW \
    [get_clocks UART_TX_CLK]

set_clock_uncertainty \
    -hold $CLK_HOLD_SKEW \
    [get_clocks UART_TX_CLK]

# ALU GATED CLOCK
create_generated_clock \
    -name ALU_CLK \
    -source [get_ports REF_CLK] \
    -divide_by 1 \
    -combinational \
    [get_pins U0_CLK_GATE/GATED_CLK]

set_clock_uncertainty \
    -setup $CLK_SETUP_SKEW \
    [get_clocks ALU_CLK]

set_clock_uncertainty \
    -hold $CLK_HOLD_SKEW \
    [get_clocks ALU_CLK]

#=========================================================
# CLOCK RELATIONSHIPS
#=========================================================

set_clock_groups \
    -asynchronous \
    -group [get_clocks {REF_CLK ALU_CLK}] \
    -group [get_clocks {UART_CLK UART_TX_CLK UART_RX_CLK}]

#=========================================================
# IO DELAYS
#=========================================================

set in2_delay  [expr 0.2*$CLK2_PERIOD]
set out2_delay [expr 0.2*$CLK2_PERIOD]

set in1_delay  [expr 0.2*$CLK1_PERIOD]
set out1_delay [expr 0.2*$CLK1_PERIOD]

#=========================================================
# INPUT DELAYS
#=========================================================

set_input_delay \
    $in2_delay \
    -clock UART_CLK \
    [get_ports UART_RX_IN]

#=========================================================
# OUTPUT DELAYS
#=========================================================

set_output_delay \
    $out2_delay \
    -clock UART_TX_CLK \
    [get_ports UART_TX_O]

set_output_delay \
    $out2_delay \
    -clock UART_CLK \
    [get_ports parity_error]

set_output_delay \
    $out2_delay \
    -clock UART_CLK \
    [get_ports framing_error]
