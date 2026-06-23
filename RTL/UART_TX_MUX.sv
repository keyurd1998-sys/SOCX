//==============================================================================
// Project      : SOC Controller
// File Name    : UART_TX_MUX.sv
// Module Name  : UART_TX_MUX
// Author       : Inaved-Semicon
// Created On   : 19 April, 2026
// Description  : RTL Module
//
//==============================================================================
// Inaved-Semicon
//==============================================================================


module UART_TX_MUX (
	input 	wire 	[1:0]	mux_sel,
/*	input 	wire 			start_bit,
	input 	wire 			stop_bit,*/
	input 	wire 			S_DATA,
	input 	wire 			par_bit,
	output	reg 			TX_OUT
	);


always@(*)
 begin
 	case (mux_sel)
 	2'b00 : begin 
 				TX_OUT = 1'b1;
 			end

 	2'b01 : begin
 				TX_OUT = 1'b0;
 			end

 	2'b11 : begin
 				TX_OUT = S_DATA;
 			end

 	2'b10 : begin
 				TX_OUT = par_bit;
 			end
 	default : begin
 				TX_OUT = 1'b1;
 	 		  end	
 	endcase

 end


endmodule