//==============================================================================
// Project      : SOC Controller
// File Name    : CLK_GATE.v
// Module Name  : CLK_GATE
// Author       : Inaved-Semicon
// Created On   : 19 April, 2026
// Description  : RTL Module
//
//==============================================================================
// Inaved-Semicon
//==============================================================================



/////////////////////////////////////////////////////////////
/////////////////////// Clock Gating ////////////////////////
/////////////////////////////////////////////////////////////

module CLK_GATE (
input      CLK_EN,
input      CLK,
output     GATED_CLK
);

/*
//internal connections
reg     Latch_Out ;

//latch (Level Sensitive Device)
always @(CLK or CLK_EN)
 begin
  if(!CLK)      // active low
   begin
    Latch_Out <= CLK_EN ;
   end
 end

 
// ANDING
assign  GATED_CLK = CLK && Latch_Out ;
*/




TLATNCAX12 U0_TLATNCAX12M (
.E(CLK_EN),
.CK(CLK),
.ECK(GATED_CLK)
);






endmodule
