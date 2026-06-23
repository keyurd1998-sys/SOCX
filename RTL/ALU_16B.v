//==============================================================================
// Project      : SOC Controller
// File Name    : ALU_16B.v
// Module Name  : ALU_16B
// Author       : Inaved-Semicon
// Created On   : 19 April, 2026
// Description  : RTL Module
//
//==============================================================================
// Inaved-Semicon
//==============================================================================


module ALU_16B #( parameter OPER_WIDTH = 8, OUT_WIDTH = OPER_WIDTH*2) (
input		wire		[OPER_WIDTH-1:0]		A,
input		wire		[OPER_WIDTH-1:0]		B,
input		wire												EN,
input		wire		[3:0]								ALU_FUN,
input		wire												CLK,
input		wire												RST,
output	reg			[OUT_WIDTH-1:0]			ALU_OUT,
output	reg													OUT_VALID
	);


//internal_signals  
reg [OUT_WIDTH-1:0] ALU_OUT_Comb;


always @(posedge CLK or negedge RST)
begin
   if(!RST)
   begin
      ALU_OUT   <= 'b0;
      OUT_VALID <= 1'b0;
   end
   else if (EN)
   begin
      ALU_OUT   <= ALU_OUT_Comb;
      OUT_VALID <= 1'b1;
   end
   else
   begin
      OUT_VALID <= 1'b0;
   end
end


always @(*)
begin
   ALU_OUT_Comb = 'b0;

   case (ALU_FUN)

      4'b0000 : ALU_OUT_Comb = A + B;
      4'b0001 : ALU_OUT_Comb = A - B;
      4'b0010 : ALU_OUT_Comb = A * B;
      4'b0011 : ALU_OUT_Comb = A / B;

      4'b0100 : ALU_OUT_Comb = A & B;
      4'b0101 : ALU_OUT_Comb = A | B;
      4'b0110 : ALU_OUT_Comb = ~(A & B);
      4'b0111 : ALU_OUT_Comb = ~(A | B);

      4'b1000 : ALU_OUT_Comb = A ^ B;
      4'b1001 : ALU_OUT_Comb = ~(A ^ B);

      4'b1010 : ALU_OUT_Comb = (A == B) ? 'd1 : 'd0;
      4'b1011 : ALU_OUT_Comb = (A > B)  ? 'd2 : 'd0;
      4'b1100 : ALU_OUT_Comb = (A < B)  ? 'd3 : 'd0;

      4'b1101 : ALU_OUT_Comb = A >> 1;
      4'b1110 : ALU_OUT_Comb = A << 1;

      default : ALU_OUT_Comb = 'b0;

   endcase
end


endmodule
