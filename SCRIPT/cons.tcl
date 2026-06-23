# REF CLOCK (50 MHz)
set CLK1 REF_CLK
set CLK1_PERIOD 20

# UART_RX CLOCK (115.2 KHz * 32)
set CLK2 UART_CLK
set CLK2_PERIOD 271.267

# Skew
set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1

#1. Master Clocks

create_clock -name $CLK1 -period $CLK1_PERIOD -waveform "0 [expr $CLK1_PERIOD/2]" [get_ports REF_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK1]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK1]

create_clock -name $CLK2 -period $CLK2_PERIOD -waveform "0 [expr $CLK2_PERIOD/2]" [get_ports UART_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks $CLK2]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks $CLK2]

#2. Generated clocks

# UART_RX
create_generated_clock -master_clock $CLK2 -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_port U1_Integer_Clock_Divider_RX/o_div_clk] \
                       -divide_by 1
                       
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "UART_RX_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "UART_RX_CLK"]

# UART_TX
create_generated_clock -master_clock $CLK2 -source [get_ports UART_CLK] \
                       -name "UART_TX_CLK" [get_port U0_Integer_Clock_Divider_TX/o_div_clk] \
                       -divide_by 32
                       
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "UART_TX_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "UART_TX_CLK"]

# ALU
create_generated_clock -master_clock $CLK1 -source [get_ports REF_CLK] \
                       -name "ALU_CLK" [get_port U0_CLK_GATE/GATED_CLK] \
                       -divide_by 1
                       
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks "ALU_CLK"]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks "ALU_CLK"]


####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "$CLK1 ALU_CLK"]  \
                               -group [get_clocks "$CLK2 UART_TX_CLK UART_RX_CLK"] 
                                

####################################################################################
           #########################################################
             #### Section 3 : #set input/output delay on ports ####
           #########################################################
####################################################################################

set in2_delay  [expr 0.2*$CLK2_PERIOD]
set out2_delay [expr 0.2*$CLK2_PERIOD]

set in1_delay  [expr 0.2*$CLK1_PERIOD]
set out1_delay [expr 0.2*$CLK1_PERIOD]

#Constrain Input Paths
set_input_delay $in2_delay -clock $CLK2 [get_port UART_RX_IN]

#Constrain Scan Input Paths
set_input_delay $in1_delay -clock $CLK1 [get_port TestMode]
set_input_delay $in1_delay -clock $CLK1 [get_port "ScanIn*"]
set_input_delay $in1_delay -clock $CLK1 [get_port ScanEnable]

#Constrain Output Paths
set_output_delay $out2_delay -clock UART_TX_CLK [get_port UART_TX_O]
set_output_delay $out2_delay -clock $CLK2 [get_port parity_error]
set_output_delay $out2_delay -clock $CLK2 [get_port framing_error]

#Constrain Scan Output Paths
set_output_delay $out1_delay -clock $CLK1 [get_port "ScanOut*"]