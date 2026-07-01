//***************************************************************************//
//                           VERILOG MAINSIM FILE                            //
// Modus(TM) DFT Software Solution, Version 25.10-p027_1, built Mar 13 2025  //
//***************************************************************************//
//                                                                           //
//  FILE CREATED..............July 01, 2026 at 17:11:19                      //
//                                                                           //
//  PROJECT NAME..............ATPG                                           //
//                                                                           //
//  TESTMODE..................FULLSCAN                                       //
//                                                                           //
//  INEXPERIMENT..............TOP_atpg                                       //
//                                                                           //
//  TDR.......................dummy.tdr                                      //
//                                                                           //
//  TEST PERIOD...............80.000   TEST TIME UNITS...........ns          //
//  TEST PULSE WIDTH..........8.000                                          //
//  TEST STROBE OFFSET........72.000   TEST STROBE TYPE..........edge        //
//  TEST BIDI OFFSET..........0.000                                          //
//  TEST PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//  SCAN FORMAT...............parallel SCAN OVERLAP..............yes         //
//  SCAN PERIOD...............80.000   SCAN TIME UNITS...........ns          //
//  SCAN PULSE WIDTH..........8.000                                          //
//  SCAN STROBE OFFSET........8.000    SCAN STROBE TYPE..........edge        //
//  SCAN BIDI OFFSET..........0.000                                          //
//  SCAN PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//                                                                           //
//   Individually set PIs                                                    //
//  "REF_CLK" (PI # 1)                                                       //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  "UART_CLK" (PI # 9)                                                      //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  Active TESTMODEs TM = 1 ..FULLSCAN                                       //
//                                                                           //
//***************************************************************************//

