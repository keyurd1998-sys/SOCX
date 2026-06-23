//==============================================================================
// Project      : SOC Controller
// File Name    : CLKDIV_MUX.v
// Module Name  : CLKDIV_MUX
// Author       : Inaved-Semicon
// Created On   : 19 April, 2026
// Description  : RTL Module
//
//==============================================================================
// Inaved-Semicon
//==============================================================================



module CLKDIV_MUX #(parameter WIDTH = 8)  (
input    wire     [5:0]              IN,
output   reg      [WIDTH-1:0]        OUT
);


always @(*)
  begin
	case(IN) 
	6'b100000 : begin
				OUT = 'd1 ;
				end
	6'b010000 : begin
				OUT = 'd2 ;
				end	
	6'b001000 : begin
				OUT = 'd4 ;
				end	
	6'b000100 : begin
				OUT = 'd8 ;
				end
	default   : begin
				OUT = 'd1 ;
				end					
	endcase
  end	
  
  
  
  
endmodule
