# Cadence Genus(TM) Synthesis Solution, Version 25.10-p002_1, built Apr 17 2025 15:35:38

# Date: Tue Jun 23 09:50:14 2026
# Host: Pine-06 (x86_64 w/Linux 5.14.0-611.30.1.el9_7.x86_64) (6cores*6cpus*1physical cpu*Intel(R) Core(TM) i5-9400 CPU @ 2.90GHz 9216KB)
# OS:   Red Hat Enterprise Linux 9.7 (Plow)

source scan.tcl
create_generated_clock -master_clock $CLK2 -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_* U1_Integer_Clock_Divider_RX/o_div_clk] \
                       -divide_by 1
create_generated_clock -master_clock $CLK2 -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_ports U1_Integer_Clock_Divider_RX/o_div_clk] \
                       -divide_by 1
create_generated_clock -master_clock $CLK2 -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" [get_pins U1_Integer_Clock_Divider_RX/o_div_clk] \
                       -divide_by 1
create_generated_clock -master_clock $CLK2 -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" -devide_by 1 [get_pins U1_Integer_Clock_Divider_RX/o_div_clk]
create_generated_clock -master_clock $CLK2 -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" -divide_by 1 [get_pins U1_Integer_Clock_Divider_RX/o_div_clk]
create_generated_clock -source [get_ports UART_CLK] \
                       -name "UART_RX_CLK" -divide_by 1 [get_pins U1_Integer_Clock_Divider_RX/o_div_clk]
exit