// Command Line: write_vectors -WORKDIR /home/admin/DFT/SOCX/ATPG -TESTMODE FULLSCAN -INEXPERIMENT TOP_atpg -STDOUT summary -language verilog -scanformat parallel

  `timescale 1 ns / 1 ps

  module ATPG_FULLSCAN_TOP_atpg ;

//***************************************************************************//
//                DEFINE VARIABLES FOR ALL PRIMARY I/O PORTS                 //
//***************************************************************************//

  reg [1:10] stim_PIs;   
  reg [1:10] part_PIs;   

  reg [1:10] stim_CIs;   

  reg [1:7] meas_POs;   

  reg [1:7] scan_POs;   
  wire [1:7] part_POs;   

//***************************************************************************//
//                   DEFINE VARIABLES FOR ALL SHIFT CHAINS                   //
//***************************************************************************//

  reg [1:91] stim_CR_1;   reg [1:91] stim_CR_2;   reg [1:91] stim_CR_3;   reg [1:91] stim_CR_4;   

  reg [1:91] meas_OR_1;   reg [1:91] meas_OR_2;   reg [1:91] meas_OR_3;   reg [1:91] meas_OR_4;   

  reg [1:91] part_S_CR_1_TM_1;   reg [1:89] part_S_CR_2_TM_1;   reg [1:91] part_S_CR_3_TM_1;   reg [1:90] part_S_CR_4_TM_1;   

  wire [1:91] part_M_OR_1_TM_1;   wire [1:89] part_M_OR_2_TM_1;   wire [1:91] part_M_OR_3_TM_1;   wire [1:90] part_M_OR_4_TM_1;   


//***************************************************************************//
//                             OTHER DEFINITIONS                             //
//***************************************************************************//

  integer  CYCLE, SCANCYCLE, SERIALCYCLE, PInum, POnum, ORnum, MODENUM, EXPNUM, SCANOPNUM, SEQNUM, TASKNUM, START, NUM_SHIFTS, MultiShift, maxMultiShifts, MultiShiftsLeft, forcePointStart, forcePoint, SCANNUM, FREQNUM ; 
  integer  CMD, DATAID, SAVEID, TID, num_files, rc_read, repeat_depth, repeat_heart, MAX, FAILSETID, DIAG_DATAID; 
  integer  test_num, test_num_prev, failed_test_num, num_tests, num_failed_tests, total_num_tests, total_num_failed_tests, total_cycles, scan_num, overlap; 
  integer  repeat_num  [1:15]; 
  integer  num_repeats [1:15]; 
  reg      [1:8185] name_POs [1:7]; 
  reg      [130:0] good_compares, miscompares, miscompare_limit, total_good_compares, total_miscompares, measure_current; 
  reg      [63:0] start_of_repeat [1:15]; 
  reg      [63:0] start_of_current_line, fseek_offset; 
  reg      [130:0] line_number, save_line_number; 
  reg      count_cycles, sim_trace, sim_heart, sim_range, sim_range_measure, failset, global_term, sim_debug, sim_more_debug, diag_debug; 
  reg      [1:800] PATTERN, pattern, TESTFILE, INITFILE, SOD, EOD, eventID, DIAG_DEBUG_FILE; 
  reg      [1:8184] DATAFILE, SAVEFILE, COMMENT, FAILSET; 
  reg      [1:4096] PROCESSNAME; 

//***************************************************************************//
//        INSTANTIATE THE STRUCTURE AND CONNECT TO VERILOG VARIABLES         //
//***************************************************************************//

  TOP
    TOP_inst (
      .RST_N         ( part_PIs[002] ),      // pinName = RST_N;  tf = -SC  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .UART_CLK      ( part_PIs[009] ),      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .REF_CLK       ( part_PIs[001] ),      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .UART_RX_IN    ( part_PIs[010] ),      // pinName = UART_RX_IN; testOffset = 0.000000;  scanOffset = 0.000000;  
      .UART_TX_O     ( part_POs[005] ),      // pinName = UART_TX_O; 
      .parity_error  ( part_POs[007] ),      // pinName = parity_error; 
      .framing_error ( part_POs[006] ),      // pinName = framing_error; 
      .ScanEnable    ( part_PIs[003] ),      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .TestMode      ( part_PIs[008] ),      // pinName = TestMode;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanIn_1      ( part_PIs[004] ),      // pinName = ScanIn_1;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_1     ( part_POs[001] ),      // pinName = ScanOut_1;  tf =  SO  ; 
      .ScanIn_2      ( part_PIs[005] ),      // pinName = ScanIn_2;  tf =  SI1 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_2     ( part_POs[002] ),      // pinName = ScanOut_2;  tf =  SO1 ; 
      .ScanIn_3      ( part_PIs[006] ),      // pinName = ScanIn_3;  tf =  SI2 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_3     ( part_POs[003] ),      // pinName = ScanOut_3;  tf =  SO2 ; 
      .ScanIn_4      ( part_PIs[007] ),      // pinName = ScanIn_4;  tf =  SI3 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_4     ( part_POs[004] )     // pinName = ScanOut_4;  tf =  SO3 ; 
      );

//***************************************************************************//
//                        MAKE SOME OTHER CONNECTIONS                        //
//***************************************************************************//

  assign ( weak0, weak1 ) // Termination 
    part_POs [1] = global_term,     // pinName = ScanOut_1;  tf =  SO  ; 
    part_POs [2] = global_term,     // pinName = ScanOut_2;  tf =  SO1 ; 
    part_POs [3] = global_term,     // pinName = ScanOut_3;  tf =  SO2 ; 
    part_POs [4] = global_term,     // pinName = ScanOut_4;  tf =  SO3 ; 
    part_POs [5] = global_term,     // pinName = UART_TX_O; 
    part_POs [6] = global_term,     // pinName = framing_error; 
    part_POs [7] = global_term;      // pinName = parity_error; 


  assign ( supply0, supply1 ) // CR = 1 
    TOP_inst.ScanIn_1 = part_S_CR_1_TM_1 [91] ,   // CR = 1;  pos = 1;  Pin Index = 3;  Pin Name = ScanIn_1;  pinInvFromLatch = no;  Latch Index = 593;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[1] .SI = part_S_CR_1_TM_1 [90] ,   // CR = 1;  pos = 2;  Pin Index = 2630;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 838;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[2] .SI = part_S_CR_1_TM_1 [89] ,   // CR = 1;  pos = 3;  Pin Index = 2736;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 873;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[3] .SI = part_S_CR_1_TM_1 [88] ,   // CR = 1;  pos = 4;  Pin Index = 2842;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 908;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[4] .SI = part_S_CR_1_TM_1 [87] ,   // CR = 1;  pos = 5;  Pin Index = 2948;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 943;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[5] .SI = part_S_CR_1_TM_1 [86] ,   // CR = 1;  pos = 6;  Pin Index = 3054;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 978;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[6] .SI = part_S_CR_1_TM_1 [85] ,   // CR = 1;  pos = 7;  Pin Index = 3160;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 1013;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[7] .SI = part_S_CR_1_TM_1 [84] ,   // CR = 1;  pos = 8;  Pin Index = 3266;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 1048;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[8] .SI = part_S_CR_1_TM_1 [83] ,   // CR = 1;  pos = 9;  Pin Index = 3372;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[8].SI;  pinInvFromLatch = no;  Latch Index = 1083;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[8].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[9] .SI = part_S_CR_1_TM_1 [82] ,   // CR = 1;  pos = 10;  Pin Index = 3478;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[9].SI;  pinInvFromLatch = no;  Latch Index = 1118;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[9].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[10] .SI = part_S_CR_1_TM_1 [81] ,   // CR = 1;  pos = 11;  Pin Index = 1994;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[10].SI;  pinInvFromLatch = no;  Latch Index = 628;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[10].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[11] .SI = part_S_CR_1_TM_1 [80] ,   // CR = 1;  pos = 12;  Pin Index = 2100;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[11].SI;  pinInvFromLatch = no;  Latch Index = 663;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[11].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[12] .SI = part_S_CR_1_TM_1 [79] ,   // CR = 1;  pos = 13;  Pin Index = 2206;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[12].SI;  pinInvFromLatch = no;  Latch Index = 698;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[12].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[13] .SI = part_S_CR_1_TM_1 [78] ,   // CR = 1;  pos = 14;  Pin Index = 2312;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[13].SI;  pinInvFromLatch = no;  Latch Index = 733;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[13].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[14] .SI = part_S_CR_1_TM_1 [77] ,   // CR = 1;  pos = 15;  Pin Index = 2418;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[14].SI;  pinInvFromLatch = no;  Latch Index = 768;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[14].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[15] .SI = part_S_CR_1_TM_1 [76] ,   // CR = 1;  pos = 16;  Pin Index = 2524;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[15].SI;  pinInvFromLatch = no;  Latch Index = 803;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[15].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.OUT_VALID_reg.SI = part_S_CR_1_TM_1 [75] ,   // CR = 1;  pos = 17;  Pin Index = 1782;  Pin Name = U0_ALU_16B.OUT_VALID_reg.SI;  pinInvFromLatch = no;  Latch Index = 558;  Latch Name = U0_ALU_16B.OUT_VALID_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0] .SI = part_S_CR_1_TM_1 [74] ,   // CR = 1;  pos = 18;  Pin Index = 6714;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 2154;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1] .SI = part_S_CR_1_TM_1 [73] ,   // CR = 1;  pos = 19;  Pin Index = 6820;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 2189;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2] .SI = part_S_CR_1_TM_1 [72] ,   // CR = 1;  pos = 20;  Pin Index = 6926;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2].SI;  pinInvFromLatch = no;  Latch Index = 2224;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3] .SI = part_S_CR_1_TM_1 [71] ,   // CR = 1;  pos = 21;  Pin Index = 7032;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3].SI;  pinInvFromLatch = no;  Latch Index = 2259;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4] .SI = part_S_CR_1_TM_1 [70] ,   // CR = 1;  pos = 22;  Pin Index = 7138;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].SI;  pinInvFromLatch = no;  Latch Index = 2294;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5] .SI = part_S_CR_1_TM_1 [69] ,   // CR = 1;  pos = 23;  Pin Index = 7244;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].SI;  pinInvFromLatch = no;  Latch Index = 2329;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6] .SI = part_S_CR_1_TM_1 [68] ,   // CR = 1;  pos = 24;  Pin Index = 7350;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].SI;  pinInvFromLatch = no;  Latch Index = 2364;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7] .SI = part_S_CR_1_TM_1 [67] ,   // CR = 1;  pos = 25;  Pin Index = 7456;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].SI;  pinInvFromLatch = no;  Latch Index = 2399;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0] .SI = part_S_CR_1_TM_1 [66] ,   // CR = 1;  pos = 26;  Pin Index = 7562;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].SI;  pinInvFromLatch = no;  Latch Index = 2434;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1] .SI = part_S_CR_1_TM_1 [65] ,   // CR = 1;  pos = 27;  Pin Index = 7668;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].SI;  pinInvFromLatch = no;  Latch Index = 2469;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2] .SI = part_S_CR_1_TM_1 [64] ,   // CR = 1;  pos = 28;  Pin Index = 7774;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].SI;  pinInvFromLatch = no;  Latch Index = 2504;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3] .SI = part_S_CR_1_TM_1 [63] ,   // CR = 1;  pos = 29;  Pin Index = 7880;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].SI;  pinInvFromLatch = no;  Latch Index = 2539;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4] .SI = part_S_CR_1_TM_1 [62] ,   // CR = 1;  pos = 30;  Pin Index = 7986;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].SI;  pinInvFromLatch = no;  Latch Index = 2574;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5] .SI = part_S_CR_1_TM_1 [61] ,   // CR = 1;  pos = 31;  Pin Index = 8092;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].SI;  pinInvFromLatch = no;  Latch Index = 2609;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6] .SI = part_S_CR_1_TM_1 [60] ,   // CR = 1;  pos = 32;  Pin Index = 8198;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].SI;  pinInvFromLatch = no;  Latch Index = 2644;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7] .SI = part_S_CR_1_TM_1 [59] ,   // CR = 1;  pos = 33;  Pin Index = 8304;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].SI;  pinInvFromLatch = no;  Latch Index = 2679;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0] .SI = part_S_CR_1_TM_1 [58] ,   // CR = 1;  pos = 34;  Pin Index = 8410;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 2714;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1] .SI = part_S_CR_1_TM_1 [57] ,   // CR = 1;  pos = 35;  Pin Index = 8516;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 2749;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2] .SI = part_S_CR_1_TM_1 [56] ,   // CR = 1;  pos = 36;  Pin Index = 8622;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].SI;  pinInvFromLatch = no;  Latch Index = 2784;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3] .SI = part_S_CR_1_TM_1 [55] ,   // CR = 1;  pos = 37;  Pin Index = 8728;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].SI;  pinInvFromLatch = no;  Latch Index = 2819;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4] .SI = part_S_CR_1_TM_1 [54] ,   // CR = 1;  pos = 38;  Pin Index = 8834;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].SI;  pinInvFromLatch = no;  Latch Index = 2854;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5] .SI = part_S_CR_1_TM_1 [53] ,   // CR = 1;  pos = 39;  Pin Index = 8940;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].SI;  pinInvFromLatch = no;  Latch Index = 2889;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6] .SI = part_S_CR_1_TM_1 [52] ,   // CR = 1;  pos = 40;  Pin Index = 9046;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6].SI;  pinInvFromLatch = no;  Latch Index = 2924;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7] .SI = part_S_CR_1_TM_1 [51] ,   // CR = 1;  pos = 41;  Pin Index = 9152;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7].SI;  pinInvFromLatch = no;  Latch Index = 2959;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0] .SI = part_S_CR_1_TM_1 [50] ,   // CR = 1;  pos = 42;  Pin Index = 9258;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 2994;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1] .SI = part_S_CR_1_TM_1 [49] ,   // CR = 1;  pos = 43;  Pin Index = 9364;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 3029;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2] .SI = part_S_CR_1_TM_1 [48] ,   // CR = 1;  pos = 44;  Pin Index = 9470;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].SI;  pinInvFromLatch = no;  Latch Index = 3064;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3] .SI = part_S_CR_1_TM_1 [47] ,   // CR = 1;  pos = 45;  Pin Index = 9576;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].SI;  pinInvFromLatch = no;  Latch Index = 3099;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4] .SI = part_S_CR_1_TM_1 [46] ,   // CR = 1;  pos = 46;  Pin Index = 9682;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].SI;  pinInvFromLatch = no;  Latch Index = 3134;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5] .SI = part_S_CR_1_TM_1 [45] ,   // CR = 1;  pos = 47;  Pin Index = 9788;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].SI;  pinInvFromLatch = no;  Latch Index = 3169;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6] .SI = part_S_CR_1_TM_1 [44] ,   // CR = 1;  pos = 48;  Pin Index = 9894;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].SI;  pinInvFromLatch = no;  Latch Index = 3204;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7] .SI = part_S_CR_1_TM_1 [43] ,   // CR = 1;  pos = 49;  Pin Index = 10000;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].SI;  pinInvFromLatch = no;  Latch Index = 3239;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0] .SI = part_S_CR_1_TM_1 [42] ,   // CR = 1;  pos = 50;  Pin Index = 10106;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].SI;  pinInvFromLatch = no;  Latch Index = 3274;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1] .SI = part_S_CR_1_TM_1 [41] ,   // CR = 1;  pos = 51;  Pin Index = 10212;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].SI;  pinInvFromLatch = no;  Latch Index = 3309;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2] .SI = part_S_CR_1_TM_1 [40] ,   // CR = 1;  pos = 52;  Pin Index = 10318;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].SI;  pinInvFromLatch = no;  Latch Index = 3344;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3] .SI = part_S_CR_1_TM_1 [39] ,   // CR = 1;  pos = 53;  Pin Index = 10424;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].SI;  pinInvFromLatch = no;  Latch Index = 3379;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4] .SI = part_S_CR_1_TM_1 [38] ,   // CR = 1;  pos = 54;  Pin Index = 10530;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].SI;  pinInvFromLatch = no;  Latch Index = 3414;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5] .SI = part_S_CR_1_TM_1 [37] ,   // CR = 1;  pos = 55;  Pin Index = 10636;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].SI;  pinInvFromLatch = no;  Latch Index = 3449;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6] .SI = part_S_CR_1_TM_1 [36] ,   // CR = 1;  pos = 56;  Pin Index = 10742;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].SI;  pinInvFromLatch = no;  Latch Index = 3484;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7] .SI = part_S_CR_1_TM_1 [35] ,   // CR = 1;  pos = 57;  Pin Index = 10848;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].SI;  pinInvFromLatch = no;  Latch Index = 3519;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0] .SI = part_S_CR_1_TM_1 [34] ,   // CR = 1;  pos = 58;  Pin Index = 10954;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].SI;  pinInvFromLatch = no;  Latch Index = 3554;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1] .SI = part_S_CR_1_TM_1 [33] ,   // CR = 1;  pos = 59;  Pin Index = 11060;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].SI;  pinInvFromLatch = no;  Latch Index = 3589;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2] .SI = part_S_CR_1_TM_1 [32] ,   // CR = 1;  pos = 60;  Pin Index = 11166;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2].SI;  pinInvFromLatch = no;  Latch Index = 3624;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3] .SI = part_S_CR_1_TM_1 [31] ,   // CR = 1;  pos = 61;  Pin Index = 11272;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3].SI;  pinInvFromLatch = no;  Latch Index = 3659;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4] .SI = part_S_CR_1_TM_1 [30] ,   // CR = 1;  pos = 62;  Pin Index = 11378;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].SI;  pinInvFromLatch = no;  Latch Index = 3694;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5] .SI = part_S_CR_1_TM_1 [29] ,   // CR = 1;  pos = 63;  Pin Index = 11484;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].SI;  pinInvFromLatch = no;  Latch Index = 3729;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6] .SI = part_S_CR_1_TM_1 [28] ,   // CR = 1;  pos = 64;  Pin Index = 11590;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].SI;  pinInvFromLatch = no;  Latch Index = 3764;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7] .SI = part_S_CR_1_TM_1 [27] ,   // CR = 1;  pos = 65;  Pin Index = 11696;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].SI;  pinInvFromLatch = no;  Latch Index = 3799;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0] .SI = part_S_CR_1_TM_1 [26] ,   // CR = 1;  pos = 66;  Pin Index = 11802;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].SI;  pinInvFromLatch = no;  Latch Index = 3834;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1] .SI = part_S_CR_1_TM_1 [25] ,   // CR = 1;  pos = 67;  Pin Index = 11908;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].SI;  pinInvFromLatch = no;  Latch Index = 3869;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2] .SI = part_S_CR_1_TM_1 [24] ,   // CR = 1;  pos = 68;  Pin Index = 12014;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].SI;  pinInvFromLatch = no;  Latch Index = 3904;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3] .SI = part_S_CR_1_TM_1 [23] ,   // CR = 1;  pos = 69;  Pin Index = 12120;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].SI;  pinInvFromLatch = no;  Latch Index = 3939;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4] .SI = part_S_CR_1_TM_1 [22] ,   // CR = 1;  pos = 70;  Pin Index = 12226;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].SI;  pinInvFromLatch = no;  Latch Index = 3974;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5] .SI = part_S_CR_1_TM_1 [21] ,   // CR = 1;  pos = 71;  Pin Index = 12332;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].SI;  pinInvFromLatch = no;  Latch Index = 4009;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6] .SI = part_S_CR_1_TM_1 [20] ,   // CR = 1;  pos = 72;  Pin Index = 12438;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].SI;  pinInvFromLatch = no;  Latch Index = 4044;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7] .SI = part_S_CR_1_TM_1 [19] ,   // CR = 1;  pos = 73;  Pin Index = 12544;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].SI;  pinInvFromLatch = no;  Latch Index = 4079;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0] .SI = part_S_CR_1_TM_1 [18] ,   // CR = 1;  pos = 74;  Pin Index = 12650;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].SI;  pinInvFromLatch = no;  Latch Index = 4114;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1] .SI = part_S_CR_1_TM_1 [17] ,   // CR = 1;  pos = 75;  Pin Index = 12756;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].SI;  pinInvFromLatch = no;  Latch Index = 4149;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2] .SI = part_S_CR_1_TM_1 [16] ,   // CR = 1;  pos = 76;  Pin Index = 12862;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].SI;  pinInvFromLatch = no;  Latch Index = 4184;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3] .SI = part_S_CR_1_TM_1 [15] ,   // CR = 1;  pos = 77;  Pin Index = 12968;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].SI;  pinInvFromLatch = no;  Latch Index = 4219;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4] .SI = part_S_CR_1_TM_1 [14] ,   // CR = 1;  pos = 78;  Pin Index = 13074;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].SI;  pinInvFromLatch = no;  Latch Index = 4254;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5] .SI = part_S_CR_1_TM_1 [13] ,   // CR = 1;  pos = 79;  Pin Index = 13180;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].SI;  pinInvFromLatch = no;  Latch Index = 4289;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6] .SI = part_S_CR_1_TM_1 [12] ,   // CR = 1;  pos = 80;  Pin Index = 13286;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6].SI;  pinInvFromLatch = no;  Latch Index = 4324;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7] .SI = part_S_CR_1_TM_1 [11] ,   // CR = 1;  pos = 81;  Pin Index = 13392;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7].SI;  pinInvFromLatch = no;  Latch Index = 4359;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0] .SI = part_S_CR_1_TM_1 [10] ,   // CR = 1;  pos = 82;  Pin Index = 16176;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 5205;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1] .SI = part_S_CR_1_TM_1 [9] ,   // CR = 1;  pos = 83;  Pin Index = 16282;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 5240;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2] .SI = part_S_CR_1_TM_1 [8] ,   // CR = 1;  pos = 84;  Pin Index = 16388;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 5275;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3] .SI = part_S_CR_1_TM_1 [7] ,   // CR = 1;  pos = 85;  Pin Index = 16494;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 5310;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0] .SI = part_S_CR_1_TM_1 [6] ,   // CR = 1;  pos = 86;  Pin Index = 16600;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 5345;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1] .SI = part_S_CR_1_TM_1 [5] ,   // CR = 1;  pos = 87;  Pin Index = 16706;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 5380;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2] .SI = part_S_CR_1_TM_1 [4] ,   // CR = 1;  pos = 88;  Pin Index = 16812;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 5415;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3] .SI = part_S_CR_1_TM_1 [3] ,   // CR = 1;  pos = 89;  Pin Index = 16918;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 5450;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0] .SI = part_S_CR_1_TM_1 [2] ,   // CR = 1;  pos = 90;  Pin Index = 17208;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 5542;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1] .SI = part_S_CR_1_TM_1 [1] ;   // CR = 1;  pos = 91;  Pin Index = 17314;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 5577;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 2 
    TOP_inst.ScanIn_2 = part_S_CR_2_TM_1 [89] ,   // CR = 2;  pos = 1;  Pin Index = 4;  Pin Name = ScanIn_2;  pinInvFromLatch = no;  Latch Index = 4866;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1] .SI = part_S_CR_2_TM_1 [88] ,   // CR = 2;  pos = 2;  Pin Index = 15245;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 4901;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2] .SI = part_S_CR_2_TM_1 [87] ,   // CR = 2;  pos = 3;  Pin Index = 15351;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 4936;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3] .SI = part_S_CR_2_TM_1 [86] ,   // CR = 2;  pos = 4;  Pin Index = 15457;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 4971;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0] .SI = part_S_CR_2_TM_1 [85] ,   // CR = 2;  pos = 5;  Pin Index = 15563;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 5006;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1] .SI = part_S_CR_2_TM_1 [84] ,   // CR = 2;  pos = 6;  Pin Index = 15669;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 5041;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2] .SI = part_S_CR_2_TM_1 [83] ,   // CR = 2;  pos = 7;  Pin Index = 15775;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 5076;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3] .SI = part_S_CR_2_TM_1 [82] ,   // CR = 2;  pos = 8;  Pin Index = 15881;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 5111;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0] .SI = part_S_CR_2_TM_1 [81] ,   // CR = 2;  pos = 9;  Pin Index = 18075;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 5825;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1] .SI = part_S_CR_2_TM_1 [80] ,   // CR = 2;  pos = 10;  Pin Index = 18181;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 5860;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0] .SI = part_S_CR_2_TM_1 [79] ,   // CR = 2;  pos = 11;  Pin Index = 18287;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].SI;  pinInvFromLatch = no;  Latch Index = 5895;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1] .SI = part_S_CR_2_TM_1 [78] ,   // CR = 2;  pos = 12;  Pin Index = 18393;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].SI;  pinInvFromLatch = no;  Latch Index = 5930;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0] .SI = part_S_CR_2_TM_1 [77] ,   // CR = 2;  pos = 13;  Pin Index = 18499;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 5965;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1] .SI = part_S_CR_2_TM_1 [76] ,   // CR = 2;  pos = 14;  Pin Index = 18605;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 6000;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0] .SI = part_S_CR_2_TM_1 [75] ,   // CR = 2;  pos = 15;  Pin Index = 18711;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 6035;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1] .SI = part_S_CR_2_TM_1 [74] ,   // CR = 2;  pos = 16;  Pin Index = 18817;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 6070;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[0] .SI = part_S_CR_2_TM_1 [73] ,   // CR = 2;  pos = 17;  Pin Index = 20505;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 6607;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[1] .SI = part_S_CR_2_TM_1 [72] ,   // CR = 2;  pos = 18;  Pin Index = 20611;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 6642;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[2] .SI = part_S_CR_2_TM_1 [71] ,   // CR = 2;  pos = 19;  Pin Index = 20717;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 6677;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[3] .SI = part_S_CR_2_TM_1 [70] ,   // CR = 2;  pos = 20;  Pin Index = 20823;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 6712;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[4] .SI = part_S_CR_2_TM_1 [69] ,   // CR = 2;  pos = 21;  Pin Index = 20929;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 6747;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[5] .SI = part_S_CR_2_TM_1 [68] ,   // CR = 2;  pos = 22;  Pin Index = 21035;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 6782;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[6] .SI = part_S_CR_2_TM_1 [67] ,   // CR = 2;  pos = 23;  Pin Index = 21141;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 6817;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.gen_clk_reg.SI = part_S_CR_2_TM_1 [66] ,   // CR = 2;  pos = 24;  Pin Index = 21793;  Pin Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.SI;  pinInvFromLatch = no;  Latch Index = 7038;  Latch Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_PULSE_GEN.pls_flop_reg.SI = part_S_CR_2_TM_1 [65] ,   // CR = 2;  pos = 25;  Pin Index = 21923;  Pin Name = U0_PULSE_GEN.pls_flop_reg.SI;  pinInvFromLatch = no;  Latch Index = 7080;  Latch Name = U0_PULSE_GEN.pls_flop_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_PULSE_GEN.rcv_flop_reg.SI = part_S_CR_2_TM_1 [64] ,   // CR = 2;  pos = 26;  Pin Index = 22029;  Pin Name = U0_PULSE_GEN.rcv_flop_reg.SI;  pinInvFromLatch = no;  Latch Index = 7115;  Latch Name = U0_PULSE_GEN.rcv_flop_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0] .SI = part_S_CR_2_TM_1 [63] ,   // CR = 2;  pos = 27;  Pin Index = 44142;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 14205;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1] .SI = part_S_CR_2_TM_1 [62] ,   // CR = 2;  pos = 28;  Pin Index = 44248;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 14240;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2] .SI = part_S_CR_2_TM_1 [61] ,   // CR = 2;  pos = 29;  Pin Index = 44354;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 14275;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.SI = part_S_CR_2_TM_1 [60] ,   // CR = 2;  pos = 30;  Pin Index = 45751;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.SI;  pinInvFromLatch = no;  Latch Index = 14741;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0] .SI = part_S_CR_2_TM_1 [59] ,   // CR = 2;  pos = 31;  Pin Index = 45027;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 14487;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1] .SI = part_S_CR_2_TM_1 [58] ,   // CR = 2;  pos = 32;  Pin Index = 45116;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 14517;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2] .SI = part_S_CR_2_TM_1 [57] ,   // CR = 2;  pos = 33;  Pin Index = 45205;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 14547;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0] .SI = part_S_CR_2_TM_1 [56] ,   // CR = 2;  pos = 34;  Pin Index = 45876;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 14777;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1] .SI = part_S_CR_2_TM_1 [55] ,   // CR = 2;  pos = 35;  Pin Index = 45982;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 14812;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2] .SI = part_S_CR_2_TM_1 [54] ,   // CR = 2;  pos = 36;  Pin Index = 46088;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 14847;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3] .SI = part_S_CR_2_TM_1 [53] ,   // CR = 2;  pos = 37;  Pin Index = 46194;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 14882;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4] .SI = part_S_CR_2_TM_1 [52] ,   // CR = 2;  pos = 38;  Pin Index = 46300;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 14917;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5] .SI = part_S_CR_2_TM_1 [51] ,   // CR = 2;  pos = 39;  Pin Index = 46406;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 14952;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6] .SI = part_S_CR_2_TM_1 [50] ,   // CR = 2;  pos = 40;  Pin Index = 46512;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 14987;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7] .SI = part_S_CR_2_TM_1 [49] ,   // CR = 2;  pos = 41;  Pin Index = 46618;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 15022;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0] .SI = part_S_CR_2_TM_1 [48] ,   // CR = 2;  pos = 42;  Pin Index = 47086;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 15172;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1] .SI = part_S_CR_2_TM_1 [47] ,   // CR = 2;  pos = 43;  Pin Index = 47192;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 15207;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2] .SI = part_S_CR_2_TM_1 [46] ,   // CR = 2;  pos = 44;  Pin Index = 47298;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 15242;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3] .SI = part_S_CR_2_TM_1 [45] ,   // CR = 2;  pos = 45;  Pin Index = 47404;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 15277;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0] .SI = part_S_CR_2_TM_1 [44] ,   // CR = 2;  pos = 46;  Pin Index = 47510;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 15312;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1] .SI = part_S_CR_2_TM_1 [43] ,   // CR = 2;  pos = 47;  Pin Index = 47616;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 15347;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2] .SI = part_S_CR_2_TM_1 [42] ,   // CR = 2;  pos = 48;  Pin Index = 47722;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 15382;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3] .SI = part_S_CR_2_TM_1 [41] ,   // CR = 2;  pos = 49;  Pin Index = 47828;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 15417;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4] .SI = part_S_CR_2_TM_1 [40] ,   // CR = 2;  pos = 50;  Pin Index = 47934;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 15452;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.SI = part_S_CR_2_TM_1 [39] ,   // CR = 2;  pos = 51;  Pin Index = 48745;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.SI;  pinInvFromLatch = no;  Latch Index = 15719;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.parity_reg.SI = part_S_CR_2_TM_1 [38] ,   // CR = 2;  pos = 52;  Pin Index = 48851;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.SI;  pinInvFromLatch = no;  Latch Index = 15754;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.SI = part_S_CR_2_TM_1 [37] ,   // CR = 2;  pos = 53;  Pin Index = 49172;  Pin Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.SI;  pinInvFromLatch = no;  Latch Index = 15859;  Latch Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.SI = part_S_CR_2_TM_1 [36] ,   // CR = 2;  pos = 54;  Pin Index = 49503;  Pin Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.SI;  pinInvFromLatch = no;  Latch Index = 15963;  Latch Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0] .SI = part_S_CR_2_TM_1 [35] ,   // CR = 2;  pos = 55;  Pin Index = 49641;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 16000;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1] .SI = part_S_CR_2_TM_1 [34] ,   // CR = 2;  pos = 56;  Pin Index = 49747;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 16035;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2] .SI = part_S_CR_2_TM_1 [33] ,   // CR = 2;  pos = 57;  Pin Index = 49853;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 16070;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0] .SI = part_S_CR_2_TM_1 [32] ,   // CR = 2;  pos = 58;  Pin Index = 50130;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 16161;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1] .SI = part_S_CR_2_TM_1 [31] ,   // CR = 2;  pos = 59;  Pin Index = 50236;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 16196;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2] .SI = part_S_CR_2_TM_1 [30] ,   // CR = 2;  pos = 60;  Pin Index = 50342;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 16231;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3] .SI = part_S_CR_2_TM_1 [29] ,   // CR = 2;  pos = 61;  Pin Index = 50448;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 16266;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4] .SI = part_S_CR_2_TM_1 [28] ,   // CR = 2;  pos = 62;  Pin Index = 50554;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 16301;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5] .SI = part_S_CR_2_TM_1 [27] ,   // CR = 2;  pos = 63;  Pin Index = 50660;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 16336;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6] .SI = part_S_CR_2_TM_1 [26] ,   // CR = 2;  pos = 64;  Pin Index = 50766;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 16371;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7] .SI = part_S_CR_2_TM_1 [25] ,   // CR = 2;  pos = 65;  Pin Index = 50872;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 16406;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.SI = part_S_CR_2_TM_1 [24] ,   // CR = 2;  pos = 66;  Pin Index = 51171;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.SI;  pinInvFromLatch = no;  Latch Index = 16495;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0] .SI = part_S_CR_2_TM_1 [23] ,   // CR = 2;  pos = 67;  Pin Index = 51275;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 16530;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1] .SI = part_S_CR_2_TM_1 [22] ,   // CR = 2;  pos = 68;  Pin Index = 51381;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 16565;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2] .SI = part_S_CR_2_TM_1 [21] ,   // CR = 2;  pos = 69;  Pin Index = 51487;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 16600;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3] .SI = part_S_CR_2_TM_1 [20] ,   // CR = 2;  pos = 70;  Pin Index = 51593;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 16635;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0] .SI = part_S_CR_2_TM_1 [19] ,   // CR = 2;  pos = 71;  Pin Index = 51699;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 16670;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1] .SI = part_S_CR_2_TM_1 [18] ,   // CR = 2;  pos = 72;  Pin Index = 51805;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 16705;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2] .SI = part_S_CR_2_TM_1 [17] ,   // CR = 2;  pos = 73;  Pin Index = 51911;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 16740;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3] .SI = part_S_CR_2_TM_1 [16] ,   // CR = 2;  pos = 74;  Pin Index = 52017;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 16775;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4] .SI = part_S_CR_2_TM_1 [15] ,   // CR = 2;  pos = 75;  Pin Index = 52123;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 16810;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5] .SI = part_S_CR_2_TM_1 [14] ,   // CR = 2;  pos = 76;  Pin Index = 52229;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 16845;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6] .SI = part_S_CR_2_TM_1 [13] ,   // CR = 2;  pos = 77;  Pin Index = 52335;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 16880;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7] .SI = part_S_CR_2_TM_1 [12] ,   // CR = 2;  pos = 78;  Pin Index = 52441;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 16915;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.SI = part_S_CR_2_TM_1 [11] ,   // CR = 2;  pos = 79;  Pin Index = 52945;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.SI;  pinInvFromLatch = no;  Latch Index = 17084;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[0] .SI = part_S_CR_2_TM_1 [10] ,   // CR = 2;  pos = 80;  Pin Index = 53067;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 17120;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[1] .SI = part_S_CR_2_TM_1 [9] ,   // CR = 2;  pos = 81;  Pin Index = 53173;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 17155;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[2] .SI = part_S_CR_2_TM_1 [8] ,   // CR = 2;  pos = 82;  Pin Index = 53279;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 17190;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[3] .SI = part_S_CR_2_TM_1 [7] ,   // CR = 2;  pos = 83;  Pin Index = 53385;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 17225;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[4] .SI = part_S_CR_2_TM_1 [6] ,   // CR = 2;  pos = 84;  Pin Index = 53491;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 17260;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[5] .SI = part_S_CR_2_TM_1 [5] ,   // CR = 2;  pos = 85;  Pin Index = 53597;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 17295;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[6] .SI = part_S_CR_2_TM_1 [4] ,   // CR = 2;  pos = 86;  Pin Index = 53703;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 17330;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.gen_clk_reg.SI = part_S_CR_2_TM_1 [3] ,   // CR = 2;  pos = 87;  Pin Index = 54153;  Pin Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.SI;  pinInvFromLatch = no;  Latch Index = 17484;  Latch Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.__iNsT2.dff_primitive;   
    TOP_inst.U1_RST_SYNC_UART.\sync_reg_reg[0] .SI = part_S_CR_2_TM_1 [2] ,   // CR = 2;  pos = 88;  Pin Index = 54265;  Pin Name = U1_RST_SYNC_UART.\sync_reg_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 17520;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U1_RST_SYNC_UART.\sync_reg_reg[1] .SI = part_S_CR_2_TM_1 [1] ;   // CR = 2;  pos = 89;  Pin Index = 54371;  Pin Name = U1_RST_SYNC_UART.\sync_reg_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 17555;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[1].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 3 
    TOP_inst.ScanIn_3 = part_S_CR_3_TM_1 [91] ,   // CR = 3;  pos = 1;  Pin Index = 5;  Pin Name = ScanIn_3;  pinInvFromLatch = no;  Latch Index = 5612;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1] .SI = part_S_CR_3_TM_1 [90] ,   // CR = 3;  pos = 2;  Pin Index = 17526;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].SI;  pinInvFromLatch = no;  Latch Index = 5647;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0] .SI = part_S_CR_3_TM_1 [89] ,   // CR = 3;  pos = 3;  Pin Index = 17632;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 5682;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1] .SI = part_S_CR_3_TM_1 [88] ,   // CR = 3;  pos = 4;  Pin Index = 17738;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 5717;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0] .SI = part_S_CR_3_TM_1 [87] ,   // CR = 3;  pos = 5;  Pin Index = 17844;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 5752;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1] .SI = part_S_CR_3_TM_1 [86] ,   // CR = 3;  pos = 6;  Pin Index = 17950;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 5787;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.enable_flop_reg.SI = part_S_CR_3_TM_1 [85] ,   // CR = 3;  pos = 7;  Pin Index = 20155;  Pin Name = U0_DATA_SYNC.enable_flop_reg.SI;  pinInvFromLatch = no;  Latch Index = 6501;  Latch Name = U0_DATA_SYNC.enable_flop_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.enable_pulse_reg.SI = part_S_CR_3_TM_1 [84] ,   // CR = 3;  pos = 8;  Pin Index = 20261;  Pin Name = U0_DATA_SYNC.enable_pulse_reg.SI;  pinInvFromLatch = no;  Latch Index = 6536;  Latch Name = U0_DATA_SYNC.enable_pulse_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[0] .SI = part_S_CR_3_TM_1 [83] ,   // CR = 3;  pos = 9;  Pin Index = 19095;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 6151;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[1] .SI = part_S_CR_3_TM_1 [82] ,   // CR = 3;  pos = 10;  Pin Index = 19201;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 6186;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[2] .SI = part_S_CR_3_TM_1 [81] ,   // CR = 3;  pos = 11;  Pin Index = 19307;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 6221;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[3] .SI = part_S_CR_3_TM_1 [80] ,   // CR = 3;  pos = 12;  Pin Index = 19413;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 6256;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[4] .SI = part_S_CR_3_TM_1 [79] ,   // CR = 3;  pos = 13;  Pin Index = 19519;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 6291;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[5] .SI = part_S_CR_3_TM_1 [78] ,   // CR = 3;  pos = 14;  Pin Index = 19625;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 6326;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[6] .SI = part_S_CR_3_TM_1 [77] ,   // CR = 3;  pos = 15;  Pin Index = 19731;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 6361;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[7] .SI = part_S_CR_3_TM_1 [76] ,   // CR = 3;  pos = 16;  Pin Index = 19837;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 6396;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_reg_reg[0] .SI = part_S_CR_3_TM_1 [75] ,   // CR = 3;  pos = 17;  Pin Index = 19943;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 6431;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_reg_reg[1] .SI = part_S_CR_3_TM_1 [74] ,   // CR = 3;  pos = 18;  Pin Index = 20049;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 6466;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[0] .SI = part_S_CR_3_TM_1 [73] ,   // CR = 3;  pos = 19;  Pin Index = 22141;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 7151;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[1] .SI = part_S_CR_3_TM_1 [72] ,   // CR = 3;  pos = 20;  Pin Index = 22247;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 7186;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][0] .SI = part_S_CR_3_TM_1 [71] ,   // CR = 3;  pos = 21;  Pin Index = 22527;  Pin Name = U0_Register_File.\Memory_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 7260;  Latch Name = U0_Register_File.\Memory_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][1] .SI = part_S_CR_3_TM_1 [70] ,   // CR = 3;  pos = 22;  Pin Index = 22633;  Pin Name = U0_Register_File.\Memory_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 7295;  Latch Name = U0_Register_File.\Memory_reg[0][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][2] .SI = part_S_CR_3_TM_1 [69] ,   // CR = 3;  pos = 23;  Pin Index = 22739;  Pin Name = U0_Register_File.\Memory_reg[0][2].SI;  pinInvFromLatch = no;  Latch Index = 7330;  Latch Name = U0_Register_File.\Memory_reg[0][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][3] .SI = part_S_CR_3_TM_1 [68] ,   // CR = 3;  pos = 24;  Pin Index = 22845;  Pin Name = U0_Register_File.\Memory_reg[0][3].SI;  pinInvFromLatch = no;  Latch Index = 7365;  Latch Name = U0_Register_File.\Memory_reg[0][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][4] .SI = part_S_CR_3_TM_1 [67] ,   // CR = 3;  pos = 25;  Pin Index = 22951;  Pin Name = U0_Register_File.\Memory_reg[0][4].SI;  pinInvFromLatch = no;  Latch Index = 7400;  Latch Name = U0_Register_File.\Memory_reg[0][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][5] .SI = part_S_CR_3_TM_1 [66] ,   // CR = 3;  pos = 26;  Pin Index = 23057;  Pin Name = U0_Register_File.\Memory_reg[0][5].SI;  pinInvFromLatch = no;  Latch Index = 7435;  Latch Name = U0_Register_File.\Memory_reg[0][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][6] .SI = part_S_CR_3_TM_1 [65] ,   // CR = 3;  pos = 27;  Pin Index = 23163;  Pin Name = U0_Register_File.\Memory_reg[0][6].SI;  pinInvFromLatch = no;  Latch Index = 7470;  Latch Name = U0_Register_File.\Memory_reg[0][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][7] .SI = part_S_CR_3_TM_1 [64] ,   // CR = 3;  pos = 28;  Pin Index = 23269;  Pin Name = U0_Register_File.\Memory_reg[0][7].SI;  pinInvFromLatch = no;  Latch Index = 7505;  Latch Name = U0_Register_File.\Memory_reg[0][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][0] .SI = part_S_CR_3_TM_1 [63] ,   // CR = 3;  pos = 29;  Pin Index = 28463;  Pin Name = U0_Register_File.\Memory_reg[1][0].SI;  pinInvFromLatch = no;  Latch Index = 9220;  Latch Name = U0_Register_File.\Memory_reg[1][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][1] .SI = part_S_CR_3_TM_1 [62] ,   // CR = 3;  pos = 30;  Pin Index = 28569;  Pin Name = U0_Register_File.\Memory_reg[1][1].SI;  pinInvFromLatch = no;  Latch Index = 9255;  Latch Name = U0_Register_File.\Memory_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][2] .SI = part_S_CR_3_TM_1 [61] ,   // CR = 3;  pos = 31;  Pin Index = 28675;  Pin Name = U0_Register_File.\Memory_reg[1][2].SI;  pinInvFromLatch = no;  Latch Index = 9290;  Latch Name = U0_Register_File.\Memory_reg[1][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][3] .SI = part_S_CR_3_TM_1 [60] ,   // CR = 3;  pos = 32;  Pin Index = 28781;  Pin Name = U0_Register_File.\Memory_reg[1][3].SI;  pinInvFromLatch = no;  Latch Index = 9325;  Latch Name = U0_Register_File.\Memory_reg[1][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][4] .SI = part_S_CR_3_TM_1 [59] ,   // CR = 3;  pos = 33;  Pin Index = 28887;  Pin Name = U0_Register_File.\Memory_reg[1][4].SI;  pinInvFromLatch = no;  Latch Index = 9360;  Latch Name = U0_Register_File.\Memory_reg[1][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][5] .SI = part_S_CR_3_TM_1 [58] ,   // CR = 3;  pos = 34;  Pin Index = 28993;  Pin Name = U0_Register_File.\Memory_reg[1][5].SI;  pinInvFromLatch = no;  Latch Index = 9395;  Latch Name = U0_Register_File.\Memory_reg[1][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][6] .SI = part_S_CR_3_TM_1 [57] ,   // CR = 3;  pos = 35;  Pin Index = 29099;  Pin Name = U0_Register_File.\Memory_reg[1][6].SI;  pinInvFromLatch = no;  Latch Index = 9430;  Latch Name = U0_Register_File.\Memory_reg[1][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][7] .SI = part_S_CR_3_TM_1 [56] ,   // CR = 3;  pos = 36;  Pin Index = 29205;  Pin Name = U0_Register_File.\Memory_reg[1][7].SI;  pinInvFromLatch = no;  Latch Index = 9465;  Latch Name = U0_Register_File.\Memory_reg[1][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][0] .SI = part_S_CR_3_TM_1 [55] ,   // CR = 3;  pos = 37;  Pin Index = 29310;  Pin Name = U0_Register_File.\Memory_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 9499;  Latch Name = U0_Register_File.\Memory_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][1] .SI = part_S_CR_3_TM_1 [54] ,   // CR = 3;  pos = 38;  Pin Index = 29414;  Pin Name = U0_Register_File.\Memory_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 9534;  Latch Name = U0_Register_File.\Memory_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][2] .SI = part_S_CR_3_TM_1 [53] ,   // CR = 3;  pos = 39;  Pin Index = 29520;  Pin Name = U0_Register_File.\Memory_reg[2][2].SI;  pinInvFromLatch = no;  Latch Index = 9569;  Latch Name = U0_Register_File.\Memory_reg[2][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][3] .SI = part_S_CR_3_TM_1 [52] ,   // CR = 3;  pos = 40;  Pin Index = 29626;  Pin Name = U0_Register_File.\Memory_reg[2][3].SI;  pinInvFromLatch = no;  Latch Index = 9604;  Latch Name = U0_Register_File.\Memory_reg[2][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][4] .SI = part_S_CR_3_TM_1 [51] ,   // CR = 3;  pos = 41;  Pin Index = 29732;  Pin Name = U0_Register_File.\Memory_reg[2][4].SI;  pinInvFromLatch = no;  Latch Index = 9639;  Latch Name = U0_Register_File.\Memory_reg[2][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][5] .SI = part_S_CR_3_TM_1 [50] ,   // CR = 3;  pos = 42;  Pin Index = 29838;  Pin Name = U0_Register_File.\Memory_reg[2][5].SI;  pinInvFromLatch = no;  Latch Index = 9674;  Latch Name = U0_Register_File.\Memory_reg[2][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][6] .SI = part_S_CR_3_TM_1 [49] ,   // CR = 3;  pos = 43;  Pin Index = 29944;  Pin Name = U0_Register_File.\Memory_reg[2][6].SI;  pinInvFromLatch = no;  Latch Index = 9709;  Latch Name = U0_Register_File.\Memory_reg[2][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][7] .SI = part_S_CR_3_TM_1 [48] ,   // CR = 3;  pos = 44;  Pin Index = 30049;  Pin Name = U0_Register_File.\Memory_reg[2][7].SI;  pinInvFromLatch = no;  Latch Index = 9743;  Latch Name = U0_Register_File.\Memory_reg[2][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][0] .SI = part_S_CR_3_TM_1 [47] ,   // CR = 3;  pos = 45;  Pin Index = 30153;  Pin Name = U0_Register_File.\Memory_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 9778;  Latch Name = U0_Register_File.\Memory_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][1] .SI = part_S_CR_3_TM_1 [46] ,   // CR = 3;  pos = 46;  Pin Index = 30259;  Pin Name = U0_Register_File.\Memory_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 9813;  Latch Name = U0_Register_File.\Memory_reg[3][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][2] .SI = part_S_CR_3_TM_1 [45] ,   // CR = 3;  pos = 47;  Pin Index = 30365;  Pin Name = U0_Register_File.\Memory_reg[3][2].SI;  pinInvFromLatch = no;  Latch Index = 9848;  Latch Name = U0_Register_File.\Memory_reg[3][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][3] .SI = part_S_CR_3_TM_1 [44] ,   // CR = 3;  pos = 48;  Pin Index = 30471;  Pin Name = U0_Register_File.\Memory_reg[3][3].SI;  pinInvFromLatch = no;  Latch Index = 9883;  Latch Name = U0_Register_File.\Memory_reg[3][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][4] .SI = part_S_CR_3_TM_1 [43] ,   // CR = 3;  pos = 49;  Pin Index = 30577;  Pin Name = U0_Register_File.\Memory_reg[3][4].SI;  pinInvFromLatch = no;  Latch Index = 9918;  Latch Name = U0_Register_File.\Memory_reg[3][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][5] .SI = part_S_CR_3_TM_1 [42] ,   // CR = 3;  pos = 50;  Pin Index = 30682;  Pin Name = U0_Register_File.\Memory_reg[3][5].SI;  pinInvFromLatch = no;  Latch Index = 9952;  Latch Name = U0_Register_File.\Memory_reg[3][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][6] .SI = part_S_CR_3_TM_1 [41] ,   // CR = 3;  pos = 51;  Pin Index = 30786;  Pin Name = U0_Register_File.\Memory_reg[3][6].SI;  pinInvFromLatch = no;  Latch Index = 9987;  Latch Name = U0_Register_File.\Memory_reg[3][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][7] .SI = part_S_CR_3_TM_1 [40] ,   // CR = 3;  pos = 52;  Pin Index = 30892;  Pin Name = U0_Register_File.\Memory_reg[3][7].SI;  pinInvFromLatch = no;  Latch Index = 10022;  Latch Name = U0_Register_File.\Memory_reg[3][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][0] .SI = part_S_CR_3_TM_1 [39] ,   // CR = 3;  pos = 53;  Pin Index = 30998;  Pin Name = U0_Register_File.\Memory_reg[4][0].SI;  pinInvFromLatch = no;  Latch Index = 10057;  Latch Name = U0_Register_File.\Memory_reg[4][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][1] .SI = part_S_CR_3_TM_1 [38] ,   // CR = 3;  pos = 54;  Pin Index = 31104;  Pin Name = U0_Register_File.\Memory_reg[4][1].SI;  pinInvFromLatch = no;  Latch Index = 10092;  Latch Name = U0_Register_File.\Memory_reg[4][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][2] .SI = part_S_CR_3_TM_1 [37] ,   // CR = 3;  pos = 55;  Pin Index = 31210;  Pin Name = U0_Register_File.\Memory_reg[4][2].SI;  pinInvFromLatch = no;  Latch Index = 10127;  Latch Name = U0_Register_File.\Memory_reg[4][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][3] .SI = part_S_CR_3_TM_1 [36] ,   // CR = 3;  pos = 56;  Pin Index = 31316;  Pin Name = U0_Register_File.\Memory_reg[4][3].SI;  pinInvFromLatch = no;  Latch Index = 10162;  Latch Name = U0_Register_File.\Memory_reg[4][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][4] .SI = part_S_CR_3_TM_1 [35] ,   // CR = 3;  pos = 57;  Pin Index = 31422;  Pin Name = U0_Register_File.\Memory_reg[4][4].SI;  pinInvFromLatch = no;  Latch Index = 10197;  Latch Name = U0_Register_File.\Memory_reg[4][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][5] .SI = part_S_CR_3_TM_1 [34] ,   // CR = 3;  pos = 58;  Pin Index = 31528;  Pin Name = U0_Register_File.\Memory_reg[4][5].SI;  pinInvFromLatch = no;  Latch Index = 10232;  Latch Name = U0_Register_File.\Memory_reg[4][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][6] .SI = part_S_CR_3_TM_1 [33] ,   // CR = 3;  pos = 59;  Pin Index = 31634;  Pin Name = U0_Register_File.\Memory_reg[4][6].SI;  pinInvFromLatch = no;  Latch Index = 10267;  Latch Name = U0_Register_File.\Memory_reg[4][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][7] .SI = part_S_CR_3_TM_1 [32] ,   // CR = 3;  pos = 60;  Pin Index = 31740;  Pin Name = U0_Register_File.\Memory_reg[4][7].SI;  pinInvFromLatch = no;  Latch Index = 10302;  Latch Name = U0_Register_File.\Memory_reg[4][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][0] .SI = part_S_CR_3_TM_1 [31] ,   // CR = 3;  pos = 61;  Pin Index = 31846;  Pin Name = U0_Register_File.\Memory_reg[5][0].SI;  pinInvFromLatch = no;  Latch Index = 10337;  Latch Name = U0_Register_File.\Memory_reg[5][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][1] .SI = part_S_CR_3_TM_1 [30] ,   // CR = 3;  pos = 62;  Pin Index = 31952;  Pin Name = U0_Register_File.\Memory_reg[5][1].SI;  pinInvFromLatch = no;  Latch Index = 10372;  Latch Name = U0_Register_File.\Memory_reg[5][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][2] .SI = part_S_CR_3_TM_1 [29] ,   // CR = 3;  pos = 63;  Pin Index = 32058;  Pin Name = U0_Register_File.\Memory_reg[5][2].SI;  pinInvFromLatch = no;  Latch Index = 10407;  Latch Name = U0_Register_File.\Memory_reg[5][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][3] .SI = part_S_CR_3_TM_1 [28] ,   // CR = 3;  pos = 64;  Pin Index = 32164;  Pin Name = U0_Register_File.\Memory_reg[5][3].SI;  pinInvFromLatch = no;  Latch Index = 10442;  Latch Name = U0_Register_File.\Memory_reg[5][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][4] .SI = part_S_CR_3_TM_1 [27] ,   // CR = 3;  pos = 65;  Pin Index = 32270;  Pin Name = U0_Register_File.\Memory_reg[5][4].SI;  pinInvFromLatch = no;  Latch Index = 10477;  Latch Name = U0_Register_File.\Memory_reg[5][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][5] .SI = part_S_CR_3_TM_1 [26] ,   // CR = 3;  pos = 66;  Pin Index = 32376;  Pin Name = U0_Register_File.\Memory_reg[5][5].SI;  pinInvFromLatch = no;  Latch Index = 10512;  Latch Name = U0_Register_File.\Memory_reg[5][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][6] .SI = part_S_CR_3_TM_1 [25] ,   // CR = 3;  pos = 67;  Pin Index = 32482;  Pin Name = U0_Register_File.\Memory_reg[5][6].SI;  pinInvFromLatch = no;  Latch Index = 10547;  Latch Name = U0_Register_File.\Memory_reg[5][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][7] .SI = part_S_CR_3_TM_1 [24] ,   // CR = 3;  pos = 68;  Pin Index = 32588;  Pin Name = U0_Register_File.\Memory_reg[5][7].SI;  pinInvFromLatch = no;  Latch Index = 10582;  Latch Name = U0_Register_File.\Memory_reg[5][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][0] .SI = part_S_CR_3_TM_1 [23] ,   // CR = 3;  pos = 69;  Pin Index = 32694;  Pin Name = U0_Register_File.\Memory_reg[6][0].SI;  pinInvFromLatch = no;  Latch Index = 10617;  Latch Name = U0_Register_File.\Memory_reg[6][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][1] .SI = part_S_CR_3_TM_1 [22] ,   // CR = 3;  pos = 70;  Pin Index = 32800;  Pin Name = U0_Register_File.\Memory_reg[6][1].SI;  pinInvFromLatch = no;  Latch Index = 10652;  Latch Name = U0_Register_File.\Memory_reg[6][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][2] .SI = part_S_CR_3_TM_1 [21] ,   // CR = 3;  pos = 71;  Pin Index = 32906;  Pin Name = U0_Register_File.\Memory_reg[6][2].SI;  pinInvFromLatch = no;  Latch Index = 10687;  Latch Name = U0_Register_File.\Memory_reg[6][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][3] .SI = part_S_CR_3_TM_1 [20] ,   // CR = 3;  pos = 72;  Pin Index = 33012;  Pin Name = U0_Register_File.\Memory_reg[6][3].SI;  pinInvFromLatch = no;  Latch Index = 10722;  Latch Name = U0_Register_File.\Memory_reg[6][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][4] .SI = part_S_CR_3_TM_1 [19] ,   // CR = 3;  pos = 73;  Pin Index = 33118;  Pin Name = U0_Register_File.\Memory_reg[6][4].SI;  pinInvFromLatch = no;  Latch Index = 10757;  Latch Name = U0_Register_File.\Memory_reg[6][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][5] .SI = part_S_CR_3_TM_1 [18] ,   // CR = 3;  pos = 74;  Pin Index = 33224;  Pin Name = U0_Register_File.\Memory_reg[6][5].SI;  pinInvFromLatch = no;  Latch Index = 10792;  Latch Name = U0_Register_File.\Memory_reg[6][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][6] .SI = part_S_CR_3_TM_1 [17] ,   // CR = 3;  pos = 75;  Pin Index = 33330;  Pin Name = U0_Register_File.\Memory_reg[6][6].SI;  pinInvFromLatch = no;  Latch Index = 10827;  Latch Name = U0_Register_File.\Memory_reg[6][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][7] .SI = part_S_CR_3_TM_1 [16] ,   // CR = 3;  pos = 76;  Pin Index = 33436;  Pin Name = U0_Register_File.\Memory_reg[6][7].SI;  pinInvFromLatch = no;  Latch Index = 10862;  Latch Name = U0_Register_File.\Memory_reg[6][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][0] .SI = part_S_CR_3_TM_1 [15] ,   // CR = 3;  pos = 77;  Pin Index = 33542;  Pin Name = U0_Register_File.\Memory_reg[7][0].SI;  pinInvFromLatch = no;  Latch Index = 10897;  Latch Name = U0_Register_File.\Memory_reg[7][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][1] .SI = part_S_CR_3_TM_1 [14] ,   // CR = 3;  pos = 78;  Pin Index = 33648;  Pin Name = U0_Register_File.\Memory_reg[7][1].SI;  pinInvFromLatch = no;  Latch Index = 10932;  Latch Name = U0_Register_File.\Memory_reg[7][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][2] .SI = part_S_CR_3_TM_1 [13] ,   // CR = 3;  pos = 79;  Pin Index = 33754;  Pin Name = U0_Register_File.\Memory_reg[7][2].SI;  pinInvFromLatch = no;  Latch Index = 10967;  Latch Name = U0_Register_File.\Memory_reg[7][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][3] .SI = part_S_CR_3_TM_1 [12] ,   // CR = 3;  pos = 80;  Pin Index = 33860;  Pin Name = U0_Register_File.\Memory_reg[7][3].SI;  pinInvFromLatch = no;  Latch Index = 11002;  Latch Name = U0_Register_File.\Memory_reg[7][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][4] .SI = part_S_CR_3_TM_1 [11] ,   // CR = 3;  pos = 81;  Pin Index = 33966;  Pin Name = U0_Register_File.\Memory_reg[7][4].SI;  pinInvFromLatch = no;  Latch Index = 11037;  Latch Name = U0_Register_File.\Memory_reg[7][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][5] .SI = part_S_CR_3_TM_1 [10] ,   // CR = 3;  pos = 82;  Pin Index = 34072;  Pin Name = U0_Register_File.\Memory_reg[7][5].SI;  pinInvFromLatch = no;  Latch Index = 11072;  Latch Name = U0_Register_File.\Memory_reg[7][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][6] .SI = part_S_CR_3_TM_1 [9] ,   // CR = 3;  pos = 83;  Pin Index = 34178;  Pin Name = U0_Register_File.\Memory_reg[7][6].SI;  pinInvFromLatch = no;  Latch Index = 11107;  Latch Name = U0_Register_File.\Memory_reg[7][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][7] .SI = part_S_CR_3_TM_1 [8] ,   // CR = 3;  pos = 84;  Pin Index = 34284;  Pin Name = U0_Register_File.\Memory_reg[7][7].SI;  pinInvFromLatch = no;  Latch Index = 11142;  Latch Name = U0_Register_File.\Memory_reg[7][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][0] .SI = part_S_CR_3_TM_1 [7] ,   // CR = 3;  pos = 85;  Pin Index = 34390;  Pin Name = U0_Register_File.\Memory_reg[8][0].SI;  pinInvFromLatch = no;  Latch Index = 11177;  Latch Name = U0_Register_File.\Memory_reg[8][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][1] .SI = part_S_CR_3_TM_1 [6] ,   // CR = 3;  pos = 86;  Pin Index = 34496;  Pin Name = U0_Register_File.\Memory_reg[8][1].SI;  pinInvFromLatch = no;  Latch Index = 11212;  Latch Name = U0_Register_File.\Memory_reg[8][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][2] .SI = part_S_CR_3_TM_1 [5] ,   // CR = 3;  pos = 87;  Pin Index = 34602;  Pin Name = U0_Register_File.\Memory_reg[8][2].SI;  pinInvFromLatch = no;  Latch Index = 11247;  Latch Name = U0_Register_File.\Memory_reg[8][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][3] .SI = part_S_CR_3_TM_1 [4] ,   // CR = 3;  pos = 88;  Pin Index = 34708;  Pin Name = U0_Register_File.\Memory_reg[8][3].SI;  pinInvFromLatch = no;  Latch Index = 11282;  Latch Name = U0_Register_File.\Memory_reg[8][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][4] .SI = part_S_CR_3_TM_1 [3] ,   // CR = 3;  pos = 89;  Pin Index = 34814;  Pin Name = U0_Register_File.\Memory_reg[8][4].SI;  pinInvFromLatch = no;  Latch Index = 11317;  Latch Name = U0_Register_File.\Memory_reg[8][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][5] .SI = part_S_CR_3_TM_1 [2] ,   // CR = 3;  pos = 90;  Pin Index = 34920;  Pin Name = U0_Register_File.\Memory_reg[8][5].SI;  pinInvFromLatch = no;  Latch Index = 11352;  Latch Name = U0_Register_File.\Memory_reg[8][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][6] .SI = part_S_CR_3_TM_1 [1] ;   // CR = 3;  pos = 91;  Pin Index = 35026;  Pin Name = U0_Register_File.\Memory_reg[8][6].SI;  pinInvFromLatch = no;  Latch Index = 11387;  Latch Name = U0_Register_File.\Memory_reg[8][6].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 4 
    TOP_inst.ScanIn_4 = part_S_CR_4_TM_1 [90] ,   // CR = 4;  pos = 1;  Pin Index = 6;  Pin Name = ScanIn_4;  pinInvFromLatch = no;  Latch Index = 11422;  Latch Name = U0_Register_File.\Memory_reg[8][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][0] .SI = part_S_CR_4_TM_1 [89] ,   // CR = 4;  pos = 2;  Pin Index = 35238;  Pin Name = U0_Register_File.\Memory_reg[9][0].SI;  pinInvFromLatch = no;  Latch Index = 11457;  Latch Name = U0_Register_File.\Memory_reg[9][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][1] .SI = part_S_CR_4_TM_1 [88] ,   // CR = 4;  pos = 3;  Pin Index = 35344;  Pin Name = U0_Register_File.\Memory_reg[9][1].SI;  pinInvFromLatch = no;  Latch Index = 11492;  Latch Name = U0_Register_File.\Memory_reg[9][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][2] .SI = part_S_CR_4_TM_1 [87] ,   // CR = 4;  pos = 4;  Pin Index = 35450;  Pin Name = U0_Register_File.\Memory_reg[9][2].SI;  pinInvFromLatch = no;  Latch Index = 11527;  Latch Name = U0_Register_File.\Memory_reg[9][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][3] .SI = part_S_CR_4_TM_1 [86] ,   // CR = 4;  pos = 5;  Pin Index = 35556;  Pin Name = U0_Register_File.\Memory_reg[9][3].SI;  pinInvFromLatch = no;  Latch Index = 11562;  Latch Name = U0_Register_File.\Memory_reg[9][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][4] .SI = part_S_CR_4_TM_1 [85] ,   // CR = 4;  pos = 6;  Pin Index = 35662;  Pin Name = U0_Register_File.\Memory_reg[9][4].SI;  pinInvFromLatch = no;  Latch Index = 11597;  Latch Name = U0_Register_File.\Memory_reg[9][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][5] .SI = part_S_CR_4_TM_1 [84] ,   // CR = 4;  pos = 7;  Pin Index = 35768;  Pin Name = U0_Register_File.\Memory_reg[9][5].SI;  pinInvFromLatch = no;  Latch Index = 11632;  Latch Name = U0_Register_File.\Memory_reg[9][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][6] .SI = part_S_CR_4_TM_1 [83] ,   // CR = 4;  pos = 8;  Pin Index = 35874;  Pin Name = U0_Register_File.\Memory_reg[9][6].SI;  pinInvFromLatch = no;  Latch Index = 11667;  Latch Name = U0_Register_File.\Memory_reg[9][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][7] .SI = part_S_CR_4_TM_1 [82] ,   // CR = 4;  pos = 9;  Pin Index = 35980;  Pin Name = U0_Register_File.\Memory_reg[9][7].SI;  pinInvFromLatch = no;  Latch Index = 11702;  Latch Name = U0_Register_File.\Memory_reg[9][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][0] .SI = part_S_CR_4_TM_1 [81] ,   // CR = 4;  pos = 10;  Pin Index = 23375;  Pin Name = U0_Register_File.\Memory_reg[10][0].SI;  pinInvFromLatch = no;  Latch Index = 7540;  Latch Name = U0_Register_File.\Memory_reg[10][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][1] .SI = part_S_CR_4_TM_1 [80] ,   // CR = 4;  pos = 11;  Pin Index = 23481;  Pin Name = U0_Register_File.\Memory_reg[10][1].SI;  pinInvFromLatch = no;  Latch Index = 7575;  Latch Name = U0_Register_File.\Memory_reg[10][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][2] .SI = part_S_CR_4_TM_1 [79] ,   // CR = 4;  pos = 12;  Pin Index = 23587;  Pin Name = U0_Register_File.\Memory_reg[10][2].SI;  pinInvFromLatch = no;  Latch Index = 7610;  Latch Name = U0_Register_File.\Memory_reg[10][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][3] .SI = part_S_CR_4_TM_1 [78] ,   // CR = 4;  pos = 13;  Pin Index = 23693;  Pin Name = U0_Register_File.\Memory_reg[10][3].SI;  pinInvFromLatch = no;  Latch Index = 7645;  Latch Name = U0_Register_File.\Memory_reg[10][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][4] .SI = part_S_CR_4_TM_1 [77] ,   // CR = 4;  pos = 14;  Pin Index = 23799;  Pin Name = U0_Register_File.\Memory_reg[10][4].SI;  pinInvFromLatch = no;  Latch Index = 7680;  Latch Name = U0_Register_File.\Memory_reg[10][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][5] .SI = part_S_CR_4_TM_1 [76] ,   // CR = 4;  pos = 15;  Pin Index = 23905;  Pin Name = U0_Register_File.\Memory_reg[10][5].SI;  pinInvFromLatch = no;  Latch Index = 7715;  Latch Name = U0_Register_File.\Memory_reg[10][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][6] .SI = part_S_CR_4_TM_1 [75] ,   // CR = 4;  pos = 16;  Pin Index = 24011;  Pin Name = U0_Register_File.\Memory_reg[10][6].SI;  pinInvFromLatch = no;  Latch Index = 7750;  Latch Name = U0_Register_File.\Memory_reg[10][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][7] .SI = part_S_CR_4_TM_1 [74] ,   // CR = 4;  pos = 17;  Pin Index = 24117;  Pin Name = U0_Register_File.\Memory_reg[10][7].SI;  pinInvFromLatch = no;  Latch Index = 7785;  Latch Name = U0_Register_File.\Memory_reg[10][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][0] .SI = part_S_CR_4_TM_1 [73] ,   // CR = 4;  pos = 18;  Pin Index = 24223;  Pin Name = U0_Register_File.\Memory_reg[11][0].SI;  pinInvFromLatch = no;  Latch Index = 7820;  Latch Name = U0_Register_File.\Memory_reg[11][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][1] .SI = part_S_CR_4_TM_1 [72] ,   // CR = 4;  pos = 19;  Pin Index = 24329;  Pin Name = U0_Register_File.\Memory_reg[11][1].SI;  pinInvFromLatch = no;  Latch Index = 7855;  Latch Name = U0_Register_File.\Memory_reg[11][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][2] .SI = part_S_CR_4_TM_1 [71] ,   // CR = 4;  pos = 20;  Pin Index = 24435;  Pin Name = U0_Register_File.\Memory_reg[11][2].SI;  pinInvFromLatch = no;  Latch Index = 7890;  Latch Name = U0_Register_File.\Memory_reg[11][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][3] .SI = part_S_CR_4_TM_1 [70] ,   // CR = 4;  pos = 21;  Pin Index = 24541;  Pin Name = U0_Register_File.\Memory_reg[11][3].SI;  pinInvFromLatch = no;  Latch Index = 7925;  Latch Name = U0_Register_File.\Memory_reg[11][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][4] .SI = part_S_CR_4_TM_1 [69] ,   // CR = 4;  pos = 22;  Pin Index = 24647;  Pin Name = U0_Register_File.\Memory_reg[11][4].SI;  pinInvFromLatch = no;  Latch Index = 7960;  Latch Name = U0_Register_File.\Memory_reg[11][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][5] .SI = part_S_CR_4_TM_1 [68] ,   // CR = 4;  pos = 23;  Pin Index = 24753;  Pin Name = U0_Register_File.\Memory_reg[11][5].SI;  pinInvFromLatch = no;  Latch Index = 7995;  Latch Name = U0_Register_File.\Memory_reg[11][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][6] .SI = part_S_CR_4_TM_1 [67] ,   // CR = 4;  pos = 24;  Pin Index = 24859;  Pin Name = U0_Register_File.\Memory_reg[11][6].SI;  pinInvFromLatch = no;  Latch Index = 8030;  Latch Name = U0_Register_File.\Memory_reg[11][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][7] .SI = part_S_CR_4_TM_1 [66] ,   // CR = 4;  pos = 25;  Pin Index = 24965;  Pin Name = U0_Register_File.\Memory_reg[11][7].SI;  pinInvFromLatch = no;  Latch Index = 8065;  Latch Name = U0_Register_File.\Memory_reg[11][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][0] .SI = part_S_CR_4_TM_1 [65] ,   // CR = 4;  pos = 26;  Pin Index = 25071;  Pin Name = U0_Register_File.\Memory_reg[12][0].SI;  pinInvFromLatch = no;  Latch Index = 8100;  Latch Name = U0_Register_File.\Memory_reg[12][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][1] .SI = part_S_CR_4_TM_1 [64] ,   // CR = 4;  pos = 27;  Pin Index = 25177;  Pin Name = U0_Register_File.\Memory_reg[12][1].SI;  pinInvFromLatch = no;  Latch Index = 8135;  Latch Name = U0_Register_File.\Memory_reg[12][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][2] .SI = part_S_CR_4_TM_1 [63] ,   // CR = 4;  pos = 28;  Pin Index = 25283;  Pin Name = U0_Register_File.\Memory_reg[12][2].SI;  pinInvFromLatch = no;  Latch Index = 8170;  Latch Name = U0_Register_File.\Memory_reg[12][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][3] .SI = part_S_CR_4_TM_1 [62] ,   // CR = 4;  pos = 29;  Pin Index = 25389;  Pin Name = U0_Register_File.\Memory_reg[12][3].SI;  pinInvFromLatch = no;  Latch Index = 8205;  Latch Name = U0_Register_File.\Memory_reg[12][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][4] .SI = part_S_CR_4_TM_1 [61] ,   // CR = 4;  pos = 30;  Pin Index = 25495;  Pin Name = U0_Register_File.\Memory_reg[12][4].SI;  pinInvFromLatch = no;  Latch Index = 8240;  Latch Name = U0_Register_File.\Memory_reg[12][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][5] .SI = part_S_CR_4_TM_1 [60] ,   // CR = 4;  pos = 31;  Pin Index = 25601;  Pin Name = U0_Register_File.\Memory_reg[12][5].SI;  pinInvFromLatch = no;  Latch Index = 8275;  Latch Name = U0_Register_File.\Memory_reg[12][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][6] .SI = part_S_CR_4_TM_1 [59] ,   // CR = 4;  pos = 32;  Pin Index = 25707;  Pin Name = U0_Register_File.\Memory_reg[12][6].SI;  pinInvFromLatch = no;  Latch Index = 8310;  Latch Name = U0_Register_File.\Memory_reg[12][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][7] .SI = part_S_CR_4_TM_1 [58] ,   // CR = 4;  pos = 33;  Pin Index = 25813;  Pin Name = U0_Register_File.\Memory_reg[12][7].SI;  pinInvFromLatch = no;  Latch Index = 8345;  Latch Name = U0_Register_File.\Memory_reg[12][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][0] .SI = part_S_CR_4_TM_1 [57] ,   // CR = 4;  pos = 34;  Pin Index = 25919;  Pin Name = U0_Register_File.\Memory_reg[13][0].SI;  pinInvFromLatch = no;  Latch Index = 8380;  Latch Name = U0_Register_File.\Memory_reg[13][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][1] .SI = part_S_CR_4_TM_1 [56] ,   // CR = 4;  pos = 35;  Pin Index = 26025;  Pin Name = U0_Register_File.\Memory_reg[13][1].SI;  pinInvFromLatch = no;  Latch Index = 8415;  Latch Name = U0_Register_File.\Memory_reg[13][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][2] .SI = part_S_CR_4_TM_1 [55] ,   // CR = 4;  pos = 36;  Pin Index = 26131;  Pin Name = U0_Register_File.\Memory_reg[13][2].SI;  pinInvFromLatch = no;  Latch Index = 8450;  Latch Name = U0_Register_File.\Memory_reg[13][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][3] .SI = part_S_CR_4_TM_1 [54] ,   // CR = 4;  pos = 37;  Pin Index = 26237;  Pin Name = U0_Register_File.\Memory_reg[13][3].SI;  pinInvFromLatch = no;  Latch Index = 8485;  Latch Name = U0_Register_File.\Memory_reg[13][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][4] .SI = part_S_CR_4_TM_1 [53] ,   // CR = 4;  pos = 38;  Pin Index = 26343;  Pin Name = U0_Register_File.\Memory_reg[13][4].SI;  pinInvFromLatch = no;  Latch Index = 8520;  Latch Name = U0_Register_File.\Memory_reg[13][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][5] .SI = part_S_CR_4_TM_1 [52] ,   // CR = 4;  pos = 39;  Pin Index = 26449;  Pin Name = U0_Register_File.\Memory_reg[13][5].SI;  pinInvFromLatch = no;  Latch Index = 8555;  Latch Name = U0_Register_File.\Memory_reg[13][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][6] .SI = part_S_CR_4_TM_1 [51] ,   // CR = 4;  pos = 40;  Pin Index = 26555;  Pin Name = U0_Register_File.\Memory_reg[13][6].SI;  pinInvFromLatch = no;  Latch Index = 8590;  Latch Name = U0_Register_File.\Memory_reg[13][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][7] .SI = part_S_CR_4_TM_1 [50] ,   // CR = 4;  pos = 41;  Pin Index = 26661;  Pin Name = U0_Register_File.\Memory_reg[13][7].SI;  pinInvFromLatch = no;  Latch Index = 8625;  Latch Name = U0_Register_File.\Memory_reg[13][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][0] .SI = part_S_CR_4_TM_1 [49] ,   // CR = 4;  pos = 42;  Pin Index = 26767;  Pin Name = U0_Register_File.\Memory_reg[14][0].SI;  pinInvFromLatch = no;  Latch Index = 8660;  Latch Name = U0_Register_File.\Memory_reg[14][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][1] .SI = part_S_CR_4_TM_1 [48] ,   // CR = 4;  pos = 43;  Pin Index = 26873;  Pin Name = U0_Register_File.\Memory_reg[14][1].SI;  pinInvFromLatch = no;  Latch Index = 8695;  Latch Name = U0_Register_File.\Memory_reg[14][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][2] .SI = part_S_CR_4_TM_1 [47] ,   // CR = 4;  pos = 44;  Pin Index = 26979;  Pin Name = U0_Register_File.\Memory_reg[14][2].SI;  pinInvFromLatch = no;  Latch Index = 8730;  Latch Name = U0_Register_File.\Memory_reg[14][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][3] .SI = part_S_CR_4_TM_1 [46] ,   // CR = 4;  pos = 45;  Pin Index = 27085;  Pin Name = U0_Register_File.\Memory_reg[14][3].SI;  pinInvFromLatch = no;  Latch Index = 8765;  Latch Name = U0_Register_File.\Memory_reg[14][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][4] .SI = part_S_CR_4_TM_1 [45] ,   // CR = 4;  pos = 46;  Pin Index = 27191;  Pin Name = U0_Register_File.\Memory_reg[14][4].SI;  pinInvFromLatch = no;  Latch Index = 8800;  Latch Name = U0_Register_File.\Memory_reg[14][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][5] .SI = part_S_CR_4_TM_1 [44] ,   // CR = 4;  pos = 47;  Pin Index = 27297;  Pin Name = U0_Register_File.\Memory_reg[14][5].SI;  pinInvFromLatch = no;  Latch Index = 8835;  Latch Name = U0_Register_File.\Memory_reg[14][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][6] .SI = part_S_CR_4_TM_1 [43] ,   // CR = 4;  pos = 48;  Pin Index = 27403;  Pin Name = U0_Register_File.\Memory_reg[14][6].SI;  pinInvFromLatch = no;  Latch Index = 8870;  Latch Name = U0_Register_File.\Memory_reg[14][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][7] .SI = part_S_CR_4_TM_1 [42] ,   // CR = 4;  pos = 49;  Pin Index = 27509;  Pin Name = U0_Register_File.\Memory_reg[14][7].SI;  pinInvFromLatch = no;  Latch Index = 8905;  Latch Name = U0_Register_File.\Memory_reg[14][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][0] .SI = part_S_CR_4_TM_1 [41] ,   // CR = 4;  pos = 50;  Pin Index = 27615;  Pin Name = U0_Register_File.\Memory_reg[15][0].SI;  pinInvFromLatch = no;  Latch Index = 8940;  Latch Name = U0_Register_File.\Memory_reg[15][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][1] .SI = part_S_CR_4_TM_1 [40] ,   // CR = 4;  pos = 51;  Pin Index = 27721;  Pin Name = U0_Register_File.\Memory_reg[15][1].SI;  pinInvFromLatch = no;  Latch Index = 8975;  Latch Name = U0_Register_File.\Memory_reg[15][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][2] .SI = part_S_CR_4_TM_1 [39] ,   // CR = 4;  pos = 52;  Pin Index = 27827;  Pin Name = U0_Register_File.\Memory_reg[15][2].SI;  pinInvFromLatch = no;  Latch Index = 9010;  Latch Name = U0_Register_File.\Memory_reg[15][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][3] .SI = part_S_CR_4_TM_1 [38] ,   // CR = 4;  pos = 53;  Pin Index = 27933;  Pin Name = U0_Register_File.\Memory_reg[15][3].SI;  pinInvFromLatch = no;  Latch Index = 9045;  Latch Name = U0_Register_File.\Memory_reg[15][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][4] .SI = part_S_CR_4_TM_1 [37] ,   // CR = 4;  pos = 54;  Pin Index = 28039;  Pin Name = U0_Register_File.\Memory_reg[15][4].SI;  pinInvFromLatch = no;  Latch Index = 9080;  Latch Name = U0_Register_File.\Memory_reg[15][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][5] .SI = part_S_CR_4_TM_1 [36] ,   // CR = 4;  pos = 55;  Pin Index = 28145;  Pin Name = U0_Register_File.\Memory_reg[15][5].SI;  pinInvFromLatch = no;  Latch Index = 9115;  Latch Name = U0_Register_File.\Memory_reg[15][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][6] .SI = part_S_CR_4_TM_1 [35] ,   // CR = 4;  pos = 56;  Pin Index = 28251;  Pin Name = U0_Register_File.\Memory_reg[15][6].SI;  pinInvFromLatch = no;  Latch Index = 9150;  Latch Name = U0_Register_File.\Memory_reg[15][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][7] .SI = part_S_CR_4_TM_1 [34] ,   // CR = 4;  pos = 57;  Pin Index = 28357;  Pin Name = U0_Register_File.\Memory_reg[15][7].SI;  pinInvFromLatch = no;  Latch Index = 9185;  Latch Name = U0_Register_File.\Memory_reg[15][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.RdData_Valid_reg.SI = part_S_CR_4_TM_1 [33] ,   // CR = 4;  pos = 58;  Pin Index = 22421;  Pin Name = U0_Register_File.RdData_Valid_reg.SI;  pinInvFromLatch = no;  Latch Index = 7225;  Latch Name = U0_Register_File.RdData_Valid_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[0] .SI = part_S_CR_4_TM_1 [32] ,   // CR = 4;  pos = 59;  Pin Index = 36086;  Pin Name = U0_Register_File.\RdData_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 11737;  Latch Name = U0_Register_File.\RdData_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[1] .SI = part_S_CR_4_TM_1 [31] ,   // CR = 4;  pos = 60;  Pin Index = 36192;  Pin Name = U0_Register_File.\RdData_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 11772;  Latch Name = U0_Register_File.\RdData_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[2] .SI = part_S_CR_4_TM_1 [30] ,   // CR = 4;  pos = 61;  Pin Index = 36298;  Pin Name = U0_Register_File.\RdData_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 11807;  Latch Name = U0_Register_File.\RdData_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[3] .SI = part_S_CR_4_TM_1 [29] ,   // CR = 4;  pos = 62;  Pin Index = 36404;  Pin Name = U0_Register_File.\RdData_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 11842;  Latch Name = U0_Register_File.\RdData_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[4] .SI = part_S_CR_4_TM_1 [28] ,   // CR = 4;  pos = 63;  Pin Index = 36510;  Pin Name = U0_Register_File.\RdData_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 11877;  Latch Name = U0_Register_File.\RdData_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[5] .SI = part_S_CR_4_TM_1 [27] ,   // CR = 4;  pos = 64;  Pin Index = 36616;  Pin Name = U0_Register_File.\RdData_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 11912;  Latch Name = U0_Register_File.\RdData_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[6] .SI = part_S_CR_4_TM_1 [26] ,   // CR = 4;  pos = 65;  Pin Index = 36722;  Pin Name = U0_Register_File.\RdData_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 11947;  Latch Name = U0_Register_File.\RdData_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[7] .SI = part_S_CR_4_TM_1 [25] ,   // CR = 4;  pos = 66;  Pin Index = 36828;  Pin Name = U0_Register_File.\RdData_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 11982;  Latch Name = U0_Register_File.\RdData_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[0] .SI = part_S_CR_4_TM_1 [24] ,   // CR = 4;  pos = 67;  Pin Index = 40323;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 12976;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[1] .SI = part_S_CR_4_TM_1 [23] ,   // CR = 4;  pos = 68;  Pin Index = 40429;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 13011;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[2] .SI = part_S_CR_4_TM_1 [22] ,   // CR = 4;  pos = 69;  Pin Index = 40535;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 13046;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[3] .SI = part_S_CR_4_TM_1 [21] ,   // CR = 4;  pos = 70;  Pin Index = 40641;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 13081;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[0] .SI = part_S_CR_4_TM_1 [20] ,   // CR = 4;  pos = 71;  Pin Index = 40747;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 13116;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[1] .SI = part_S_CR_4_TM_1 [19] ,   // CR = 4;  pos = 72;  Pin Index = 41489;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 13361;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[2] .SI = part_S_CR_4_TM_1 [18] ,   // CR = 4;  pos = 73;  Pin Index = 41595;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 13396;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[3] .SI = part_S_CR_4_TM_1 [17] ,   // CR = 4;  pos = 74;  Pin Index = 41701;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 13431;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[4] .SI = part_S_CR_4_TM_1 [16] ,   // CR = 4;  pos = 75;  Pin Index = 41807;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 13466;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[5] .SI = part_S_CR_4_TM_1 [15] ,   // CR = 4;  pos = 76;  Pin Index = 41913;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 13501;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[6] .SI = part_S_CR_4_TM_1 [14] ,   // CR = 4;  pos = 77;  Pin Index = 42019;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 13536;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[7] .SI = part_S_CR_4_TM_1 [13] ,   // CR = 4;  pos = 78;  Pin Index = 42125;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 13571;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[8] .SI = part_S_CR_4_TM_1 [12] ,   // CR = 4;  pos = 79;  Pin Index = 42231;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].SI;  pinInvFromLatch = no;  Latch Index = 13606;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[9] .SI = part_S_CR_4_TM_1 [11] ,   // CR = 4;  pos = 80;  Pin Index = 42337;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].SI;  pinInvFromLatch = no;  Latch Index = 13641;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[10] .SI = part_S_CR_4_TM_1 [10] ,   // CR = 4;  pos = 81;  Pin Index = 40853;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].SI;  pinInvFromLatch = no;  Latch Index = 13151;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[11] .SI = part_S_CR_4_TM_1 [9] ,   // CR = 4;  pos = 82;  Pin Index = 40959;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].SI;  pinInvFromLatch = no;  Latch Index = 13186;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[12] .SI = part_S_CR_4_TM_1 [8] ,   // CR = 4;  pos = 83;  Pin Index = 41065;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].SI;  pinInvFromLatch = no;  Latch Index = 13221;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[13] .SI = part_S_CR_4_TM_1 [7] ,   // CR = 4;  pos = 84;  Pin Index = 41171;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].SI;  pinInvFromLatch = no;  Latch Index = 13256;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[14] .SI = part_S_CR_4_TM_1 [6] ,   // CR = 4;  pos = 85;  Pin Index = 41277;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].SI;  pinInvFromLatch = no;  Latch Index = 13291;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[15] .SI = part_S_CR_4_TM_1 [5] ,   // CR = 4;  pos = 86;  Pin Index = 41383;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].SI;  pinInvFromLatch = no;  Latch Index = 13326;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[0] .SI = part_S_CR_4_TM_1 [4] ,   // CR = 4;  pos = 87;  Pin Index = 42443;  Pin Name = U0_SYS_CTRL.\current_state_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 13676;  Latch Name = U0_SYS_CTRL.\current_state_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[1] .SI = part_S_CR_4_TM_1 [3] ,   // CR = 4;  pos = 88;  Pin Index = 42549;  Pin Name = U0_SYS_CTRL.\current_state_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 13711;  Latch Name = U0_SYS_CTRL.\current_state_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[2] .SI = part_S_CR_4_TM_1 [2] ,   // CR = 4;  pos = 89;  Pin Index = 42655;  Pin Name = U0_SYS_CTRL.\current_state_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 13746;  Latch Name = U0_SYS_CTRL.\current_state_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[3] .SI = part_S_CR_4_TM_1 [1] ;   // CR = 4;  pos = 90;  Pin Index = 42761;  Pin Name = U0_SYS_CTRL.\current_state_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 13781;  Latch Name = U0_SYS_CTRL.\current_state_reg[3].__iNsT2.dff_primitive;   

  assign // OR = 1 
    part_M_OR_1_TM_1 [1] =  TOP_inst.ScanOut_1 ,   // OR = 1;  pos = 1;  Pin Index = 10;  Pin Name = ScanOut_1;  pinInvFromLatch = no;  Latch Index = 5577;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [2] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0] .Q ,   // OR = 1;  pos = 2;  Pin Index = 17209;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 5542;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [3] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3] .Q ,   // OR = 1;  pos = 3;  Pin Index = 16919;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 5450;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [4] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2] .Q ,   // OR = 1;  pos = 4;  Pin Index = 16813;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 5415;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [5] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1] .Q ,   // OR = 1;  pos = 5;  Pin Index = 16707;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 5380;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [6] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0] .Q ,   // OR = 1;  pos = 6;  Pin Index = 16601;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 5345;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [7] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3] .Q ,   // OR = 1;  pos = 7;  Pin Index = 16495;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 5310;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [8] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2] .Q ,   // OR = 1;  pos = 8;  Pin Index = 16389;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 5275;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [9] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1] .Q ,   // OR = 1;  pos = 9;  Pin Index = 16283;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 5240;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [10] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0] .Q ,   // OR = 1;  pos = 10;  Pin Index = 16177;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 5205;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [11] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7] .Q ,   // OR = 1;  pos = 11;  Pin Index = 13393;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7].Q;  pinInvFromLatch = no;  Latch Index = 4359;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [12] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6] .Q ,   // OR = 1;  pos = 12;  Pin Index = 13287;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6].Q;  pinInvFromLatch = no;  Latch Index = 4324;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [13] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5] .Q ,   // OR = 1;  pos = 13;  Pin Index = 13181;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].Q;  pinInvFromLatch = no;  Latch Index = 4289;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [14] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4] .Q ,   // OR = 1;  pos = 14;  Pin Index = 13075;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].Q;  pinInvFromLatch = no;  Latch Index = 4254;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [15] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3] .Q ,   // OR = 1;  pos = 15;  Pin Index = 12969;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].Q;  pinInvFromLatch = no;  Latch Index = 4219;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [16] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2] .Q ,   // OR = 1;  pos = 16;  Pin Index = 12863;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].Q;  pinInvFromLatch = no;  Latch Index = 4184;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [17] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1] .Q ,   // OR = 1;  pos = 17;  Pin Index = 12757;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].Q;  pinInvFromLatch = no;  Latch Index = 4149;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [18] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0] .Q ,   // OR = 1;  pos = 18;  Pin Index = 12651;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].Q;  pinInvFromLatch = no;  Latch Index = 4114;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [19] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7] .Q ,   // OR = 1;  pos = 19;  Pin Index = 12545;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].Q;  pinInvFromLatch = no;  Latch Index = 4079;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [20] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6] .Q ,   // OR = 1;  pos = 20;  Pin Index = 12439;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].Q;  pinInvFromLatch = no;  Latch Index = 4044;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [21] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5] .Q ,   // OR = 1;  pos = 21;  Pin Index = 12333;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].Q;  pinInvFromLatch = no;  Latch Index = 4009;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [22] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4] .Q ,   // OR = 1;  pos = 22;  Pin Index = 12227;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].Q;  pinInvFromLatch = no;  Latch Index = 3974;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [23] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3] .Q ,   // OR = 1;  pos = 23;  Pin Index = 12121;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].Q;  pinInvFromLatch = no;  Latch Index = 3939;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [24] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2] .Q ,   // OR = 1;  pos = 24;  Pin Index = 12015;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].Q;  pinInvFromLatch = no;  Latch Index = 3904;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [25] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1] .Q ,   // OR = 1;  pos = 25;  Pin Index = 11909;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].Q;  pinInvFromLatch = no;  Latch Index = 3869;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [26] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0] .Q ,   // OR = 1;  pos = 26;  Pin Index = 11803;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].Q;  pinInvFromLatch = no;  Latch Index = 3834;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [27] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7] .Q ,   // OR = 1;  pos = 27;  Pin Index = 11697;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].Q;  pinInvFromLatch = no;  Latch Index = 3799;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [28] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6] .Q ,   // OR = 1;  pos = 28;  Pin Index = 11591;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].Q;  pinInvFromLatch = no;  Latch Index = 3764;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [29] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5] .Q ,   // OR = 1;  pos = 29;  Pin Index = 11485;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].Q;  pinInvFromLatch = no;  Latch Index = 3729;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [30] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4] .Q ,   // OR = 1;  pos = 30;  Pin Index = 11379;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].Q;  pinInvFromLatch = no;  Latch Index = 3694;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [31] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3] .Q ,   // OR = 1;  pos = 31;  Pin Index = 11273;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3].Q;  pinInvFromLatch = no;  Latch Index = 3659;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [32] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2] .Q ,   // OR = 1;  pos = 32;  Pin Index = 11167;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2].Q;  pinInvFromLatch = no;  Latch Index = 3624;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [33] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1] .Q ,   // OR = 1;  pos = 33;  Pin Index = 11061;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].Q;  pinInvFromLatch = no;  Latch Index = 3589;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [34] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0] .Q ,   // OR = 1;  pos = 34;  Pin Index = 10955;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].Q;  pinInvFromLatch = no;  Latch Index = 3554;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [35] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7] .Q ,   // OR = 1;  pos = 35;  Pin Index = 10849;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].Q;  pinInvFromLatch = no;  Latch Index = 3519;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [36] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6] .Q ,   // OR = 1;  pos = 36;  Pin Index = 10743;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].Q;  pinInvFromLatch = no;  Latch Index = 3484;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [37] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5] .Q ,   // OR = 1;  pos = 37;  Pin Index = 10637;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].Q;  pinInvFromLatch = no;  Latch Index = 3449;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [38] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4] .Q ,   // OR = 1;  pos = 38;  Pin Index = 10531;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].Q;  pinInvFromLatch = no;  Latch Index = 3414;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [39] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3] .Q ,   // OR = 1;  pos = 39;  Pin Index = 10425;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].Q;  pinInvFromLatch = no;  Latch Index = 3379;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [40] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2] .Q ,   // OR = 1;  pos = 40;  Pin Index = 10319;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].Q;  pinInvFromLatch = no;  Latch Index = 3344;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [41] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1] .Q ,   // OR = 1;  pos = 41;  Pin Index = 10213;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].Q;  pinInvFromLatch = no;  Latch Index = 3309;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [42] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0] .Q ,   // OR = 1;  pos = 42;  Pin Index = 10107;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].Q;  pinInvFromLatch = no;  Latch Index = 3274;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [43] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7] .Q ,   // OR = 1;  pos = 43;  Pin Index = 10001;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].Q;  pinInvFromLatch = no;  Latch Index = 3239;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [44] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6] .Q ,   // OR = 1;  pos = 44;  Pin Index = 9895;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].Q;  pinInvFromLatch = no;  Latch Index = 3204;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [45] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5] .Q ,   // OR = 1;  pos = 45;  Pin Index = 9789;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].Q;  pinInvFromLatch = no;  Latch Index = 3169;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [46] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4] .Q ,   // OR = 1;  pos = 46;  Pin Index = 9683;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].Q;  pinInvFromLatch = no;  Latch Index = 3134;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [47] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3] .Q ,   // OR = 1;  pos = 47;  Pin Index = 9577;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].Q;  pinInvFromLatch = no;  Latch Index = 3099;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [48] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2] .Q ,   // OR = 1;  pos = 48;  Pin Index = 9471;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].Q;  pinInvFromLatch = no;  Latch Index = 3064;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [49] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1] .Q ,   // OR = 1;  pos = 49;  Pin Index = 9365;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].Q;  pinInvFromLatch = no;  Latch Index = 3029;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [50] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0] .Q ,   // OR = 1;  pos = 50;  Pin Index = 9259;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 2994;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [51] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7] .Q ,   // OR = 1;  pos = 51;  Pin Index = 9153;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7].Q;  pinInvFromLatch = no;  Latch Index = 2959;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [52] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6] .Q ,   // OR = 1;  pos = 52;  Pin Index = 9047;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6].Q;  pinInvFromLatch = no;  Latch Index = 2924;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [53] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5] .Q ,   // OR = 1;  pos = 53;  Pin Index = 8941;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].Q;  pinInvFromLatch = no;  Latch Index = 2889;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [54] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4] .Q ,   // OR = 1;  pos = 54;  Pin Index = 8835;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].Q;  pinInvFromLatch = no;  Latch Index = 2854;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [55] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3] .Q ,   // OR = 1;  pos = 55;  Pin Index = 8729;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].Q;  pinInvFromLatch = no;  Latch Index = 2819;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [56] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2] .Q ,   // OR = 1;  pos = 56;  Pin Index = 8623;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].Q;  pinInvFromLatch = no;  Latch Index = 2784;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [57] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1] .Q ,   // OR = 1;  pos = 57;  Pin Index = 8517;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 2749;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [58] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0] .Q ,   // OR = 1;  pos = 58;  Pin Index = 8411;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].Q;  pinInvFromLatch = no;  Latch Index = 2714;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [59] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7] .Q ,   // OR = 1;  pos = 59;  Pin Index = 8305;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].Q;  pinInvFromLatch = no;  Latch Index = 2679;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [60] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6] .Q ,   // OR = 1;  pos = 60;  Pin Index = 8199;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].Q;  pinInvFromLatch = no;  Latch Index = 2644;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [61] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5] .Q ,   // OR = 1;  pos = 61;  Pin Index = 8093;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].Q;  pinInvFromLatch = no;  Latch Index = 2609;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [62] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4] .Q ,   // OR = 1;  pos = 62;  Pin Index = 7987;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].Q;  pinInvFromLatch = no;  Latch Index = 2574;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [63] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3] .Q ,   // OR = 1;  pos = 63;  Pin Index = 7881;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].Q;  pinInvFromLatch = no;  Latch Index = 2539;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [64] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2] .Q ,   // OR = 1;  pos = 64;  Pin Index = 7775;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].Q;  pinInvFromLatch = no;  Latch Index = 2504;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [65] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1] .Q ,   // OR = 1;  pos = 65;  Pin Index = 7669;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 2469;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [66] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0] .Q ,   // OR = 1;  pos = 66;  Pin Index = 7563;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].Q;  pinInvFromLatch = no;  Latch Index = 2434;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [67] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7] .Q ,   // OR = 1;  pos = 67;  Pin Index = 7457;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].Q;  pinInvFromLatch = no;  Latch Index = 2399;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [68] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6] .Q ,   // OR = 1;  pos = 68;  Pin Index = 7351;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].Q;  pinInvFromLatch = no;  Latch Index = 2364;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [69] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5] .Q ,   // OR = 1;  pos = 69;  Pin Index = 7245;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].Q;  pinInvFromLatch = no;  Latch Index = 2329;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [70] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4] .Q ,   // OR = 1;  pos = 70;  Pin Index = 7139;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].Q;  pinInvFromLatch = no;  Latch Index = 2294;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [71] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3] .Q ,   // OR = 1;  pos = 71;  Pin Index = 7033;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3].Q;  pinInvFromLatch = no;  Latch Index = 2259;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [72] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2] .Q ,   // OR = 1;  pos = 72;  Pin Index = 6927;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2].Q;  pinInvFromLatch = no;  Latch Index = 2224;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [73] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1] .Q ,   // OR = 1;  pos = 73;  Pin Index = 6821;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].Q;  pinInvFromLatch = no;  Latch Index = 2189;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [74] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0] .Q ,   // OR = 1;  pos = 74;  Pin Index = 6715;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 2154;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [75] =  TOP_inst.U0_ALU_16B.OUT_VALID_reg.Q ,   // OR = 1;  pos = 75;  Pin Index = 1783;  Pin Name = U0_ALU_16B.OUT_VALID_reg.Q;  pinInvFromLatch = no;  Latch Index = 558;  Latch Name = U0_ALU_16B.OUT_VALID_reg.__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [76] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[15] .Q ,   // OR = 1;  pos = 76;  Pin Index = 2525;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[15].Q;  pinInvFromLatch = no;  Latch Index = 803;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[15].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [77] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[14] .Q ,   // OR = 1;  pos = 77;  Pin Index = 2419;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[14].Q;  pinInvFromLatch = no;  Latch Index = 768;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[14].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [78] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[13] .Q ,   // OR = 1;  pos = 78;  Pin Index = 2313;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[13].Q;  pinInvFromLatch = no;  Latch Index = 733;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[13].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [79] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[12] .Q ,   // OR = 1;  pos = 79;  Pin Index = 2207;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[12].Q;  pinInvFromLatch = no;  Latch Index = 698;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[12].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [80] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[11] .Q ,   // OR = 1;  pos = 80;  Pin Index = 2101;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[11].Q;  pinInvFromLatch = no;  Latch Index = 663;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[11].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [81] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[10] .Q ,   // OR = 1;  pos = 81;  Pin Index = 1995;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[10].Q;  pinInvFromLatch = no;  Latch Index = 628;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[10].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [82] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[9] .Q ,   // OR = 1;  pos = 82;  Pin Index = 3479;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[9].Q;  pinInvFromLatch = no;  Latch Index = 1118;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[9].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [83] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[8] .Q ,   // OR = 1;  pos = 83;  Pin Index = 3373;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[8].Q;  pinInvFromLatch = no;  Latch Index = 1083;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[8].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [84] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[7] .Q ,   // OR = 1;  pos = 84;  Pin Index = 3267;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 1048;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [85] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[6] .Q ,   // OR = 1;  pos = 85;  Pin Index = 3161;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 1013;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [86] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[5] .Q ,   // OR = 1;  pos = 86;  Pin Index = 3055;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 978;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [87] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[4] .Q ,   // OR = 1;  pos = 87;  Pin Index = 2949;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 943;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [88] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[3] .Q ,   // OR = 1;  pos = 88;  Pin Index = 2843;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 908;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [89] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[2] .Q ,   // OR = 1;  pos = 89;  Pin Index = 2737;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 873;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [90] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[1] .Q ,   // OR = 1;  pos = 90;  Pin Index = 2631;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 838;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [91] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[0] .Q ;   // OR = 1;  pos = 91;  Pin Index = 1889;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 593;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[0].__iNsT2.dff_primitive;   

  assign // OR = 2 
    part_M_OR_2_TM_1 [1] =  TOP_inst.ScanOut_2 ,   // OR = 2;  pos = 1;  Pin Index = 11;  Pin Name = ScanOut_2;  pinInvFromLatch = no;  Latch Index = 17555;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [2] =  TOP_inst.U1_RST_SYNC_UART.\sync_reg_reg[0] .Q ,   // OR = 2;  pos = 2;  Pin Index = 54266;  Pin Name = U1_RST_SYNC_UART.\sync_reg_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 17520;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [3] =  TOP_inst.U1_Integer_Clock_Divider_RX.gen_clk_reg.Q ,   // OR = 2;  pos = 3;  Pin Index = 54154;  Pin Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.Q;  pinInvFromLatch = no;  Latch Index = 17484;  Latch Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [4] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[6] .Q ,   // OR = 2;  pos = 4;  Pin Index = 53704;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 17330;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [5] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[5] .Q ,   // OR = 2;  pos = 5;  Pin Index = 53598;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 17295;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [6] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[4] .Q ,   // OR = 2;  pos = 6;  Pin Index = 53492;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 17260;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [7] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[3] .Q ,   // OR = 2;  pos = 7;  Pin Index = 53386;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 17225;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [8] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[2] .Q ,   // OR = 2;  pos = 8;  Pin Index = 53280;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 17190;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [9] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[1] .Q ,   // OR = 2;  pos = 9;  Pin Index = 53174;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 17155;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [10] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[0] .Q ,   // OR = 2;  pos = 10;  Pin Index = 53068;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 17120;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [11] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.Q ,   // OR = 2;  pos = 11;  Pin Index = 52946;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.Q;  pinInvFromLatch = no;  Latch Index = 17084;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [12] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7] .Q ,   // OR = 2;  pos = 12;  Pin Index = 52442;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 16915;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [13] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6] .Q ,   // OR = 2;  pos = 13;  Pin Index = 52336;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 16880;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [14] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5] .Q ,   // OR = 2;  pos = 14;  Pin Index = 52230;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 16845;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [15] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4] .Q ,   // OR = 2;  pos = 15;  Pin Index = 52124;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 16810;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [16] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3] .Q ,   // OR = 2;  pos = 16;  Pin Index = 52018;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 16775;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [17] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2] .Q ,   // OR = 2;  pos = 17;  Pin Index = 51912;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 16740;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [18] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1] .Q ,   // OR = 2;  pos = 18;  Pin Index = 51806;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 16705;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [19] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0] .Q ,   // OR = 2;  pos = 19;  Pin Index = 51700;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 16670;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [20] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3] .Q ,   // OR = 2;  pos = 20;  Pin Index = 51594;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 16635;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [21] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2] .Q ,   // OR = 2;  pos = 21;  Pin Index = 51488;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 16600;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [22] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1] .Q ,   // OR = 2;  pos = 22;  Pin Index = 51382;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 16565;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [23] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0] .Q ,   // OR = 2;  pos = 23;  Pin Index = 51276;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 16530;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [24] = !TOP_inst.U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.QN ,   // OR = 2;  pos = 24;  Pin Index = 51174;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.QN;  pinInvFromLatch = yes;  Latch Index = 16495;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [25] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7] .Q ,   // OR = 2;  pos = 25;  Pin Index = 50873;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 16406;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [26] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6] .Q ,   // OR = 2;  pos = 26;  Pin Index = 50767;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 16371;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [27] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5] .Q ,   // OR = 2;  pos = 27;  Pin Index = 50661;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 16336;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [28] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4] .Q ,   // OR = 2;  pos = 28;  Pin Index = 50555;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 16301;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [29] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3] .Q ,   // OR = 2;  pos = 29;  Pin Index = 50449;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 16266;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [30] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2] .Q ,   // OR = 2;  pos = 30;  Pin Index = 50343;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 16231;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [31] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1] .Q ,   // OR = 2;  pos = 31;  Pin Index = 50237;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 16196;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [32] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0] .Q ,   // OR = 2;  pos = 32;  Pin Index = 50131;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 16161;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [33] =  TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2] .Q ,   // OR = 2;  pos = 33;  Pin Index = 49854;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 16070;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [34] =  TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1] .Q ,   // OR = 2;  pos = 34;  Pin Index = 49748;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 16035;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [35] =  TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0] .Q ,   // OR = 2;  pos = 35;  Pin Index = 49642;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 16000;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [36] =  TOP_inst.U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.Q ,   // OR = 2;  pos = 36;  Pin Index = 49504;  Pin Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.Q;  pinInvFromLatch = no;  Latch Index = 15963;  Latch Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [37] =  TOP_inst.U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.Q ,   // OR = 2;  pos = 37;  Pin Index = 49173;  Pin Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.Q;  pinInvFromLatch = no;  Latch Index = 15859;  Latch Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [38] =  TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.parity_reg.Q ,   // OR = 2;  pos = 38;  Pin Index = 48852;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.Q;  pinInvFromLatch = no;  Latch Index = 15754;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [39] =  TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.Q ,   // OR = 2;  pos = 39;  Pin Index = 48746;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.Q;  pinInvFromLatch = no;  Latch Index = 15719;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [40] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4] .Q ,   // OR = 2;  pos = 40;  Pin Index = 47935;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 15452;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [41] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3] .Q ,   // OR = 2;  pos = 41;  Pin Index = 47829;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 15417;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [42] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2] .Q ,   // OR = 2;  pos = 42;  Pin Index = 47723;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 15382;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [43] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1] .Q ,   // OR = 2;  pos = 43;  Pin Index = 47617;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 15347;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [44] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0] .Q ,   // OR = 2;  pos = 44;  Pin Index = 47511;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 15312;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [45] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3] .Q ,   // OR = 2;  pos = 45;  Pin Index = 47405;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 15277;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [46] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2] .Q ,   // OR = 2;  pos = 46;  Pin Index = 47299;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 15242;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [47] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1] .Q ,   // OR = 2;  pos = 47;  Pin Index = 47193;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 15207;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [48] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0] .Q ,   // OR = 2;  pos = 48;  Pin Index = 47087;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 15172;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [49] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7] .Q ,   // OR = 2;  pos = 49;  Pin Index = 46619;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 15022;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [50] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6] .Q ,   // OR = 2;  pos = 50;  Pin Index = 46513;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 14987;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [51] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5] .Q ,   // OR = 2;  pos = 51;  Pin Index = 46407;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 14952;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [52] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4] .Q ,   // OR = 2;  pos = 52;  Pin Index = 46301;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 14917;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [53] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3] .Q ,   // OR = 2;  pos = 53;  Pin Index = 46195;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 14882;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [54] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2] .Q ,   // OR = 2;  pos = 54;  Pin Index = 46089;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 14847;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [55] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1] .Q ,   // OR = 2;  pos = 55;  Pin Index = 45983;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 14812;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [56] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0] .Q ,   // OR = 2;  pos = 56;  Pin Index = 45877;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 14777;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [57] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2] .Q ,   // OR = 2;  pos = 57;  Pin Index = 45206;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 14547;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].__iNsT1.dff_primitive;   
    part_M_OR_2_TM_1 [58] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1] .Q ,   // OR = 2;  pos = 58;  Pin Index = 45117;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 14517;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].__iNsT1.dff_primitive;   
    part_M_OR_2_TM_1 [59] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0] .Q ,   // OR = 2;  pos = 59;  Pin Index = 45028;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 14487;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].__iNsT1.dff_primitive;   
    part_M_OR_2_TM_1 [60] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.Q ,   // OR = 2;  pos = 60;  Pin Index = 45752;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.Q;  pinInvFromLatch = no;  Latch Index = 14741;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [61] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2] .Q ,   // OR = 2;  pos = 61;  Pin Index = 44355;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 14275;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [62] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1] .Q ,   // OR = 2;  pos = 62;  Pin Index = 44249;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 14240;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [63] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0] .Q ,   // OR = 2;  pos = 63;  Pin Index = 44143;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 14205;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [64] =  TOP_inst.U0_PULSE_GEN.rcv_flop_reg.Q ,   // OR = 2;  pos = 64;  Pin Index = 22030;  Pin Name = U0_PULSE_GEN.rcv_flop_reg.Q;  pinInvFromLatch = no;  Latch Index = 7115;  Latch Name = U0_PULSE_GEN.rcv_flop_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [65] =  TOP_inst.U0_PULSE_GEN.pls_flop_reg.Q ,   // OR = 2;  pos = 65;  Pin Index = 21924;  Pin Name = U0_PULSE_GEN.pls_flop_reg.Q;  pinInvFromLatch = no;  Latch Index = 7080;  Latch Name = U0_PULSE_GEN.pls_flop_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [66] =  TOP_inst.U0_Integer_Clock_Divider_TX.gen_clk_reg.Q ,   // OR = 2;  pos = 66;  Pin Index = 21794;  Pin Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.Q;  pinInvFromLatch = no;  Latch Index = 7038;  Latch Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [67] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[6] .Q ,   // OR = 2;  pos = 67;  Pin Index = 21142;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 6817;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [68] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[5] .Q ,   // OR = 2;  pos = 68;  Pin Index = 21036;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 6782;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [69] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[4] .Q ,   // OR = 2;  pos = 69;  Pin Index = 20930;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 6747;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [70] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[3] .Q ,   // OR = 2;  pos = 70;  Pin Index = 20824;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 6712;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [71] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[2] .Q ,   // OR = 2;  pos = 71;  Pin Index = 20718;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 6677;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [72] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[1] .Q ,   // OR = 2;  pos = 72;  Pin Index = 20612;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 6642;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [73] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[0] .Q ,   // OR = 2;  pos = 73;  Pin Index = 20506;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 6607;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [74] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1] .Q ,   // OR = 2;  pos = 74;  Pin Index = 18818;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1].Q;  pinInvFromLatch = no;  Latch Index = 6070;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [75] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0] .Q ,   // OR = 2;  pos = 75;  Pin Index = 18712;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 6035;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [76] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1] .Q ,   // OR = 2;  pos = 76;  Pin Index = 18606;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 6000;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [77] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0] .Q ,   // OR = 2;  pos = 77;  Pin Index = 18500;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].Q;  pinInvFromLatch = no;  Latch Index = 5965;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [78] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1] .Q ,   // OR = 2;  pos = 78;  Pin Index = 18394;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 5930;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [79] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0] .Q ,   // OR = 2;  pos = 79;  Pin Index = 18288;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].Q;  pinInvFromLatch = no;  Latch Index = 5895;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [80] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1] .Q ,   // OR = 2;  pos = 80;  Pin Index = 18182;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].Q;  pinInvFromLatch = no;  Latch Index = 5860;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [81] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0] .Q ,   // OR = 2;  pos = 81;  Pin Index = 18076;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 5825;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [82] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3] .Q ,   // OR = 2;  pos = 82;  Pin Index = 15882;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 5111;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [83] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2] .Q ,   // OR = 2;  pos = 83;  Pin Index = 15776;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 5076;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [84] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1] .Q ,   // OR = 2;  pos = 84;  Pin Index = 15670;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 5041;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [85] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0] .Q ,   // OR = 2;  pos = 85;  Pin Index = 15564;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 5006;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [86] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3] .Q ,   // OR = 2;  pos = 86;  Pin Index = 15458;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 4971;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [87] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2] .Q ,   // OR = 2;  pos = 87;  Pin Index = 15352;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 4936;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [88] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1] .Q ,   // OR = 2;  pos = 88;  Pin Index = 15246;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 4901;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [89] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0] .Q ;   // OR = 2;  pos = 89;  Pin Index = 15140;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 4866;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0].__iNsT2.dff_primitive;   

  assign // OR = 3 
    part_M_OR_3_TM_1 [1] =  TOP_inst.ScanOut_3 ,   // OR = 3;  pos = 1;  Pin Index = 12;  Pin Name = ScanOut_3;  pinInvFromLatch = no;  Latch Index = 11387;  Latch Name = U0_Register_File.\Memory_reg[8][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[8][5] .Q ,   // OR = 3;  pos = 2;  Pin Index = 34921;  Pin Name = U0_Register_File.\Memory_reg[8][5].Q;  pinInvFromLatch = no;  Latch Index = 11352;  Latch Name = U0_Register_File.\Memory_reg[8][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[8][4] .Q ,   // OR = 3;  pos = 3;  Pin Index = 34815;  Pin Name = U0_Register_File.\Memory_reg[8][4].Q;  pinInvFromLatch = no;  Latch Index = 11317;  Latch Name = U0_Register_File.\Memory_reg[8][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[8][3] .Q ,   // OR = 3;  pos = 4;  Pin Index = 34709;  Pin Name = U0_Register_File.\Memory_reg[8][3].Q;  pinInvFromLatch = no;  Latch Index = 11282;  Latch Name = U0_Register_File.\Memory_reg[8][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[8][2] .Q ,   // OR = 3;  pos = 5;  Pin Index = 34603;  Pin Name = U0_Register_File.\Memory_reg[8][2].Q;  pinInvFromLatch = no;  Latch Index = 11247;  Latch Name = U0_Register_File.\Memory_reg[8][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [6] =  TOP_inst.U0_Register_File.\Memory_reg[8][1] .Q ,   // OR = 3;  pos = 6;  Pin Index = 34497;  Pin Name = U0_Register_File.\Memory_reg[8][1].Q;  pinInvFromLatch = no;  Latch Index = 11212;  Latch Name = U0_Register_File.\Memory_reg[8][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[8][0] .Q ,   // OR = 3;  pos = 7;  Pin Index = 34391;  Pin Name = U0_Register_File.\Memory_reg[8][0].Q;  pinInvFromLatch = no;  Latch Index = 11177;  Latch Name = U0_Register_File.\Memory_reg[8][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[7][7] .Q ,   // OR = 3;  pos = 8;  Pin Index = 34285;  Pin Name = U0_Register_File.\Memory_reg[7][7].Q;  pinInvFromLatch = no;  Latch Index = 11142;  Latch Name = U0_Register_File.\Memory_reg[7][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[7][6] .Q ,   // OR = 3;  pos = 9;  Pin Index = 34179;  Pin Name = U0_Register_File.\Memory_reg[7][6].Q;  pinInvFromLatch = no;  Latch Index = 11107;  Latch Name = U0_Register_File.\Memory_reg[7][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [10] =  TOP_inst.U0_Register_File.\Memory_reg[7][5] .Q ,   // OR = 3;  pos = 10;  Pin Index = 34073;  Pin Name = U0_Register_File.\Memory_reg[7][5].Q;  pinInvFromLatch = no;  Latch Index = 11072;  Latch Name = U0_Register_File.\Memory_reg[7][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [11] =  TOP_inst.U0_Register_File.\Memory_reg[7][4] .Q ,   // OR = 3;  pos = 11;  Pin Index = 33967;  Pin Name = U0_Register_File.\Memory_reg[7][4].Q;  pinInvFromLatch = no;  Latch Index = 11037;  Latch Name = U0_Register_File.\Memory_reg[7][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [12] =  TOP_inst.U0_Register_File.\Memory_reg[7][3] .Q ,   // OR = 3;  pos = 12;  Pin Index = 33861;  Pin Name = U0_Register_File.\Memory_reg[7][3].Q;  pinInvFromLatch = no;  Latch Index = 11002;  Latch Name = U0_Register_File.\Memory_reg[7][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [13] =  TOP_inst.U0_Register_File.\Memory_reg[7][2] .Q ,   // OR = 3;  pos = 13;  Pin Index = 33755;  Pin Name = U0_Register_File.\Memory_reg[7][2].Q;  pinInvFromLatch = no;  Latch Index = 10967;  Latch Name = U0_Register_File.\Memory_reg[7][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [14] =  TOP_inst.U0_Register_File.\Memory_reg[7][1] .Q ,   // OR = 3;  pos = 14;  Pin Index = 33649;  Pin Name = U0_Register_File.\Memory_reg[7][1].Q;  pinInvFromLatch = no;  Latch Index = 10932;  Latch Name = U0_Register_File.\Memory_reg[7][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [15] =  TOP_inst.U0_Register_File.\Memory_reg[7][0] .Q ,   // OR = 3;  pos = 15;  Pin Index = 33543;  Pin Name = U0_Register_File.\Memory_reg[7][0].Q;  pinInvFromLatch = no;  Latch Index = 10897;  Latch Name = U0_Register_File.\Memory_reg[7][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[6][7] .Q ,   // OR = 3;  pos = 16;  Pin Index = 33437;  Pin Name = U0_Register_File.\Memory_reg[6][7].Q;  pinInvFromLatch = no;  Latch Index = 10862;  Latch Name = U0_Register_File.\Memory_reg[6][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[6][6] .Q ,   // OR = 3;  pos = 17;  Pin Index = 33331;  Pin Name = U0_Register_File.\Memory_reg[6][6].Q;  pinInvFromLatch = no;  Latch Index = 10827;  Latch Name = U0_Register_File.\Memory_reg[6][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[6][5] .Q ,   // OR = 3;  pos = 18;  Pin Index = 33225;  Pin Name = U0_Register_File.\Memory_reg[6][5].Q;  pinInvFromLatch = no;  Latch Index = 10792;  Latch Name = U0_Register_File.\Memory_reg[6][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [19] =  TOP_inst.U0_Register_File.\Memory_reg[6][4] .Q ,   // OR = 3;  pos = 19;  Pin Index = 33119;  Pin Name = U0_Register_File.\Memory_reg[6][4].Q;  pinInvFromLatch = no;  Latch Index = 10757;  Latch Name = U0_Register_File.\Memory_reg[6][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [20] =  TOP_inst.U0_Register_File.\Memory_reg[6][3] .Q ,   // OR = 3;  pos = 20;  Pin Index = 33013;  Pin Name = U0_Register_File.\Memory_reg[6][3].Q;  pinInvFromLatch = no;  Latch Index = 10722;  Latch Name = U0_Register_File.\Memory_reg[6][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [21] =  TOP_inst.U0_Register_File.\Memory_reg[6][2] .Q ,   // OR = 3;  pos = 21;  Pin Index = 32907;  Pin Name = U0_Register_File.\Memory_reg[6][2].Q;  pinInvFromLatch = no;  Latch Index = 10687;  Latch Name = U0_Register_File.\Memory_reg[6][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [22] =  TOP_inst.U0_Register_File.\Memory_reg[6][1] .Q ,   // OR = 3;  pos = 22;  Pin Index = 32801;  Pin Name = U0_Register_File.\Memory_reg[6][1].Q;  pinInvFromLatch = no;  Latch Index = 10652;  Latch Name = U0_Register_File.\Memory_reg[6][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [23] =  TOP_inst.U0_Register_File.\Memory_reg[6][0] .Q ,   // OR = 3;  pos = 23;  Pin Index = 32695;  Pin Name = U0_Register_File.\Memory_reg[6][0].Q;  pinInvFromLatch = no;  Latch Index = 10617;  Latch Name = U0_Register_File.\Memory_reg[6][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [24] =  TOP_inst.U0_Register_File.\Memory_reg[5][7] .Q ,   // OR = 3;  pos = 24;  Pin Index = 32589;  Pin Name = U0_Register_File.\Memory_reg[5][7].Q;  pinInvFromLatch = no;  Latch Index = 10582;  Latch Name = U0_Register_File.\Memory_reg[5][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [25] =  TOP_inst.U0_Register_File.\Memory_reg[5][6] .Q ,   // OR = 3;  pos = 25;  Pin Index = 32483;  Pin Name = U0_Register_File.\Memory_reg[5][6].Q;  pinInvFromLatch = no;  Latch Index = 10547;  Latch Name = U0_Register_File.\Memory_reg[5][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [26] =  TOP_inst.U0_Register_File.\Memory_reg[5][5] .Q ,   // OR = 3;  pos = 26;  Pin Index = 32377;  Pin Name = U0_Register_File.\Memory_reg[5][5].Q;  pinInvFromLatch = no;  Latch Index = 10512;  Latch Name = U0_Register_File.\Memory_reg[5][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [27] =  TOP_inst.U0_Register_File.\Memory_reg[5][4] .Q ,   // OR = 3;  pos = 27;  Pin Index = 32271;  Pin Name = U0_Register_File.\Memory_reg[5][4].Q;  pinInvFromLatch = no;  Latch Index = 10477;  Latch Name = U0_Register_File.\Memory_reg[5][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [28] =  TOP_inst.U0_Register_File.\Memory_reg[5][3] .Q ,   // OR = 3;  pos = 28;  Pin Index = 32165;  Pin Name = U0_Register_File.\Memory_reg[5][3].Q;  pinInvFromLatch = no;  Latch Index = 10442;  Latch Name = U0_Register_File.\Memory_reg[5][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [29] =  TOP_inst.U0_Register_File.\Memory_reg[5][2] .Q ,   // OR = 3;  pos = 29;  Pin Index = 32059;  Pin Name = U0_Register_File.\Memory_reg[5][2].Q;  pinInvFromLatch = no;  Latch Index = 10407;  Latch Name = U0_Register_File.\Memory_reg[5][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [30] =  TOP_inst.U0_Register_File.\Memory_reg[5][1] .Q ,   // OR = 3;  pos = 30;  Pin Index = 31953;  Pin Name = U0_Register_File.\Memory_reg[5][1].Q;  pinInvFromLatch = no;  Latch Index = 10372;  Latch Name = U0_Register_File.\Memory_reg[5][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [31] =  TOP_inst.U0_Register_File.\Memory_reg[5][0] .Q ,   // OR = 3;  pos = 31;  Pin Index = 31847;  Pin Name = U0_Register_File.\Memory_reg[5][0].Q;  pinInvFromLatch = no;  Latch Index = 10337;  Latch Name = U0_Register_File.\Memory_reg[5][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [32] =  TOP_inst.U0_Register_File.\Memory_reg[4][7] .Q ,   // OR = 3;  pos = 32;  Pin Index = 31741;  Pin Name = U0_Register_File.\Memory_reg[4][7].Q;  pinInvFromLatch = no;  Latch Index = 10302;  Latch Name = U0_Register_File.\Memory_reg[4][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [33] =  TOP_inst.U0_Register_File.\Memory_reg[4][6] .Q ,   // OR = 3;  pos = 33;  Pin Index = 31635;  Pin Name = U0_Register_File.\Memory_reg[4][6].Q;  pinInvFromLatch = no;  Latch Index = 10267;  Latch Name = U0_Register_File.\Memory_reg[4][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [34] =  TOP_inst.U0_Register_File.\Memory_reg[4][5] .Q ,   // OR = 3;  pos = 34;  Pin Index = 31529;  Pin Name = U0_Register_File.\Memory_reg[4][5].Q;  pinInvFromLatch = no;  Latch Index = 10232;  Latch Name = U0_Register_File.\Memory_reg[4][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [35] =  TOP_inst.U0_Register_File.\Memory_reg[4][4] .Q ,   // OR = 3;  pos = 35;  Pin Index = 31423;  Pin Name = U0_Register_File.\Memory_reg[4][4].Q;  pinInvFromLatch = no;  Latch Index = 10197;  Latch Name = U0_Register_File.\Memory_reg[4][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [36] =  TOP_inst.U0_Register_File.\Memory_reg[4][3] .Q ,   // OR = 3;  pos = 36;  Pin Index = 31317;  Pin Name = U0_Register_File.\Memory_reg[4][3].Q;  pinInvFromLatch = no;  Latch Index = 10162;  Latch Name = U0_Register_File.\Memory_reg[4][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [37] =  TOP_inst.U0_Register_File.\Memory_reg[4][2] .Q ,   // OR = 3;  pos = 37;  Pin Index = 31211;  Pin Name = U0_Register_File.\Memory_reg[4][2].Q;  pinInvFromLatch = no;  Latch Index = 10127;  Latch Name = U0_Register_File.\Memory_reg[4][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [38] =  TOP_inst.U0_Register_File.\Memory_reg[4][1] .Q ,   // OR = 3;  pos = 38;  Pin Index = 31105;  Pin Name = U0_Register_File.\Memory_reg[4][1].Q;  pinInvFromLatch = no;  Latch Index = 10092;  Latch Name = U0_Register_File.\Memory_reg[4][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [39] =  TOP_inst.U0_Register_File.\Memory_reg[4][0] .Q ,   // OR = 3;  pos = 39;  Pin Index = 30999;  Pin Name = U0_Register_File.\Memory_reg[4][0].Q;  pinInvFromLatch = no;  Latch Index = 10057;  Latch Name = U0_Register_File.\Memory_reg[4][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [40] =  TOP_inst.U0_Register_File.\Memory_reg[3][7] .Q ,   // OR = 3;  pos = 40;  Pin Index = 30893;  Pin Name = U0_Register_File.\Memory_reg[3][7].Q;  pinInvFromLatch = no;  Latch Index = 10022;  Latch Name = U0_Register_File.\Memory_reg[3][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [41] =  TOP_inst.U0_Register_File.\Memory_reg[3][6] .Q ,   // OR = 3;  pos = 41;  Pin Index = 30787;  Pin Name = U0_Register_File.\Memory_reg[3][6].Q;  pinInvFromLatch = no;  Latch Index = 9987;  Latch Name = U0_Register_File.\Memory_reg[3][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [42] = !TOP_inst.U0_Register_File.\Memory_reg[3][5] .QN ,   // OR = 3;  pos = 42;  Pin Index = 30685;  Pin Name = U0_Register_File.\Memory_reg[3][5].QN;  pinInvFromLatch = yes;  Latch Index = 9952;  Latch Name = U0_Register_File.\Memory_reg[3][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [43] =  TOP_inst.U0_Register_File.\Memory_reg[3][4] .Q ,   // OR = 3;  pos = 43;  Pin Index = 30578;  Pin Name = U0_Register_File.\Memory_reg[3][4].Q;  pinInvFromLatch = no;  Latch Index = 9918;  Latch Name = U0_Register_File.\Memory_reg[3][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [44] =  TOP_inst.U0_Register_File.\Memory_reg[3][3] .Q ,   // OR = 3;  pos = 44;  Pin Index = 30472;  Pin Name = U0_Register_File.\Memory_reg[3][3].Q;  pinInvFromLatch = no;  Latch Index = 9883;  Latch Name = U0_Register_File.\Memory_reg[3][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [45] =  TOP_inst.U0_Register_File.\Memory_reg[3][2] .Q ,   // OR = 3;  pos = 45;  Pin Index = 30366;  Pin Name = U0_Register_File.\Memory_reg[3][2].Q;  pinInvFromLatch = no;  Latch Index = 9848;  Latch Name = U0_Register_File.\Memory_reg[3][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [46] =  TOP_inst.U0_Register_File.\Memory_reg[3][1] .Q ,   // OR = 3;  pos = 46;  Pin Index = 30260;  Pin Name = U0_Register_File.\Memory_reg[3][1].Q;  pinInvFromLatch = no;  Latch Index = 9813;  Latch Name = U0_Register_File.\Memory_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [47] =  TOP_inst.U0_Register_File.\Memory_reg[3][0] .Q ,   // OR = 3;  pos = 47;  Pin Index = 30154;  Pin Name = U0_Register_File.\Memory_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 9778;  Latch Name = U0_Register_File.\Memory_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [48] = !TOP_inst.U0_Register_File.\Memory_reg[2][7] .QN ,   // OR = 3;  pos = 48;  Pin Index = 30052;  Pin Name = U0_Register_File.\Memory_reg[2][7].QN;  pinInvFromLatch = yes;  Latch Index = 9743;  Latch Name = U0_Register_File.\Memory_reg[2][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [49] =  TOP_inst.U0_Register_File.\Memory_reg[2][6] .Q ,   // OR = 3;  pos = 49;  Pin Index = 29945;  Pin Name = U0_Register_File.\Memory_reg[2][6].Q;  pinInvFromLatch = no;  Latch Index = 9709;  Latch Name = U0_Register_File.\Memory_reg[2][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [50] =  TOP_inst.U0_Register_File.\Memory_reg[2][5] .Q ,   // OR = 3;  pos = 50;  Pin Index = 29839;  Pin Name = U0_Register_File.\Memory_reg[2][5].Q;  pinInvFromLatch = no;  Latch Index = 9674;  Latch Name = U0_Register_File.\Memory_reg[2][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [51] =  TOP_inst.U0_Register_File.\Memory_reg[2][4] .Q ,   // OR = 3;  pos = 51;  Pin Index = 29733;  Pin Name = U0_Register_File.\Memory_reg[2][4].Q;  pinInvFromLatch = no;  Latch Index = 9639;  Latch Name = U0_Register_File.\Memory_reg[2][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [52] =  TOP_inst.U0_Register_File.\Memory_reg[2][3] .Q ,   // OR = 3;  pos = 52;  Pin Index = 29627;  Pin Name = U0_Register_File.\Memory_reg[2][3].Q;  pinInvFromLatch = no;  Latch Index = 9604;  Latch Name = U0_Register_File.\Memory_reg[2][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [53] =  TOP_inst.U0_Register_File.\Memory_reg[2][2] .Q ,   // OR = 3;  pos = 53;  Pin Index = 29521;  Pin Name = U0_Register_File.\Memory_reg[2][2].Q;  pinInvFromLatch = no;  Latch Index = 9569;  Latch Name = U0_Register_File.\Memory_reg[2][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [54] =  TOP_inst.U0_Register_File.\Memory_reg[2][1] .Q ,   // OR = 3;  pos = 54;  Pin Index = 29415;  Pin Name = U0_Register_File.\Memory_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 9534;  Latch Name = U0_Register_File.\Memory_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [55] = !TOP_inst.U0_Register_File.\Memory_reg[2][0] .QN ,   // OR = 3;  pos = 55;  Pin Index = 29313;  Pin Name = U0_Register_File.\Memory_reg[2][0].QN;  pinInvFromLatch = yes;  Latch Index = 9499;  Latch Name = U0_Register_File.\Memory_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [56] =  TOP_inst.U0_Register_File.\Memory_reg[1][7] .Q ,   // OR = 3;  pos = 56;  Pin Index = 29206;  Pin Name = U0_Register_File.\Memory_reg[1][7].Q;  pinInvFromLatch = no;  Latch Index = 9465;  Latch Name = U0_Register_File.\Memory_reg[1][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [57] =  TOP_inst.U0_Register_File.\Memory_reg[1][6] .Q ,   // OR = 3;  pos = 57;  Pin Index = 29100;  Pin Name = U0_Register_File.\Memory_reg[1][6].Q;  pinInvFromLatch = no;  Latch Index = 9430;  Latch Name = U0_Register_File.\Memory_reg[1][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [58] =  TOP_inst.U0_Register_File.\Memory_reg[1][5] .Q ,   // OR = 3;  pos = 58;  Pin Index = 28994;  Pin Name = U0_Register_File.\Memory_reg[1][5].Q;  pinInvFromLatch = no;  Latch Index = 9395;  Latch Name = U0_Register_File.\Memory_reg[1][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [59] =  TOP_inst.U0_Register_File.\Memory_reg[1][4] .Q ,   // OR = 3;  pos = 59;  Pin Index = 28888;  Pin Name = U0_Register_File.\Memory_reg[1][4].Q;  pinInvFromLatch = no;  Latch Index = 9360;  Latch Name = U0_Register_File.\Memory_reg[1][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [60] =  TOP_inst.U0_Register_File.\Memory_reg[1][3] .Q ,   // OR = 3;  pos = 60;  Pin Index = 28782;  Pin Name = U0_Register_File.\Memory_reg[1][3].Q;  pinInvFromLatch = no;  Latch Index = 9325;  Latch Name = U0_Register_File.\Memory_reg[1][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [61] =  TOP_inst.U0_Register_File.\Memory_reg[1][2] .Q ,   // OR = 3;  pos = 61;  Pin Index = 28676;  Pin Name = U0_Register_File.\Memory_reg[1][2].Q;  pinInvFromLatch = no;  Latch Index = 9290;  Latch Name = U0_Register_File.\Memory_reg[1][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [62] =  TOP_inst.U0_Register_File.\Memory_reg[1][1] .Q ,   // OR = 3;  pos = 62;  Pin Index = 28570;  Pin Name = U0_Register_File.\Memory_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 9255;  Latch Name = U0_Register_File.\Memory_reg[1][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [63] =  TOP_inst.U0_Register_File.\Memory_reg[1][0] .Q ,   // OR = 3;  pos = 63;  Pin Index = 28464;  Pin Name = U0_Register_File.\Memory_reg[1][0].Q;  pinInvFromLatch = no;  Latch Index = 9220;  Latch Name = U0_Register_File.\Memory_reg[1][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [64] =  TOP_inst.U0_Register_File.\Memory_reg[0][7] .Q ,   // OR = 3;  pos = 64;  Pin Index = 23270;  Pin Name = U0_Register_File.\Memory_reg[0][7].Q;  pinInvFromLatch = no;  Latch Index = 7505;  Latch Name = U0_Register_File.\Memory_reg[0][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [65] =  TOP_inst.U0_Register_File.\Memory_reg[0][6] .Q ,   // OR = 3;  pos = 65;  Pin Index = 23164;  Pin Name = U0_Register_File.\Memory_reg[0][6].Q;  pinInvFromLatch = no;  Latch Index = 7470;  Latch Name = U0_Register_File.\Memory_reg[0][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [66] =  TOP_inst.U0_Register_File.\Memory_reg[0][5] .Q ,   // OR = 3;  pos = 66;  Pin Index = 23058;  Pin Name = U0_Register_File.\Memory_reg[0][5].Q;  pinInvFromLatch = no;  Latch Index = 7435;  Latch Name = U0_Register_File.\Memory_reg[0][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [67] =  TOP_inst.U0_Register_File.\Memory_reg[0][4] .Q ,   // OR = 3;  pos = 67;  Pin Index = 22952;  Pin Name = U0_Register_File.\Memory_reg[0][4].Q;  pinInvFromLatch = no;  Latch Index = 7400;  Latch Name = U0_Register_File.\Memory_reg[0][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [68] =  TOP_inst.U0_Register_File.\Memory_reg[0][3] .Q ,   // OR = 3;  pos = 68;  Pin Index = 22846;  Pin Name = U0_Register_File.\Memory_reg[0][3].Q;  pinInvFromLatch = no;  Latch Index = 7365;  Latch Name = U0_Register_File.\Memory_reg[0][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [69] =  TOP_inst.U0_Register_File.\Memory_reg[0][2] .Q ,   // OR = 3;  pos = 69;  Pin Index = 22740;  Pin Name = U0_Register_File.\Memory_reg[0][2].Q;  pinInvFromLatch = no;  Latch Index = 7330;  Latch Name = U0_Register_File.\Memory_reg[0][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [70] =  TOP_inst.U0_Register_File.\Memory_reg[0][1] .Q ,   // OR = 3;  pos = 70;  Pin Index = 22634;  Pin Name = U0_Register_File.\Memory_reg[0][1].Q;  pinInvFromLatch = no;  Latch Index = 7295;  Latch Name = U0_Register_File.\Memory_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [71] =  TOP_inst.U0_Register_File.\Memory_reg[0][0] .Q ,   // OR = 3;  pos = 71;  Pin Index = 22528;  Pin Name = U0_Register_File.\Memory_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 7260;  Latch Name = U0_Register_File.\Memory_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [72] =  TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[1] .Q ,   // OR = 3;  pos = 72;  Pin Index = 22248;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 7186;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [73] =  TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[0] .Q ,   // OR = 3;  pos = 73;  Pin Index = 22142;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 7151;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [74] =  TOP_inst.U0_DATA_SYNC.\sync_reg_reg[1] .Q ,   // OR = 3;  pos = 74;  Pin Index = 20050;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 6466;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [75] =  TOP_inst.U0_DATA_SYNC.\sync_reg_reg[0] .Q ,   // OR = 3;  pos = 75;  Pin Index = 19944;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 6431;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [76] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[7] .Q ,   // OR = 3;  pos = 76;  Pin Index = 19838;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 6396;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [77] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[6] .Q ,   // OR = 3;  pos = 77;  Pin Index = 19732;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 6361;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [78] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[5] .Q ,   // OR = 3;  pos = 78;  Pin Index = 19626;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 6326;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [79] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[4] .Q ,   // OR = 3;  pos = 79;  Pin Index = 19520;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 6291;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [80] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[3] .Q ,   // OR = 3;  pos = 80;  Pin Index = 19414;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 6256;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [81] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[2] .Q ,   // OR = 3;  pos = 81;  Pin Index = 19308;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 6221;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [82] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[1] .Q ,   // OR = 3;  pos = 82;  Pin Index = 19202;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 6186;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [83] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[0] .Q ,   // OR = 3;  pos = 83;  Pin Index = 19096;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 6151;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [84] =  TOP_inst.U0_DATA_SYNC.enable_pulse_reg.Q ,   // OR = 3;  pos = 84;  Pin Index = 20262;  Pin Name = U0_DATA_SYNC.enable_pulse_reg.Q;  pinInvFromLatch = no;  Latch Index = 6536;  Latch Name = U0_DATA_SYNC.enable_pulse_reg.__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [85] =  TOP_inst.U0_DATA_SYNC.enable_flop_reg.Q ,   // OR = 3;  pos = 85;  Pin Index = 20156;  Pin Name = U0_DATA_SYNC.enable_flop_reg.Q;  pinInvFromLatch = no;  Latch Index = 6501;  Latch Name = U0_DATA_SYNC.enable_flop_reg.__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [86] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1] .Q ,   // OR = 3;  pos = 86;  Pin Index = 17951;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].Q;  pinInvFromLatch = no;  Latch Index = 5787;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [87] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0] .Q ,   // OR = 3;  pos = 87;  Pin Index = 17845;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 5752;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [88] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1] .Q ,   // OR = 3;  pos = 88;  Pin Index = 17739;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 5717;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [89] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0] .Q ,   // OR = 3;  pos = 89;  Pin Index = 17633;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].Q;  pinInvFromLatch = no;  Latch Index = 5682;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [90] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1] .Q ,   // OR = 3;  pos = 90;  Pin Index = 17527;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 5647;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [91] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0] .Q ;   // OR = 3;  pos = 91;  Pin Index = 17421;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0].Q;  pinInvFromLatch = no;  Latch Index = 5612;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   

  assign // OR = 4 
    part_M_OR_4_TM_1 [1] =  TOP_inst.ScanOut_4 ,   // OR = 4;  pos = 1;  Pin Index = 13;  Pin Name = ScanOut_4;  pinInvFromLatch = no;  Latch Index = 13781;  Latch Name = U0_SYS_CTRL.\current_state_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [2] =  TOP_inst.U0_SYS_CTRL.\current_state_reg[2] .Q ,   // OR = 4;  pos = 2;  Pin Index = 42656;  Pin Name = U0_SYS_CTRL.\current_state_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 13746;  Latch Name = U0_SYS_CTRL.\current_state_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [3] =  TOP_inst.U0_SYS_CTRL.\current_state_reg[1] .Q ,   // OR = 4;  pos = 3;  Pin Index = 42550;  Pin Name = U0_SYS_CTRL.\current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 13711;  Latch Name = U0_SYS_CTRL.\current_state_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [4] =  TOP_inst.U0_SYS_CTRL.\current_state_reg[0] .Q ,   // OR = 4;  pos = 4;  Pin Index = 42444;  Pin Name = U0_SYS_CTRL.\current_state_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 13676;  Latch Name = U0_SYS_CTRL.\current_state_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [5] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[15] .Q ,   // OR = 4;  pos = 5;  Pin Index = 41384;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].Q;  pinInvFromLatch = no;  Latch Index = 13326;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [6] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[14] .Q ,   // OR = 4;  pos = 6;  Pin Index = 41278;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].Q;  pinInvFromLatch = no;  Latch Index = 13291;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [7] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[13] .Q ,   // OR = 4;  pos = 7;  Pin Index = 41172;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].Q;  pinInvFromLatch = no;  Latch Index = 13256;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [8] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[12] .Q ,   // OR = 4;  pos = 8;  Pin Index = 41066;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].Q;  pinInvFromLatch = no;  Latch Index = 13221;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [9] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[11] .Q ,   // OR = 4;  pos = 9;  Pin Index = 40960;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].Q;  pinInvFromLatch = no;  Latch Index = 13186;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [10] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[10] .Q ,   // OR = 4;  pos = 10;  Pin Index = 40854;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].Q;  pinInvFromLatch = no;  Latch Index = 13151;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [11] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[9] .Q ,   // OR = 4;  pos = 11;  Pin Index = 42338;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].Q;  pinInvFromLatch = no;  Latch Index = 13641;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [12] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[8] .Q ,   // OR = 4;  pos = 12;  Pin Index = 42232;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].Q;  pinInvFromLatch = no;  Latch Index = 13606;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [13] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[7] .Q ,   // OR = 4;  pos = 13;  Pin Index = 42126;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 13571;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [14] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[6] .Q ,   // OR = 4;  pos = 14;  Pin Index = 42020;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 13536;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [15] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[5] .Q ,   // OR = 4;  pos = 15;  Pin Index = 41914;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 13501;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [16] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[4] .Q ,   // OR = 4;  pos = 16;  Pin Index = 41808;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 13466;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [17] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[3] .Q ,   // OR = 4;  pos = 17;  Pin Index = 41702;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 13431;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [18] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[2] .Q ,   // OR = 4;  pos = 18;  Pin Index = 41596;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 13396;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [19] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[1] .Q ,   // OR = 4;  pos = 19;  Pin Index = 41490;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 13361;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [20] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[0] .Q ,   // OR = 4;  pos = 20;  Pin Index = 40748;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 13116;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [21] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[3] .Q ,   // OR = 4;  pos = 21;  Pin Index = 40642;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 13081;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [22] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[2] .Q ,   // OR = 4;  pos = 22;  Pin Index = 40536;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 13046;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [23] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[1] .Q ,   // OR = 4;  pos = 23;  Pin Index = 40430;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 13011;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [24] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[0] .Q ,   // OR = 4;  pos = 24;  Pin Index = 40324;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 12976;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [25] =  TOP_inst.U0_Register_File.\RdData_reg[7] .Q ,   // OR = 4;  pos = 25;  Pin Index = 36829;  Pin Name = U0_Register_File.\RdData_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 11982;  Latch Name = U0_Register_File.\RdData_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [26] =  TOP_inst.U0_Register_File.\RdData_reg[6] .Q ,   // OR = 4;  pos = 26;  Pin Index = 36723;  Pin Name = U0_Register_File.\RdData_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 11947;  Latch Name = U0_Register_File.\RdData_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [27] =  TOP_inst.U0_Register_File.\RdData_reg[5] .Q ,   // OR = 4;  pos = 27;  Pin Index = 36617;  Pin Name = U0_Register_File.\RdData_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 11912;  Latch Name = U0_Register_File.\RdData_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [28] =  TOP_inst.U0_Register_File.\RdData_reg[4] .Q ,   // OR = 4;  pos = 28;  Pin Index = 36511;  Pin Name = U0_Register_File.\RdData_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 11877;  Latch Name = U0_Register_File.\RdData_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [29] =  TOP_inst.U0_Register_File.\RdData_reg[3] .Q ,   // OR = 4;  pos = 29;  Pin Index = 36405;  Pin Name = U0_Register_File.\RdData_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 11842;  Latch Name = U0_Register_File.\RdData_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [30] =  TOP_inst.U0_Register_File.\RdData_reg[2] .Q ,   // OR = 4;  pos = 30;  Pin Index = 36299;  Pin Name = U0_Register_File.\RdData_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 11807;  Latch Name = U0_Register_File.\RdData_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [31] =  TOP_inst.U0_Register_File.\RdData_reg[1] .Q ,   // OR = 4;  pos = 31;  Pin Index = 36193;  Pin Name = U0_Register_File.\RdData_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 11772;  Latch Name = U0_Register_File.\RdData_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [32] =  TOP_inst.U0_Register_File.\RdData_reg[0] .Q ,   // OR = 4;  pos = 32;  Pin Index = 36087;  Pin Name = U0_Register_File.\RdData_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 11737;  Latch Name = U0_Register_File.\RdData_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [33] =  TOP_inst.U0_Register_File.RdData_Valid_reg.Q ,   // OR = 4;  pos = 33;  Pin Index = 22422;  Pin Name = U0_Register_File.RdData_Valid_reg.Q;  pinInvFromLatch = no;  Latch Index = 7225;  Latch Name = U0_Register_File.RdData_Valid_reg.__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [34] =  TOP_inst.U0_Register_File.\Memory_reg[15][7] .Q ,   // OR = 4;  pos = 34;  Pin Index = 28358;  Pin Name = U0_Register_File.\Memory_reg[15][7].Q;  pinInvFromLatch = no;  Latch Index = 9185;  Latch Name = U0_Register_File.\Memory_reg[15][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [35] =  TOP_inst.U0_Register_File.\Memory_reg[15][6] .Q ,   // OR = 4;  pos = 35;  Pin Index = 28252;  Pin Name = U0_Register_File.\Memory_reg[15][6].Q;  pinInvFromLatch = no;  Latch Index = 9150;  Latch Name = U0_Register_File.\Memory_reg[15][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [36] =  TOP_inst.U0_Register_File.\Memory_reg[15][5] .Q ,   // OR = 4;  pos = 36;  Pin Index = 28146;  Pin Name = U0_Register_File.\Memory_reg[15][5].Q;  pinInvFromLatch = no;  Latch Index = 9115;  Latch Name = U0_Register_File.\Memory_reg[15][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [37] =  TOP_inst.U0_Register_File.\Memory_reg[15][4] .Q ,   // OR = 4;  pos = 37;  Pin Index = 28040;  Pin Name = U0_Register_File.\Memory_reg[15][4].Q;  pinInvFromLatch = no;  Latch Index = 9080;  Latch Name = U0_Register_File.\Memory_reg[15][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [38] =  TOP_inst.U0_Register_File.\Memory_reg[15][3] .Q ,   // OR = 4;  pos = 38;  Pin Index = 27934;  Pin Name = U0_Register_File.\Memory_reg[15][3].Q;  pinInvFromLatch = no;  Latch Index = 9045;  Latch Name = U0_Register_File.\Memory_reg[15][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [39] =  TOP_inst.U0_Register_File.\Memory_reg[15][2] .Q ,   // OR = 4;  pos = 39;  Pin Index = 27828;  Pin Name = U0_Register_File.\Memory_reg[15][2].Q;  pinInvFromLatch = no;  Latch Index = 9010;  Latch Name = U0_Register_File.\Memory_reg[15][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [40] =  TOP_inst.U0_Register_File.\Memory_reg[15][1] .Q ,   // OR = 4;  pos = 40;  Pin Index = 27722;  Pin Name = U0_Register_File.\Memory_reg[15][1].Q;  pinInvFromLatch = no;  Latch Index = 8975;  Latch Name = U0_Register_File.\Memory_reg[15][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [41] =  TOP_inst.U0_Register_File.\Memory_reg[15][0] .Q ,   // OR = 4;  pos = 41;  Pin Index = 27616;  Pin Name = U0_Register_File.\Memory_reg[15][0].Q;  pinInvFromLatch = no;  Latch Index = 8940;  Latch Name = U0_Register_File.\Memory_reg[15][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [42] =  TOP_inst.U0_Register_File.\Memory_reg[14][7] .Q ,   // OR = 4;  pos = 42;  Pin Index = 27510;  Pin Name = U0_Register_File.\Memory_reg[14][7].Q;  pinInvFromLatch = no;  Latch Index = 8905;  Latch Name = U0_Register_File.\Memory_reg[14][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [43] =  TOP_inst.U0_Register_File.\Memory_reg[14][6] .Q ,   // OR = 4;  pos = 43;  Pin Index = 27404;  Pin Name = U0_Register_File.\Memory_reg[14][6].Q;  pinInvFromLatch = no;  Latch Index = 8870;  Latch Name = U0_Register_File.\Memory_reg[14][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [44] =  TOP_inst.U0_Register_File.\Memory_reg[14][5] .Q ,   // OR = 4;  pos = 44;  Pin Index = 27298;  Pin Name = U0_Register_File.\Memory_reg[14][5].Q;  pinInvFromLatch = no;  Latch Index = 8835;  Latch Name = U0_Register_File.\Memory_reg[14][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [45] =  TOP_inst.U0_Register_File.\Memory_reg[14][4] .Q ,   // OR = 4;  pos = 45;  Pin Index = 27192;  Pin Name = U0_Register_File.\Memory_reg[14][4].Q;  pinInvFromLatch = no;  Latch Index = 8800;  Latch Name = U0_Register_File.\Memory_reg[14][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [46] =  TOP_inst.U0_Register_File.\Memory_reg[14][3] .Q ,   // OR = 4;  pos = 46;  Pin Index = 27086;  Pin Name = U0_Register_File.\Memory_reg[14][3].Q;  pinInvFromLatch = no;  Latch Index = 8765;  Latch Name = U0_Register_File.\Memory_reg[14][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [47] =  TOP_inst.U0_Register_File.\Memory_reg[14][2] .Q ,   // OR = 4;  pos = 47;  Pin Index = 26980;  Pin Name = U0_Register_File.\Memory_reg[14][2].Q;  pinInvFromLatch = no;  Latch Index = 8730;  Latch Name = U0_Register_File.\Memory_reg[14][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [48] =  TOP_inst.U0_Register_File.\Memory_reg[14][1] .Q ,   // OR = 4;  pos = 48;  Pin Index = 26874;  Pin Name = U0_Register_File.\Memory_reg[14][1].Q;  pinInvFromLatch = no;  Latch Index = 8695;  Latch Name = U0_Register_File.\Memory_reg[14][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [49] =  TOP_inst.U0_Register_File.\Memory_reg[14][0] .Q ,   // OR = 4;  pos = 49;  Pin Index = 26768;  Pin Name = U0_Register_File.\Memory_reg[14][0].Q;  pinInvFromLatch = no;  Latch Index = 8660;  Latch Name = U0_Register_File.\Memory_reg[14][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [50] =  TOP_inst.U0_Register_File.\Memory_reg[13][7] .Q ,   // OR = 4;  pos = 50;  Pin Index = 26662;  Pin Name = U0_Register_File.\Memory_reg[13][7].Q;  pinInvFromLatch = no;  Latch Index = 8625;  Latch Name = U0_Register_File.\Memory_reg[13][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [51] =  TOP_inst.U0_Register_File.\Memory_reg[13][6] .Q ,   // OR = 4;  pos = 51;  Pin Index = 26556;  Pin Name = U0_Register_File.\Memory_reg[13][6].Q;  pinInvFromLatch = no;  Latch Index = 8590;  Latch Name = U0_Register_File.\Memory_reg[13][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [52] =  TOP_inst.U0_Register_File.\Memory_reg[13][5] .Q ,   // OR = 4;  pos = 52;  Pin Index = 26450;  Pin Name = U0_Register_File.\Memory_reg[13][5].Q;  pinInvFromLatch = no;  Latch Index = 8555;  Latch Name = U0_Register_File.\Memory_reg[13][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [53] =  TOP_inst.U0_Register_File.\Memory_reg[13][4] .Q ,   // OR = 4;  pos = 53;  Pin Index = 26344;  Pin Name = U0_Register_File.\Memory_reg[13][4].Q;  pinInvFromLatch = no;  Latch Index = 8520;  Latch Name = U0_Register_File.\Memory_reg[13][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [54] =  TOP_inst.U0_Register_File.\Memory_reg[13][3] .Q ,   // OR = 4;  pos = 54;  Pin Index = 26238;  Pin Name = U0_Register_File.\Memory_reg[13][3].Q;  pinInvFromLatch = no;  Latch Index = 8485;  Latch Name = U0_Register_File.\Memory_reg[13][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [55] =  TOP_inst.U0_Register_File.\Memory_reg[13][2] .Q ,   // OR = 4;  pos = 55;  Pin Index = 26132;  Pin Name = U0_Register_File.\Memory_reg[13][2].Q;  pinInvFromLatch = no;  Latch Index = 8450;  Latch Name = U0_Register_File.\Memory_reg[13][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [56] =  TOP_inst.U0_Register_File.\Memory_reg[13][1] .Q ,   // OR = 4;  pos = 56;  Pin Index = 26026;  Pin Name = U0_Register_File.\Memory_reg[13][1].Q;  pinInvFromLatch = no;  Latch Index = 8415;  Latch Name = U0_Register_File.\Memory_reg[13][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [57] =  TOP_inst.U0_Register_File.\Memory_reg[13][0] .Q ,   // OR = 4;  pos = 57;  Pin Index = 25920;  Pin Name = U0_Register_File.\Memory_reg[13][0].Q;  pinInvFromLatch = no;  Latch Index = 8380;  Latch Name = U0_Register_File.\Memory_reg[13][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [58] =  TOP_inst.U0_Register_File.\Memory_reg[12][7] .Q ,   // OR = 4;  pos = 58;  Pin Index = 25814;  Pin Name = U0_Register_File.\Memory_reg[12][7].Q;  pinInvFromLatch = no;  Latch Index = 8345;  Latch Name = U0_Register_File.\Memory_reg[12][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [59] =  TOP_inst.U0_Register_File.\Memory_reg[12][6] .Q ,   // OR = 4;  pos = 59;  Pin Index = 25708;  Pin Name = U0_Register_File.\Memory_reg[12][6].Q;  pinInvFromLatch = no;  Latch Index = 8310;  Latch Name = U0_Register_File.\Memory_reg[12][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [60] =  TOP_inst.U0_Register_File.\Memory_reg[12][5] .Q ,   // OR = 4;  pos = 60;  Pin Index = 25602;  Pin Name = U0_Register_File.\Memory_reg[12][5].Q;  pinInvFromLatch = no;  Latch Index = 8275;  Latch Name = U0_Register_File.\Memory_reg[12][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [61] =  TOP_inst.U0_Register_File.\Memory_reg[12][4] .Q ,   // OR = 4;  pos = 61;  Pin Index = 25496;  Pin Name = U0_Register_File.\Memory_reg[12][4].Q;  pinInvFromLatch = no;  Latch Index = 8240;  Latch Name = U0_Register_File.\Memory_reg[12][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [62] =  TOP_inst.U0_Register_File.\Memory_reg[12][3] .Q ,   // OR = 4;  pos = 62;  Pin Index = 25390;  Pin Name = U0_Register_File.\Memory_reg[12][3].Q;  pinInvFromLatch = no;  Latch Index = 8205;  Latch Name = U0_Register_File.\Memory_reg[12][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [63] =  TOP_inst.U0_Register_File.\Memory_reg[12][2] .Q ,   // OR = 4;  pos = 63;  Pin Index = 25284;  Pin Name = U0_Register_File.\Memory_reg[12][2].Q;  pinInvFromLatch = no;  Latch Index = 8170;  Latch Name = U0_Register_File.\Memory_reg[12][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [64] =  TOP_inst.U0_Register_File.\Memory_reg[12][1] .Q ,   // OR = 4;  pos = 64;  Pin Index = 25178;  Pin Name = U0_Register_File.\Memory_reg[12][1].Q;  pinInvFromLatch = no;  Latch Index = 8135;  Latch Name = U0_Register_File.\Memory_reg[12][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [65] =  TOP_inst.U0_Register_File.\Memory_reg[12][0] .Q ,   // OR = 4;  pos = 65;  Pin Index = 25072;  Pin Name = U0_Register_File.\Memory_reg[12][0].Q;  pinInvFromLatch = no;  Latch Index = 8100;  Latch Name = U0_Register_File.\Memory_reg[12][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [66] =  TOP_inst.U0_Register_File.\Memory_reg[11][7] .Q ,   // OR = 4;  pos = 66;  Pin Index = 24966;  Pin Name = U0_Register_File.\Memory_reg[11][7].Q;  pinInvFromLatch = no;  Latch Index = 8065;  Latch Name = U0_Register_File.\Memory_reg[11][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [67] =  TOP_inst.U0_Register_File.\Memory_reg[11][6] .Q ,   // OR = 4;  pos = 67;  Pin Index = 24860;  Pin Name = U0_Register_File.\Memory_reg[11][6].Q;  pinInvFromLatch = no;  Latch Index = 8030;  Latch Name = U0_Register_File.\Memory_reg[11][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [68] =  TOP_inst.U0_Register_File.\Memory_reg[11][5] .Q ,   // OR = 4;  pos = 68;  Pin Index = 24754;  Pin Name = U0_Register_File.\Memory_reg[11][5].Q;  pinInvFromLatch = no;  Latch Index = 7995;  Latch Name = U0_Register_File.\Memory_reg[11][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [69] =  TOP_inst.U0_Register_File.\Memory_reg[11][4] .Q ,   // OR = 4;  pos = 69;  Pin Index = 24648;  Pin Name = U0_Register_File.\Memory_reg[11][4].Q;  pinInvFromLatch = no;  Latch Index = 7960;  Latch Name = U0_Register_File.\Memory_reg[11][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [70] =  TOP_inst.U0_Register_File.\Memory_reg[11][3] .Q ,   // OR = 4;  pos = 70;  Pin Index = 24542;  Pin Name = U0_Register_File.\Memory_reg[11][3].Q;  pinInvFromLatch = no;  Latch Index = 7925;  Latch Name = U0_Register_File.\Memory_reg[11][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [71] =  TOP_inst.U0_Register_File.\Memory_reg[11][2] .Q ,   // OR = 4;  pos = 71;  Pin Index = 24436;  Pin Name = U0_Register_File.\Memory_reg[11][2].Q;  pinInvFromLatch = no;  Latch Index = 7890;  Latch Name = U0_Register_File.\Memory_reg[11][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [72] =  TOP_inst.U0_Register_File.\Memory_reg[11][1] .Q ,   // OR = 4;  pos = 72;  Pin Index = 24330;  Pin Name = U0_Register_File.\Memory_reg[11][1].Q;  pinInvFromLatch = no;  Latch Index = 7855;  Latch Name = U0_Register_File.\Memory_reg[11][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [73] =  TOP_inst.U0_Register_File.\Memory_reg[11][0] .Q ,   // OR = 4;  pos = 73;  Pin Index = 24224;  Pin Name = U0_Register_File.\Memory_reg[11][0].Q;  pinInvFromLatch = no;  Latch Index = 7820;  Latch Name = U0_Register_File.\Memory_reg[11][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [74] =  TOP_inst.U0_Register_File.\Memory_reg[10][7] .Q ,   // OR = 4;  pos = 74;  Pin Index = 24118;  Pin Name = U0_Register_File.\Memory_reg[10][7].Q;  pinInvFromLatch = no;  Latch Index = 7785;  Latch Name = U0_Register_File.\Memory_reg[10][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [75] =  TOP_inst.U0_Register_File.\Memory_reg[10][6] .Q ,   // OR = 4;  pos = 75;  Pin Index = 24012;  Pin Name = U0_Register_File.\Memory_reg[10][6].Q;  pinInvFromLatch = no;  Latch Index = 7750;  Latch Name = U0_Register_File.\Memory_reg[10][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [76] =  TOP_inst.U0_Register_File.\Memory_reg[10][5] .Q ,   // OR = 4;  pos = 76;  Pin Index = 23906;  Pin Name = U0_Register_File.\Memory_reg[10][5].Q;  pinInvFromLatch = no;  Latch Index = 7715;  Latch Name = U0_Register_File.\Memory_reg[10][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [77] =  TOP_inst.U0_Register_File.\Memory_reg[10][4] .Q ,   // OR = 4;  pos = 77;  Pin Index = 23800;  Pin Name = U0_Register_File.\Memory_reg[10][4].Q;  pinInvFromLatch = no;  Latch Index = 7680;  Latch Name = U0_Register_File.\Memory_reg[10][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [78] =  TOP_inst.U0_Register_File.\Memory_reg[10][3] .Q ,   // OR = 4;  pos = 78;  Pin Index = 23694;  Pin Name = U0_Register_File.\Memory_reg[10][3].Q;  pinInvFromLatch = no;  Latch Index = 7645;  Latch Name = U0_Register_File.\Memory_reg[10][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [79] =  TOP_inst.U0_Register_File.\Memory_reg[10][2] .Q ,   // OR = 4;  pos = 79;  Pin Index = 23588;  Pin Name = U0_Register_File.\Memory_reg[10][2].Q;  pinInvFromLatch = no;  Latch Index = 7610;  Latch Name = U0_Register_File.\Memory_reg[10][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [80] =  TOP_inst.U0_Register_File.\Memory_reg[10][1] .Q ,   // OR = 4;  pos = 80;  Pin Index = 23482;  Pin Name = U0_Register_File.\Memory_reg[10][1].Q;  pinInvFromLatch = no;  Latch Index = 7575;  Latch Name = U0_Register_File.\Memory_reg[10][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [81] =  TOP_inst.U0_Register_File.\Memory_reg[10][0] .Q ,   // OR = 4;  pos = 81;  Pin Index = 23376;  Pin Name = U0_Register_File.\Memory_reg[10][0].Q;  pinInvFromLatch = no;  Latch Index = 7540;  Latch Name = U0_Register_File.\Memory_reg[10][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [82] =  TOP_inst.U0_Register_File.\Memory_reg[9][7] .Q ,   // OR = 4;  pos = 82;  Pin Index = 35981;  Pin Name = U0_Register_File.\Memory_reg[9][7].Q;  pinInvFromLatch = no;  Latch Index = 11702;  Latch Name = U0_Register_File.\Memory_reg[9][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [83] =  TOP_inst.U0_Register_File.\Memory_reg[9][6] .Q ,   // OR = 4;  pos = 83;  Pin Index = 35875;  Pin Name = U0_Register_File.\Memory_reg[9][6].Q;  pinInvFromLatch = no;  Latch Index = 11667;  Latch Name = U0_Register_File.\Memory_reg[9][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [84] =  TOP_inst.U0_Register_File.\Memory_reg[9][5] .Q ,   // OR = 4;  pos = 84;  Pin Index = 35769;  Pin Name = U0_Register_File.\Memory_reg[9][5].Q;  pinInvFromLatch = no;  Latch Index = 11632;  Latch Name = U0_Register_File.\Memory_reg[9][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [85] =  TOP_inst.U0_Register_File.\Memory_reg[9][4] .Q ,   // OR = 4;  pos = 85;  Pin Index = 35663;  Pin Name = U0_Register_File.\Memory_reg[9][4].Q;  pinInvFromLatch = no;  Latch Index = 11597;  Latch Name = U0_Register_File.\Memory_reg[9][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [86] =  TOP_inst.U0_Register_File.\Memory_reg[9][3] .Q ,   // OR = 4;  pos = 86;  Pin Index = 35557;  Pin Name = U0_Register_File.\Memory_reg[9][3].Q;  pinInvFromLatch = no;  Latch Index = 11562;  Latch Name = U0_Register_File.\Memory_reg[9][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [87] =  TOP_inst.U0_Register_File.\Memory_reg[9][2] .Q ,   // OR = 4;  pos = 87;  Pin Index = 35451;  Pin Name = U0_Register_File.\Memory_reg[9][2].Q;  pinInvFromLatch = no;  Latch Index = 11527;  Latch Name = U0_Register_File.\Memory_reg[9][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [88] =  TOP_inst.U0_Register_File.\Memory_reg[9][1] .Q ,   // OR = 4;  pos = 88;  Pin Index = 35345;  Pin Name = U0_Register_File.\Memory_reg[9][1].Q;  pinInvFromLatch = no;  Latch Index = 11492;  Latch Name = U0_Register_File.\Memory_reg[9][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [89] =  TOP_inst.U0_Register_File.\Memory_reg[9][0] .Q ,   // OR = 4;  pos = 89;  Pin Index = 35239;  Pin Name = U0_Register_File.\Memory_reg[9][0].Q;  pinInvFromLatch = no;  Latch Index = 11457;  Latch Name = U0_Register_File.\Memory_reg[9][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [90] =  TOP_inst.U0_Register_File.\Memory_reg[8][7] .Q ;   // OR = 4;  pos = 90;  Pin Index = 35133;  Pin Name = U0_Register_File.\Memory_reg[8][7].Q;  pinInvFromLatch = no;  Latch Index = 11422;  Latch Name = U0_Register_File.\Memory_reg[8][7].__iNsT2.dff_primitive;   

//***************************************************************************//
//                     OPEN THE FILE AND RUN SIMULATION                      //
//***************************************************************************//

  initial 
    begin 

      $timeformat ( -12, 2, " ps", 10 ); 

      `ifdef sdf_annotate 
        `ifdef SDF_Minimum 
          $sdf_annotate ("default.sdf",TOP_inst,,"sdf_Min.log","MINIMUM");
        `endif 
        `ifdef SDF_Maximum 
          $sdf_annotate ("default.sdf",TOP_inst,,"sdf_Max.log","MAXIMUM");
        `endif 
        `ifdef SDF_Typical
          $sdf_annotate ("default.sdf",TOP_inst,,"sdf_Typ.log","TYPICAL");
        `endif 
      `endif 

      `ifndef NOT_NC 
        if ( $test$plusargs ( "simvision" ) )  begin 
          $shm_open("simvision.shm"); 
          $shm_probe("AC"); 
        end  
      `endif 

      if ( $test$plusargs ( "vcd" ) )  begin 
        $dumpfile("out.vcd"); 
        $dumpvars(0,ATPG_FULLSCAN_TOP_atpg ); 
      end  

      DATAFILE = 0; 
      sim_setup; 

      `ifdef MISCOMPAREDEBUG 
        diag_debug = 1'b0; 
        if ( $value$plusargs ( "MISCOMPAREDEBUGFILE=%s", DIAG_DEBUG_FILE )) begin 
          DIAG_DATAID = $fopen ( DIAG_DEBUG_FILE, "r" ); 
          if ( DIAG_DATAID ) begin 
            diag_debug = 1'b1; 
            $fclose ( DIAG_DATAID ); 
          end  
          else $display ( "\nERROR (TVE-951): Failed to open the file: Diagnostic 'MISCOMPAREDEBUGFILE' %0s. \n", DIAG_DEBUG_FILE ); 
        end  
      `endif  

      num_files = 0; 
      for ( TID = 1; TID <= 99; TID = TID + 1 ) begin 
        $sformat ( TESTFILE, "TESTFILE%0d=%s", TID, "%s" ); 
        if ( $value$plusargs ( TESTFILE, DATAFILE )) begin 
          DATAID = $fopen ( DATAFILE, "r" ); 
          if ( DATAID )  begin 
            sim_vector_file; 
            num_files = num_files + 1; 
          end  
          else $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", DATAFILE ); 
        end  
      end  

      if ( FAILSETID )  $fclose ( FAILSETID ); 

      if ( DATAFILE )  begin
        $display ( "\nINFO (TVE-209): Cumulative Results: " ); 
        $display ( "                      Number of Files Simulated:        %0d ", num_files ); 
        $display ( "                      Total Number of Cycles:           %0d ", total_cycles ); 
        $display ( "                      Total Number of Tests:            %0d ", total_num_tests ); 
        $display ( "                        - Total Passed Tests:           %0d ", total_num_tests - total_num_failed_tests ); 
        $display ( "                        - Total Failed Tests:           %0d ", total_num_failed_tests ); 
        $display ( "                      Total Number of Compares:         %0.0f ", total_good_compares + total_miscompares ); 
        $display ( "                        - Total Good Compares:          %0.0f ", total_good_compares ); 
        $display ( "                        - Total Miscompares:            %0.0f \n", total_miscompares ); 
      end  
      else $display ( "\nWARNING (TVE-661): No input data files found. The data file must be specified using +TESTFILE1=<string>, +TESTFILE2=<string>, ... The +TESTFILEn=<string> keyword is an NC-Sim command. \n" ); 

      $finish; 

    end  

//***************************************************************************//
//                     DEFINE SIMULATION SETUP PROCEDURE                     //
//***************************************************************************//

  task sim_setup; 
    begin 

      total_good_compares = 0; 
      total_miscompares = 0; 
      miscompare_limit = 0; 
      total_num_tests = 0; 
      total_num_failed_tests = 0; 
      total_cycles = 0; 
      SOD = ""; 
      EOD = ""; 
      START = 0; 
      NUM_SHIFTS = 0; 
      MAX = 1; 

      sim_heart = 1'b0; 
      sim_range = 1'b1; 
      sim_range_measure = 1'b1; 
      sim_trace = 1'b0; 
      sim_debug = 1'b0; 
      sim_more_debug = 1'b0; 

      global_term = 1'bZ; 

      failset = 1'b0; 
      FAILSETID = 0; 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      count_cycles = 1'b1; 
      SEQNUM = 0; 
      name_POs [1] = "ScanOut_1";      // pinName = ScanOut_1;  tf =  SO  ; 
      name_POs [2] = "ScanOut_2";      // pinName = ScanOut_2;  tf =  SO1 ; 
      name_POs [3] = "ScanOut_3";      // pinName = ScanOut_3;  tf =  SO2 ; 
      name_POs [4] = "ScanOut_4";      // pinName = ScanOut_4;  tf =  SO3 ; 
      name_POs [5] = "UART_TX_O";      // pinName = UART_TX_O; 
      name_POs [6] = "framing_error";      // pinName = framing_error; 
      name_POs [7] = "parity_error";      // pinName = parity_error; 



      if ( $test$plusargs ( "MODUS_DEBUG" ) )  sim_trace = 1'b1; 

      if ( $test$plusargs ( "HEARTBEAT" ) )  sim_heart = 1'b1; 

      if ( $value$plusargs ( "START_RANGE=%s", SOD ) )  sim_range = 1'b0; 
      if ( $value$plusargs ( "START_RANGE=%s", SOD ) ) sim_range_measure = 1'b0;

      if ( $value$plusargs ( "END_RANGE=%s", EOD ) ); 

      if ( $value$plusargs ( "miscompare_limit=%0f", miscompare_limit ) ); 

      if ( $test$plusargs ( "FAILSET" ) )  failset = 1'b1; 

      stim_PIs = {10{1'bX}};   
      stim_CIs = 10'b0XXXXXXX0X; 
      meas_POs = {7{1'bX}};   
      stim_CR_1 = {91{1'b0}};   stim_CR_2 = {91{1'b0}};   stim_CR_3 = {91{1'b0}};   stim_CR_4 = {91{1'b0}};   
      part_S_CR_1_TM_1 = {91{1'bZ}};   part_S_CR_2_TM_1 = {89{1'bZ}};   part_S_CR_3_TM_1 = {91{1'bZ}};   part_S_CR_4_TM_1 = {90{1'bZ}};   
      meas_OR_1 = {91{1'bX}};   meas_OR_2 = {91{1'bX}};   meas_OR_3 = {91{1'bX}};   meas_OR_4 = {91{1'bX}};   

    end  
  endtask  

//***************************************************************************//
//                          FAILSET SETUP PROCEDURE                          //
//***************************************************************************//

  task failset_setup; 
    begin 

      $sformat ( FAILSET, "%0s_FAILSET", DATAFILE ); 
      FAILSETID = $fopen ( FAILSET, "w" ); 
      if ( ! FAILSETID ) 
        $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", FAILSET ); 

    end  
  endtask 

//***************************************************************************//
//                           SET UP FOR SIMULATION                           //
//***************************************************************************//

  task sim_vector_file; 
    begin 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      good_compares = 0; 
      miscompares = 0; 
      measure_current = 0; 
      test_num = 0; 
      test_num_prev = 0; 
      failed_test_num = 0; 
      num_tests = 0; 
      num_failed_tests = 0; 
      scan_num = 0; 
      overlap = 0; 
      repeat_depth = 0; 
      repeat_heart = 1000; 


      $display ( "\nINFO (TVE-200): Simulating vector file: %0s ", DATAFILE ); 

      $display ( "\nINFO (TVE-189): Design:  TOP   Test Mode:  FULLSCAN   InExperiment:  TOP_atpg " ); 
      start_of_current_line = $ftell ( DATAID ); 
      line_number = 1; 
      rc_read = $fscanf ( DATAID, "%d", CMD ); 
      while ( rc_read > 0 ) begin 

        cmd_code; 

        if ( rc_read > 0 )  begin 
          if ( sim_range )  begin 
            if (( miscompare_limit > 0 ) & ( miscompares > miscompare_limit ))  begin 
              sim_range = 1'b0; 
              if ( overlap )  num_tests = num_tests - 1; 
              $display ( "\nINFO (TVE-207): The miscompare limit (+miscompare_limit) of %0.0f has been reached. ", miscompare_limit ); 
            end  
            if ( EOD == pattern )  begin 
              sim_range = 1'b0; 
            end  
          end  
          start_of_current_line = $ftell ( DATAID ); 
          rc_read = $fscanf ( DATAID, "%d", CMD ); 
          if ( rc_read <= 0 )  begin 
            rc_read = $fgets ( COMMENT, DATAID ); 
            if ( rc_read > 0 )  bad_cmd_code; 
            else  line_number = 0; 
          end  
        end  
      end  

      if ( line_number == 0 )  begin
        $display ( "\nINFO (TVE-201): Simulation complete on vector file: %0s ", DATAFILE ); 
        $display ( "\nINFO (TVE-210): Results for vector file: %0s ", DATAFILE ); 
        $display ( "                      Number of Cycles:               %0d ", CYCLE ); 
        $display ( "                      Number of Tests:                %0d ", num_tests ); 
        $display ( "                        - Passed Tests:               %0d ", num_tests - num_failed_tests ); 
        $display ( "                        - Failed Tests:               %0d ", num_failed_tests ); 
        $display ( "                      Number of Compares:             %0.0f ", good_compares + miscompares ); 
        $display ( "                        - Good Compares:              %0.0f ", good_compares ); 
        $display ( "                        - Miscompares:                %0.0f ", miscompares ); 
        $display ( "                      Time:                       %t \n", $time ); 
      end  

      $fclose ( DATAID ); 

      total_good_compares = total_good_compares + good_compares; 

      total_miscompares = total_miscompares + miscompares; 

      total_num_tests = total_num_tests + num_tests; 

      total_num_failed_tests = total_num_failed_tests + num_failed_tests; 

      total_cycles = total_cycles + CYCLE; 

    end  
  endtask  

//***************************************************************************//
//                           DEFINE TEST PROCEDURE                           //
//***************************************************************************//

  task test_cycle; 
    begin 

      CYCLE = CYCLE + 1; 
      SERIALCYCLE = SERIALCYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_PIs [2] = stim_PIs [2];      // pinName = RST_N;  tf = -SC  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [3] = stim_PIs [3];      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [4] = stim_PIs [4];      // pinName = ScanIn_1;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [5] = stim_PIs [5];      // pinName = ScanIn_2;  tf =  SI1 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [6] = stim_PIs [6];      // pinName = ScanIn_3;  tf =  SI2 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [7] = stim_PIs [7];      // pinName = ScanIn_4;  tf =  SI3 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [8] = stim_PIs [8];      // pinName = TestMode;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [10] = stim_PIs [10];      // pinName = UART_RX_IN; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_PIs [1];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [9] = stim_PIs [9];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_CIs [1];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [9] = stim_CIs [9];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 72.000000 ns;  From the start of the cycle.

      for ( POnum = 1; POnum <= 7; POnum = POnum + 1 ) begin 
        if (( part_POs [ POnum ] !== meas_POs [ POnum ] ) & ( meas_POs [ POnum ] !== 1'bX )) begin 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-650): PO miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   On PO: %0s   ", meas_POs [ POnum ], part_POs [ POnum ], name_POs [ POnum ] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [ POnum ], PATTERN, -1, part_POs [ POnum ] ); 
          end  
        end  
        else if ( meas_POs [ POnum ] !== 1'bX )  good_compares = good_compares + 1; 
      end  
     #8.000000;        // 80.000000 ns;  From the start of the cycle.
      meas_POs = {7{1'bX}}; 

    end  
  endtask  

//***************************************************************************//
//                       DEFINE SCAN PRECOND PROCEDURE                       //
//***************************************************************************//

  task Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
    begin 

      PROCESSNAME = "SCAN PRECONDITIONING (Scan_Preconditioning_Sequence)";
      stim_PIs [3] = 1'b1;      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  

      test_cycle; 
      PROCESSNAME = "";
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                      DEFINE SCAN SEQUENCE PROCEDURE                       //
//***************************************************************************//

  task Scan_Sequence_TM_1_SEQ_2_SOP_1; 
    begin 

      PROCESSNAME = "SCAN SEQUENCE (Scan_Sequence)";
      if (sim_range ) sim_range_measure = 1'b1 ;
      if ( overlap )  test_num = test_num - 1; 
      SERIALCYCLE = SERIALCYCLE + MAX; 
      CYCLE = CYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.

      for ( SCANCYCLE = 1; SCANCYCLE <= MAX; SCANCYCLE = SCANCYCLE + 1 ) begin 

        if (( part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_1 [ 0 + SCANCYCLE ] ) & ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_1;  tf =  SO  ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 1;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_1 [ 0 + SCANCYCLE ], part_M_OR_1_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [1] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [1], PATTERN, SCANCYCLE, part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_2_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_2 [ 0 + SCANCYCLE ] ) & ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_2;  tf =  SO1 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 2;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_2 [ 0 + SCANCYCLE ], part_M_OR_2_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [2] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [2], PATTERN, SCANCYCLE, part_M_OR_2_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_3_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_3 [ 0 + SCANCYCLE ] ) & ( meas_OR_3 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_3;  tf =  SO2 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 3;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_3 [ 0 + SCANCYCLE ], part_M_OR_3_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [3] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [3], PATTERN, SCANCYCLE, part_M_OR_3_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_3 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_4_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_4 [ 0 + SCANCYCLE ] ) & ( meas_OR_4 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_4;  tf =  SO3 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 4;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_4 [ 0 + SCANCYCLE ], part_M_OR_4_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [4] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [4], PATTERN, SCANCYCLE, part_M_OR_4_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_4 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 
      end  
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 [1:91] = stim_CR_1 [1:91]; 
      part_S_CR_2_TM_1 [1:89] = stim_CR_2 [3:91]; 
      part_S_CR_3_TM_1 [1:91] = stim_CR_3 [1:91]; 
      part_S_CR_4_TM_1 [1:90] = stim_CR_4 [2:91]; 
     #16.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [1] = 1'b1;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [9] = 1'b1;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
      part_PIs [1] = 1'b0;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [9] = 1'b0;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 = {91{1'bZ}};   part_S_CR_2_TM_1 = {89{1'bZ}};   part_S_CR_3_TM_1 = {91{1'bZ}};   part_S_CR_4_TM_1 = {90{1'bZ}};   
     #0; 
      meas_OR_1 = {91{1'bX}};   meas_OR_2 = {91{1'bX}};   meas_OR_3 = {91{1'bX}};   meas_OR_4 = {91{1'bX}};   
      stim_CR_1 = {91{1'b0}};   stim_CR_2 = {91{1'b0}};   stim_CR_3 = {91{1'b0}};   stim_CR_4 = {91{1'b0}};   
      stim_PIs = part_PIs; 
      SCANCYCLE = 0; 
      NUM_SHIFTS = 0; 
      if ( overlap )  test_num = test_num + 1; 
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                 READ COMMANDS AND DATA AND RUN SIMULATION                 //
//***************************************************************************//

  task cmd_code; 
    begin 

      if ( sim_trace )  $display ( "\nCommand code:  %0d ", CMD ); 

      case ( CMD ) 

        000: begin 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

        100: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        104: begin 
          rc_read = $fgets ( PROCESSNAME, DATAID ); 
          if ( rc_read > 0 )  begin 
            if ( $value$plusargs ( "START_RANGE=%s", SOD ) ) begin
              if( sim_range == 1'b0 && PROCESSNAME == 4096'b100000010011010100111101000100010001010100100101001110010010010101010000001010) begin // PROCESSNAME == MODEINIT in ASCII
                sim_range = 1'b1 ;
              end
              if( sim_range==1'b1 && PROCESSNAME == 4096'b1000000010000000001010) begin // PROCESSNAME == '' in ASCII 
                sim_range = 1'b0 ;
              end
            end
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, PROCESSNAME ); 
          end  
          line_number = line_number + 1; 
        end  

        110: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
            $display ( "\n %0s ", COMMENT ); 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        151: begin 
          test_num_prev = test_num; 
          rc_read = $fscanf ( DATAID, "%d", test_num ); 
          if ( rc_read > 0 )  begin 
            if (( test_num != test_num_prev ) && ( test_num != 0 ) && ( sim_range ))  num_tests = num_tests + 1; 
          end  
          else  bad_cmd_code; 

          rc_read = $fscanf ( DATAID, "%d", scan_num ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 

          rc_read = $fscanf ( DATAID, "%d", overlap ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 

          line_number = line_number + 1; 
        end  

        200: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_PIs [1:10] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        201: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_CIs [1:10] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        202: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", meas_POs [1:7] ); 
            if (sim_range_measure == 1'b0 ) meas_POs = 'bx;
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        203: begin 
          rc_read = $fscanf ( DATAID, "%b", global_term ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        300: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_1 [1:91] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_2 [3:91] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    3: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_3 [1:91] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    4: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_4 [2:91] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        301: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_1 [1:91] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_1 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_2 [1:89] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_2 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    3: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_3 [1:91] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_3 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    4: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_4 [1:90] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_4 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        400: begin 
          if ( sim_range )  test_cycle; 
          line_number = line_number + 1; 
        end  

        500: begin 
          repeat_depth = repeat_depth + 1; 
          rc_read = $fscanf ( DATAID, "%d", num_repeats [repeat_depth] ); 
          if ( rc_read > 0 )  begin 
            start_of_repeat[repeat_depth] = $ftell ( DATAID ); 
          end  
          else  bad_cmd_code; 
          if ((sim_range & sim_heart) && repeat_heart) 
            $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d.  Start of %0d cycles of a repeat loop.", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests, num_repeats [repeat_depth] ); 
          line_number = line_number + 1; 
        end  

        501: begin 
          num_repeats [repeat_depth] = num_repeats [repeat_depth] - 1; 
          if ( num_repeats [repeat_depth] )  begin 
            if ((sim_range & sim_heart) && repeat_heart && (num_repeats [repeat_depth] % repeat_heart == 0 )) 
              $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d.  Number of cycles remaining in this repeat loop is %0d.", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests, num_repeats [repeat_depth] ); 
            rc_read = $fseek ( DATAID, start_of_repeat [repeat_depth], 0 ); 
            rc_read = 1; 
            fseek_offset = $ftell ( DATAID ); 
            if ( fseek_offset != start_of_repeat [repeat_depth] )  begin 
              $display ( "\nERROR (TVE-956): A Verilog simulator limitation in the fseek routine has been reached.  The size of the Verilog Data file is so big that it can not support branching using fseek in the Verilog simulator.  Any branching after 9,223,372,036,854,775,807 (0x7fffffffffffffff) bytes of data will not run correctly under the Verilog simulator.  It is recommended that you break up the Verilog Data file using the keyword maxvectorsperfile.  The Verilog Data file:  %0s  \n", DATAFILE ); 
              rc_read = 0;  // This will stop execution 
            end  
          end  
          else  repeat_depth = repeat_depth - 1; 
          line_number = line_number + 1; 
        end  

        600: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SEQNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SEQNUM ) 

                    1: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                    2: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Sequence_TM_1_SEQ_2_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                  endcase  
                end  
              end 

            endcase  
          end  
        end  

        900: begin 
          rc_read = $fscanf ( DATAID, "%s", pattern ); 
          if ( rc_read > 0 )  begin 
            if ( SOD == pattern )  begin 
              sim_range = 1'b1; 
            end  
            if (( sim_range ) & ( scan_num > 0 ))  begin 
              if ( sim_heart > 0 )  begin 
                if ( overlap )  $display ( "\nINFO (TVE-211): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Relative Scan: %0d  Overlap Tests %0d and %0d.  Tests Passed %0d of %0d, Failed %0d. ", test_num - 1, pattern, CYCLE + 1, $time, scan_num, test_num - 1, test_num, num_tests - num_failed_tests - 1, num_tests - 1, num_failed_tests ); 
                else  $display ( "\nINFO (TVE-211): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Relative Scan: %0d  Tests Passed %0d of %0d, Failed %0d. ", test_num, pattern, CYCLE + 1, $time, scan_num, num_tests - num_failed_tests, num_tests, num_failed_tests ); 
              end  
              scan_num = 0; 
            end  
            else if ( sim_range & sim_heart )  begin 
              $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d. ", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests ); 
            end  
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        901: begin 
          rc_read = $fscanf ( DATAID, "%s", PATTERN ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        903: begin 
          measure_current = measure_current + 1; 
          line_number = line_number + 1; 
        end  

        904: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "TOP_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        905: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "TOP_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  


        default: begin 
          bad_cmd_code; 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

      endcase  

    end  
  endtask  

//***************************************************************************//
//                          PRINT BAD CMD CODE DATA                          //
//***************************************************************************//

  task bad_cmd_code; 
    begin 

      $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
      start_of_current_line = $ftell ( DATAID ); 
      rc_read = $fgets ( COMMENT, DATAID ); 
      $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
      rc_read = 0;  // This will stop execution 

    end  
  endtask  

  endmodule 
