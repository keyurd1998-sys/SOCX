//***************************************************************************//
//                           VERILOG MAINSIM FILE                            //
// Modus(TM) DFT Software Solution, Version 25.10-p027_1, built Mar 13 2025  //
//***************************************************************************//
//                                                                           //
//  FILE CREATED..............July 04, 2026 at 14:14:15                      //
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
//  "UART_CLK" (PI # 25)                                                     //
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

  reg [1:26] stim_PIs;   
  reg [1:26] part_PIs;   

  reg [1:26] stim_CIs;   

  reg [1:23] meas_POs;   

  reg [1:23] scan_POs;   
  wire [1:23] part_POs;   

//***************************************************************************//
//                   DEFINE VARIABLES FOR ALL SHIFT CHAINS                   //
//***************************************************************************//

  reg [1:20] stim_CR_1;   reg [1:20] stim_CR_2;   reg [1:20] stim_CR_3;   reg [1:20] stim_CR_4;   reg [1:20] stim_CR_5;   reg [1:20] stim_CR_6;   reg [1:20] stim_CR_7;   reg [1:20] stim_CR_8;   reg [1:20] stim_CR_9;   reg [1:20] stim_CR_10;   reg [1:20] stim_CR_11;   reg [1:20] stim_CR_12;   reg [1:20] stim_CR_13;   reg [1:20] stim_CR_14;   reg [1:20] stim_CR_15;   reg [1:20] stim_CR_16;   reg [1:20] stim_CR_17;   reg [1:20] stim_CR_18;   reg [1:20] stim_CR_19;   reg [1:20] stim_CR_20;   

  reg [1:20] meas_OR_1;   reg [1:20] meas_OR_2;   reg [1:20] meas_OR_3;   reg [1:20] meas_OR_4;   reg [1:20] meas_OR_5;   reg [1:20] meas_OR_6;   reg [1:20] meas_OR_7;   reg [1:20] meas_OR_8;   reg [1:20] meas_OR_9;   reg [1:20] meas_OR_10;   reg [1:20] meas_OR_11;   reg [1:20] meas_OR_12;   reg [1:20] meas_OR_13;   reg [1:20] meas_OR_14;   reg [1:20] meas_OR_15;   reg [1:20] meas_OR_16;   reg [1:20] meas_OR_17;   reg [1:20] meas_OR_18;   reg [1:20] meas_OR_19;   reg [1:20] meas_OR_20;   

  reg [1:20] part_S_CR_1_TM_1;   reg [1:18] part_S_CR_2_TM_1;   reg [1:20] part_S_CR_3_TM_1;   reg [1:20] part_S_CR_4_TM_1;   reg [1:18] part_S_CR_5_TM_1;   reg [1:20] part_S_CR_6_TM_1;   reg [1:20] part_S_CR_7_TM_1;   reg [1:20] part_S_CR_8_TM_1;   reg [1:18] part_S_CR_9_TM_1;   reg [1:20] part_S_CR_10_TM_1;   reg [1:19] part_S_CR_11_TM_1;   reg [1:19] part_S_CR_12_TM_1;   reg [1:17] part_S_CR_13_TM_1;   reg [1:19] part_S_CR_14_TM_1;   reg [1:19] part_S_CR_15_TM_1;   reg [1:17] part_S_CR_16_TM_1;   reg [1:19] part_S_CR_17_TM_1;   reg [1:19] part_S_CR_18_TM_1;   reg [1:19] part_S_CR_19_TM_1;   reg [1:17] part_S_CR_20_TM_1;   

  wire [1:20] part_M_OR_1_TM_1;   wire [1:18] part_M_OR_2_TM_1;   wire [1:20] part_M_OR_3_TM_1;   wire [1:20] part_M_OR_4_TM_1;   wire [1:18] part_M_OR_5_TM_1;   wire [1:20] part_M_OR_6_TM_1;   wire [1:20] part_M_OR_7_TM_1;   wire [1:20] part_M_OR_8_TM_1;   wire [1:18] part_M_OR_9_TM_1;   wire [1:20] part_M_OR_10_TM_1;   wire [1:19] part_M_OR_11_TM_1;   wire [1:19] part_M_OR_12_TM_1;   wire [1:17] part_M_OR_13_TM_1;   wire [1:19] part_M_OR_14_TM_1;   wire [1:19] part_M_OR_15_TM_1;   wire [1:17] part_M_OR_16_TM_1;   wire [1:19] part_M_OR_17_TM_1;   wire [1:19] part_M_OR_18_TM_1;   wire [1:19] part_M_OR_19_TM_1;   wire [1:17] part_M_OR_20_TM_1;   


//***************************************************************************//
//                             OTHER DEFINITIONS                             //
//***************************************************************************//

  integer  CYCLE, SCANCYCLE, SERIALCYCLE, PInum, POnum, ORnum, MODENUM, EXPNUM, SCANOPNUM, SEQNUM, TASKNUM, START, NUM_SHIFTS, MultiShift, maxMultiShifts, MultiShiftsLeft, forcePointStart, forcePoint, SCANNUM, FREQNUM ; 
  integer  CMD, DATAID, SAVEID, TID, num_files, rc_read, repeat_depth, repeat_heart, MAX, FAILSETID, DIAG_DATAID; 
  integer  test_num, test_num_prev, failed_test_num, num_tests, num_failed_tests, total_num_tests, total_num_failed_tests, total_cycles, scan_num, overlap; 
  integer  repeat_num  [1:15]; 
  integer  num_repeats [1:15]; 
  reg      [1:8185] name_POs [1:23]; 
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
      .UART_CLK      ( part_PIs[025] ),      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .REF_CLK       ( part_PIs[001] ),      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .UART_RX_IN    ( part_PIs[026] ),      // pinName = UART_RX_IN; testOffset = 0.000000;  scanOffset = 0.000000;  
      .UART_TX_O     ( part_POs[021] ),      // pinName = UART_TX_O; 
      .parity_error  ( part_POs[023] ),      // pinName = parity_error; 
      .framing_error ( part_POs[022] ),      // pinName = framing_error; 
      .ScanEnable    ( part_PIs[003] ),      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .TestMode      ( part_PIs[024] ),      // pinName = TestMode;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanIn_1      ( part_PIs[004] ),      // pinName = ScanIn_1;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_1     ( part_POs[001] ),      // pinName = ScanOut_1;  tf =  SO  ; 
      .ScanIn_2      ( part_PIs[015] ),      // pinName = ScanIn_2;  tf =  SI1 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_2     ( part_POs[012] ),      // pinName = ScanOut_2;  tf =  SO1 ; 
      .ScanIn_3      ( part_PIs[017] ),      // pinName = ScanIn_3;  tf =  SI2 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_3     ( part_POs[014] ),      // pinName = ScanOut_3;  tf =  SO2 ; 
      .ScanIn_4      ( part_PIs[018] ),      // pinName = ScanIn_4;  tf =  SI3 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_4     ( part_POs[015] ),      // pinName = ScanOut_4;  tf =  SO3 ; 
      .ScanIn_5      ( part_PIs[019] ),      // pinName = ScanIn_5;  tf =  SI4 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_5     ( part_POs[016] ),      // pinName = ScanOut_5;  tf =  SO4 ; 
      .ScanIn_6      ( part_PIs[020] ),      // pinName = ScanIn_6;  tf =  SI5 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_6     ( part_POs[017] ),      // pinName = ScanOut_6;  tf =  SO5 ; 
      .ScanIn_7      ( part_PIs[021] ),      // pinName = ScanIn_7;  tf =  SI6 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_7     ( part_POs[018] ),      // pinName = ScanOut_7;  tf =  SO6 ; 
      .ScanIn_8      ( part_PIs[022] ),      // pinName = ScanIn_8;  tf =  SI7 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_8     ( part_POs[019] ),      // pinName = ScanOut_8;  tf =  SO7 ; 
      .ScanIn_9      ( part_PIs[023] ),      // pinName = ScanIn_9;  tf =  SI8 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_9     ( part_POs[020] ),      // pinName = ScanOut_9;  tf =  SO8 ; 
      .ScanIn_10     ( part_PIs[005] ),      // pinName = ScanIn_10;  tf =  SI9 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_10    ( part_POs[002] ),      // pinName = ScanOut_10;  tf =  SO9 ; 
      .ScanIn_11     ( part_PIs[006] ),      // pinName = ScanIn_11;  tf =  SI10 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_11    ( part_POs[003] ),      // pinName = ScanOut_11;  tf =  SO10 ; 
      .ScanIn_12     ( part_PIs[007] ),      // pinName = ScanIn_12;  tf =  SI11 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_12    ( part_POs[004] ),      // pinName = ScanOut_12;  tf =  SO11 ; 
      .ScanIn_13     ( part_PIs[008] ),      // pinName = ScanIn_13;  tf =  SI12 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_13    ( part_POs[005] ),      // pinName = ScanOut_13;  tf =  SO12 ; 
      .ScanIn_14     ( part_PIs[009] ),      // pinName = ScanIn_14;  tf =  SI13 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_14    ( part_POs[006] ),      // pinName = ScanOut_14;  tf =  SO13 ; 
      .ScanIn_15     ( part_PIs[010] ),      // pinName = ScanIn_15;  tf =  SI14 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_15    ( part_POs[007] ),      // pinName = ScanOut_15;  tf =  SO14 ; 
      .ScanIn_16     ( part_PIs[011] ),      // pinName = ScanIn_16;  tf =  SI15 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_16    ( part_POs[008] ),      // pinName = ScanOut_16;  tf =  SO15 ; 
      .ScanIn_17     ( part_PIs[012] ),      // pinName = ScanIn_17;  tf =  SI16 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_17    ( part_POs[009] ),      // pinName = ScanOut_17;  tf =  SO16 ; 
      .ScanIn_18     ( part_PIs[013] ),      // pinName = ScanIn_18;  tf =  SI17 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_18    ( part_POs[010] ),      // pinName = ScanOut_18;  tf =  SO17 ; 
      .ScanIn_19     ( part_PIs[014] ),      // pinName = ScanIn_19;  tf =  SI18 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_19    ( part_POs[011] ),      // pinName = ScanOut_19;  tf =  SO18 ; 
      .ScanIn_20     ( part_PIs[016] ),      // pinName = ScanIn_20;  tf =  SI19 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_20    ( part_POs[013] )     // pinName = ScanOut_20;  tf =  SO19 ; 
      );

//***************************************************************************//
//                        MAKE SOME OTHER CONNECTIONS                        //
//***************************************************************************//

  assign ( weak0, weak1 ) // Termination 
    part_POs [1] = global_term,     // pinName = ScanOut_1;  tf =  SO  ; 
    part_POs [2] = global_term,     // pinName = ScanOut_10;  tf =  SO9 ; 
    part_POs [3] = global_term,     // pinName = ScanOut_11;  tf =  SO10 ; 
    part_POs [4] = global_term,     // pinName = ScanOut_12;  tf =  SO11 ; 
    part_POs [5] = global_term,     // pinName = ScanOut_13;  tf =  SO12 ; 
    part_POs [6] = global_term,     // pinName = ScanOut_14;  tf =  SO13 ; 
    part_POs [7] = global_term,     // pinName = ScanOut_15;  tf =  SO14 ; 
    part_POs [8] = global_term,     // pinName = ScanOut_16;  tf =  SO15 ; 
    part_POs [9] = global_term,     // pinName = ScanOut_17;  tf =  SO16 ; 
    part_POs [10] = global_term,     // pinName = ScanOut_18;  tf =  SO17 ; 
    part_POs [11] = global_term,     // pinName = ScanOut_19;  tf =  SO18 ; 
    part_POs [12] = global_term,     // pinName = ScanOut_2;  tf =  SO1 ; 
    part_POs [13] = global_term,     // pinName = ScanOut_20;  tf =  SO19 ; 
    part_POs [14] = global_term,     // pinName = ScanOut_3;  tf =  SO2 ; 
    part_POs [15] = global_term,     // pinName = ScanOut_4;  tf =  SO3 ; 
    part_POs [16] = global_term,     // pinName = ScanOut_5;  tf =  SO4 ; 
    part_POs [17] = global_term,     // pinName = ScanOut_6;  tf =  SO5 ; 
    part_POs [18] = global_term,     // pinName = ScanOut_7;  tf =  SO6 ; 
    part_POs [19] = global_term,     // pinName = ScanOut_8;  tf =  SO7 ; 
    part_POs [20] = global_term,     // pinName = ScanOut_9;  tf =  SO8 ; 
    part_POs [21] = global_term,     // pinName = UART_TX_O; 
    part_POs [22] = global_term,     // pinName = framing_error; 
    part_POs [23] = global_term;      // pinName = parity_error; 


  assign ( supply0, supply1 ) // CR = 1 
    TOP_inst.ScanIn_1 = part_S_CR_1_TM_1 [20] ,   // CR = 1;  pos = 1;  Pin Index = 3;  Pin Name = ScanIn_1;  pinInvFromLatch = no;  Latch Index = 593;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[1] .SI = part_S_CR_1_TM_1 [19] ,   // CR = 1;  pos = 2;  Pin Index = 2662;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 838;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[2] .SI = part_S_CR_1_TM_1 [18] ,   // CR = 1;  pos = 3;  Pin Index = 2768;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 873;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[3] .SI = part_S_CR_1_TM_1 [17] ,   // CR = 1;  pos = 4;  Pin Index = 2874;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 908;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[4] .SI = part_S_CR_1_TM_1 [16] ,   // CR = 1;  pos = 5;  Pin Index = 2980;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 943;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[5] .SI = part_S_CR_1_TM_1 [15] ,   // CR = 1;  pos = 6;  Pin Index = 3086;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 978;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[6] .SI = part_S_CR_1_TM_1 [14] ,   // CR = 1;  pos = 7;  Pin Index = 3192;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 1013;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[7] .SI = part_S_CR_1_TM_1 [13] ,   // CR = 1;  pos = 8;  Pin Index = 3298;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 1048;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[8] .SI = part_S_CR_1_TM_1 [12] ,   // CR = 1;  pos = 9;  Pin Index = 3404;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[8].SI;  pinInvFromLatch = no;  Latch Index = 1083;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[8].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[9] .SI = part_S_CR_1_TM_1 [11] ,   // CR = 1;  pos = 10;  Pin Index = 3510;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[9].SI;  pinInvFromLatch = no;  Latch Index = 1118;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[9].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[10] .SI = part_S_CR_1_TM_1 [10] ,   // CR = 1;  pos = 11;  Pin Index = 2026;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[10].SI;  pinInvFromLatch = no;  Latch Index = 628;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[10].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[11] .SI = part_S_CR_1_TM_1 [9] ,   // CR = 1;  pos = 12;  Pin Index = 2132;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[11].SI;  pinInvFromLatch = no;  Latch Index = 663;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[11].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[12] .SI = part_S_CR_1_TM_1 [8] ,   // CR = 1;  pos = 13;  Pin Index = 2238;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[12].SI;  pinInvFromLatch = no;  Latch Index = 698;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[12].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[13] .SI = part_S_CR_1_TM_1 [7] ,   // CR = 1;  pos = 14;  Pin Index = 2344;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[13].SI;  pinInvFromLatch = no;  Latch Index = 733;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[13].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[14] .SI = part_S_CR_1_TM_1 [6] ,   // CR = 1;  pos = 15;  Pin Index = 2450;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[14].SI;  pinInvFromLatch = no;  Latch Index = 768;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[14].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.\ALU_OUT_reg[15] .SI = part_S_CR_1_TM_1 [5] ,   // CR = 1;  pos = 16;  Pin Index = 2556;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[15].SI;  pinInvFromLatch = no;  Latch Index = 803;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[15].__iNsT2.dff_primitive;   
    TOP_inst.U0_ALU_16B.OUT_VALID_reg.SI = part_S_CR_1_TM_1 [4] ,   // CR = 1;  pos = 17;  Pin Index = 1814;  Pin Name = U0_ALU_16B.OUT_VALID_reg.SI;  pinInvFromLatch = no;  Latch Index = 558;  Latch Name = U0_ALU_16B.OUT_VALID_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0] .SI = part_S_CR_1_TM_1 [3] ,   // CR = 1;  pos = 18;  Pin Index = 6779;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 2154;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1] .SI = part_S_CR_1_TM_1 [2] ,   // CR = 1;  pos = 19;  Pin Index = 6885;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 2189;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2] .SI = part_S_CR_1_TM_1 [1] ;   // CR = 1;  pos = 20;  Pin Index = 6991;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2].SI;  pinInvFromLatch = no;  Latch Index = 2224;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 2 
    TOP_inst.ScanIn_2 = part_S_CR_2_TM_1 [18] ,   // CR = 2;  pos = 1;  Pin Index = 14;  Pin Name = ScanIn_2;  pinInvFromLatch = no;  Latch Index = 4859;  Latch Name = U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_5.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_7.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_2_TM_1 [17] ,   // CR = 2;  pos = 2;  Pin Index = 15365;  Pin Name = U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_7.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 4904;  Latch Name = U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_7.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0] .SI = part_S_CR_2_TM_1 [16] ,   // CR = 2;  pos = 3;  Pin Index = 15497;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 4958;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1] .SI = part_S_CR_2_TM_1 [15] ,   // CR = 2;  pos = 4;  Pin Index = 15603;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 4993;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2] .SI = part_S_CR_2_TM_1 [14] ,   // CR = 2;  pos = 5;  Pin Index = 15709;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 5028;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3] .SI = part_S_CR_2_TM_1 [13] ,   // CR = 2;  pos = 6;  Pin Index = 15815;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 5063;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0] .SI = part_S_CR_2_TM_1 [12] ,   // CR = 2;  pos = 7;  Pin Index = 15921;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 5098;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1] .SI = part_S_CR_2_TM_1 [11] ,   // CR = 2;  pos = 8;  Pin Index = 16027;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 5133;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2] .SI = part_S_CR_2_TM_1 [10] ,   // CR = 2;  pos = 9;  Pin Index = 16133;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 5168;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3] .SI = part_S_CR_2_TM_1 [9] ,   // CR = 2;  pos = 10;  Pin Index = 16239;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 5203;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0] .SI = part_S_CR_2_TM_1 [8] ,   // CR = 2;  pos = 11;  Pin Index = 18434;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 5917;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1] .SI = part_S_CR_2_TM_1 [7] ,   // CR = 2;  pos = 12;  Pin Index = 18540;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 5952;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0] .SI = part_S_CR_2_TM_1 [6] ,   // CR = 2;  pos = 13;  Pin Index = 18646;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].SI;  pinInvFromLatch = no;  Latch Index = 5987;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1] .SI = part_S_CR_2_TM_1 [5] ,   // CR = 2;  pos = 14;  Pin Index = 18752;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].SI;  pinInvFromLatch = no;  Latch Index = 6022;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0] .SI = part_S_CR_2_TM_1 [4] ,   // CR = 2;  pos = 15;  Pin Index = 18858;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 6057;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1] .SI = part_S_CR_2_TM_1 [3] ,   // CR = 2;  pos = 16;  Pin Index = 18964;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 6092;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0] .SI = part_S_CR_2_TM_1 [2] ,   // CR = 2;  pos = 17;  Pin Index = 19070;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 6127;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1] .SI = part_S_CR_2_TM_1 [1] ;   // CR = 2;  pos = 18;  Pin Index = 19176;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 6162;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 3 
    TOP_inst.ScanIn_3 = part_S_CR_3_TM_1 [20] ,   // CR = 3;  pos = 1;  Pin Index = 16;  Pin Name = ScanIn_3;  pinInvFromLatch = no;  Latch Index = 2259;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4] .SI = part_S_CR_3_TM_1 [19] ,   // CR = 3;  pos = 2;  Pin Index = 7203;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].SI;  pinInvFromLatch = no;  Latch Index = 2294;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5] .SI = part_S_CR_3_TM_1 [18] ,   // CR = 3;  pos = 3;  Pin Index = 7309;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].SI;  pinInvFromLatch = no;  Latch Index = 2329;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6] .SI = part_S_CR_3_TM_1 [17] ,   // CR = 3;  pos = 4;  Pin Index = 7415;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].SI;  pinInvFromLatch = no;  Latch Index = 2364;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7] .SI = part_S_CR_3_TM_1 [16] ,   // CR = 3;  pos = 5;  Pin Index = 7521;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].SI;  pinInvFromLatch = no;  Latch Index = 2399;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0] .SI = part_S_CR_3_TM_1 [15] ,   // CR = 3;  pos = 6;  Pin Index = 7627;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].SI;  pinInvFromLatch = no;  Latch Index = 2434;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1] .SI = part_S_CR_3_TM_1 [14] ,   // CR = 3;  pos = 7;  Pin Index = 7733;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].SI;  pinInvFromLatch = no;  Latch Index = 2469;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2] .SI = part_S_CR_3_TM_1 [13] ,   // CR = 3;  pos = 8;  Pin Index = 7839;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].SI;  pinInvFromLatch = no;  Latch Index = 2504;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3] .SI = part_S_CR_3_TM_1 [12] ,   // CR = 3;  pos = 9;  Pin Index = 7945;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].SI;  pinInvFromLatch = no;  Latch Index = 2539;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4] .SI = part_S_CR_3_TM_1 [11] ,   // CR = 3;  pos = 10;  Pin Index = 8051;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].SI;  pinInvFromLatch = no;  Latch Index = 2574;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5] .SI = part_S_CR_3_TM_1 [10] ,   // CR = 3;  pos = 11;  Pin Index = 8157;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].SI;  pinInvFromLatch = no;  Latch Index = 2609;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6] .SI = part_S_CR_3_TM_1 [9] ,   // CR = 3;  pos = 12;  Pin Index = 8263;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].SI;  pinInvFromLatch = no;  Latch Index = 2644;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7] .SI = part_S_CR_3_TM_1 [8] ,   // CR = 3;  pos = 13;  Pin Index = 8369;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].SI;  pinInvFromLatch = no;  Latch Index = 2679;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0] .SI = part_S_CR_3_TM_1 [7] ,   // CR = 3;  pos = 14;  Pin Index = 8475;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 2714;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1] .SI = part_S_CR_3_TM_1 [6] ,   // CR = 3;  pos = 15;  Pin Index = 8581;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 2749;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2] .SI = part_S_CR_3_TM_1 [5] ,   // CR = 3;  pos = 16;  Pin Index = 8687;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].SI;  pinInvFromLatch = no;  Latch Index = 2784;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3] .SI = part_S_CR_3_TM_1 [4] ,   // CR = 3;  pos = 17;  Pin Index = 8793;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].SI;  pinInvFromLatch = no;  Latch Index = 2819;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4] .SI = part_S_CR_3_TM_1 [3] ,   // CR = 3;  pos = 18;  Pin Index = 8899;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].SI;  pinInvFromLatch = no;  Latch Index = 2854;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5] .SI = part_S_CR_3_TM_1 [2] ,   // CR = 3;  pos = 19;  Pin Index = 9005;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].SI;  pinInvFromLatch = no;  Latch Index = 2889;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6] .SI = part_S_CR_3_TM_1 [1] ;   // CR = 3;  pos = 20;  Pin Index = 9111;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6].SI;  pinInvFromLatch = no;  Latch Index = 2924;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 4 
    TOP_inst.ScanIn_4 = part_S_CR_4_TM_1 [20] ,   // CR = 4;  pos = 1;  Pin Index = 17;  Pin Name = ScanIn_4;  pinInvFromLatch = no;  Latch Index = 2959;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0] .SI = part_S_CR_4_TM_1 [19] ,   // CR = 4;  pos = 2;  Pin Index = 9323;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 2994;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1] .SI = part_S_CR_4_TM_1 [18] ,   // CR = 4;  pos = 3;  Pin Index = 9429;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 3029;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2] .SI = part_S_CR_4_TM_1 [17] ,   // CR = 4;  pos = 4;  Pin Index = 9535;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].SI;  pinInvFromLatch = no;  Latch Index = 3064;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3] .SI = part_S_CR_4_TM_1 [16] ,   // CR = 4;  pos = 5;  Pin Index = 9641;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].SI;  pinInvFromLatch = no;  Latch Index = 3099;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4] .SI = part_S_CR_4_TM_1 [15] ,   // CR = 4;  pos = 6;  Pin Index = 9747;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].SI;  pinInvFromLatch = no;  Latch Index = 3134;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5] .SI = part_S_CR_4_TM_1 [14] ,   // CR = 4;  pos = 7;  Pin Index = 9853;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].SI;  pinInvFromLatch = no;  Latch Index = 3169;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6] .SI = part_S_CR_4_TM_1 [13] ,   // CR = 4;  pos = 8;  Pin Index = 9959;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].SI;  pinInvFromLatch = no;  Latch Index = 3204;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7] .SI = part_S_CR_4_TM_1 [12] ,   // CR = 4;  pos = 9;  Pin Index = 10065;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].SI;  pinInvFromLatch = no;  Latch Index = 3239;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0] .SI = part_S_CR_4_TM_1 [11] ,   // CR = 4;  pos = 10;  Pin Index = 10171;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].SI;  pinInvFromLatch = no;  Latch Index = 3274;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1] .SI = part_S_CR_4_TM_1 [10] ,   // CR = 4;  pos = 11;  Pin Index = 10277;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].SI;  pinInvFromLatch = no;  Latch Index = 3309;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2] .SI = part_S_CR_4_TM_1 [9] ,   // CR = 4;  pos = 12;  Pin Index = 10383;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].SI;  pinInvFromLatch = no;  Latch Index = 3344;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3] .SI = part_S_CR_4_TM_1 [8] ,   // CR = 4;  pos = 13;  Pin Index = 10489;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].SI;  pinInvFromLatch = no;  Latch Index = 3379;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4] .SI = part_S_CR_4_TM_1 [7] ,   // CR = 4;  pos = 14;  Pin Index = 10595;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].SI;  pinInvFromLatch = no;  Latch Index = 3414;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5] .SI = part_S_CR_4_TM_1 [6] ,   // CR = 4;  pos = 15;  Pin Index = 10701;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].SI;  pinInvFromLatch = no;  Latch Index = 3449;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6] .SI = part_S_CR_4_TM_1 [5] ,   // CR = 4;  pos = 16;  Pin Index = 10807;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].SI;  pinInvFromLatch = no;  Latch Index = 3484;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7] .SI = part_S_CR_4_TM_1 [4] ,   // CR = 4;  pos = 17;  Pin Index = 10913;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].SI;  pinInvFromLatch = no;  Latch Index = 3519;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0] .SI = part_S_CR_4_TM_1 [3] ,   // CR = 4;  pos = 18;  Pin Index = 11019;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].SI;  pinInvFromLatch = no;  Latch Index = 3554;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1] .SI = part_S_CR_4_TM_1 [2] ,   // CR = 4;  pos = 19;  Pin Index = 11125;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].SI;  pinInvFromLatch = no;  Latch Index = 3589;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2] .SI = part_S_CR_4_TM_1 [1] ;   // CR = 4;  pos = 20;  Pin Index = 11231;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2].SI;  pinInvFromLatch = no;  Latch Index = 3624;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 5 
    TOP_inst.ScanIn_5 = part_S_CR_5_TM_1 [18] ,   // CR = 5;  pos = 1;  Pin Index = 18;  Pin Name = ScanIn_5;  pinInvFromLatch = no;  Latch Index = 6699;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[1] .SI = part_S_CR_5_TM_1 [17] ,   // CR = 5;  pos = 2;  Pin Index = 20974;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 6734;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[2] .SI = part_S_CR_5_TM_1 [16] ,   // CR = 5;  pos = 3;  Pin Index = 21080;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 6769;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[3] .SI = part_S_CR_5_TM_1 [15] ,   // CR = 5;  pos = 4;  Pin Index = 21186;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 6804;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[4] .SI = part_S_CR_5_TM_1 [14] ,   // CR = 5;  pos = 5;  Pin Index = 21292;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 6839;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[5] .SI = part_S_CR_5_TM_1 [13] ,   // CR = 5;  pos = 6;  Pin Index = 21398;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 6874;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[6] .SI = part_S_CR_5_TM_1 [12] ,   // CR = 5;  pos = 7;  Pin Index = 21504;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 6909;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Integer_Clock_Divider_TX.gen_clk_reg.SI = part_S_CR_5_TM_1 [11] ,   // CR = 5;  pos = 8;  Pin Index = 22156;  Pin Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.SI;  pinInvFromLatch = no;  Latch Index = 7130;  Latch Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_PULSE_GEN.pls_flop_reg.SI = part_S_CR_5_TM_1 [10] ,   // CR = 5;  pos = 9;  Pin Index = 22286;  Pin Name = U0_PULSE_GEN.pls_flop_reg.SI;  pinInvFromLatch = no;  Latch Index = 7172;  Latch Name = U0_PULSE_GEN.pls_flop_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_PULSE_GEN.rcv_flop_reg.SI = part_S_CR_5_TM_1 [9] ,   // CR = 5;  pos = 10;  Pin Index = 22392;  Pin Name = U0_PULSE_GEN.rcv_flop_reg.SI;  pinInvFromLatch = no;  Latch Index = 7207;  Latch Name = U0_PULSE_GEN.rcv_flop_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_2.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_5_TM_1 [8] ,   // CR = 5;  pos = 11;  Pin Index = 44710;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_2.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 14325;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_2.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_3.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_5_TM_1 [7] ,   // CR = 5;  pos = 12;  Pin Index = 44850;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_3.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 14370;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_3.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_4.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_5_TM_1 [6] ,   // CR = 5;  pos = 13;  Pin Index = 44990;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_4.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 14415;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_4.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_6.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_5_TM_1 [5] ,   // CR = 5;  pos = 14;  Pin Index = 45130;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_6.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 14460;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_6.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_9.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_5_TM_1 [4] ,   // CR = 5;  pos = 15;  Pin Index = 45270;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_9.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 14505;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_9.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0] .SI = part_S_CR_5_TM_1 [3] ,   // CR = 5;  pos = 16;  Pin Index = 45402;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 14559;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1] .SI = part_S_CR_5_TM_1 [2] ,   // CR = 5;  pos = 17;  Pin Index = 45508;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 14594;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2] .SI = part_S_CR_5_TM_1 [1] ;   // CR = 5;  pos = 18;  Pin Index = 45614;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 14629;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 6 
    TOP_inst.ScanIn_6 = part_S_CR_6_TM_1 [20] ,   // CR = 6;  pos = 1;  Pin Index = 19;  Pin Name = ScanIn_6;  pinInvFromLatch = no;  Latch Index = 3659;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4] .SI = part_S_CR_6_TM_1 [19] ,   // CR = 6;  pos = 2;  Pin Index = 11443;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].SI;  pinInvFromLatch = no;  Latch Index = 3694;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5] .SI = part_S_CR_6_TM_1 [18] ,   // CR = 6;  pos = 3;  Pin Index = 11549;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].SI;  pinInvFromLatch = no;  Latch Index = 3729;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6] .SI = part_S_CR_6_TM_1 [17] ,   // CR = 6;  pos = 4;  Pin Index = 11655;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].SI;  pinInvFromLatch = no;  Latch Index = 3764;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7] .SI = part_S_CR_6_TM_1 [16] ,   // CR = 6;  pos = 5;  Pin Index = 11761;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].SI;  pinInvFromLatch = no;  Latch Index = 3799;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0] .SI = part_S_CR_6_TM_1 [15] ,   // CR = 6;  pos = 6;  Pin Index = 11867;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].SI;  pinInvFromLatch = no;  Latch Index = 3834;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1] .SI = part_S_CR_6_TM_1 [14] ,   // CR = 6;  pos = 7;  Pin Index = 11973;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].SI;  pinInvFromLatch = no;  Latch Index = 3869;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2] .SI = part_S_CR_6_TM_1 [13] ,   // CR = 6;  pos = 8;  Pin Index = 12079;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].SI;  pinInvFromLatch = no;  Latch Index = 3904;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3] .SI = part_S_CR_6_TM_1 [12] ,   // CR = 6;  pos = 9;  Pin Index = 12185;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].SI;  pinInvFromLatch = no;  Latch Index = 3939;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4] .SI = part_S_CR_6_TM_1 [11] ,   // CR = 6;  pos = 10;  Pin Index = 12291;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].SI;  pinInvFromLatch = no;  Latch Index = 3974;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5] .SI = part_S_CR_6_TM_1 [10] ,   // CR = 6;  pos = 11;  Pin Index = 12397;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].SI;  pinInvFromLatch = no;  Latch Index = 4009;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6] .SI = part_S_CR_6_TM_1 [9] ,   // CR = 6;  pos = 12;  Pin Index = 12503;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].SI;  pinInvFromLatch = no;  Latch Index = 4044;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7] .SI = part_S_CR_6_TM_1 [8] ,   // CR = 6;  pos = 13;  Pin Index = 12609;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].SI;  pinInvFromLatch = no;  Latch Index = 4079;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0] .SI = part_S_CR_6_TM_1 [7] ,   // CR = 6;  pos = 14;  Pin Index = 12715;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].SI;  pinInvFromLatch = no;  Latch Index = 4114;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1] .SI = part_S_CR_6_TM_1 [6] ,   // CR = 6;  pos = 15;  Pin Index = 12821;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].SI;  pinInvFromLatch = no;  Latch Index = 4149;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2] .SI = part_S_CR_6_TM_1 [5] ,   // CR = 6;  pos = 16;  Pin Index = 12927;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].SI;  pinInvFromLatch = no;  Latch Index = 4184;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3] .SI = part_S_CR_6_TM_1 [4] ,   // CR = 6;  pos = 17;  Pin Index = 13033;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].SI;  pinInvFromLatch = no;  Latch Index = 4219;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4] .SI = part_S_CR_6_TM_1 [3] ,   // CR = 6;  pos = 18;  Pin Index = 13139;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].SI;  pinInvFromLatch = no;  Latch Index = 4254;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5] .SI = part_S_CR_6_TM_1 [2] ,   // CR = 6;  pos = 19;  Pin Index = 13245;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].SI;  pinInvFromLatch = no;  Latch Index = 4289;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6] .SI = part_S_CR_6_TM_1 [1] ;   // CR = 6;  pos = 20;  Pin Index = 13351;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6].SI;  pinInvFromLatch = no;  Latch Index = 4324;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 7 
    TOP_inst.ScanIn_7 = part_S_CR_7_TM_1 [20] ,   // CR = 7;  pos = 1;  Pin Index = 20;  Pin Name = ScanIn_7;  pinInvFromLatch = no;  Latch Index = 4359;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0] .SI = part_S_CR_7_TM_1 [19] ,   // CR = 7;  pos = 2;  Pin Index = 16534;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 5297;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1] .SI = part_S_CR_7_TM_1 [18] ,   // CR = 7;  pos = 3;  Pin Index = 16640;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 5332;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2] .SI = part_S_CR_7_TM_1 [17] ,   // CR = 7;  pos = 4;  Pin Index = 16746;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 5367;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3] .SI = part_S_CR_7_TM_1 [16] ,   // CR = 7;  pos = 5;  Pin Index = 16852;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 5402;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0] .SI = part_S_CR_7_TM_1 [15] ,   // CR = 7;  pos = 6;  Pin Index = 16958;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 5437;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1] .SI = part_S_CR_7_TM_1 [14] ,   // CR = 7;  pos = 7;  Pin Index = 17064;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 5472;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2] .SI = part_S_CR_7_TM_1 [13] ,   // CR = 7;  pos = 8;  Pin Index = 17170;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 5507;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3] .SI = part_S_CR_7_TM_1 [12] ,   // CR = 7;  pos = 9;  Pin Index = 17276;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 5542;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0] .SI = part_S_CR_7_TM_1 [11] ,   // CR = 7;  pos = 10;  Pin Index = 17567;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 5634;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1] .SI = part_S_CR_7_TM_1 [10] ,   // CR = 7;  pos = 11;  Pin Index = 17673;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 5669;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0] .SI = part_S_CR_7_TM_1 [9] ,   // CR = 7;  pos = 12;  Pin Index = 17779;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0].SI;  pinInvFromLatch = no;  Latch Index = 5704;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1] .SI = part_S_CR_7_TM_1 [8] ,   // CR = 7;  pos = 13;  Pin Index = 17885;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].SI;  pinInvFromLatch = no;  Latch Index = 5739;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0] .SI = part_S_CR_7_TM_1 [7] ,   // CR = 7;  pos = 14;  Pin Index = 17991;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 5774;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1] .SI = part_S_CR_7_TM_1 [6] ,   // CR = 7;  pos = 15;  Pin Index = 18097;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 5809;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0] .SI = part_S_CR_7_TM_1 [5] ,   // CR = 7;  pos = 16;  Pin Index = 18203;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 5844;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1] .SI = part_S_CR_7_TM_1 [4] ,   // CR = 7;  pos = 17;  Pin Index = 18309;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 5879;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.enable_flop_reg.SI = part_S_CR_7_TM_1 [3] ,   // CR = 7;  pos = 18;  Pin Index = 20515;  Pin Name = U0_DATA_SYNC.enable_flop_reg.SI;  pinInvFromLatch = no;  Latch Index = 6593;  Latch Name = U0_DATA_SYNC.enable_flop_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.enable_pulse_reg.SI = part_S_CR_7_TM_1 [2] ,   // CR = 7;  pos = 19;  Pin Index = 20621;  Pin Name = U0_DATA_SYNC.enable_pulse_reg.SI;  pinInvFromLatch = no;  Latch Index = 6628;  Latch Name = U0_DATA_SYNC.enable_pulse_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[0] .SI = part_S_CR_7_TM_1 [1] ;   // CR = 7;  pos = 20;  Pin Index = 19455;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 6243;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[0].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 8 
    TOP_inst.ScanIn_8 = part_S_CR_8_TM_1 [20] ,   // CR = 8;  pos = 1;  Pin Index = 21;  Pin Name = ScanIn_8;  pinInvFromLatch = no;  Latch Index = 6278;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[2] .SI = part_S_CR_8_TM_1 [19] ,   // CR = 8;  pos = 2;  Pin Index = 19667;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 6313;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[3] .SI = part_S_CR_8_TM_1 [18] ,   // CR = 8;  pos = 3;  Pin Index = 19773;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 6348;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[4] .SI = part_S_CR_8_TM_1 [17] ,   // CR = 8;  pos = 4;  Pin Index = 19879;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 6383;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[5] .SI = part_S_CR_8_TM_1 [16] ,   // CR = 8;  pos = 5;  Pin Index = 19985;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 6418;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[6] .SI = part_S_CR_8_TM_1 [15] ,   // CR = 8;  pos = 6;  Pin Index = 20091;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 6453;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_bus_reg[7] .SI = part_S_CR_8_TM_1 [14] ,   // CR = 8;  pos = 7;  Pin Index = 20197;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 6488;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_reg_reg[0] .SI = part_S_CR_8_TM_1 [13] ,   // CR = 8;  pos = 8;  Pin Index = 20303;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 6523;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_DATA_SYNC.\sync_reg_reg[1] .SI = part_S_CR_8_TM_1 [12] ,   // CR = 8;  pos = 9;  Pin Index = 20409;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 6558;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[0] .SI = part_S_CR_8_TM_1 [11] ,   // CR = 8;  pos = 10;  Pin Index = 22506;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 7243;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[1] .SI = part_S_CR_8_TM_1 [10] ,   // CR = 8;  pos = 11;  Pin Index = 22612;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 7278;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][0] .SI = part_S_CR_8_TM_1 [9] ,   // CR = 8;  pos = 12;  Pin Index = 22912;  Pin Name = U0_Register_File.\Memory_reg[0][0].SI;  pinInvFromLatch = no;  Latch Index = 7352;  Latch Name = U0_Register_File.\Memory_reg[0][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][1] .SI = part_S_CR_8_TM_1 [8] ,   // CR = 8;  pos = 13;  Pin Index = 23018;  Pin Name = U0_Register_File.\Memory_reg[0][1].SI;  pinInvFromLatch = no;  Latch Index = 7387;  Latch Name = U0_Register_File.\Memory_reg[0][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][2] .SI = part_S_CR_8_TM_1 [7] ,   // CR = 8;  pos = 14;  Pin Index = 23124;  Pin Name = U0_Register_File.\Memory_reg[0][2].SI;  pinInvFromLatch = no;  Latch Index = 7422;  Latch Name = U0_Register_File.\Memory_reg[0][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][3] .SI = part_S_CR_8_TM_1 [6] ,   // CR = 8;  pos = 15;  Pin Index = 23230;  Pin Name = U0_Register_File.\Memory_reg[0][3].SI;  pinInvFromLatch = no;  Latch Index = 7457;  Latch Name = U0_Register_File.\Memory_reg[0][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][4] .SI = part_S_CR_8_TM_1 [5] ,   // CR = 8;  pos = 16;  Pin Index = 23336;  Pin Name = U0_Register_File.\Memory_reg[0][4].SI;  pinInvFromLatch = no;  Latch Index = 7492;  Latch Name = U0_Register_File.\Memory_reg[0][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][5] .SI = part_S_CR_8_TM_1 [4] ,   // CR = 8;  pos = 17;  Pin Index = 23442;  Pin Name = U0_Register_File.\Memory_reg[0][5].SI;  pinInvFromLatch = no;  Latch Index = 7527;  Latch Name = U0_Register_File.\Memory_reg[0][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][6] .SI = part_S_CR_8_TM_1 [3] ,   // CR = 8;  pos = 18;  Pin Index = 23548;  Pin Name = U0_Register_File.\Memory_reg[0][6].SI;  pinInvFromLatch = no;  Latch Index = 7562;  Latch Name = U0_Register_File.\Memory_reg[0][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[0][7] .SI = part_S_CR_8_TM_1 [2] ,   // CR = 8;  pos = 19;  Pin Index = 23654;  Pin Name = U0_Register_File.\Memory_reg[0][7].SI;  pinInvFromLatch = no;  Latch Index = 7597;  Latch Name = U0_Register_File.\Memory_reg[0][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][0] .SI = part_S_CR_8_TM_1 [1] ;   // CR = 8;  pos = 20;  Pin Index = 28848;  Pin Name = U0_Register_File.\Memory_reg[1][0].SI;  pinInvFromLatch = no;  Latch Index = 9312;  Latch Name = U0_Register_File.\Memory_reg[1][0].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 9 
    TOP_inst.ScanIn_9 = part_S_CR_9_TM_1 [18] ,   // CR = 9;  pos = 1;  Pin Index = 22;  Pin Name = ScanIn_9;  pinInvFromLatch = no;  Latch Index = 14844;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_0.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_11.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_9_TM_1 [17] ,   // CR = 9;  pos = 2;  Pin Index = 46457;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_11.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 14889;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_11.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.SI = part_S_CR_9_TM_1 [16] ,   // CR = 9;  pos = 3;  Pin Index = 47312;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.SI;  pinInvFromLatch = no;  Latch Index = 15187;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0] .SI = part_S_CR_9_TM_1 [15] ,   // CR = 9;  pos = 4;  Pin Index = 46588;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 14933;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1] .SI = part_S_CR_9_TM_1 [14] ,   // CR = 9;  pos = 5;  Pin Index = 46677;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 14963;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2] .SI = part_S_CR_9_TM_1 [13] ,   // CR = 9;  pos = 6;  Pin Index = 46766;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 14993;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.DFT_tpi_xor_tree_15.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_9_TM_1 [12] ,   // CR = 9;  pos = 7;  Pin Index = 47455;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.DFT_tpi_xor_tree_15.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 15216;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.DFT_tpi_xor_tree_15.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0] .SI = part_S_CR_9_TM_1 [11] ,   // CR = 9;  pos = 8;  Pin Index = 47587;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 15270;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1] .SI = part_S_CR_9_TM_1 [10] ,   // CR = 9;  pos = 9;  Pin Index = 47693;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 15305;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2] .SI = part_S_CR_9_TM_1 [9] ,   // CR = 9;  pos = 10;  Pin Index = 47799;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 15340;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3] .SI = part_S_CR_9_TM_1 [8] ,   // CR = 9;  pos = 11;  Pin Index = 47905;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 15375;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4] .SI = part_S_CR_9_TM_1 [7] ,   // CR = 9;  pos = 12;  Pin Index = 48011;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 15410;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5] .SI = part_S_CR_9_TM_1 [6] ,   // CR = 9;  pos = 13;  Pin Index = 48117;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 15445;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6] .SI = part_S_CR_9_TM_1 [5] ,   // CR = 9;  pos = 14;  Pin Index = 48223;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 15480;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7] .SI = part_S_CR_9_TM_1 [4] ,   // CR = 9;  pos = 15;  Pin Index = 48329;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 15515;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_10.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_9_TM_1 [3] ,   // CR = 9;  pos = 16;  Pin Index = 48821;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_10.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 15658;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_10.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_14.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_9_TM_1 [2] ,   // CR = 9;  pos = 17;  Pin Index = 48961;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_14.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 15703;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_14.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0] .SI = part_S_CR_9_TM_1 [1] ;   // CR = 9;  pos = 18;  Pin Index = 49093;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 15757;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 10 
    TOP_inst.ScanIn_10 = part_S_CR_10_TM_1 [20] ,   // CR = 10;  pos = 1;  Pin Index = 4;  Pin Name = ScanIn_10;  pinInvFromLatch = no;  Latch Index = 9347;  Latch Name = U0_Register_File.\Memory_reg[1][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][2] .SI = part_S_CR_10_TM_1 [19] ,   // CR = 10;  pos = 2;  Pin Index = 29060;  Pin Name = U0_Register_File.\Memory_reg[1][2].SI;  pinInvFromLatch = no;  Latch Index = 9382;  Latch Name = U0_Register_File.\Memory_reg[1][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][3] .SI = part_S_CR_10_TM_1 [18] ,   // CR = 10;  pos = 3;  Pin Index = 29166;  Pin Name = U0_Register_File.\Memory_reg[1][3].SI;  pinInvFromLatch = no;  Latch Index = 9417;  Latch Name = U0_Register_File.\Memory_reg[1][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][4] .SI = part_S_CR_10_TM_1 [17] ,   // CR = 10;  pos = 4;  Pin Index = 29272;  Pin Name = U0_Register_File.\Memory_reg[1][4].SI;  pinInvFromLatch = no;  Latch Index = 9452;  Latch Name = U0_Register_File.\Memory_reg[1][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][5] .SI = part_S_CR_10_TM_1 [16] ,   // CR = 10;  pos = 5;  Pin Index = 29378;  Pin Name = U0_Register_File.\Memory_reg[1][5].SI;  pinInvFromLatch = no;  Latch Index = 9487;  Latch Name = U0_Register_File.\Memory_reg[1][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][6] .SI = part_S_CR_10_TM_1 [15] ,   // CR = 10;  pos = 6;  Pin Index = 29484;  Pin Name = U0_Register_File.\Memory_reg[1][6].SI;  pinInvFromLatch = no;  Latch Index = 9522;  Latch Name = U0_Register_File.\Memory_reg[1][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[1][7] .SI = part_S_CR_10_TM_1 [14] ,   // CR = 10;  pos = 7;  Pin Index = 29590;  Pin Name = U0_Register_File.\Memory_reg[1][7].SI;  pinInvFromLatch = no;  Latch Index = 9557;  Latch Name = U0_Register_File.\Memory_reg[1][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][0] .SI = part_S_CR_10_TM_1 [13] ,   // CR = 10;  pos = 8;  Pin Index = 29695;  Pin Name = U0_Register_File.\Memory_reg[2][0].SI;  pinInvFromLatch = no;  Latch Index = 9591;  Latch Name = U0_Register_File.\Memory_reg[2][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][1] .SI = part_S_CR_10_TM_1 [12] ,   // CR = 10;  pos = 9;  Pin Index = 29799;  Pin Name = U0_Register_File.\Memory_reg[2][1].SI;  pinInvFromLatch = no;  Latch Index = 9626;  Latch Name = U0_Register_File.\Memory_reg[2][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][2] .SI = part_S_CR_10_TM_1 [11] ,   // CR = 10;  pos = 10;  Pin Index = 29905;  Pin Name = U0_Register_File.\Memory_reg[2][2].SI;  pinInvFromLatch = no;  Latch Index = 9661;  Latch Name = U0_Register_File.\Memory_reg[2][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][3] .SI = part_S_CR_10_TM_1 [10] ,   // CR = 10;  pos = 11;  Pin Index = 30011;  Pin Name = U0_Register_File.\Memory_reg[2][3].SI;  pinInvFromLatch = no;  Latch Index = 9696;  Latch Name = U0_Register_File.\Memory_reg[2][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][4] .SI = part_S_CR_10_TM_1 [9] ,   // CR = 10;  pos = 12;  Pin Index = 30117;  Pin Name = U0_Register_File.\Memory_reg[2][4].SI;  pinInvFromLatch = no;  Latch Index = 9731;  Latch Name = U0_Register_File.\Memory_reg[2][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][5] .SI = part_S_CR_10_TM_1 [8] ,   // CR = 10;  pos = 13;  Pin Index = 30223;  Pin Name = U0_Register_File.\Memory_reg[2][5].SI;  pinInvFromLatch = no;  Latch Index = 9766;  Latch Name = U0_Register_File.\Memory_reg[2][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][6] .SI = part_S_CR_10_TM_1 [7] ,   // CR = 10;  pos = 14;  Pin Index = 30329;  Pin Name = U0_Register_File.\Memory_reg[2][6].SI;  pinInvFromLatch = no;  Latch Index = 9801;  Latch Name = U0_Register_File.\Memory_reg[2][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[2][7] .SI = part_S_CR_10_TM_1 [6] ,   // CR = 10;  pos = 15;  Pin Index = 30434;  Pin Name = U0_Register_File.\Memory_reg[2][7].SI;  pinInvFromLatch = no;  Latch Index = 9835;  Latch Name = U0_Register_File.\Memory_reg[2][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][0] .SI = part_S_CR_10_TM_1 [5] ,   // CR = 10;  pos = 16;  Pin Index = 30538;  Pin Name = U0_Register_File.\Memory_reg[3][0].SI;  pinInvFromLatch = no;  Latch Index = 9870;  Latch Name = U0_Register_File.\Memory_reg[3][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][1] .SI = part_S_CR_10_TM_1 [4] ,   // CR = 10;  pos = 17;  Pin Index = 30644;  Pin Name = U0_Register_File.\Memory_reg[3][1].SI;  pinInvFromLatch = no;  Latch Index = 9905;  Latch Name = U0_Register_File.\Memory_reg[3][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][2] .SI = part_S_CR_10_TM_1 [3] ,   // CR = 10;  pos = 18;  Pin Index = 30750;  Pin Name = U0_Register_File.\Memory_reg[3][2].SI;  pinInvFromLatch = no;  Latch Index = 9940;  Latch Name = U0_Register_File.\Memory_reg[3][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][3] .SI = part_S_CR_10_TM_1 [2] ,   // CR = 10;  pos = 19;  Pin Index = 30856;  Pin Name = U0_Register_File.\Memory_reg[3][3].SI;  pinInvFromLatch = no;  Latch Index = 9975;  Latch Name = U0_Register_File.\Memory_reg[3][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][4] .SI = part_S_CR_10_TM_1 [1] ;   // CR = 10;  pos = 20;  Pin Index = 30962;  Pin Name = U0_Register_File.\Memory_reg[3][4].SI;  pinInvFromLatch = no;  Latch Index = 10010;  Latch Name = U0_Register_File.\Memory_reg[3][4].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 11 
    TOP_inst.ScanIn_11 = part_S_CR_11_TM_1 [19] ,   // CR = 11;  pos = 1;  Pin Index = 5;  Pin Name = ScanIn_11;  pinInvFromLatch = no;  Latch Index = 10044;  Latch Name = U0_Register_File.\Memory_reg[3][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][6] .SI = part_S_CR_11_TM_1 [18] ,   // CR = 11;  pos = 2;  Pin Index = 31171;  Pin Name = U0_Register_File.\Memory_reg[3][6].SI;  pinInvFromLatch = no;  Latch Index = 10079;  Latch Name = U0_Register_File.\Memory_reg[3][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[3][7] .SI = part_S_CR_11_TM_1 [17] ,   // CR = 11;  pos = 3;  Pin Index = 31277;  Pin Name = U0_Register_File.\Memory_reg[3][7].SI;  pinInvFromLatch = no;  Latch Index = 10114;  Latch Name = U0_Register_File.\Memory_reg[3][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][0] .SI = part_S_CR_11_TM_1 [16] ,   // CR = 11;  pos = 4;  Pin Index = 31383;  Pin Name = U0_Register_File.\Memory_reg[4][0].SI;  pinInvFromLatch = no;  Latch Index = 10149;  Latch Name = U0_Register_File.\Memory_reg[4][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][1] .SI = part_S_CR_11_TM_1 [15] ,   // CR = 11;  pos = 5;  Pin Index = 31489;  Pin Name = U0_Register_File.\Memory_reg[4][1].SI;  pinInvFromLatch = no;  Latch Index = 10184;  Latch Name = U0_Register_File.\Memory_reg[4][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][2] .SI = part_S_CR_11_TM_1 [14] ,   // CR = 11;  pos = 6;  Pin Index = 31595;  Pin Name = U0_Register_File.\Memory_reg[4][2].SI;  pinInvFromLatch = no;  Latch Index = 10219;  Latch Name = U0_Register_File.\Memory_reg[4][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][3] .SI = part_S_CR_11_TM_1 [13] ,   // CR = 11;  pos = 7;  Pin Index = 31701;  Pin Name = U0_Register_File.\Memory_reg[4][3].SI;  pinInvFromLatch = no;  Latch Index = 10254;  Latch Name = U0_Register_File.\Memory_reg[4][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][4] .SI = part_S_CR_11_TM_1 [12] ,   // CR = 11;  pos = 8;  Pin Index = 31807;  Pin Name = U0_Register_File.\Memory_reg[4][4].SI;  pinInvFromLatch = no;  Latch Index = 10289;  Latch Name = U0_Register_File.\Memory_reg[4][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][5] .SI = part_S_CR_11_TM_1 [11] ,   // CR = 11;  pos = 9;  Pin Index = 31913;  Pin Name = U0_Register_File.\Memory_reg[4][5].SI;  pinInvFromLatch = no;  Latch Index = 10324;  Latch Name = U0_Register_File.\Memory_reg[4][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][6] .SI = part_S_CR_11_TM_1 [10] ,   // CR = 11;  pos = 10;  Pin Index = 32019;  Pin Name = U0_Register_File.\Memory_reg[4][6].SI;  pinInvFromLatch = no;  Latch Index = 10359;  Latch Name = U0_Register_File.\Memory_reg[4][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[4][7] .SI = part_S_CR_11_TM_1 [9] ,   // CR = 11;  pos = 11;  Pin Index = 32125;  Pin Name = U0_Register_File.\Memory_reg[4][7].SI;  pinInvFromLatch = no;  Latch Index = 10394;  Latch Name = U0_Register_File.\Memory_reg[4][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][0] .SI = part_S_CR_11_TM_1 [8] ,   // CR = 11;  pos = 12;  Pin Index = 32231;  Pin Name = U0_Register_File.\Memory_reg[5][0].SI;  pinInvFromLatch = no;  Latch Index = 10429;  Latch Name = U0_Register_File.\Memory_reg[5][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][1] .SI = part_S_CR_11_TM_1 [7] ,   // CR = 11;  pos = 13;  Pin Index = 32337;  Pin Name = U0_Register_File.\Memory_reg[5][1].SI;  pinInvFromLatch = no;  Latch Index = 10464;  Latch Name = U0_Register_File.\Memory_reg[5][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][2] .SI = part_S_CR_11_TM_1 [6] ,   // CR = 11;  pos = 14;  Pin Index = 32443;  Pin Name = U0_Register_File.\Memory_reg[5][2].SI;  pinInvFromLatch = no;  Latch Index = 10499;  Latch Name = U0_Register_File.\Memory_reg[5][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][3] .SI = part_S_CR_11_TM_1 [5] ,   // CR = 11;  pos = 15;  Pin Index = 32549;  Pin Name = U0_Register_File.\Memory_reg[5][3].SI;  pinInvFromLatch = no;  Latch Index = 10534;  Latch Name = U0_Register_File.\Memory_reg[5][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][4] .SI = part_S_CR_11_TM_1 [4] ,   // CR = 11;  pos = 16;  Pin Index = 32655;  Pin Name = U0_Register_File.\Memory_reg[5][4].SI;  pinInvFromLatch = no;  Latch Index = 10569;  Latch Name = U0_Register_File.\Memory_reg[5][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][5] .SI = part_S_CR_11_TM_1 [3] ,   // CR = 11;  pos = 17;  Pin Index = 32761;  Pin Name = U0_Register_File.\Memory_reg[5][5].SI;  pinInvFromLatch = no;  Latch Index = 10604;  Latch Name = U0_Register_File.\Memory_reg[5][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][6] .SI = part_S_CR_11_TM_1 [2] ,   // CR = 11;  pos = 18;  Pin Index = 32867;  Pin Name = U0_Register_File.\Memory_reg[5][6].SI;  pinInvFromLatch = no;  Latch Index = 10639;  Latch Name = U0_Register_File.\Memory_reg[5][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[5][7] .SI = part_S_CR_11_TM_1 [1] ;   // CR = 11;  pos = 19;  Pin Index = 32973;  Pin Name = U0_Register_File.\Memory_reg[5][7].SI;  pinInvFromLatch = no;  Latch Index = 10674;  Latch Name = U0_Register_File.\Memory_reg[5][7].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 12 
    TOP_inst.ScanIn_12 = part_S_CR_12_TM_1 [19] ,   // CR = 12;  pos = 1;  Pin Index = 6;  Pin Name = ScanIn_12;  pinInvFromLatch = no;  Latch Index = 10709;  Latch Name = U0_Register_File.\Memory_reg[6][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][1] .SI = part_S_CR_12_TM_1 [18] ,   // CR = 12;  pos = 2;  Pin Index = 33185;  Pin Name = U0_Register_File.\Memory_reg[6][1].SI;  pinInvFromLatch = no;  Latch Index = 10744;  Latch Name = U0_Register_File.\Memory_reg[6][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][2] .SI = part_S_CR_12_TM_1 [17] ,   // CR = 12;  pos = 3;  Pin Index = 33291;  Pin Name = U0_Register_File.\Memory_reg[6][2].SI;  pinInvFromLatch = no;  Latch Index = 10779;  Latch Name = U0_Register_File.\Memory_reg[6][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][3] .SI = part_S_CR_12_TM_1 [16] ,   // CR = 12;  pos = 4;  Pin Index = 33397;  Pin Name = U0_Register_File.\Memory_reg[6][3].SI;  pinInvFromLatch = no;  Latch Index = 10814;  Latch Name = U0_Register_File.\Memory_reg[6][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][4] .SI = part_S_CR_12_TM_1 [15] ,   // CR = 12;  pos = 5;  Pin Index = 33503;  Pin Name = U0_Register_File.\Memory_reg[6][4].SI;  pinInvFromLatch = no;  Latch Index = 10849;  Latch Name = U0_Register_File.\Memory_reg[6][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][5] .SI = part_S_CR_12_TM_1 [14] ,   // CR = 12;  pos = 6;  Pin Index = 33609;  Pin Name = U0_Register_File.\Memory_reg[6][5].SI;  pinInvFromLatch = no;  Latch Index = 10884;  Latch Name = U0_Register_File.\Memory_reg[6][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][6] .SI = part_S_CR_12_TM_1 [13] ,   // CR = 12;  pos = 7;  Pin Index = 33715;  Pin Name = U0_Register_File.\Memory_reg[6][6].SI;  pinInvFromLatch = no;  Latch Index = 10919;  Latch Name = U0_Register_File.\Memory_reg[6][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[6][7] .SI = part_S_CR_12_TM_1 [12] ,   // CR = 12;  pos = 8;  Pin Index = 33821;  Pin Name = U0_Register_File.\Memory_reg[6][7].SI;  pinInvFromLatch = no;  Latch Index = 10954;  Latch Name = U0_Register_File.\Memory_reg[6][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][0] .SI = part_S_CR_12_TM_1 [11] ,   // CR = 12;  pos = 9;  Pin Index = 33927;  Pin Name = U0_Register_File.\Memory_reg[7][0].SI;  pinInvFromLatch = no;  Latch Index = 10989;  Latch Name = U0_Register_File.\Memory_reg[7][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][1] .SI = part_S_CR_12_TM_1 [10] ,   // CR = 12;  pos = 10;  Pin Index = 34033;  Pin Name = U0_Register_File.\Memory_reg[7][1].SI;  pinInvFromLatch = no;  Latch Index = 11024;  Latch Name = U0_Register_File.\Memory_reg[7][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][2] .SI = part_S_CR_12_TM_1 [9] ,   // CR = 12;  pos = 11;  Pin Index = 34139;  Pin Name = U0_Register_File.\Memory_reg[7][2].SI;  pinInvFromLatch = no;  Latch Index = 11059;  Latch Name = U0_Register_File.\Memory_reg[7][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][3] .SI = part_S_CR_12_TM_1 [8] ,   // CR = 12;  pos = 12;  Pin Index = 34245;  Pin Name = U0_Register_File.\Memory_reg[7][3].SI;  pinInvFromLatch = no;  Latch Index = 11094;  Latch Name = U0_Register_File.\Memory_reg[7][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][4] .SI = part_S_CR_12_TM_1 [7] ,   // CR = 12;  pos = 13;  Pin Index = 34351;  Pin Name = U0_Register_File.\Memory_reg[7][4].SI;  pinInvFromLatch = no;  Latch Index = 11129;  Latch Name = U0_Register_File.\Memory_reg[7][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][5] .SI = part_S_CR_12_TM_1 [6] ,   // CR = 12;  pos = 14;  Pin Index = 34457;  Pin Name = U0_Register_File.\Memory_reg[7][5].SI;  pinInvFromLatch = no;  Latch Index = 11164;  Latch Name = U0_Register_File.\Memory_reg[7][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][6] .SI = part_S_CR_12_TM_1 [5] ,   // CR = 12;  pos = 15;  Pin Index = 34563;  Pin Name = U0_Register_File.\Memory_reg[7][6].SI;  pinInvFromLatch = no;  Latch Index = 11199;  Latch Name = U0_Register_File.\Memory_reg[7][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[7][7] .SI = part_S_CR_12_TM_1 [4] ,   // CR = 12;  pos = 16;  Pin Index = 34669;  Pin Name = U0_Register_File.\Memory_reg[7][7].SI;  pinInvFromLatch = no;  Latch Index = 11234;  Latch Name = U0_Register_File.\Memory_reg[7][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][0] .SI = part_S_CR_12_TM_1 [3] ,   // CR = 12;  pos = 17;  Pin Index = 34775;  Pin Name = U0_Register_File.\Memory_reg[8][0].SI;  pinInvFromLatch = no;  Latch Index = 11269;  Latch Name = U0_Register_File.\Memory_reg[8][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][1] .SI = part_S_CR_12_TM_1 [2] ,   // CR = 12;  pos = 18;  Pin Index = 34881;  Pin Name = U0_Register_File.\Memory_reg[8][1].SI;  pinInvFromLatch = no;  Latch Index = 11304;  Latch Name = U0_Register_File.\Memory_reg[8][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][2] .SI = part_S_CR_12_TM_1 [1] ;   // CR = 12;  pos = 19;  Pin Index = 34987;  Pin Name = U0_Register_File.\Memory_reg[8][2].SI;  pinInvFromLatch = no;  Latch Index = 11339;  Latch Name = U0_Register_File.\Memory_reg[8][2].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 13 
    TOP_inst.ScanIn_13 = part_S_CR_13_TM_1 [17] ,   // CR = 13;  pos = 1;  Pin Index = 7;  Pin Name = ScanIn_13;  pinInvFromLatch = no;  Latch Index = 15792;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2] .SI = part_S_CR_13_TM_1 [16] ,   // CR = 13;  pos = 2;  Pin Index = 49305;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 15827;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3] .SI = part_S_CR_13_TM_1 [15] ,   // CR = 13;  pos = 3;  Pin Index = 49411;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 15862;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0] .SI = part_S_CR_13_TM_1 [14] ,   // CR = 13;  pos = 4;  Pin Index = 49517;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 15897;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1] .SI = part_S_CR_13_TM_1 [13] ,   // CR = 13;  pos = 5;  Pin Index = 49623;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 15932;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2] .SI = part_S_CR_13_TM_1 [12] ,   // CR = 13;  pos = 6;  Pin Index = 49729;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 15967;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3] .SI = part_S_CR_13_TM_1 [11] ,   // CR = 13;  pos = 7;  Pin Index = 49835;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 16002;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4] .SI = part_S_CR_13_TM_1 [10] ,   // CR = 13;  pos = 8;  Pin Index = 49941;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 16037;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_8.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_13_TM_1 [9] ,   // CR = 13;  pos = 9;  Pin Index = 50645;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_8.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 16250;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_8.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_12.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_13_TM_1 [8] ,   // CR = 13;  pos = 10;  Pin Index = 50505;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_12.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 16205;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_12.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.SI = part_S_CR_13_TM_1 [7] ,   // CR = 13;  pos = 11;  Pin Index = 51047;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.SI;  pinInvFromLatch = no;  Latch Index = 16396;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.parity_reg.SI = part_S_CR_13_TM_1 [6] ,   // CR = 13;  pos = 12;  Pin Index = 51153;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.SI;  pinInvFromLatch = no;  Latch Index = 16431;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.SI = part_S_CR_13_TM_1 [5] ,   // CR = 13;  pos = 13;  Pin Index = 51480;  Pin Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.SI;  pinInvFromLatch = no;  Latch Index = 16536;  Latch Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_strt_check.DFT_tpi_xor_tree_1.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_13_TM_1 [4] ,   // CR = 13;  pos = 14;  Pin Index = 51630;  Pin Name = U0_UART.U0_UART_RX.U0_strt_check.DFT_tpi_xor_tree_1.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 16565;  Latch Name = U0_UART.U0_UART_RX.U0_strt_check.DFT_tpi_xor_tree_1.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.SI = part_S_CR_13_TM_1 [3] ,   // CR = 13;  pos = 15;  Pin Index = 51964;  Pin Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.SI;  pinInvFromLatch = no;  Latch Index = 16687;  Latch Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_FSM.DFT_tpi_xor_tree_13.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_13_TM_1 [2] ,   // CR = 13;  pos = 16;  Pin Index = 52142;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.DFT_tpi_xor_tree_13.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 16717;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.DFT_tpi_xor_tree_13.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0] .SI = part_S_CR_13_TM_1 [1] ;   // CR = 13;  pos = 17;  Pin Index = 52274;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 16771;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 14 
    TOP_inst.ScanIn_14 = part_S_CR_14_TM_1 [19] ,   // CR = 14;  pos = 1;  Pin Index = 8;  Pin Name = ScanIn_14;  pinInvFromLatch = no;  Latch Index = 11374;  Latch Name = U0_Register_File.\Memory_reg[8][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][4] .SI = part_S_CR_14_TM_1 [18] ,   // CR = 14;  pos = 2;  Pin Index = 35199;  Pin Name = U0_Register_File.\Memory_reg[8][4].SI;  pinInvFromLatch = no;  Latch Index = 11409;  Latch Name = U0_Register_File.\Memory_reg[8][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][5] .SI = part_S_CR_14_TM_1 [17] ,   // CR = 14;  pos = 3;  Pin Index = 35305;  Pin Name = U0_Register_File.\Memory_reg[8][5].SI;  pinInvFromLatch = no;  Latch Index = 11444;  Latch Name = U0_Register_File.\Memory_reg[8][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][6] .SI = part_S_CR_14_TM_1 [16] ,   // CR = 14;  pos = 4;  Pin Index = 35411;  Pin Name = U0_Register_File.\Memory_reg[8][6].SI;  pinInvFromLatch = no;  Latch Index = 11479;  Latch Name = U0_Register_File.\Memory_reg[8][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[8][7] .SI = part_S_CR_14_TM_1 [15] ,   // CR = 14;  pos = 5;  Pin Index = 35517;  Pin Name = U0_Register_File.\Memory_reg[8][7].SI;  pinInvFromLatch = no;  Latch Index = 11514;  Latch Name = U0_Register_File.\Memory_reg[8][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][0] .SI = part_S_CR_14_TM_1 [14] ,   // CR = 14;  pos = 6;  Pin Index = 35623;  Pin Name = U0_Register_File.\Memory_reg[9][0].SI;  pinInvFromLatch = no;  Latch Index = 11549;  Latch Name = U0_Register_File.\Memory_reg[9][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][1] .SI = part_S_CR_14_TM_1 [13] ,   // CR = 14;  pos = 7;  Pin Index = 35729;  Pin Name = U0_Register_File.\Memory_reg[9][1].SI;  pinInvFromLatch = no;  Latch Index = 11584;  Latch Name = U0_Register_File.\Memory_reg[9][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][2] .SI = part_S_CR_14_TM_1 [12] ,   // CR = 14;  pos = 8;  Pin Index = 35835;  Pin Name = U0_Register_File.\Memory_reg[9][2].SI;  pinInvFromLatch = no;  Latch Index = 11619;  Latch Name = U0_Register_File.\Memory_reg[9][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][3] .SI = part_S_CR_14_TM_1 [11] ,   // CR = 14;  pos = 9;  Pin Index = 35941;  Pin Name = U0_Register_File.\Memory_reg[9][3].SI;  pinInvFromLatch = no;  Latch Index = 11654;  Latch Name = U0_Register_File.\Memory_reg[9][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][4] .SI = part_S_CR_14_TM_1 [10] ,   // CR = 14;  pos = 10;  Pin Index = 36047;  Pin Name = U0_Register_File.\Memory_reg[9][4].SI;  pinInvFromLatch = no;  Latch Index = 11689;  Latch Name = U0_Register_File.\Memory_reg[9][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][5] .SI = part_S_CR_14_TM_1 [9] ,   // CR = 14;  pos = 11;  Pin Index = 36153;  Pin Name = U0_Register_File.\Memory_reg[9][5].SI;  pinInvFromLatch = no;  Latch Index = 11724;  Latch Name = U0_Register_File.\Memory_reg[9][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][6] .SI = part_S_CR_14_TM_1 [8] ,   // CR = 14;  pos = 12;  Pin Index = 36259;  Pin Name = U0_Register_File.\Memory_reg[9][6].SI;  pinInvFromLatch = no;  Latch Index = 11759;  Latch Name = U0_Register_File.\Memory_reg[9][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[9][7] .SI = part_S_CR_14_TM_1 [7] ,   // CR = 14;  pos = 13;  Pin Index = 36365;  Pin Name = U0_Register_File.\Memory_reg[9][7].SI;  pinInvFromLatch = no;  Latch Index = 11794;  Latch Name = U0_Register_File.\Memory_reg[9][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][0] .SI = part_S_CR_14_TM_1 [6] ,   // CR = 14;  pos = 14;  Pin Index = 23760;  Pin Name = U0_Register_File.\Memory_reg[10][0].SI;  pinInvFromLatch = no;  Latch Index = 7632;  Latch Name = U0_Register_File.\Memory_reg[10][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][1] .SI = part_S_CR_14_TM_1 [5] ,   // CR = 14;  pos = 15;  Pin Index = 23866;  Pin Name = U0_Register_File.\Memory_reg[10][1].SI;  pinInvFromLatch = no;  Latch Index = 7667;  Latch Name = U0_Register_File.\Memory_reg[10][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][2] .SI = part_S_CR_14_TM_1 [4] ,   // CR = 14;  pos = 16;  Pin Index = 23972;  Pin Name = U0_Register_File.\Memory_reg[10][2].SI;  pinInvFromLatch = no;  Latch Index = 7702;  Latch Name = U0_Register_File.\Memory_reg[10][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][3] .SI = part_S_CR_14_TM_1 [3] ,   // CR = 14;  pos = 17;  Pin Index = 24078;  Pin Name = U0_Register_File.\Memory_reg[10][3].SI;  pinInvFromLatch = no;  Latch Index = 7737;  Latch Name = U0_Register_File.\Memory_reg[10][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][4] .SI = part_S_CR_14_TM_1 [2] ,   // CR = 14;  pos = 18;  Pin Index = 24184;  Pin Name = U0_Register_File.\Memory_reg[10][4].SI;  pinInvFromLatch = no;  Latch Index = 7772;  Latch Name = U0_Register_File.\Memory_reg[10][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][5] .SI = part_S_CR_14_TM_1 [1] ;   // CR = 14;  pos = 19;  Pin Index = 24290;  Pin Name = U0_Register_File.\Memory_reg[10][5].SI;  pinInvFromLatch = no;  Latch Index = 7807;  Latch Name = U0_Register_File.\Memory_reg[10][5].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 15 
    TOP_inst.ScanIn_15 = part_S_CR_15_TM_1 [19] ,   // CR = 15;  pos = 1;  Pin Index = 9;  Pin Name = ScanIn_15;  pinInvFromLatch = no;  Latch Index = 7842;  Latch Name = U0_Register_File.\Memory_reg[10][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[10][7] .SI = part_S_CR_15_TM_1 [18] ,   // CR = 15;  pos = 2;  Pin Index = 24502;  Pin Name = U0_Register_File.\Memory_reg[10][7].SI;  pinInvFromLatch = no;  Latch Index = 7877;  Latch Name = U0_Register_File.\Memory_reg[10][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][0] .SI = part_S_CR_15_TM_1 [17] ,   // CR = 15;  pos = 3;  Pin Index = 24608;  Pin Name = U0_Register_File.\Memory_reg[11][0].SI;  pinInvFromLatch = no;  Latch Index = 7912;  Latch Name = U0_Register_File.\Memory_reg[11][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][1] .SI = part_S_CR_15_TM_1 [16] ,   // CR = 15;  pos = 4;  Pin Index = 24714;  Pin Name = U0_Register_File.\Memory_reg[11][1].SI;  pinInvFromLatch = no;  Latch Index = 7947;  Latch Name = U0_Register_File.\Memory_reg[11][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][2] .SI = part_S_CR_15_TM_1 [15] ,   // CR = 15;  pos = 5;  Pin Index = 24820;  Pin Name = U0_Register_File.\Memory_reg[11][2].SI;  pinInvFromLatch = no;  Latch Index = 7982;  Latch Name = U0_Register_File.\Memory_reg[11][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][3] .SI = part_S_CR_15_TM_1 [14] ,   // CR = 15;  pos = 6;  Pin Index = 24926;  Pin Name = U0_Register_File.\Memory_reg[11][3].SI;  pinInvFromLatch = no;  Latch Index = 8017;  Latch Name = U0_Register_File.\Memory_reg[11][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][4] .SI = part_S_CR_15_TM_1 [13] ,   // CR = 15;  pos = 7;  Pin Index = 25032;  Pin Name = U0_Register_File.\Memory_reg[11][4].SI;  pinInvFromLatch = no;  Latch Index = 8052;  Latch Name = U0_Register_File.\Memory_reg[11][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][5] .SI = part_S_CR_15_TM_1 [12] ,   // CR = 15;  pos = 8;  Pin Index = 25138;  Pin Name = U0_Register_File.\Memory_reg[11][5].SI;  pinInvFromLatch = no;  Latch Index = 8087;  Latch Name = U0_Register_File.\Memory_reg[11][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][6] .SI = part_S_CR_15_TM_1 [11] ,   // CR = 15;  pos = 9;  Pin Index = 25244;  Pin Name = U0_Register_File.\Memory_reg[11][6].SI;  pinInvFromLatch = no;  Latch Index = 8122;  Latch Name = U0_Register_File.\Memory_reg[11][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[11][7] .SI = part_S_CR_15_TM_1 [10] ,   // CR = 15;  pos = 10;  Pin Index = 25350;  Pin Name = U0_Register_File.\Memory_reg[11][7].SI;  pinInvFromLatch = no;  Latch Index = 8157;  Latch Name = U0_Register_File.\Memory_reg[11][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][0] .SI = part_S_CR_15_TM_1 [9] ,   // CR = 15;  pos = 11;  Pin Index = 25456;  Pin Name = U0_Register_File.\Memory_reg[12][0].SI;  pinInvFromLatch = no;  Latch Index = 8192;  Latch Name = U0_Register_File.\Memory_reg[12][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][1] .SI = part_S_CR_15_TM_1 [8] ,   // CR = 15;  pos = 12;  Pin Index = 25562;  Pin Name = U0_Register_File.\Memory_reg[12][1].SI;  pinInvFromLatch = no;  Latch Index = 8227;  Latch Name = U0_Register_File.\Memory_reg[12][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][2] .SI = part_S_CR_15_TM_1 [7] ,   // CR = 15;  pos = 13;  Pin Index = 25668;  Pin Name = U0_Register_File.\Memory_reg[12][2].SI;  pinInvFromLatch = no;  Latch Index = 8262;  Latch Name = U0_Register_File.\Memory_reg[12][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][3] .SI = part_S_CR_15_TM_1 [6] ,   // CR = 15;  pos = 14;  Pin Index = 25774;  Pin Name = U0_Register_File.\Memory_reg[12][3].SI;  pinInvFromLatch = no;  Latch Index = 8297;  Latch Name = U0_Register_File.\Memory_reg[12][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][4] .SI = part_S_CR_15_TM_1 [5] ,   // CR = 15;  pos = 15;  Pin Index = 25880;  Pin Name = U0_Register_File.\Memory_reg[12][4].SI;  pinInvFromLatch = no;  Latch Index = 8332;  Latch Name = U0_Register_File.\Memory_reg[12][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][5] .SI = part_S_CR_15_TM_1 [4] ,   // CR = 15;  pos = 16;  Pin Index = 25986;  Pin Name = U0_Register_File.\Memory_reg[12][5].SI;  pinInvFromLatch = no;  Latch Index = 8367;  Latch Name = U0_Register_File.\Memory_reg[12][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][6] .SI = part_S_CR_15_TM_1 [3] ,   // CR = 15;  pos = 17;  Pin Index = 26092;  Pin Name = U0_Register_File.\Memory_reg[12][6].SI;  pinInvFromLatch = no;  Latch Index = 8402;  Latch Name = U0_Register_File.\Memory_reg[12][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[12][7] .SI = part_S_CR_15_TM_1 [2] ,   // CR = 15;  pos = 18;  Pin Index = 26198;  Pin Name = U0_Register_File.\Memory_reg[12][7].SI;  pinInvFromLatch = no;  Latch Index = 8437;  Latch Name = U0_Register_File.\Memory_reg[12][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][0] .SI = part_S_CR_15_TM_1 [1] ;   // CR = 15;  pos = 19;  Pin Index = 26304;  Pin Name = U0_Register_File.\Memory_reg[13][0].SI;  pinInvFromLatch = no;  Latch Index = 8472;  Latch Name = U0_Register_File.\Memory_reg[13][0].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 16 
    TOP_inst.ScanIn_16 = part_S_CR_16_TM_1 [17] ,   // CR = 16;  pos = 1;  Pin Index = 10;  Pin Name = ScanIn_16;  pinInvFromLatch = no;  Latch Index = 16806;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2] .SI = part_S_CR_16_TM_1 [16] ,   // CR = 16;  pos = 2;  Pin Index = 52486;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 16841;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0] .SI = part_S_CR_16_TM_1 [15] ,   // CR = 16;  pos = 3;  Pin Index = 52770;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 16932;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1] .SI = part_S_CR_16_TM_1 [14] ,   // CR = 16;  pos = 4;  Pin Index = 52876;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 16967;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2] .SI = part_S_CR_16_TM_1 [13] ,   // CR = 16;  pos = 5;  Pin Index = 52982;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 17002;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3] .SI = part_S_CR_16_TM_1 [12] ,   // CR = 16;  pos = 6;  Pin Index = 53088;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 17037;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4] .SI = part_S_CR_16_TM_1 [11] ,   // CR = 16;  pos = 7;  Pin Index = 53194;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 17072;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5] .SI = part_S_CR_16_TM_1 [10] ,   // CR = 16;  pos = 8;  Pin Index = 53300;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 17107;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6] .SI = part_S_CR_16_TM_1 [9] ,   // CR = 16;  pos = 9;  Pin Index = 53406;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 17142;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7] .SI = part_S_CR_16_TM_1 [8] ,   // CR = 16;  pos = 10;  Pin Index = 53512;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 17177;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.SI = part_S_CR_16_TM_1 [7] ,   // CR = 16;  pos = 11;  Pin Index = 53818;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.SI;  pinInvFromLatch = no;  Latch Index = 17266;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0] .SI = part_S_CR_16_TM_1 [6] ,   // CR = 16;  pos = 12;  Pin Index = 53922;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 17301;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1] .SI = part_S_CR_16_TM_1 [5] ,   // CR = 16;  pos = 13;  Pin Index = 54028;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 17336;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2] .SI = part_S_CR_16_TM_1 [4] ,   // CR = 16;  pos = 14;  Pin Index = 54134;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 17371;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3] .SI = part_S_CR_16_TM_1 [3] ,   // CR = 16;  pos = 15;  Pin Index = 54240;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 17406;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0] .SI = part_S_CR_16_TM_1 [2] ,   // CR = 16;  pos = 16;  Pin Index = 54346;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 17441;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1] .SI = part_S_CR_16_TM_1 [1] ;   // CR = 16;  pos = 17;  Pin Index = 54452;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 17476;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 17 
    TOP_inst.ScanIn_17 = part_S_CR_17_TM_1 [19] ,   // CR = 17;  pos = 1;  Pin Index = 11;  Pin Name = ScanIn_17;  pinInvFromLatch = no;  Latch Index = 8507;  Latch Name = U0_Register_File.\Memory_reg[13][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][2] .SI = part_S_CR_17_TM_1 [18] ,   // CR = 17;  pos = 2;  Pin Index = 26516;  Pin Name = U0_Register_File.\Memory_reg[13][2].SI;  pinInvFromLatch = no;  Latch Index = 8542;  Latch Name = U0_Register_File.\Memory_reg[13][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][3] .SI = part_S_CR_17_TM_1 [17] ,   // CR = 17;  pos = 3;  Pin Index = 26622;  Pin Name = U0_Register_File.\Memory_reg[13][3].SI;  pinInvFromLatch = no;  Latch Index = 8577;  Latch Name = U0_Register_File.\Memory_reg[13][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][4] .SI = part_S_CR_17_TM_1 [16] ,   // CR = 17;  pos = 4;  Pin Index = 26728;  Pin Name = U0_Register_File.\Memory_reg[13][4].SI;  pinInvFromLatch = no;  Latch Index = 8612;  Latch Name = U0_Register_File.\Memory_reg[13][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][5] .SI = part_S_CR_17_TM_1 [15] ,   // CR = 17;  pos = 5;  Pin Index = 26834;  Pin Name = U0_Register_File.\Memory_reg[13][5].SI;  pinInvFromLatch = no;  Latch Index = 8647;  Latch Name = U0_Register_File.\Memory_reg[13][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][6] .SI = part_S_CR_17_TM_1 [14] ,   // CR = 17;  pos = 6;  Pin Index = 26940;  Pin Name = U0_Register_File.\Memory_reg[13][6].SI;  pinInvFromLatch = no;  Latch Index = 8682;  Latch Name = U0_Register_File.\Memory_reg[13][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[13][7] .SI = part_S_CR_17_TM_1 [13] ,   // CR = 17;  pos = 7;  Pin Index = 27046;  Pin Name = U0_Register_File.\Memory_reg[13][7].SI;  pinInvFromLatch = no;  Latch Index = 8717;  Latch Name = U0_Register_File.\Memory_reg[13][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][0] .SI = part_S_CR_17_TM_1 [12] ,   // CR = 17;  pos = 8;  Pin Index = 27152;  Pin Name = U0_Register_File.\Memory_reg[14][0].SI;  pinInvFromLatch = no;  Latch Index = 8752;  Latch Name = U0_Register_File.\Memory_reg[14][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][1] .SI = part_S_CR_17_TM_1 [11] ,   // CR = 17;  pos = 9;  Pin Index = 27258;  Pin Name = U0_Register_File.\Memory_reg[14][1].SI;  pinInvFromLatch = no;  Latch Index = 8787;  Latch Name = U0_Register_File.\Memory_reg[14][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][2] .SI = part_S_CR_17_TM_1 [10] ,   // CR = 17;  pos = 10;  Pin Index = 27364;  Pin Name = U0_Register_File.\Memory_reg[14][2].SI;  pinInvFromLatch = no;  Latch Index = 8822;  Latch Name = U0_Register_File.\Memory_reg[14][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][3] .SI = part_S_CR_17_TM_1 [9] ,   // CR = 17;  pos = 11;  Pin Index = 27470;  Pin Name = U0_Register_File.\Memory_reg[14][3].SI;  pinInvFromLatch = no;  Latch Index = 8857;  Latch Name = U0_Register_File.\Memory_reg[14][3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][4] .SI = part_S_CR_17_TM_1 [8] ,   // CR = 17;  pos = 12;  Pin Index = 27576;  Pin Name = U0_Register_File.\Memory_reg[14][4].SI;  pinInvFromLatch = no;  Latch Index = 8892;  Latch Name = U0_Register_File.\Memory_reg[14][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][5] .SI = part_S_CR_17_TM_1 [7] ,   // CR = 17;  pos = 13;  Pin Index = 27682;  Pin Name = U0_Register_File.\Memory_reg[14][5].SI;  pinInvFromLatch = no;  Latch Index = 8927;  Latch Name = U0_Register_File.\Memory_reg[14][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][6] .SI = part_S_CR_17_TM_1 [6] ,   // CR = 17;  pos = 14;  Pin Index = 27788;  Pin Name = U0_Register_File.\Memory_reg[14][6].SI;  pinInvFromLatch = no;  Latch Index = 8962;  Latch Name = U0_Register_File.\Memory_reg[14][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[14][7] .SI = part_S_CR_17_TM_1 [5] ,   // CR = 17;  pos = 15;  Pin Index = 27894;  Pin Name = U0_Register_File.\Memory_reg[14][7].SI;  pinInvFromLatch = no;  Latch Index = 8997;  Latch Name = U0_Register_File.\Memory_reg[14][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][0] .SI = part_S_CR_17_TM_1 [4] ,   // CR = 17;  pos = 16;  Pin Index = 28000;  Pin Name = U0_Register_File.\Memory_reg[15][0].SI;  pinInvFromLatch = no;  Latch Index = 9032;  Latch Name = U0_Register_File.\Memory_reg[15][0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][1] .SI = part_S_CR_17_TM_1 [3] ,   // CR = 17;  pos = 17;  Pin Index = 28106;  Pin Name = U0_Register_File.\Memory_reg[15][1].SI;  pinInvFromLatch = no;  Latch Index = 9067;  Latch Name = U0_Register_File.\Memory_reg[15][1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][2] .SI = part_S_CR_17_TM_1 [2] ,   // CR = 17;  pos = 18;  Pin Index = 28212;  Pin Name = U0_Register_File.\Memory_reg[15][2].SI;  pinInvFromLatch = no;  Latch Index = 9102;  Latch Name = U0_Register_File.\Memory_reg[15][2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][3] .SI = part_S_CR_17_TM_1 [1] ;   // CR = 17;  pos = 19;  Pin Index = 28318;  Pin Name = U0_Register_File.\Memory_reg[15][3].SI;  pinInvFromLatch = no;  Latch Index = 9137;  Latch Name = U0_Register_File.\Memory_reg[15][3].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 18 
    TOP_inst.ScanIn_18 = part_S_CR_18_TM_1 [19] ,   // CR = 18;  pos = 1;  Pin Index = 12;  Pin Name = ScanIn_18;  pinInvFromLatch = no;  Latch Index = 9172;  Latch Name = U0_Register_File.\Memory_reg[15][4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][5] .SI = part_S_CR_18_TM_1 [18] ,   // CR = 18;  pos = 2;  Pin Index = 28530;  Pin Name = U0_Register_File.\Memory_reg[15][5].SI;  pinInvFromLatch = no;  Latch Index = 9207;  Latch Name = U0_Register_File.\Memory_reg[15][5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][6] .SI = part_S_CR_18_TM_1 [17] ,   // CR = 18;  pos = 3;  Pin Index = 28636;  Pin Name = U0_Register_File.\Memory_reg[15][6].SI;  pinInvFromLatch = no;  Latch Index = 9242;  Latch Name = U0_Register_File.\Memory_reg[15][6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\Memory_reg[15][7] .SI = part_S_CR_18_TM_1 [16] ,   // CR = 18;  pos = 4;  Pin Index = 28742;  Pin Name = U0_Register_File.\Memory_reg[15][7].SI;  pinInvFromLatch = no;  Latch Index = 9277;  Latch Name = U0_Register_File.\Memory_reg[15][7].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.RdData_Valid_reg.SI = part_S_CR_18_TM_1 [15] ,   // CR = 18;  pos = 5;  Pin Index = 22806;  Pin Name = U0_Register_File.RdData_Valid_reg.SI;  pinInvFromLatch = no;  Latch Index = 7317;  Latch Name = U0_Register_File.RdData_Valid_reg.__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[0] .SI = part_S_CR_18_TM_1 [14] ,   // CR = 18;  pos = 6;  Pin Index = 36471;  Pin Name = U0_Register_File.\RdData_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 11829;  Latch Name = U0_Register_File.\RdData_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[1] .SI = part_S_CR_18_TM_1 [13] ,   // CR = 18;  pos = 7;  Pin Index = 36577;  Pin Name = U0_Register_File.\RdData_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 11864;  Latch Name = U0_Register_File.\RdData_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[2] .SI = part_S_CR_18_TM_1 [12] ,   // CR = 18;  pos = 8;  Pin Index = 36683;  Pin Name = U0_Register_File.\RdData_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 11899;  Latch Name = U0_Register_File.\RdData_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[3] .SI = part_S_CR_18_TM_1 [11] ,   // CR = 18;  pos = 9;  Pin Index = 36789;  Pin Name = U0_Register_File.\RdData_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 11934;  Latch Name = U0_Register_File.\RdData_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[4] .SI = part_S_CR_18_TM_1 [10] ,   // CR = 18;  pos = 10;  Pin Index = 36895;  Pin Name = U0_Register_File.\RdData_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 11969;  Latch Name = U0_Register_File.\RdData_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[5] .SI = part_S_CR_18_TM_1 [9] ,   // CR = 18;  pos = 11;  Pin Index = 37001;  Pin Name = U0_Register_File.\RdData_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 12004;  Latch Name = U0_Register_File.\RdData_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[6] .SI = part_S_CR_18_TM_1 [8] ,   // CR = 18;  pos = 12;  Pin Index = 37107;  Pin Name = U0_Register_File.\RdData_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 12039;  Latch Name = U0_Register_File.\RdData_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_Register_File.\RdData_reg[7] .SI = part_S_CR_18_TM_1 [7] ,   // CR = 18;  pos = 13;  Pin Index = 37213;  Pin Name = U0_Register_File.\RdData_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 12074;  Latch Name = U0_Register_File.\RdData_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.DFT_tpi_xor_tree_16.DFT_CDNS_OBS_tpi_flop.SI = part_S_CR_18_TM_1 [6] ,   // CR = 18;  pos = 14;  Pin Index = 40723;  Pin Name = U0_SYS_CTRL.DFT_tpi_xor_tree_16.DFT_CDNS_OBS_tpi_flop.SI;  pinInvFromLatch = no;  Latch Index = 13061;  Latch Name = U0_SYS_CTRL.DFT_tpi_xor_tree_16.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[0] .SI = part_S_CR_18_TM_1 [5] ,   // CR = 18;  pos = 15;  Pin Index = 40819;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 13103;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[1] .SI = part_S_CR_18_TM_1 [4] ,   // CR = 18;  pos = 16;  Pin Index = 40925;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 13138;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[2] .SI = part_S_CR_18_TM_1 [3] ,   // CR = 18;  pos = 17;  Pin Index = 41031;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 13173;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[3] .SI = part_S_CR_18_TM_1 [2] ,   // CR = 18;  pos = 18;  Pin Index = 41137;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 13208;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[0] .SI = part_S_CR_18_TM_1 [1] ;   // CR = 18;  pos = 19;  Pin Index = 41243;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 13243;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[0].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 19 
    TOP_inst.ScanIn_19 = part_S_CR_19_TM_1 [19] ,   // CR = 19;  pos = 1;  Pin Index = 13;  Pin Name = ScanIn_19;  pinInvFromLatch = no;  Latch Index = 13488;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[2] .SI = part_S_CR_19_TM_1 [18] ,   // CR = 19;  pos = 2;  Pin Index = 42091;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 13523;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[3] .SI = part_S_CR_19_TM_1 [17] ,   // CR = 19;  pos = 3;  Pin Index = 42197;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 13558;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[4] .SI = part_S_CR_19_TM_1 [16] ,   // CR = 19;  pos = 4;  Pin Index = 42303;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 13593;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[5] .SI = part_S_CR_19_TM_1 [15] ,   // CR = 19;  pos = 5;  Pin Index = 42409;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 13628;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[6] .SI = part_S_CR_19_TM_1 [14] ,   // CR = 19;  pos = 6;  Pin Index = 42515;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 13663;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[7] .SI = part_S_CR_19_TM_1 [13] ,   // CR = 19;  pos = 7;  Pin Index = 42621;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 13698;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[8] .SI = part_S_CR_19_TM_1 [12] ,   // CR = 19;  pos = 8;  Pin Index = 42727;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].SI;  pinInvFromLatch = no;  Latch Index = 13733;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[9] .SI = part_S_CR_19_TM_1 [11] ,   // CR = 19;  pos = 9;  Pin Index = 42833;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].SI;  pinInvFromLatch = no;  Latch Index = 13768;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[10] .SI = part_S_CR_19_TM_1 [10] ,   // CR = 19;  pos = 10;  Pin Index = 41349;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].SI;  pinInvFromLatch = no;  Latch Index = 13278;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[11] .SI = part_S_CR_19_TM_1 [9] ,   // CR = 19;  pos = 11;  Pin Index = 41455;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].SI;  pinInvFromLatch = no;  Latch Index = 13313;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[12] .SI = part_S_CR_19_TM_1 [8] ,   // CR = 19;  pos = 12;  Pin Index = 41561;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].SI;  pinInvFromLatch = no;  Latch Index = 13348;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[13] .SI = part_S_CR_19_TM_1 [7] ,   // CR = 19;  pos = 13;  Pin Index = 41667;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].SI;  pinInvFromLatch = no;  Latch Index = 13383;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[14] .SI = part_S_CR_19_TM_1 [6] ,   // CR = 19;  pos = 14;  Pin Index = 41773;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].SI;  pinInvFromLatch = no;  Latch Index = 13418;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[15] .SI = part_S_CR_19_TM_1 [5] ,   // CR = 19;  pos = 15;  Pin Index = 41879;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].SI;  pinInvFromLatch = no;  Latch Index = 13453;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[0] .SI = part_S_CR_19_TM_1 [4] ,   // CR = 19;  pos = 16;  Pin Index = 42939;  Pin Name = U0_SYS_CTRL.\current_state_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 13803;  Latch Name = U0_SYS_CTRL.\current_state_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[1] .SI = part_S_CR_19_TM_1 [3] ,   // CR = 19;  pos = 17;  Pin Index = 43045;  Pin Name = U0_SYS_CTRL.\current_state_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 13838;  Latch Name = U0_SYS_CTRL.\current_state_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[2] .SI = part_S_CR_19_TM_1 [2] ,   // CR = 19;  pos = 18;  Pin Index = 43151;  Pin Name = U0_SYS_CTRL.\current_state_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 13873;  Latch Name = U0_SYS_CTRL.\current_state_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_SYS_CTRL.\current_state_reg[3] .SI = part_S_CR_19_TM_1 [1] ;   // CR = 19;  pos = 19;  Pin Index = 43257;  Pin Name = U0_SYS_CTRL.\current_state_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 13908;  Latch Name = U0_SYS_CTRL.\current_state_reg[3].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 20 
    TOP_inst.ScanIn_20 = part_S_CR_20_TM_1 [17] ,   // CR = 20;  pos = 1;  Pin Index = 15;  Pin Name = ScanIn_20;  pinInvFromLatch = no;  Latch Index = 17511;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3] .SI = part_S_CR_20_TM_1 [16] ,   // CR = 20;  pos = 2;  Pin Index = 54664;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 17546;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4] .SI = part_S_CR_20_TM_1 [15] ,   // CR = 20;  pos = 3;  Pin Index = 54770;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 17581;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5] .SI = part_S_CR_20_TM_1 [14] ,   // CR = 20;  pos = 4;  Pin Index = 54876;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 17616;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6] .SI = part_S_CR_20_TM_1 [13] ,   // CR = 20;  pos = 5;  Pin Index = 54982;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 17651;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7] .SI = part_S_CR_20_TM_1 [12] ,   // CR = 20;  pos = 6;  Pin Index = 55088;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 17686;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    TOP_inst.U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.SI = part_S_CR_20_TM_1 [11] ,   // CR = 20;  pos = 7;  Pin Index = 55592;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.SI;  pinInvFromLatch = no;  Latch Index = 17855;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[0] .SI = part_S_CR_20_TM_1 [10] ,   // CR = 20;  pos = 8;  Pin Index = 55714;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 17891;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[1] .SI = part_S_CR_20_TM_1 [9] ,   // CR = 20;  pos = 9;  Pin Index = 55820;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 17926;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[2] .SI = part_S_CR_20_TM_1 [8] ,   // CR = 20;  pos = 10;  Pin Index = 55926;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 17961;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[3] .SI = part_S_CR_20_TM_1 [7] ,   // CR = 20;  pos = 11;  Pin Index = 56032;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 17996;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[4] .SI = part_S_CR_20_TM_1 [6] ,   // CR = 20;  pos = 12;  Pin Index = 56138;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 18031;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[5] .SI = part_S_CR_20_TM_1 [5] ,   // CR = 20;  pos = 13;  Pin Index = 56244;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 18066;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[6] .SI = part_S_CR_20_TM_1 [4] ,   // CR = 20;  pos = 14;  Pin Index = 56350;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 18101;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].__iNsT2.dff_primitive;   
    TOP_inst.U1_Integer_Clock_Divider_RX.gen_clk_reg.SI = part_S_CR_20_TM_1 [3] ,   // CR = 20;  pos = 15;  Pin Index = 56800;  Pin Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.SI;  pinInvFromLatch = no;  Latch Index = 18255;  Latch Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.__iNsT2.dff_primitive;   
    TOP_inst.U1_RST_SYNC_UART.\sync_reg_reg[0] .SI = part_S_CR_20_TM_1 [2] ,   // CR = 20;  pos = 16;  Pin Index = 56912;  Pin Name = U1_RST_SYNC_UART.\sync_reg_reg[0].SI;  pinInvFromLatch = no;  Latch Index = 18291;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    TOP_inst.U1_RST_SYNC_UART.\sync_reg_reg[1] .SI = part_S_CR_20_TM_1 [1] ;   // CR = 20;  pos = 17;  Pin Index = 57018;  Pin Name = U1_RST_SYNC_UART.\sync_reg_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 18326;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[1].__iNsT2.dff_primitive;   

  assign // OR = 1 
    part_M_OR_1_TM_1 [1] =  TOP_inst.ScanOut_1 ,   // OR = 1;  pos = 1;  Pin Index = 26;  Pin Name = ScanOut_1;  pinInvFromLatch = no;  Latch Index = 2224;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [2] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1] .Q ,   // OR = 1;  pos = 2;  Pin Index = 6886;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].Q;  pinInvFromLatch = no;  Latch Index = 2189;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [3] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0] .Q ,   // OR = 1;  pos = 3;  Pin Index = 6780;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 2154;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [4] =  TOP_inst.U0_ALU_16B.OUT_VALID_reg.Q ,   // OR = 1;  pos = 4;  Pin Index = 1815;  Pin Name = U0_ALU_16B.OUT_VALID_reg.Q;  pinInvFromLatch = no;  Latch Index = 558;  Latch Name = U0_ALU_16B.OUT_VALID_reg.__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [5] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[15] .Q ,   // OR = 1;  pos = 5;  Pin Index = 2557;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[15].Q;  pinInvFromLatch = no;  Latch Index = 803;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[15].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [6] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[14] .Q ,   // OR = 1;  pos = 6;  Pin Index = 2451;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[14].Q;  pinInvFromLatch = no;  Latch Index = 768;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[14].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [7] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[13] .Q ,   // OR = 1;  pos = 7;  Pin Index = 2345;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[13].Q;  pinInvFromLatch = no;  Latch Index = 733;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[13].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [8] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[12] .Q ,   // OR = 1;  pos = 8;  Pin Index = 2239;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[12].Q;  pinInvFromLatch = no;  Latch Index = 698;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[12].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [9] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[11] .Q ,   // OR = 1;  pos = 9;  Pin Index = 2133;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[11].Q;  pinInvFromLatch = no;  Latch Index = 663;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[11].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [10] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[10] .Q ,   // OR = 1;  pos = 10;  Pin Index = 2027;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[10].Q;  pinInvFromLatch = no;  Latch Index = 628;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[10].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [11] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[9] .Q ,   // OR = 1;  pos = 11;  Pin Index = 3511;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[9].Q;  pinInvFromLatch = no;  Latch Index = 1118;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[9].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [12] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[8] .Q ,   // OR = 1;  pos = 12;  Pin Index = 3405;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[8].Q;  pinInvFromLatch = no;  Latch Index = 1083;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[8].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [13] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[7] .Q ,   // OR = 1;  pos = 13;  Pin Index = 3299;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 1048;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [14] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[6] .Q ,   // OR = 1;  pos = 14;  Pin Index = 3193;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 1013;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [15] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[5] .Q ,   // OR = 1;  pos = 15;  Pin Index = 3087;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 978;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [16] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[4] .Q ,   // OR = 1;  pos = 16;  Pin Index = 2981;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 943;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [17] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[3] .Q ,   // OR = 1;  pos = 17;  Pin Index = 2875;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 908;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [18] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[2] .Q ,   // OR = 1;  pos = 18;  Pin Index = 2769;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 873;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [19] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[1] .Q ,   // OR = 1;  pos = 19;  Pin Index = 2663;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 838;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [20] =  TOP_inst.U0_ALU_16B.\ALU_OUT_reg[0] .Q ;   // OR = 1;  pos = 20;  Pin Index = 1921;  Pin Name = U0_ALU_16B.\ALU_OUT_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 593;  Latch Name = U0_ALU_16B.\ALU_OUT_reg[0].__iNsT2.dff_primitive;   

  assign // OR = 2 
    part_M_OR_2_TM_1 [1] =  TOP_inst.ScanOut_2 ,   // OR = 2;  pos = 1;  Pin Index = 37;  Pin Name = ScanOut_2;  pinInvFromLatch = no;  Latch Index = 6162;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [2] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0] .Q ,   // OR = 2;  pos = 2;  Pin Index = 19071;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 6127;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [3] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1] .Q ,   // OR = 2;  pos = 3;  Pin Index = 18965;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 6092;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [4] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0] .Q ,   // OR = 2;  pos = 4;  Pin Index = 18859;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].Q;  pinInvFromLatch = no;  Latch Index = 6057;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [5] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1] .Q ,   // OR = 2;  pos = 5;  Pin Index = 18753;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 6022;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [6] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0] .Q ,   // OR = 2;  pos = 6;  Pin Index = 18647;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].Q;  pinInvFromLatch = no;  Latch Index = 5987;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [7] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1] .Q ,   // OR = 2;  pos = 7;  Pin Index = 18541;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].Q;  pinInvFromLatch = no;  Latch Index = 5952;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [8] =  TOP_inst.U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0] .Q ,   // OR = 2;  pos = 8;  Pin Index = 18435;  Pin Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 5917;  Latch Name = U0_Async_fifo.u_w2r_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [9] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3] .Q ,   // OR = 2;  pos = 9;  Pin Index = 16240;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 5203;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [10] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2] .Q ,   // OR = 2;  pos = 10;  Pin Index = 16134;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 5168;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [11] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1] .Q ,   // OR = 2;  pos = 11;  Pin Index = 16028;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 5133;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [12] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0] .Q ,   // OR = 2;  pos = 12;  Pin Index = 15922;  Pin Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 5098;  Latch Name = U0_Async_fifo.u_fifo_rd.\rd_ptr_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [13] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3] .Q ,   // OR = 2;  pos = 13;  Pin Index = 15816;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 5063;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [14] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2] .Q ,   // OR = 2;  pos = 14;  Pin Index = 15710;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 5028;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [15] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1] .Q ,   // OR = 2;  pos = 15;  Pin Index = 15604;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 4993;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [16] =  TOP_inst.U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0] .Q ,   // OR = 2;  pos = 16;  Pin Index = 15498;  Pin Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 4958;  Latch Name = U0_Async_fifo.u_fifo_rd.\gray_rd_ptr_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [17] =  TOP_inst.U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_7.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 2;  pos = 17;  Pin Index = 15366;  Pin Name = U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_7.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 4904;  Latch Name = U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_7.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_2_TM_1 [18] =  TOP_inst.U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_5.DFT_CDNS_OBS_tpi_flop.Q ;   // OR = 2;  pos = 18;  Pin Index = 15226;  Pin Name = U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_5.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 4859;  Latch Name = U0_Async_fifo.u_fifo_rd.DFT_tpi_xor_tree_5.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   

  assign // OR = 3 
    part_M_OR_3_TM_1 [1] =  TOP_inst.ScanOut_3 ,   // OR = 3;  pos = 1;  Pin Index = 39;  Pin Name = ScanOut_3;  pinInvFromLatch = no;  Latch Index = 2924;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [2] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5] .Q ,   // OR = 3;  pos = 2;  Pin Index = 9006;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].Q;  pinInvFromLatch = no;  Latch Index = 2889;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [3] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4] .Q ,   // OR = 3;  pos = 3;  Pin Index = 8900;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].Q;  pinInvFromLatch = no;  Latch Index = 2854;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [4] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3] .Q ,   // OR = 3;  pos = 4;  Pin Index = 8794;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].Q;  pinInvFromLatch = no;  Latch Index = 2819;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [5] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2] .Q ,   // OR = 3;  pos = 5;  Pin Index = 8688;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].Q;  pinInvFromLatch = no;  Latch Index = 2784;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [6] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1] .Q ,   // OR = 3;  pos = 6;  Pin Index = 8582;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 2749;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [7] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0] .Q ,   // OR = 3;  pos = 7;  Pin Index = 8476;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].Q;  pinInvFromLatch = no;  Latch Index = 2714;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [8] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7] .Q ,   // OR = 3;  pos = 8;  Pin Index = 8370;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].Q;  pinInvFromLatch = no;  Latch Index = 2679;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [9] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6] .Q ,   // OR = 3;  pos = 9;  Pin Index = 8264;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].Q;  pinInvFromLatch = no;  Latch Index = 2644;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [10] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5] .Q ,   // OR = 3;  pos = 10;  Pin Index = 8158;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].Q;  pinInvFromLatch = no;  Latch Index = 2609;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [11] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4] .Q ,   // OR = 3;  pos = 11;  Pin Index = 8052;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].Q;  pinInvFromLatch = no;  Latch Index = 2574;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [12] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3] .Q ,   // OR = 3;  pos = 12;  Pin Index = 7946;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].Q;  pinInvFromLatch = no;  Latch Index = 2539;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][3].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [13] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2] .Q ,   // OR = 3;  pos = 13;  Pin Index = 7840;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].Q;  pinInvFromLatch = no;  Latch Index = 2504;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][2].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [14] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1] .Q ,   // OR = 3;  pos = 14;  Pin Index = 7734;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 2469;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][1].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [15] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0] .Q ,   // OR = 3;  pos = 15;  Pin Index = 7628;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].Q;  pinInvFromLatch = no;  Latch Index = 2434;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[1][0].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [16] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7] .Q ,   // OR = 3;  pos = 16;  Pin Index = 7522;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].Q;  pinInvFromLatch = no;  Latch Index = 2399;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][7].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [17] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6] .Q ,   // OR = 3;  pos = 17;  Pin Index = 7416;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].Q;  pinInvFromLatch = no;  Latch Index = 2364;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][6].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [18] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5] .Q ,   // OR = 3;  pos = 18;  Pin Index = 7310;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].Q;  pinInvFromLatch = no;  Latch Index = 2329;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][5].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [19] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4] .Q ,   // OR = 3;  pos = 19;  Pin Index = 7204;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].Q;  pinInvFromLatch = no;  Latch Index = 2294;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][4].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [20] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3] .Q ;   // OR = 3;  pos = 20;  Pin Index = 7098;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3].Q;  pinInvFromLatch = no;  Latch Index = 2259;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[0][3].__iNsT2.dff_primitive;   

  assign // OR = 4 
    part_M_OR_4_TM_1 [1] =  TOP_inst.ScanOut_4 ,   // OR = 4;  pos = 1;  Pin Index = 40;  Pin Name = ScanOut_4;  pinInvFromLatch = no;  Latch Index = 3624;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [2] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1] .Q ,   // OR = 4;  pos = 2;  Pin Index = 11126;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].Q;  pinInvFromLatch = no;  Latch Index = 3589;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [3] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0] .Q ,   // OR = 4;  pos = 3;  Pin Index = 11020;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].Q;  pinInvFromLatch = no;  Latch Index = 3554;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [4] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7] .Q ,   // OR = 4;  pos = 4;  Pin Index = 10914;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].Q;  pinInvFromLatch = no;  Latch Index = 3519;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [5] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6] .Q ,   // OR = 4;  pos = 5;  Pin Index = 10808;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].Q;  pinInvFromLatch = no;  Latch Index = 3484;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [6] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5] .Q ,   // OR = 4;  pos = 6;  Pin Index = 10702;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].Q;  pinInvFromLatch = no;  Latch Index = 3449;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [7] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4] .Q ,   // OR = 4;  pos = 7;  Pin Index = 10596;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].Q;  pinInvFromLatch = no;  Latch Index = 3414;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [8] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3] .Q ,   // OR = 4;  pos = 8;  Pin Index = 10490;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].Q;  pinInvFromLatch = no;  Latch Index = 3379;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [9] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2] .Q ,   // OR = 4;  pos = 9;  Pin Index = 10384;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].Q;  pinInvFromLatch = no;  Latch Index = 3344;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [10] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1] .Q ,   // OR = 4;  pos = 10;  Pin Index = 10278;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].Q;  pinInvFromLatch = no;  Latch Index = 3309;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [11] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0] .Q ,   // OR = 4;  pos = 11;  Pin Index = 10172;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].Q;  pinInvFromLatch = no;  Latch Index = 3274;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[4][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [12] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7] .Q ,   // OR = 4;  pos = 12;  Pin Index = 10066;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].Q;  pinInvFromLatch = no;  Latch Index = 3239;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][7].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [13] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6] .Q ,   // OR = 4;  pos = 13;  Pin Index = 9960;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].Q;  pinInvFromLatch = no;  Latch Index = 3204;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][6].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [14] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5] .Q ,   // OR = 4;  pos = 14;  Pin Index = 9854;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].Q;  pinInvFromLatch = no;  Latch Index = 3169;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][5].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [15] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4] .Q ,   // OR = 4;  pos = 15;  Pin Index = 9748;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].Q;  pinInvFromLatch = no;  Latch Index = 3134;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][4].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [16] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3] .Q ,   // OR = 4;  pos = 16;  Pin Index = 9642;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].Q;  pinInvFromLatch = no;  Latch Index = 3099;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][3].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [17] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2] .Q ,   // OR = 4;  pos = 17;  Pin Index = 9536;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].Q;  pinInvFromLatch = no;  Latch Index = 3064;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][2].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [18] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1] .Q ,   // OR = 4;  pos = 18;  Pin Index = 9430;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].Q;  pinInvFromLatch = no;  Latch Index = 3029;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [19] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0] .Q ,   // OR = 4;  pos = 19;  Pin Index = 9324;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 2994;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [20] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7] .Q ;   // OR = 4;  pos = 20;  Pin Index = 9218;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7].Q;  pinInvFromLatch = no;  Latch Index = 2959;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[2][7].__iNsT2.dff_primitive;   

  assign // OR = 5 
    part_M_OR_5_TM_1 [1] =  TOP_inst.ScanOut_5 ,   // OR = 5;  pos = 1;  Pin Index = 41;  Pin Name = ScanOut_5;  pinInvFromLatch = no;  Latch Index = 14629;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [2] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1] .Q ,   // OR = 5;  pos = 2;  Pin Index = 45509;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 14594;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [3] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0] .Q ,   // OR = 5;  pos = 3;  Pin Index = 45403;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 14559;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [4] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_9.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 5;  pos = 4;  Pin Index = 45271;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_9.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 14505;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_9.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_5_TM_1 [5] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_6.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 5;  pos = 5;  Pin Index = 45131;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_6.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 14460;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_6.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_5_TM_1 [6] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_4.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 5;  pos = 6;  Pin Index = 44991;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_4.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 14415;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_4.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_5_TM_1 [7] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_3.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 5;  pos = 7;  Pin Index = 44851;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_3.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 14370;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_3.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_5_TM_1 [8] =  TOP_inst.U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_2.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 5;  pos = 8;  Pin Index = 44711;  Pin Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_2.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 14325;  Latch Name = U0_UART.U0_UART_RX.U0_FSM.DFT_tpi_xor_tree_2.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_5_TM_1 [9] =  TOP_inst.U0_PULSE_GEN.rcv_flop_reg.Q ,   // OR = 5;  pos = 9;  Pin Index = 22393;  Pin Name = U0_PULSE_GEN.rcv_flop_reg.Q;  pinInvFromLatch = no;  Latch Index = 7207;  Latch Name = U0_PULSE_GEN.rcv_flop_reg.__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [10] =  TOP_inst.U0_PULSE_GEN.pls_flop_reg.Q ,   // OR = 5;  pos = 10;  Pin Index = 22287;  Pin Name = U0_PULSE_GEN.pls_flop_reg.Q;  pinInvFromLatch = no;  Latch Index = 7172;  Latch Name = U0_PULSE_GEN.pls_flop_reg.__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [11] =  TOP_inst.U0_Integer_Clock_Divider_TX.gen_clk_reg.Q ,   // OR = 5;  pos = 11;  Pin Index = 22157;  Pin Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.Q;  pinInvFromLatch = no;  Latch Index = 7130;  Latch Name = U0_Integer_Clock_Divider_TX.gen_clk_reg.__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [12] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[6] .Q ,   // OR = 5;  pos = 12;  Pin Index = 21505;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 6909;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [13] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[5] .Q ,   // OR = 5;  pos = 13;  Pin Index = 21399;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 6874;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [14] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[4] .Q ,   // OR = 5;  pos = 14;  Pin Index = 21293;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 6839;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [15] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[3] .Q ,   // OR = 5;  pos = 15;  Pin Index = 21187;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 6804;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [16] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[2] .Q ,   // OR = 5;  pos = 16;  Pin Index = 21081;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 6769;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [17] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[1] .Q ,   // OR = 5;  pos = 17;  Pin Index = 20975;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 6734;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_5_TM_1 [18] =  TOP_inst.U0_Integer_Clock_Divider_TX.\counter_reg[0] .Q ;   // OR = 5;  pos = 18;  Pin Index = 20869;  Pin Name = U0_Integer_Clock_Divider_TX.\counter_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 6699;  Latch Name = U0_Integer_Clock_Divider_TX.\counter_reg[0].__iNsT2.dff_primitive;   

  assign // OR = 6 
    part_M_OR_6_TM_1 [1] =  TOP_inst.ScanOut_6 ,   // OR = 6;  pos = 1;  Pin Index = 42;  Pin Name = ScanOut_6;  pinInvFromLatch = no;  Latch Index = 4324;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][6].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [2] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5] .Q ,   // OR = 6;  pos = 2;  Pin Index = 13246;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].Q;  pinInvFromLatch = no;  Latch Index = 4289;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][5].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [3] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4] .Q ,   // OR = 6;  pos = 3;  Pin Index = 13140;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].Q;  pinInvFromLatch = no;  Latch Index = 4254;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][4].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [4] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3] .Q ,   // OR = 6;  pos = 4;  Pin Index = 13034;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].Q;  pinInvFromLatch = no;  Latch Index = 4219;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][3].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [5] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2] .Q ,   // OR = 6;  pos = 5;  Pin Index = 12928;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].Q;  pinInvFromLatch = no;  Latch Index = 4184;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][2].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [6] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1] .Q ,   // OR = 6;  pos = 6;  Pin Index = 12822;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].Q;  pinInvFromLatch = no;  Latch Index = 4149;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][1].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [7] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0] .Q ,   // OR = 6;  pos = 7;  Pin Index = 12716;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].Q;  pinInvFromLatch = no;  Latch Index = 4114;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][0].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [8] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7] .Q ,   // OR = 6;  pos = 8;  Pin Index = 12610;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].Q;  pinInvFromLatch = no;  Latch Index = 4079;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][7].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [9] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6] .Q ,   // OR = 6;  pos = 9;  Pin Index = 12504;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].Q;  pinInvFromLatch = no;  Latch Index = 4044;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][6].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [10] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5] .Q ,   // OR = 6;  pos = 10;  Pin Index = 12398;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].Q;  pinInvFromLatch = no;  Latch Index = 4009;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][5].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [11] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4] .Q ,   // OR = 6;  pos = 11;  Pin Index = 12292;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].Q;  pinInvFromLatch = no;  Latch Index = 3974;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][4].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [12] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3] .Q ,   // OR = 6;  pos = 12;  Pin Index = 12186;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].Q;  pinInvFromLatch = no;  Latch Index = 3939;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][3].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [13] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2] .Q ,   // OR = 6;  pos = 13;  Pin Index = 12080;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].Q;  pinInvFromLatch = no;  Latch Index = 3904;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][2].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [14] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1] .Q ,   // OR = 6;  pos = 14;  Pin Index = 11974;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].Q;  pinInvFromLatch = no;  Latch Index = 3869;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][1].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [15] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0] .Q ,   // OR = 6;  pos = 15;  Pin Index = 11868;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].Q;  pinInvFromLatch = no;  Latch Index = 3834;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[6][0].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [16] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7] .Q ,   // OR = 6;  pos = 16;  Pin Index = 11762;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].Q;  pinInvFromLatch = no;  Latch Index = 3799;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][7].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [17] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6] .Q ,   // OR = 6;  pos = 17;  Pin Index = 11656;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].Q;  pinInvFromLatch = no;  Latch Index = 3764;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][6].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [18] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5] .Q ,   // OR = 6;  pos = 18;  Pin Index = 11550;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].Q;  pinInvFromLatch = no;  Latch Index = 3729;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][5].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [19] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4] .Q ,   // OR = 6;  pos = 19;  Pin Index = 11444;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].Q;  pinInvFromLatch = no;  Latch Index = 3694;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][4].__iNsT2.dff_primitive;   
    part_M_OR_6_TM_1 [20] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3] .Q ;   // OR = 6;  pos = 20;  Pin Index = 11338;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3].Q;  pinInvFromLatch = no;  Latch Index = 3659;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[5][3].__iNsT2.dff_primitive;   

  assign // OR = 7 
    part_M_OR_7_TM_1 [1] =  TOP_inst.ScanOut_7 ,   // OR = 7;  pos = 1;  Pin Index = 43;  Pin Name = ScanOut_7;  pinInvFromLatch = no;  Latch Index = 6243;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [2] =  TOP_inst.U0_DATA_SYNC.enable_pulse_reg.Q ,   // OR = 7;  pos = 2;  Pin Index = 20622;  Pin Name = U0_DATA_SYNC.enable_pulse_reg.Q;  pinInvFromLatch = no;  Latch Index = 6628;  Latch Name = U0_DATA_SYNC.enable_pulse_reg.__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [3] =  TOP_inst.U0_DATA_SYNC.enable_flop_reg.Q ,   // OR = 7;  pos = 3;  Pin Index = 20516;  Pin Name = U0_DATA_SYNC.enable_flop_reg.Q;  pinInvFromLatch = no;  Latch Index = 6593;  Latch Name = U0_DATA_SYNC.enable_flop_reg.__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [4] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1] .Q ,   // OR = 7;  pos = 4;  Pin Index = 18310;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].Q;  pinInvFromLatch = no;  Latch Index = 5879;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [5] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0] .Q ,   // OR = 7;  pos = 5;  Pin Index = 18204;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 5844;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [6] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1] .Q ,   // OR = 7;  pos = 6;  Pin Index = 18098;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 5809;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [7] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0] .Q ,   // OR = 7;  pos = 7;  Pin Index = 17992;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].Q;  pinInvFromLatch = no;  Latch Index = 5774;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [8] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1] .Q ,   // OR = 7;  pos = 8;  Pin Index = 17886;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 5739;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][1].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [9] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0] .Q ,   // OR = 7;  pos = 9;  Pin Index = 17780;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0].Q;  pinInvFromLatch = no;  Latch Index = 5704;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[1][0].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [10] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1] .Q ,   // OR = 7;  pos = 10;  Pin Index = 17674;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1].Q;  pinInvFromLatch = no;  Latch Index = 5669;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [11] =  TOP_inst.U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0] .Q ,   // OR = 7;  pos = 11;  Pin Index = 17568;  Pin Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 5634;  Latch Name = U0_Async_fifo.u_r2w_sync.\sync_reg_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [12] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3] .Q ,   // OR = 7;  pos = 12;  Pin Index = 17277;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 5542;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [13] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2] .Q ,   // OR = 7;  pos = 13;  Pin Index = 17171;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 5507;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [14] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1] .Q ,   // OR = 7;  pos = 14;  Pin Index = 17065;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 5472;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [15] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0] .Q ,   // OR = 7;  pos = 15;  Pin Index = 16959;  Pin Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 5437;  Latch Name = U0_Async_fifo.u_fifo_wr.\w_ptr_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [16] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3] .Q ,   // OR = 7;  pos = 16;  Pin Index = 16853;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 5402;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [17] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2] .Q ,   // OR = 7;  pos = 17;  Pin Index = 16747;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 5367;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [18] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1] .Q ,   // OR = 7;  pos = 18;  Pin Index = 16641;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 5332;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [19] =  TOP_inst.U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0] .Q ,   // OR = 7;  pos = 19;  Pin Index = 16535;  Pin Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 5297;  Latch Name = U0_Async_fifo.u_fifo_wr.\gray_w_ptr_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_7_TM_1 [20] =  TOP_inst.U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7] .Q ;   // OR = 7;  pos = 20;  Pin Index = 13458;  Pin Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7].Q;  pinInvFromLatch = no;  Latch Index = 4359;  Latch Name = U0_Async_fifo.u_fifo_mem.\FIFO_MEM_reg[7][7].__iNsT2.dff_primitive;   

  assign // OR = 8 
    part_M_OR_8_TM_1 [1] =  TOP_inst.ScanOut_8 ,   // OR = 8;  pos = 1;  Pin Index = 44;  Pin Name = ScanOut_8;  pinInvFromLatch = no;  Latch Index = 9312;  Latch Name = U0_Register_File.\Memory_reg[1][0].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[0][7] .Q ,   // OR = 8;  pos = 2;  Pin Index = 23655;  Pin Name = U0_Register_File.\Memory_reg[0][7].Q;  pinInvFromLatch = no;  Latch Index = 7597;  Latch Name = U0_Register_File.\Memory_reg[0][7].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[0][6] .Q ,   // OR = 8;  pos = 3;  Pin Index = 23549;  Pin Name = U0_Register_File.\Memory_reg[0][6].Q;  pinInvFromLatch = no;  Latch Index = 7562;  Latch Name = U0_Register_File.\Memory_reg[0][6].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[0][5] .Q ,   // OR = 8;  pos = 4;  Pin Index = 23443;  Pin Name = U0_Register_File.\Memory_reg[0][5].Q;  pinInvFromLatch = no;  Latch Index = 7527;  Latch Name = U0_Register_File.\Memory_reg[0][5].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[0][4] .Q ,   // OR = 8;  pos = 5;  Pin Index = 23337;  Pin Name = U0_Register_File.\Memory_reg[0][4].Q;  pinInvFromLatch = no;  Latch Index = 7492;  Latch Name = U0_Register_File.\Memory_reg[0][4].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [6] =  TOP_inst.U0_Register_File.\Memory_reg[0][3] .Q ,   // OR = 8;  pos = 6;  Pin Index = 23231;  Pin Name = U0_Register_File.\Memory_reg[0][3].Q;  pinInvFromLatch = no;  Latch Index = 7457;  Latch Name = U0_Register_File.\Memory_reg[0][3].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[0][2] .Q ,   // OR = 8;  pos = 7;  Pin Index = 23125;  Pin Name = U0_Register_File.\Memory_reg[0][2].Q;  pinInvFromLatch = no;  Latch Index = 7422;  Latch Name = U0_Register_File.\Memory_reg[0][2].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[0][1] .Q ,   // OR = 8;  pos = 8;  Pin Index = 23019;  Pin Name = U0_Register_File.\Memory_reg[0][1].Q;  pinInvFromLatch = no;  Latch Index = 7387;  Latch Name = U0_Register_File.\Memory_reg[0][1].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[0][0] .Q ,   // OR = 8;  pos = 9;  Pin Index = 22913;  Pin Name = U0_Register_File.\Memory_reg[0][0].Q;  pinInvFromLatch = no;  Latch Index = 7352;  Latch Name = U0_Register_File.\Memory_reg[0][0].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [10] =  TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[1] .Q ,   // OR = 8;  pos = 10;  Pin Index = 22613;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 7278;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [11] =  TOP_inst.U0_RST_SYNC_REF.\sync_reg_reg[0] .Q ,   // OR = 8;  pos = 11;  Pin Index = 22507;  Pin Name = U0_RST_SYNC_REF.\sync_reg_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 7243;  Latch Name = U0_RST_SYNC_REF.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [12] =  TOP_inst.U0_DATA_SYNC.\sync_reg_reg[1] .Q ,   // OR = 8;  pos = 12;  Pin Index = 20410;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 6558;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [13] =  TOP_inst.U0_DATA_SYNC.\sync_reg_reg[0] .Q ,   // OR = 8;  pos = 13;  Pin Index = 20304;  Pin Name = U0_DATA_SYNC.\sync_reg_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 6523;  Latch Name = U0_DATA_SYNC.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [14] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[7] .Q ,   // OR = 8;  pos = 14;  Pin Index = 20198;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 6488;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [15] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[6] .Q ,   // OR = 8;  pos = 15;  Pin Index = 20092;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 6453;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [16] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[5] .Q ,   // OR = 8;  pos = 16;  Pin Index = 19986;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 6418;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [17] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[4] .Q ,   // OR = 8;  pos = 17;  Pin Index = 19880;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 6383;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [18] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[3] .Q ,   // OR = 8;  pos = 18;  Pin Index = 19774;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 6348;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [19] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[2] .Q ,   // OR = 8;  pos = 19;  Pin Index = 19668;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 6313;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_8_TM_1 [20] =  TOP_inst.U0_DATA_SYNC.\sync_bus_reg[1] .Q ;   // OR = 8;  pos = 20;  Pin Index = 19562;  Pin Name = U0_DATA_SYNC.\sync_bus_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 6278;  Latch Name = U0_DATA_SYNC.\sync_bus_reg[1].__iNsT2.dff_primitive;   

  assign // OR = 9 
    part_M_OR_9_TM_1 [1] =  TOP_inst.ScanOut_9 ,   // OR = 9;  pos = 1;  Pin Index = 45;  Pin Name = ScanOut_9;  pinInvFromLatch = no;  Latch Index = 15757;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [2] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_14.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 9;  pos = 2;  Pin Index = 48962;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_14.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 15703;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_14.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_9_TM_1 [3] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_10.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 9;  pos = 3;  Pin Index = 48822;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_10.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 15658;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.DFT_tpi_xor_tree_10.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_9_TM_1 [4] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7] .Q ,   // OR = 9;  pos = 4;  Pin Index = 48330;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 15515;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [5] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6] .Q ,   // OR = 9;  pos = 5;  Pin Index = 48224;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 15480;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [6] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5] .Q ,   // OR = 9;  pos = 6;  Pin Index = 48118;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 15445;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [7] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4] .Q ,   // OR = 9;  pos = 7;  Pin Index = 48012;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 15410;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [8] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3] .Q ,   // OR = 9;  pos = 8;  Pin Index = 47906;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 15375;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [9] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2] .Q ,   // OR = 9;  pos = 9;  Pin Index = 47800;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 15340;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [10] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1] .Q ,   // OR = 9;  pos = 10;  Pin Index = 47694;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 15305;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [11] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0] .Q ,   // OR = 9;  pos = 11;  Pin Index = 47588;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 15270;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.\P_DATA_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [12] =  TOP_inst.U0_UART.U0_UART_RX.U0_deserializer.DFT_tpi_xor_tree_15.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 9;  pos = 12;  Pin Index = 47456;  Pin Name = U0_UART.U0_UART_RX.U0_deserializer.DFT_tpi_xor_tree_15.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 15216;  Latch Name = U0_UART.U0_UART_RX.U0_deserializer.DFT_tpi_xor_tree_15.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_9_TM_1 [13] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2] .Q ,   // OR = 9;  pos = 13;  Pin Index = 46767;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 14993;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[2].__iNsT1.dff_primitive;   
    part_M_OR_9_TM_1 [14] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1] .Q ,   // OR = 9;  pos = 14;  Pin Index = 46678;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 14963;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[1].__iNsT1.dff_primitive;   
    part_M_OR_9_TM_1 [15] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0] .Q ,   // OR = 9;  pos = 15;  Pin Index = 46589;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 14933;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.\sampled_data_reg[0].__iNsT1.dff_primitive;   
    part_M_OR_9_TM_1 [16] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.Q ,   // OR = 9;  pos = 16;  Pin Index = 47313;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.Q;  pinInvFromLatch = no;  Latch Index = 15187;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.sampled_bit_reg.__iNsT2.dff_primitive;   
    part_M_OR_9_TM_1 [17] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_11.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 9;  pos = 17;  Pin Index = 46458;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_11.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 14889;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_11.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_9_TM_1 [18] =  TOP_inst.U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_0.DFT_CDNS_OBS_tpi_flop.Q ;   // OR = 9;  pos = 18;  Pin Index = 46318;  Pin Name = U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_0.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 14844;  Latch Name = U0_UART.U0_UART_RX.U0_data_sampling.DFT_tpi_xor_tree_0.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   

  assign // OR = 10 
    part_M_OR_10_TM_1 [1] =  TOP_inst.ScanOut_10 ,   // OR = 10;  pos = 1;  Pin Index = 27;  Pin Name = ScanOut_10;  pinInvFromLatch = no;  Latch Index = 10010;  Latch Name = U0_Register_File.\Memory_reg[3][4].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[3][3] .Q ,   // OR = 10;  pos = 2;  Pin Index = 30857;  Pin Name = U0_Register_File.\Memory_reg[3][3].Q;  pinInvFromLatch = no;  Latch Index = 9975;  Latch Name = U0_Register_File.\Memory_reg[3][3].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[3][2] .Q ,   // OR = 10;  pos = 3;  Pin Index = 30751;  Pin Name = U0_Register_File.\Memory_reg[3][2].Q;  pinInvFromLatch = no;  Latch Index = 9940;  Latch Name = U0_Register_File.\Memory_reg[3][2].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[3][1] .Q ,   // OR = 10;  pos = 4;  Pin Index = 30645;  Pin Name = U0_Register_File.\Memory_reg[3][1].Q;  pinInvFromLatch = no;  Latch Index = 9905;  Latch Name = U0_Register_File.\Memory_reg[3][1].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[3][0] .Q ,   // OR = 10;  pos = 5;  Pin Index = 30539;  Pin Name = U0_Register_File.\Memory_reg[3][0].Q;  pinInvFromLatch = no;  Latch Index = 9870;  Latch Name = U0_Register_File.\Memory_reg[3][0].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [6] = !TOP_inst.U0_Register_File.\Memory_reg[2][7] .QN ,   // OR = 10;  pos = 6;  Pin Index = 30437;  Pin Name = U0_Register_File.\Memory_reg[2][7].QN;  pinInvFromLatch = yes;  Latch Index = 9835;  Latch Name = U0_Register_File.\Memory_reg[2][7].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[2][6] .Q ,   // OR = 10;  pos = 7;  Pin Index = 30330;  Pin Name = U0_Register_File.\Memory_reg[2][6].Q;  pinInvFromLatch = no;  Latch Index = 9801;  Latch Name = U0_Register_File.\Memory_reg[2][6].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[2][5] .Q ,   // OR = 10;  pos = 8;  Pin Index = 30224;  Pin Name = U0_Register_File.\Memory_reg[2][5].Q;  pinInvFromLatch = no;  Latch Index = 9766;  Latch Name = U0_Register_File.\Memory_reg[2][5].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[2][4] .Q ,   // OR = 10;  pos = 9;  Pin Index = 30118;  Pin Name = U0_Register_File.\Memory_reg[2][4].Q;  pinInvFromLatch = no;  Latch Index = 9731;  Latch Name = U0_Register_File.\Memory_reg[2][4].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [10] =  TOP_inst.U0_Register_File.\Memory_reg[2][3] .Q ,   // OR = 10;  pos = 10;  Pin Index = 30012;  Pin Name = U0_Register_File.\Memory_reg[2][3].Q;  pinInvFromLatch = no;  Latch Index = 9696;  Latch Name = U0_Register_File.\Memory_reg[2][3].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [11] =  TOP_inst.U0_Register_File.\Memory_reg[2][2] .Q ,   // OR = 10;  pos = 11;  Pin Index = 29906;  Pin Name = U0_Register_File.\Memory_reg[2][2].Q;  pinInvFromLatch = no;  Latch Index = 9661;  Latch Name = U0_Register_File.\Memory_reg[2][2].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [12] =  TOP_inst.U0_Register_File.\Memory_reg[2][1] .Q ,   // OR = 10;  pos = 12;  Pin Index = 29800;  Pin Name = U0_Register_File.\Memory_reg[2][1].Q;  pinInvFromLatch = no;  Latch Index = 9626;  Latch Name = U0_Register_File.\Memory_reg[2][1].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [13] = !TOP_inst.U0_Register_File.\Memory_reg[2][0] .QN ,   // OR = 10;  pos = 13;  Pin Index = 29698;  Pin Name = U0_Register_File.\Memory_reg[2][0].QN;  pinInvFromLatch = yes;  Latch Index = 9591;  Latch Name = U0_Register_File.\Memory_reg[2][0].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [14] =  TOP_inst.U0_Register_File.\Memory_reg[1][7] .Q ,   // OR = 10;  pos = 14;  Pin Index = 29591;  Pin Name = U0_Register_File.\Memory_reg[1][7].Q;  pinInvFromLatch = no;  Latch Index = 9557;  Latch Name = U0_Register_File.\Memory_reg[1][7].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [15] =  TOP_inst.U0_Register_File.\Memory_reg[1][6] .Q ,   // OR = 10;  pos = 15;  Pin Index = 29485;  Pin Name = U0_Register_File.\Memory_reg[1][6].Q;  pinInvFromLatch = no;  Latch Index = 9522;  Latch Name = U0_Register_File.\Memory_reg[1][6].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[1][5] .Q ,   // OR = 10;  pos = 16;  Pin Index = 29379;  Pin Name = U0_Register_File.\Memory_reg[1][5].Q;  pinInvFromLatch = no;  Latch Index = 9487;  Latch Name = U0_Register_File.\Memory_reg[1][5].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[1][4] .Q ,   // OR = 10;  pos = 17;  Pin Index = 29273;  Pin Name = U0_Register_File.\Memory_reg[1][4].Q;  pinInvFromLatch = no;  Latch Index = 9452;  Latch Name = U0_Register_File.\Memory_reg[1][4].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[1][3] .Q ,   // OR = 10;  pos = 18;  Pin Index = 29167;  Pin Name = U0_Register_File.\Memory_reg[1][3].Q;  pinInvFromLatch = no;  Latch Index = 9417;  Latch Name = U0_Register_File.\Memory_reg[1][3].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [19] =  TOP_inst.U0_Register_File.\Memory_reg[1][2] .Q ,   // OR = 10;  pos = 19;  Pin Index = 29061;  Pin Name = U0_Register_File.\Memory_reg[1][2].Q;  pinInvFromLatch = no;  Latch Index = 9382;  Latch Name = U0_Register_File.\Memory_reg[1][2].__iNsT2.dff_primitive;   
    part_M_OR_10_TM_1 [20] =  TOP_inst.U0_Register_File.\Memory_reg[1][1] .Q ;   // OR = 10;  pos = 20;  Pin Index = 28955;  Pin Name = U0_Register_File.\Memory_reg[1][1].Q;  pinInvFromLatch = no;  Latch Index = 9347;  Latch Name = U0_Register_File.\Memory_reg[1][1].__iNsT2.dff_primitive;   

  assign // OR = 11 
    part_M_OR_11_TM_1 [1] =  TOP_inst.ScanOut_11 ,   // OR = 11;  pos = 1;  Pin Index = 28;  Pin Name = ScanOut_11;  pinInvFromLatch = no;  Latch Index = 10674;  Latch Name = U0_Register_File.\Memory_reg[5][7].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[5][6] .Q ,   // OR = 11;  pos = 2;  Pin Index = 32868;  Pin Name = U0_Register_File.\Memory_reg[5][6].Q;  pinInvFromLatch = no;  Latch Index = 10639;  Latch Name = U0_Register_File.\Memory_reg[5][6].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[5][5] .Q ,   // OR = 11;  pos = 3;  Pin Index = 32762;  Pin Name = U0_Register_File.\Memory_reg[5][5].Q;  pinInvFromLatch = no;  Latch Index = 10604;  Latch Name = U0_Register_File.\Memory_reg[5][5].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[5][4] .Q ,   // OR = 11;  pos = 4;  Pin Index = 32656;  Pin Name = U0_Register_File.\Memory_reg[5][4].Q;  pinInvFromLatch = no;  Latch Index = 10569;  Latch Name = U0_Register_File.\Memory_reg[5][4].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[5][3] .Q ,   // OR = 11;  pos = 5;  Pin Index = 32550;  Pin Name = U0_Register_File.\Memory_reg[5][3].Q;  pinInvFromLatch = no;  Latch Index = 10534;  Latch Name = U0_Register_File.\Memory_reg[5][3].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [6] =  TOP_inst.U0_Register_File.\Memory_reg[5][2] .Q ,   // OR = 11;  pos = 6;  Pin Index = 32444;  Pin Name = U0_Register_File.\Memory_reg[5][2].Q;  pinInvFromLatch = no;  Latch Index = 10499;  Latch Name = U0_Register_File.\Memory_reg[5][2].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[5][1] .Q ,   // OR = 11;  pos = 7;  Pin Index = 32338;  Pin Name = U0_Register_File.\Memory_reg[5][1].Q;  pinInvFromLatch = no;  Latch Index = 10464;  Latch Name = U0_Register_File.\Memory_reg[5][1].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[5][0] .Q ,   // OR = 11;  pos = 8;  Pin Index = 32232;  Pin Name = U0_Register_File.\Memory_reg[5][0].Q;  pinInvFromLatch = no;  Latch Index = 10429;  Latch Name = U0_Register_File.\Memory_reg[5][0].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[4][7] .Q ,   // OR = 11;  pos = 9;  Pin Index = 32126;  Pin Name = U0_Register_File.\Memory_reg[4][7].Q;  pinInvFromLatch = no;  Latch Index = 10394;  Latch Name = U0_Register_File.\Memory_reg[4][7].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [10] =  TOP_inst.U0_Register_File.\Memory_reg[4][6] .Q ,   // OR = 11;  pos = 10;  Pin Index = 32020;  Pin Name = U0_Register_File.\Memory_reg[4][6].Q;  pinInvFromLatch = no;  Latch Index = 10359;  Latch Name = U0_Register_File.\Memory_reg[4][6].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [11] =  TOP_inst.U0_Register_File.\Memory_reg[4][5] .Q ,   // OR = 11;  pos = 11;  Pin Index = 31914;  Pin Name = U0_Register_File.\Memory_reg[4][5].Q;  pinInvFromLatch = no;  Latch Index = 10324;  Latch Name = U0_Register_File.\Memory_reg[4][5].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [12] =  TOP_inst.U0_Register_File.\Memory_reg[4][4] .Q ,   // OR = 11;  pos = 12;  Pin Index = 31808;  Pin Name = U0_Register_File.\Memory_reg[4][4].Q;  pinInvFromLatch = no;  Latch Index = 10289;  Latch Name = U0_Register_File.\Memory_reg[4][4].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [13] =  TOP_inst.U0_Register_File.\Memory_reg[4][3] .Q ,   // OR = 11;  pos = 13;  Pin Index = 31702;  Pin Name = U0_Register_File.\Memory_reg[4][3].Q;  pinInvFromLatch = no;  Latch Index = 10254;  Latch Name = U0_Register_File.\Memory_reg[4][3].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [14] =  TOP_inst.U0_Register_File.\Memory_reg[4][2] .Q ,   // OR = 11;  pos = 14;  Pin Index = 31596;  Pin Name = U0_Register_File.\Memory_reg[4][2].Q;  pinInvFromLatch = no;  Latch Index = 10219;  Latch Name = U0_Register_File.\Memory_reg[4][2].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [15] =  TOP_inst.U0_Register_File.\Memory_reg[4][1] .Q ,   // OR = 11;  pos = 15;  Pin Index = 31490;  Pin Name = U0_Register_File.\Memory_reg[4][1].Q;  pinInvFromLatch = no;  Latch Index = 10184;  Latch Name = U0_Register_File.\Memory_reg[4][1].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[4][0] .Q ,   // OR = 11;  pos = 16;  Pin Index = 31384;  Pin Name = U0_Register_File.\Memory_reg[4][0].Q;  pinInvFromLatch = no;  Latch Index = 10149;  Latch Name = U0_Register_File.\Memory_reg[4][0].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[3][7] .Q ,   // OR = 11;  pos = 17;  Pin Index = 31278;  Pin Name = U0_Register_File.\Memory_reg[3][7].Q;  pinInvFromLatch = no;  Latch Index = 10114;  Latch Name = U0_Register_File.\Memory_reg[3][7].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[3][6] .Q ,   // OR = 11;  pos = 18;  Pin Index = 31172;  Pin Name = U0_Register_File.\Memory_reg[3][6].Q;  pinInvFromLatch = no;  Latch Index = 10079;  Latch Name = U0_Register_File.\Memory_reg[3][6].__iNsT2.dff_primitive;   
    part_M_OR_11_TM_1 [19] = !TOP_inst.U0_Register_File.\Memory_reg[3][5] .QN ;   // OR = 11;  pos = 19;  Pin Index = 31070;  Pin Name = U0_Register_File.\Memory_reg[3][5].QN;  pinInvFromLatch = yes;  Latch Index = 10044;  Latch Name = U0_Register_File.\Memory_reg[3][5].__iNsT2.dff_primitive;   

  assign // OR = 12 
    part_M_OR_12_TM_1 [1] =  TOP_inst.ScanOut_12 ,   // OR = 12;  pos = 1;  Pin Index = 29;  Pin Name = ScanOut_12;  pinInvFromLatch = no;  Latch Index = 11339;  Latch Name = U0_Register_File.\Memory_reg[8][2].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[8][1] .Q ,   // OR = 12;  pos = 2;  Pin Index = 34882;  Pin Name = U0_Register_File.\Memory_reg[8][1].Q;  pinInvFromLatch = no;  Latch Index = 11304;  Latch Name = U0_Register_File.\Memory_reg[8][1].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[8][0] .Q ,   // OR = 12;  pos = 3;  Pin Index = 34776;  Pin Name = U0_Register_File.\Memory_reg[8][0].Q;  pinInvFromLatch = no;  Latch Index = 11269;  Latch Name = U0_Register_File.\Memory_reg[8][0].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[7][7] .Q ,   // OR = 12;  pos = 4;  Pin Index = 34670;  Pin Name = U0_Register_File.\Memory_reg[7][7].Q;  pinInvFromLatch = no;  Latch Index = 11234;  Latch Name = U0_Register_File.\Memory_reg[7][7].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[7][6] .Q ,   // OR = 12;  pos = 5;  Pin Index = 34564;  Pin Name = U0_Register_File.\Memory_reg[7][6].Q;  pinInvFromLatch = no;  Latch Index = 11199;  Latch Name = U0_Register_File.\Memory_reg[7][6].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [6] =  TOP_inst.U0_Register_File.\Memory_reg[7][5] .Q ,   // OR = 12;  pos = 6;  Pin Index = 34458;  Pin Name = U0_Register_File.\Memory_reg[7][5].Q;  pinInvFromLatch = no;  Latch Index = 11164;  Latch Name = U0_Register_File.\Memory_reg[7][5].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[7][4] .Q ,   // OR = 12;  pos = 7;  Pin Index = 34352;  Pin Name = U0_Register_File.\Memory_reg[7][4].Q;  pinInvFromLatch = no;  Latch Index = 11129;  Latch Name = U0_Register_File.\Memory_reg[7][4].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[7][3] .Q ,   // OR = 12;  pos = 8;  Pin Index = 34246;  Pin Name = U0_Register_File.\Memory_reg[7][3].Q;  pinInvFromLatch = no;  Latch Index = 11094;  Latch Name = U0_Register_File.\Memory_reg[7][3].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[7][2] .Q ,   // OR = 12;  pos = 9;  Pin Index = 34140;  Pin Name = U0_Register_File.\Memory_reg[7][2].Q;  pinInvFromLatch = no;  Latch Index = 11059;  Latch Name = U0_Register_File.\Memory_reg[7][2].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [10] =  TOP_inst.U0_Register_File.\Memory_reg[7][1] .Q ,   // OR = 12;  pos = 10;  Pin Index = 34034;  Pin Name = U0_Register_File.\Memory_reg[7][1].Q;  pinInvFromLatch = no;  Latch Index = 11024;  Latch Name = U0_Register_File.\Memory_reg[7][1].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [11] =  TOP_inst.U0_Register_File.\Memory_reg[7][0] .Q ,   // OR = 12;  pos = 11;  Pin Index = 33928;  Pin Name = U0_Register_File.\Memory_reg[7][0].Q;  pinInvFromLatch = no;  Latch Index = 10989;  Latch Name = U0_Register_File.\Memory_reg[7][0].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [12] =  TOP_inst.U0_Register_File.\Memory_reg[6][7] .Q ,   // OR = 12;  pos = 12;  Pin Index = 33822;  Pin Name = U0_Register_File.\Memory_reg[6][7].Q;  pinInvFromLatch = no;  Latch Index = 10954;  Latch Name = U0_Register_File.\Memory_reg[6][7].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [13] =  TOP_inst.U0_Register_File.\Memory_reg[6][6] .Q ,   // OR = 12;  pos = 13;  Pin Index = 33716;  Pin Name = U0_Register_File.\Memory_reg[6][6].Q;  pinInvFromLatch = no;  Latch Index = 10919;  Latch Name = U0_Register_File.\Memory_reg[6][6].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [14] =  TOP_inst.U0_Register_File.\Memory_reg[6][5] .Q ,   // OR = 12;  pos = 14;  Pin Index = 33610;  Pin Name = U0_Register_File.\Memory_reg[6][5].Q;  pinInvFromLatch = no;  Latch Index = 10884;  Latch Name = U0_Register_File.\Memory_reg[6][5].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [15] =  TOP_inst.U0_Register_File.\Memory_reg[6][4] .Q ,   // OR = 12;  pos = 15;  Pin Index = 33504;  Pin Name = U0_Register_File.\Memory_reg[6][4].Q;  pinInvFromLatch = no;  Latch Index = 10849;  Latch Name = U0_Register_File.\Memory_reg[6][4].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[6][3] .Q ,   // OR = 12;  pos = 16;  Pin Index = 33398;  Pin Name = U0_Register_File.\Memory_reg[6][3].Q;  pinInvFromLatch = no;  Latch Index = 10814;  Latch Name = U0_Register_File.\Memory_reg[6][3].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[6][2] .Q ,   // OR = 12;  pos = 17;  Pin Index = 33292;  Pin Name = U0_Register_File.\Memory_reg[6][2].Q;  pinInvFromLatch = no;  Latch Index = 10779;  Latch Name = U0_Register_File.\Memory_reg[6][2].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[6][1] .Q ,   // OR = 12;  pos = 18;  Pin Index = 33186;  Pin Name = U0_Register_File.\Memory_reg[6][1].Q;  pinInvFromLatch = no;  Latch Index = 10744;  Latch Name = U0_Register_File.\Memory_reg[6][1].__iNsT2.dff_primitive;   
    part_M_OR_12_TM_1 [19] =  TOP_inst.U0_Register_File.\Memory_reg[6][0] .Q ;   // OR = 12;  pos = 19;  Pin Index = 33080;  Pin Name = U0_Register_File.\Memory_reg[6][0].Q;  pinInvFromLatch = no;  Latch Index = 10709;  Latch Name = U0_Register_File.\Memory_reg[6][0].__iNsT2.dff_primitive;   

  assign // OR = 13 
    part_M_OR_13_TM_1 [1] =  TOP_inst.ScanOut_13 ,   // OR = 13;  pos = 1;  Pin Index = 30;  Pin Name = ScanOut_13;  pinInvFromLatch = no;  Latch Index = 16771;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [2] =  TOP_inst.U0_UART.U0_UART_TX.U0_FSM.DFT_tpi_xor_tree_13.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 13;  pos = 2;  Pin Index = 52143;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.DFT_tpi_xor_tree_13.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 16717;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.DFT_tpi_xor_tree_13.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_13_TM_1 [3] =  TOP_inst.U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.Q ,   // OR = 13;  pos = 3;  Pin Index = 51965;  Pin Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.Q;  pinInvFromLatch = no;  Latch Index = 16687;  Latch Name = U0_UART.U0_UART_RX.U0_strt_check.strt_glitch_reg.__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [4] =  TOP_inst.U0_UART.U0_UART_RX.U0_strt_check.DFT_tpi_xor_tree_1.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 13;  pos = 4;  Pin Index = 51631;  Pin Name = U0_UART.U0_UART_RX.U0_strt_check.DFT_tpi_xor_tree_1.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 16565;  Latch Name = U0_UART.U0_UART_RX.U0_strt_check.DFT_tpi_xor_tree_1.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_13_TM_1 [5] =  TOP_inst.U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.Q ,   // OR = 13;  pos = 5;  Pin Index = 51481;  Pin Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.Q;  pinInvFromLatch = no;  Latch Index = 16536;  Latch Name = U0_UART.U0_UART_RX.U0_stop_check.stp_err_reg.__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [6] =  TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.parity_reg.Q ,   // OR = 13;  pos = 6;  Pin Index = 51154;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.Q;  pinInvFromLatch = no;  Latch Index = 16431;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.parity_reg.__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [7] =  TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.Q ,   // OR = 13;  pos = 7;  Pin Index = 51048;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.Q;  pinInvFromLatch = no;  Latch Index = 16396;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.par_err_reg.__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [8] =  TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_12.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 13;  pos = 8;  Pin Index = 50506;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_12.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 16205;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_12.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_13_TM_1 [9] =  TOP_inst.U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_8.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 13;  pos = 9;  Pin Index = 50646;  Pin Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_8.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 16250;  Latch Name = U0_UART.U0_UART_RX.U0_parity_check.DFT_tpi_xor_tree_8.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_13_TM_1 [10] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4] .Q ,   // OR = 13;  pos = 10;  Pin Index = 49942;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 16037;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [11] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3] .Q ,   // OR = 13;  pos = 11;  Pin Index = 49836;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 16002;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [12] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2] .Q ,   // OR = 13;  pos = 12;  Pin Index = 49730;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 15967;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [13] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1] .Q ,   // OR = 13;  pos = 13;  Pin Index = 49624;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 15932;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [14] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0] .Q ,   // OR = 13;  pos = 14;  Pin Index = 49518;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 15897;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\edge_cnt_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [15] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3] .Q ,   // OR = 13;  pos = 15;  Pin Index = 49412;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 15862;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [16] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2] .Q ,   // OR = 13;  pos = 16;  Pin Index = 49306;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 15827;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_13_TM_1 [17] =  TOP_inst.U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1] .Q ;   // OR = 13;  pos = 17;  Pin Index = 49200;  Pin Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 15792;  Latch Name = U0_UART.U0_UART_RX.U0_edge_bit_counter.\bit_cnt_reg[1].__iNsT2.dff_primitive;   

  assign // OR = 14 
    part_M_OR_14_TM_1 [1] =  TOP_inst.ScanOut_14 ,   // OR = 14;  pos = 1;  Pin Index = 31;  Pin Name = ScanOut_14;  pinInvFromLatch = no;  Latch Index = 7807;  Latch Name = U0_Register_File.\Memory_reg[10][5].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[10][4] .Q ,   // OR = 14;  pos = 2;  Pin Index = 24185;  Pin Name = U0_Register_File.\Memory_reg[10][4].Q;  pinInvFromLatch = no;  Latch Index = 7772;  Latch Name = U0_Register_File.\Memory_reg[10][4].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[10][3] .Q ,   // OR = 14;  pos = 3;  Pin Index = 24079;  Pin Name = U0_Register_File.\Memory_reg[10][3].Q;  pinInvFromLatch = no;  Latch Index = 7737;  Latch Name = U0_Register_File.\Memory_reg[10][3].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[10][2] .Q ,   // OR = 14;  pos = 4;  Pin Index = 23973;  Pin Name = U0_Register_File.\Memory_reg[10][2].Q;  pinInvFromLatch = no;  Latch Index = 7702;  Latch Name = U0_Register_File.\Memory_reg[10][2].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[10][1] .Q ,   // OR = 14;  pos = 5;  Pin Index = 23867;  Pin Name = U0_Register_File.\Memory_reg[10][1].Q;  pinInvFromLatch = no;  Latch Index = 7667;  Latch Name = U0_Register_File.\Memory_reg[10][1].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [6] =  TOP_inst.U0_Register_File.\Memory_reg[10][0] .Q ,   // OR = 14;  pos = 6;  Pin Index = 23761;  Pin Name = U0_Register_File.\Memory_reg[10][0].Q;  pinInvFromLatch = no;  Latch Index = 7632;  Latch Name = U0_Register_File.\Memory_reg[10][0].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[9][7] .Q ,   // OR = 14;  pos = 7;  Pin Index = 36366;  Pin Name = U0_Register_File.\Memory_reg[9][7].Q;  pinInvFromLatch = no;  Latch Index = 11794;  Latch Name = U0_Register_File.\Memory_reg[9][7].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[9][6] .Q ,   // OR = 14;  pos = 8;  Pin Index = 36260;  Pin Name = U0_Register_File.\Memory_reg[9][6].Q;  pinInvFromLatch = no;  Latch Index = 11759;  Latch Name = U0_Register_File.\Memory_reg[9][6].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[9][5] .Q ,   // OR = 14;  pos = 9;  Pin Index = 36154;  Pin Name = U0_Register_File.\Memory_reg[9][5].Q;  pinInvFromLatch = no;  Latch Index = 11724;  Latch Name = U0_Register_File.\Memory_reg[9][5].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [10] =  TOP_inst.U0_Register_File.\Memory_reg[9][4] .Q ,   // OR = 14;  pos = 10;  Pin Index = 36048;  Pin Name = U0_Register_File.\Memory_reg[9][4].Q;  pinInvFromLatch = no;  Latch Index = 11689;  Latch Name = U0_Register_File.\Memory_reg[9][4].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [11] =  TOP_inst.U0_Register_File.\Memory_reg[9][3] .Q ,   // OR = 14;  pos = 11;  Pin Index = 35942;  Pin Name = U0_Register_File.\Memory_reg[9][3].Q;  pinInvFromLatch = no;  Latch Index = 11654;  Latch Name = U0_Register_File.\Memory_reg[9][3].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [12] =  TOP_inst.U0_Register_File.\Memory_reg[9][2] .Q ,   // OR = 14;  pos = 12;  Pin Index = 35836;  Pin Name = U0_Register_File.\Memory_reg[9][2].Q;  pinInvFromLatch = no;  Latch Index = 11619;  Latch Name = U0_Register_File.\Memory_reg[9][2].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [13] =  TOP_inst.U0_Register_File.\Memory_reg[9][1] .Q ,   // OR = 14;  pos = 13;  Pin Index = 35730;  Pin Name = U0_Register_File.\Memory_reg[9][1].Q;  pinInvFromLatch = no;  Latch Index = 11584;  Latch Name = U0_Register_File.\Memory_reg[9][1].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [14] =  TOP_inst.U0_Register_File.\Memory_reg[9][0] .Q ,   // OR = 14;  pos = 14;  Pin Index = 35624;  Pin Name = U0_Register_File.\Memory_reg[9][0].Q;  pinInvFromLatch = no;  Latch Index = 11549;  Latch Name = U0_Register_File.\Memory_reg[9][0].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [15] =  TOP_inst.U0_Register_File.\Memory_reg[8][7] .Q ,   // OR = 14;  pos = 15;  Pin Index = 35518;  Pin Name = U0_Register_File.\Memory_reg[8][7].Q;  pinInvFromLatch = no;  Latch Index = 11514;  Latch Name = U0_Register_File.\Memory_reg[8][7].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[8][6] .Q ,   // OR = 14;  pos = 16;  Pin Index = 35412;  Pin Name = U0_Register_File.\Memory_reg[8][6].Q;  pinInvFromLatch = no;  Latch Index = 11479;  Latch Name = U0_Register_File.\Memory_reg[8][6].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[8][5] .Q ,   // OR = 14;  pos = 17;  Pin Index = 35306;  Pin Name = U0_Register_File.\Memory_reg[8][5].Q;  pinInvFromLatch = no;  Latch Index = 11444;  Latch Name = U0_Register_File.\Memory_reg[8][5].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[8][4] .Q ,   // OR = 14;  pos = 18;  Pin Index = 35200;  Pin Name = U0_Register_File.\Memory_reg[8][4].Q;  pinInvFromLatch = no;  Latch Index = 11409;  Latch Name = U0_Register_File.\Memory_reg[8][4].__iNsT2.dff_primitive;   
    part_M_OR_14_TM_1 [19] =  TOP_inst.U0_Register_File.\Memory_reg[8][3] .Q ;   // OR = 14;  pos = 19;  Pin Index = 35094;  Pin Name = U0_Register_File.\Memory_reg[8][3].Q;  pinInvFromLatch = no;  Latch Index = 11374;  Latch Name = U0_Register_File.\Memory_reg[8][3].__iNsT2.dff_primitive;   

  assign // OR = 15 
    part_M_OR_15_TM_1 [1] =  TOP_inst.ScanOut_15 ,   // OR = 15;  pos = 1;  Pin Index = 32;  Pin Name = ScanOut_15;  pinInvFromLatch = no;  Latch Index = 8472;  Latch Name = U0_Register_File.\Memory_reg[13][0].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[12][7] .Q ,   // OR = 15;  pos = 2;  Pin Index = 26199;  Pin Name = U0_Register_File.\Memory_reg[12][7].Q;  pinInvFromLatch = no;  Latch Index = 8437;  Latch Name = U0_Register_File.\Memory_reg[12][7].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[12][6] .Q ,   // OR = 15;  pos = 3;  Pin Index = 26093;  Pin Name = U0_Register_File.\Memory_reg[12][6].Q;  pinInvFromLatch = no;  Latch Index = 8402;  Latch Name = U0_Register_File.\Memory_reg[12][6].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[12][5] .Q ,   // OR = 15;  pos = 4;  Pin Index = 25987;  Pin Name = U0_Register_File.\Memory_reg[12][5].Q;  pinInvFromLatch = no;  Latch Index = 8367;  Latch Name = U0_Register_File.\Memory_reg[12][5].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[12][4] .Q ,   // OR = 15;  pos = 5;  Pin Index = 25881;  Pin Name = U0_Register_File.\Memory_reg[12][4].Q;  pinInvFromLatch = no;  Latch Index = 8332;  Latch Name = U0_Register_File.\Memory_reg[12][4].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [6] =  TOP_inst.U0_Register_File.\Memory_reg[12][3] .Q ,   // OR = 15;  pos = 6;  Pin Index = 25775;  Pin Name = U0_Register_File.\Memory_reg[12][3].Q;  pinInvFromLatch = no;  Latch Index = 8297;  Latch Name = U0_Register_File.\Memory_reg[12][3].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[12][2] .Q ,   // OR = 15;  pos = 7;  Pin Index = 25669;  Pin Name = U0_Register_File.\Memory_reg[12][2].Q;  pinInvFromLatch = no;  Latch Index = 8262;  Latch Name = U0_Register_File.\Memory_reg[12][2].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[12][1] .Q ,   // OR = 15;  pos = 8;  Pin Index = 25563;  Pin Name = U0_Register_File.\Memory_reg[12][1].Q;  pinInvFromLatch = no;  Latch Index = 8227;  Latch Name = U0_Register_File.\Memory_reg[12][1].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[12][0] .Q ,   // OR = 15;  pos = 9;  Pin Index = 25457;  Pin Name = U0_Register_File.\Memory_reg[12][0].Q;  pinInvFromLatch = no;  Latch Index = 8192;  Latch Name = U0_Register_File.\Memory_reg[12][0].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [10] =  TOP_inst.U0_Register_File.\Memory_reg[11][7] .Q ,   // OR = 15;  pos = 10;  Pin Index = 25351;  Pin Name = U0_Register_File.\Memory_reg[11][7].Q;  pinInvFromLatch = no;  Latch Index = 8157;  Latch Name = U0_Register_File.\Memory_reg[11][7].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [11] =  TOP_inst.U0_Register_File.\Memory_reg[11][6] .Q ,   // OR = 15;  pos = 11;  Pin Index = 25245;  Pin Name = U0_Register_File.\Memory_reg[11][6].Q;  pinInvFromLatch = no;  Latch Index = 8122;  Latch Name = U0_Register_File.\Memory_reg[11][6].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [12] =  TOP_inst.U0_Register_File.\Memory_reg[11][5] .Q ,   // OR = 15;  pos = 12;  Pin Index = 25139;  Pin Name = U0_Register_File.\Memory_reg[11][5].Q;  pinInvFromLatch = no;  Latch Index = 8087;  Latch Name = U0_Register_File.\Memory_reg[11][5].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [13] =  TOP_inst.U0_Register_File.\Memory_reg[11][4] .Q ,   // OR = 15;  pos = 13;  Pin Index = 25033;  Pin Name = U0_Register_File.\Memory_reg[11][4].Q;  pinInvFromLatch = no;  Latch Index = 8052;  Latch Name = U0_Register_File.\Memory_reg[11][4].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [14] =  TOP_inst.U0_Register_File.\Memory_reg[11][3] .Q ,   // OR = 15;  pos = 14;  Pin Index = 24927;  Pin Name = U0_Register_File.\Memory_reg[11][3].Q;  pinInvFromLatch = no;  Latch Index = 8017;  Latch Name = U0_Register_File.\Memory_reg[11][3].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [15] =  TOP_inst.U0_Register_File.\Memory_reg[11][2] .Q ,   // OR = 15;  pos = 15;  Pin Index = 24821;  Pin Name = U0_Register_File.\Memory_reg[11][2].Q;  pinInvFromLatch = no;  Latch Index = 7982;  Latch Name = U0_Register_File.\Memory_reg[11][2].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[11][1] .Q ,   // OR = 15;  pos = 16;  Pin Index = 24715;  Pin Name = U0_Register_File.\Memory_reg[11][1].Q;  pinInvFromLatch = no;  Latch Index = 7947;  Latch Name = U0_Register_File.\Memory_reg[11][1].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[11][0] .Q ,   // OR = 15;  pos = 17;  Pin Index = 24609;  Pin Name = U0_Register_File.\Memory_reg[11][0].Q;  pinInvFromLatch = no;  Latch Index = 7912;  Latch Name = U0_Register_File.\Memory_reg[11][0].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[10][7] .Q ,   // OR = 15;  pos = 18;  Pin Index = 24503;  Pin Name = U0_Register_File.\Memory_reg[10][7].Q;  pinInvFromLatch = no;  Latch Index = 7877;  Latch Name = U0_Register_File.\Memory_reg[10][7].__iNsT2.dff_primitive;   
    part_M_OR_15_TM_1 [19] =  TOP_inst.U0_Register_File.\Memory_reg[10][6] .Q ;   // OR = 15;  pos = 19;  Pin Index = 24397;  Pin Name = U0_Register_File.\Memory_reg[10][6].Q;  pinInvFromLatch = no;  Latch Index = 7842;  Latch Name = U0_Register_File.\Memory_reg[10][6].__iNsT2.dff_primitive;   

  assign // OR = 16 
    part_M_OR_16_TM_1 [1] =  TOP_inst.ScanOut_16 ,   // OR = 16;  pos = 1;  Pin Index = 33;  Pin Name = ScanOut_16;  pinInvFromLatch = no;  Latch Index = 17476;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [2] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0] .Q ,   // OR = 16;  pos = 2;  Pin Index = 54347;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 17441;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [3] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3] .Q ,   // OR = 16;  pos = 3;  Pin Index = 54241;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 17406;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [4] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2] .Q ,   // OR = 16;  pos = 4;  Pin Index = 54135;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 17371;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [5] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1] .Q ,   // OR = 16;  pos = 5;  Pin Index = 54029;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 17336;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [6] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0] .Q ,   // OR = 16;  pos = 6;  Pin Index = 53923;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 17301;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\counter_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [7] = !TOP_inst.U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.QN ,   // OR = 16;  pos = 7;  Pin Index = 53821;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.QN;  pinInvFromLatch = yes;  Latch Index = 17266;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.S_DATA_reg.__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [8] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7] .Q ,   // OR = 16;  pos = 8;  Pin Index = 53513;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 17177;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [9] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6] .Q ,   // OR = 16;  pos = 9;  Pin Index = 53407;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 17142;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [10] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5] .Q ,   // OR = 16;  pos = 10;  Pin Index = 53301;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 17107;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [11] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4] .Q ,   // OR = 16;  pos = 11;  Pin Index = 53195;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 17072;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [12] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3] .Q ,   // OR = 16;  pos = 12;  Pin Index = 53089;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 17037;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [13] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2] .Q ,   // OR = 16;  pos = 13;  Pin Index = 52983;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 17002;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [14] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1] .Q ,   // OR = 16;  pos = 14;  Pin Index = 52877;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 16967;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [15] =  TOP_inst.U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0] .Q ,   // OR = 16;  pos = 15;  Pin Index = 52771;  Pin Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 16932;  Latch Name = U0_UART.U0_UART_TX.U0_parity_Calc.\parallel_data_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [16] =  TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2] .Q ,   // OR = 16;  pos = 16;  Pin Index = 52487;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 16841;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_16_TM_1 [17] =  TOP_inst.U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1] .Q ;   // OR = 16;  pos = 17;  Pin Index = 52381;  Pin Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 16806;  Latch Name = U0_UART.U0_UART_TX.U0_FSM.\current_state_reg[1].__iNsT2.dff_primitive;   

  assign // OR = 17 
    part_M_OR_17_TM_1 [1] =  TOP_inst.ScanOut_17 ,   // OR = 17;  pos = 1;  Pin Index = 34;  Pin Name = ScanOut_17;  pinInvFromLatch = no;  Latch Index = 9137;  Latch Name = U0_Register_File.\Memory_reg[15][3].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [2] =  TOP_inst.U0_Register_File.\Memory_reg[15][2] .Q ,   // OR = 17;  pos = 2;  Pin Index = 28213;  Pin Name = U0_Register_File.\Memory_reg[15][2].Q;  pinInvFromLatch = no;  Latch Index = 9102;  Latch Name = U0_Register_File.\Memory_reg[15][2].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [3] =  TOP_inst.U0_Register_File.\Memory_reg[15][1] .Q ,   // OR = 17;  pos = 3;  Pin Index = 28107;  Pin Name = U0_Register_File.\Memory_reg[15][1].Q;  pinInvFromLatch = no;  Latch Index = 9067;  Latch Name = U0_Register_File.\Memory_reg[15][1].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [4] =  TOP_inst.U0_Register_File.\Memory_reg[15][0] .Q ,   // OR = 17;  pos = 4;  Pin Index = 28001;  Pin Name = U0_Register_File.\Memory_reg[15][0].Q;  pinInvFromLatch = no;  Latch Index = 9032;  Latch Name = U0_Register_File.\Memory_reg[15][0].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [5] =  TOP_inst.U0_Register_File.\Memory_reg[14][7] .Q ,   // OR = 17;  pos = 5;  Pin Index = 27895;  Pin Name = U0_Register_File.\Memory_reg[14][7].Q;  pinInvFromLatch = no;  Latch Index = 8997;  Latch Name = U0_Register_File.\Memory_reg[14][7].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [6] =  TOP_inst.U0_Register_File.\Memory_reg[14][6] .Q ,   // OR = 17;  pos = 6;  Pin Index = 27789;  Pin Name = U0_Register_File.\Memory_reg[14][6].Q;  pinInvFromLatch = no;  Latch Index = 8962;  Latch Name = U0_Register_File.\Memory_reg[14][6].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [7] =  TOP_inst.U0_Register_File.\Memory_reg[14][5] .Q ,   // OR = 17;  pos = 7;  Pin Index = 27683;  Pin Name = U0_Register_File.\Memory_reg[14][5].Q;  pinInvFromLatch = no;  Latch Index = 8927;  Latch Name = U0_Register_File.\Memory_reg[14][5].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [8] =  TOP_inst.U0_Register_File.\Memory_reg[14][4] .Q ,   // OR = 17;  pos = 8;  Pin Index = 27577;  Pin Name = U0_Register_File.\Memory_reg[14][4].Q;  pinInvFromLatch = no;  Latch Index = 8892;  Latch Name = U0_Register_File.\Memory_reg[14][4].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [9] =  TOP_inst.U0_Register_File.\Memory_reg[14][3] .Q ,   // OR = 17;  pos = 9;  Pin Index = 27471;  Pin Name = U0_Register_File.\Memory_reg[14][3].Q;  pinInvFromLatch = no;  Latch Index = 8857;  Latch Name = U0_Register_File.\Memory_reg[14][3].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [10] =  TOP_inst.U0_Register_File.\Memory_reg[14][2] .Q ,   // OR = 17;  pos = 10;  Pin Index = 27365;  Pin Name = U0_Register_File.\Memory_reg[14][2].Q;  pinInvFromLatch = no;  Latch Index = 8822;  Latch Name = U0_Register_File.\Memory_reg[14][2].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [11] =  TOP_inst.U0_Register_File.\Memory_reg[14][1] .Q ,   // OR = 17;  pos = 11;  Pin Index = 27259;  Pin Name = U0_Register_File.\Memory_reg[14][1].Q;  pinInvFromLatch = no;  Latch Index = 8787;  Latch Name = U0_Register_File.\Memory_reg[14][1].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [12] =  TOP_inst.U0_Register_File.\Memory_reg[14][0] .Q ,   // OR = 17;  pos = 12;  Pin Index = 27153;  Pin Name = U0_Register_File.\Memory_reg[14][0].Q;  pinInvFromLatch = no;  Latch Index = 8752;  Latch Name = U0_Register_File.\Memory_reg[14][0].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [13] =  TOP_inst.U0_Register_File.\Memory_reg[13][7] .Q ,   // OR = 17;  pos = 13;  Pin Index = 27047;  Pin Name = U0_Register_File.\Memory_reg[13][7].Q;  pinInvFromLatch = no;  Latch Index = 8717;  Latch Name = U0_Register_File.\Memory_reg[13][7].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [14] =  TOP_inst.U0_Register_File.\Memory_reg[13][6] .Q ,   // OR = 17;  pos = 14;  Pin Index = 26941;  Pin Name = U0_Register_File.\Memory_reg[13][6].Q;  pinInvFromLatch = no;  Latch Index = 8682;  Latch Name = U0_Register_File.\Memory_reg[13][6].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [15] =  TOP_inst.U0_Register_File.\Memory_reg[13][5] .Q ,   // OR = 17;  pos = 15;  Pin Index = 26835;  Pin Name = U0_Register_File.\Memory_reg[13][5].Q;  pinInvFromLatch = no;  Latch Index = 8647;  Latch Name = U0_Register_File.\Memory_reg[13][5].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[13][4] .Q ,   // OR = 17;  pos = 16;  Pin Index = 26729;  Pin Name = U0_Register_File.\Memory_reg[13][4].Q;  pinInvFromLatch = no;  Latch Index = 8612;  Latch Name = U0_Register_File.\Memory_reg[13][4].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[13][3] .Q ,   // OR = 17;  pos = 17;  Pin Index = 26623;  Pin Name = U0_Register_File.\Memory_reg[13][3].Q;  pinInvFromLatch = no;  Latch Index = 8577;  Latch Name = U0_Register_File.\Memory_reg[13][3].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[13][2] .Q ,   // OR = 17;  pos = 18;  Pin Index = 26517;  Pin Name = U0_Register_File.\Memory_reg[13][2].Q;  pinInvFromLatch = no;  Latch Index = 8542;  Latch Name = U0_Register_File.\Memory_reg[13][2].__iNsT2.dff_primitive;   
    part_M_OR_17_TM_1 [19] =  TOP_inst.U0_Register_File.\Memory_reg[13][1] .Q ;   // OR = 17;  pos = 19;  Pin Index = 26411;  Pin Name = U0_Register_File.\Memory_reg[13][1].Q;  pinInvFromLatch = no;  Latch Index = 8507;  Latch Name = U0_Register_File.\Memory_reg[13][1].__iNsT2.dff_primitive;   

  assign // OR = 18 
    part_M_OR_18_TM_1 [1] =  TOP_inst.ScanOut_18 ,   // OR = 18;  pos = 1;  Pin Index = 35;  Pin Name = ScanOut_18;  pinInvFromLatch = no;  Latch Index = 13243;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [2] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[3] .Q ,   // OR = 18;  pos = 2;  Pin Index = 41138;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 13208;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [3] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[2] .Q ,   // OR = 18;  pos = 3;  Pin Index = 41032;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 13173;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [4] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[1] .Q ,   // OR = 18;  pos = 4;  Pin Index = 40926;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 13138;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [5] =  TOP_inst.U0_SYS_CTRL.\ADDR_REG_reg[0] .Q ,   // OR = 18;  pos = 5;  Pin Index = 40820;  Pin Name = U0_SYS_CTRL.\ADDR_REG_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 13103;  Latch Name = U0_SYS_CTRL.\ADDR_REG_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [6] =  TOP_inst.U0_SYS_CTRL.DFT_tpi_xor_tree_16.DFT_CDNS_OBS_tpi_flop.Q ,   // OR = 18;  pos = 6;  Pin Index = 40724;  Pin Name = U0_SYS_CTRL.DFT_tpi_xor_tree_16.DFT_CDNS_OBS_tpi_flop.Q;  pinInvFromLatch = no;  Latch Index = 13061;  Latch Name = U0_SYS_CTRL.DFT_tpi_xor_tree_16.DFT_CDNS_OBS_tpi_flop.__iNsT1.dff_primitive;   
    part_M_OR_18_TM_1 [7] =  TOP_inst.U0_Register_File.\RdData_reg[7] .Q ,   // OR = 18;  pos = 7;  Pin Index = 37214;  Pin Name = U0_Register_File.\RdData_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 12074;  Latch Name = U0_Register_File.\RdData_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [8] =  TOP_inst.U0_Register_File.\RdData_reg[6] .Q ,   // OR = 18;  pos = 8;  Pin Index = 37108;  Pin Name = U0_Register_File.\RdData_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 12039;  Latch Name = U0_Register_File.\RdData_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [9] =  TOP_inst.U0_Register_File.\RdData_reg[5] .Q ,   // OR = 18;  pos = 9;  Pin Index = 37002;  Pin Name = U0_Register_File.\RdData_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 12004;  Latch Name = U0_Register_File.\RdData_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [10] =  TOP_inst.U0_Register_File.\RdData_reg[4] .Q ,   // OR = 18;  pos = 10;  Pin Index = 36896;  Pin Name = U0_Register_File.\RdData_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 11969;  Latch Name = U0_Register_File.\RdData_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [11] =  TOP_inst.U0_Register_File.\RdData_reg[3] .Q ,   // OR = 18;  pos = 11;  Pin Index = 36790;  Pin Name = U0_Register_File.\RdData_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 11934;  Latch Name = U0_Register_File.\RdData_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [12] =  TOP_inst.U0_Register_File.\RdData_reg[2] .Q ,   // OR = 18;  pos = 12;  Pin Index = 36684;  Pin Name = U0_Register_File.\RdData_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 11899;  Latch Name = U0_Register_File.\RdData_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [13] =  TOP_inst.U0_Register_File.\RdData_reg[1] .Q ,   // OR = 18;  pos = 13;  Pin Index = 36578;  Pin Name = U0_Register_File.\RdData_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 11864;  Latch Name = U0_Register_File.\RdData_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [14] =  TOP_inst.U0_Register_File.\RdData_reg[0] .Q ,   // OR = 18;  pos = 14;  Pin Index = 36472;  Pin Name = U0_Register_File.\RdData_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 11829;  Latch Name = U0_Register_File.\RdData_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [15] =  TOP_inst.U0_Register_File.RdData_Valid_reg.Q ,   // OR = 18;  pos = 15;  Pin Index = 22807;  Pin Name = U0_Register_File.RdData_Valid_reg.Q;  pinInvFromLatch = no;  Latch Index = 7317;  Latch Name = U0_Register_File.RdData_Valid_reg.__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [16] =  TOP_inst.U0_Register_File.\Memory_reg[15][7] .Q ,   // OR = 18;  pos = 16;  Pin Index = 28743;  Pin Name = U0_Register_File.\Memory_reg[15][7].Q;  pinInvFromLatch = no;  Latch Index = 9277;  Latch Name = U0_Register_File.\Memory_reg[15][7].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [17] =  TOP_inst.U0_Register_File.\Memory_reg[15][6] .Q ,   // OR = 18;  pos = 17;  Pin Index = 28637;  Pin Name = U0_Register_File.\Memory_reg[15][6].Q;  pinInvFromLatch = no;  Latch Index = 9242;  Latch Name = U0_Register_File.\Memory_reg[15][6].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [18] =  TOP_inst.U0_Register_File.\Memory_reg[15][5] .Q ,   // OR = 18;  pos = 18;  Pin Index = 28531;  Pin Name = U0_Register_File.\Memory_reg[15][5].Q;  pinInvFromLatch = no;  Latch Index = 9207;  Latch Name = U0_Register_File.\Memory_reg[15][5].__iNsT2.dff_primitive;   
    part_M_OR_18_TM_1 [19] =  TOP_inst.U0_Register_File.\Memory_reg[15][4] .Q ;   // OR = 18;  pos = 19;  Pin Index = 28425;  Pin Name = U0_Register_File.\Memory_reg[15][4].Q;  pinInvFromLatch = no;  Latch Index = 9172;  Latch Name = U0_Register_File.\Memory_reg[15][4].__iNsT2.dff_primitive;   

  assign // OR = 19 
    part_M_OR_19_TM_1 [1] =  TOP_inst.ScanOut_19 ,   // OR = 19;  pos = 1;  Pin Index = 36;  Pin Name = ScanOut_19;  pinInvFromLatch = no;  Latch Index = 13908;  Latch Name = U0_SYS_CTRL.\current_state_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [2] =  TOP_inst.U0_SYS_CTRL.\current_state_reg[2] .Q ,   // OR = 19;  pos = 2;  Pin Index = 43152;  Pin Name = U0_SYS_CTRL.\current_state_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 13873;  Latch Name = U0_SYS_CTRL.\current_state_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [3] =  TOP_inst.U0_SYS_CTRL.\current_state_reg[1] .Q ,   // OR = 19;  pos = 3;  Pin Index = 43046;  Pin Name = U0_SYS_CTRL.\current_state_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 13838;  Latch Name = U0_SYS_CTRL.\current_state_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [4] =  TOP_inst.U0_SYS_CTRL.\current_state_reg[0] .Q ,   // OR = 19;  pos = 4;  Pin Index = 42940;  Pin Name = U0_SYS_CTRL.\current_state_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 13803;  Latch Name = U0_SYS_CTRL.\current_state_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [5] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[15] .Q ,   // OR = 19;  pos = 5;  Pin Index = 41880;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].Q;  pinInvFromLatch = no;  Latch Index = 13453;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[15].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [6] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[14] .Q ,   // OR = 19;  pos = 6;  Pin Index = 41774;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].Q;  pinInvFromLatch = no;  Latch Index = 13418;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[14].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [7] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[13] .Q ,   // OR = 19;  pos = 7;  Pin Index = 41668;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].Q;  pinInvFromLatch = no;  Latch Index = 13383;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[13].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [8] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[12] .Q ,   // OR = 19;  pos = 8;  Pin Index = 41562;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].Q;  pinInvFromLatch = no;  Latch Index = 13348;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[12].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [9] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[11] .Q ,   // OR = 19;  pos = 9;  Pin Index = 41456;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].Q;  pinInvFromLatch = no;  Latch Index = 13313;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[11].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [10] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[10] .Q ,   // OR = 19;  pos = 10;  Pin Index = 41350;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].Q;  pinInvFromLatch = no;  Latch Index = 13278;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[10].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [11] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[9] .Q ,   // OR = 19;  pos = 11;  Pin Index = 42834;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].Q;  pinInvFromLatch = no;  Latch Index = 13768;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[9].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [12] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[8] .Q ,   // OR = 19;  pos = 12;  Pin Index = 42728;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].Q;  pinInvFromLatch = no;  Latch Index = 13733;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[8].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [13] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[7] .Q ,   // OR = 19;  pos = 13;  Pin Index = 42622;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 13698;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [14] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[6] .Q ,   // OR = 19;  pos = 14;  Pin Index = 42516;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 13663;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [15] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[5] .Q ,   // OR = 19;  pos = 15;  Pin Index = 42410;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 13628;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [16] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[4] .Q ,   // OR = 19;  pos = 16;  Pin Index = 42304;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 13593;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [17] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[3] .Q ,   // OR = 19;  pos = 17;  Pin Index = 42198;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 13558;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [18] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[2] .Q ,   // OR = 19;  pos = 18;  Pin Index = 42092;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 13523;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_19_TM_1 [19] =  TOP_inst.U0_SYS_CTRL.\ALU_OUT_REG_reg[1] .Q ;   // OR = 19;  pos = 19;  Pin Index = 41986;  Pin Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 13488;  Latch Name = U0_SYS_CTRL.\ALU_OUT_REG_reg[1].__iNsT2.dff_primitive;   

  assign // OR = 20 
    part_M_OR_20_TM_1 [1] =  TOP_inst.ScanOut_20 ,   // OR = 20;  pos = 1;  Pin Index = 38;  Pin Name = ScanOut_20;  pinInvFromLatch = no;  Latch Index = 18326;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [2] =  TOP_inst.U1_RST_SYNC_UART.\sync_reg_reg[0] .Q ,   // OR = 20;  pos = 2;  Pin Index = 56913;  Pin Name = U1_RST_SYNC_UART.\sync_reg_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 18291;  Latch Name = U1_RST_SYNC_UART.\sync_reg_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [3] =  TOP_inst.U1_Integer_Clock_Divider_RX.gen_clk_reg.Q ,   // OR = 20;  pos = 3;  Pin Index = 56801;  Pin Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.Q;  pinInvFromLatch = no;  Latch Index = 18255;  Latch Name = U1_Integer_Clock_Divider_RX.gen_clk_reg.__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [4] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[6] .Q ,   // OR = 20;  pos = 4;  Pin Index = 56351;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 18101;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [5] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[5] .Q ,   // OR = 20;  pos = 5;  Pin Index = 56245;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 18066;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [6] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[4] .Q ,   // OR = 20;  pos = 6;  Pin Index = 56139;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 18031;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [7] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[3] .Q ,   // OR = 20;  pos = 7;  Pin Index = 56033;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 17996;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [8] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[2] .Q ,   // OR = 20;  pos = 8;  Pin Index = 55927;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 17961;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [9] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[1] .Q ,   // OR = 20;  pos = 9;  Pin Index = 55821;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 17926;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [10] =  TOP_inst.U1_Integer_Clock_Divider_RX.\counter_reg[0] .Q ,   // OR = 20;  pos = 10;  Pin Index = 55715;  Pin Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 17891;  Latch Name = U1_Integer_Clock_Divider_RX.\counter_reg[0].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [11] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.Q ,   // OR = 20;  pos = 11;  Pin Index = 55593;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.Q;  pinInvFromLatch = no;  Latch Index = 17855;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.ser_done_reg.__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [12] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7] .Q ,   // OR = 20;  pos = 12;  Pin Index = 55089;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 17686;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [13] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6] .Q ,   // OR = 20;  pos = 13;  Pin Index = 54983;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 17651;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [14] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5] .Q ,   // OR = 20;  pos = 14;  Pin Index = 54877;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 17616;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [15] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4] .Q ,   // OR = 20;  pos = 15;  Pin Index = 54771;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 17581;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [16] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3] .Q ,   // OR = 20;  pos = 16;  Pin Index = 54665;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 17546;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_20_TM_1 [17] =  TOP_inst.U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2] .Q ;   // OR = 20;  pos = 17;  Pin Index = 54559;  Pin Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 17511;  Latch Name = U0_UART.U0_UART_TX.U0_serializer.\parallel_data_reg[2].__iNsT2.dff_primitive;   

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
      name_POs [2] = "ScanOut_10";      // pinName = ScanOut_10;  tf =  SO9 ; 
      name_POs [3] = "ScanOut_11";      // pinName = ScanOut_11;  tf =  SO10 ; 
      name_POs [4] = "ScanOut_12";      // pinName = ScanOut_12;  tf =  SO11 ; 
      name_POs [5] = "ScanOut_13";      // pinName = ScanOut_13;  tf =  SO12 ; 
      name_POs [6] = "ScanOut_14";      // pinName = ScanOut_14;  tf =  SO13 ; 
      name_POs [7] = "ScanOut_15";      // pinName = ScanOut_15;  tf =  SO14 ; 
      name_POs [8] = "ScanOut_16";      // pinName = ScanOut_16;  tf =  SO15 ; 
      name_POs [9] = "ScanOut_17";      // pinName = ScanOut_17;  tf =  SO16 ; 
      name_POs [10] = "ScanOut_18";      // pinName = ScanOut_18;  tf =  SO17 ; 
      name_POs [11] = "ScanOut_19";      // pinName = ScanOut_19;  tf =  SO18 ; 
      name_POs [12] = "ScanOut_2";      // pinName = ScanOut_2;  tf =  SO1 ; 
      name_POs [13] = "ScanOut_20";      // pinName = ScanOut_20;  tf =  SO19 ; 
      name_POs [14] = "ScanOut_3";      // pinName = ScanOut_3;  tf =  SO2 ; 
      name_POs [15] = "ScanOut_4";      // pinName = ScanOut_4;  tf =  SO3 ; 
      name_POs [16] = "ScanOut_5";      // pinName = ScanOut_5;  tf =  SO4 ; 
      name_POs [17] = "ScanOut_6";      // pinName = ScanOut_6;  tf =  SO5 ; 
      name_POs [18] = "ScanOut_7";      // pinName = ScanOut_7;  tf =  SO6 ; 
      name_POs [19] = "ScanOut_8";      // pinName = ScanOut_8;  tf =  SO7 ; 
      name_POs [20] = "ScanOut_9";      // pinName = ScanOut_9;  tf =  SO8 ; 
      name_POs [21] = "UART_TX_O";      // pinName = UART_TX_O; 
      name_POs [22] = "framing_error";      // pinName = framing_error; 
      name_POs [23] = "parity_error";      // pinName = parity_error; 



      if ( $test$plusargs ( "MODUS_DEBUG" ) )  sim_trace = 1'b1; 

      if ( $test$plusargs ( "HEARTBEAT" ) )  sim_heart = 1'b1; 

      if ( $value$plusargs ( "START_RANGE=%s", SOD ) )  sim_range = 1'b0; 
      if ( $value$plusargs ( "START_RANGE=%s", SOD ) ) sim_range_measure = 1'b0;

      if ( $value$plusargs ( "END_RANGE=%s", EOD ) ); 

      if ( $value$plusargs ( "miscompare_limit=%0f", miscompare_limit ) ); 

      if ( $test$plusargs ( "FAILSET" ) )  failset = 1'b1; 

      stim_PIs = {26{1'bX}};   
      stim_CIs = 26'b0XXXXXXXXXXXXXXXXXXXXXXX0X; 
      meas_POs = {23{1'bX}};   
      stim_CR_1 = {20{1'b0}};   stim_CR_2 = {20{1'b0}};   stim_CR_3 = {20{1'b0}};   stim_CR_4 = {20{1'b0}};   stim_CR_5 = {20{1'b0}};   stim_CR_6 = {20{1'b0}};   stim_CR_7 = {20{1'b0}};   stim_CR_8 = {20{1'b0}};   stim_CR_9 = {20{1'b0}};   stim_CR_10 = {20{1'b0}};   stim_CR_11 = {20{1'b0}};   stim_CR_12 = {20{1'b0}};   stim_CR_13 = {20{1'b0}};   stim_CR_14 = {20{1'b0}};   stim_CR_15 = {20{1'b0}};   stim_CR_16 = {20{1'b0}};   stim_CR_17 = {20{1'b0}};   stim_CR_18 = {20{1'b0}};   stim_CR_19 = {20{1'b0}};   stim_CR_20 = {20{1'b0}};   
      part_S_CR_1_TM_1 = {20{1'bZ}};   part_S_CR_2_TM_1 = {18{1'bZ}};   part_S_CR_3_TM_1 = {20{1'bZ}};   part_S_CR_4_TM_1 = {20{1'bZ}};   part_S_CR_5_TM_1 = {18{1'bZ}};   part_S_CR_6_TM_1 = {20{1'bZ}};   part_S_CR_7_TM_1 = {20{1'bZ}};   part_S_CR_8_TM_1 = {20{1'bZ}};   part_S_CR_9_TM_1 = {18{1'bZ}};   part_S_CR_10_TM_1 = {20{1'bZ}};   part_S_CR_11_TM_1 = {19{1'bZ}};   part_S_CR_12_TM_1 = {19{1'bZ}};   part_S_CR_13_TM_1 = {17{1'bZ}};   part_S_CR_14_TM_1 = {19{1'bZ}};   part_S_CR_15_TM_1 = {19{1'bZ}};   part_S_CR_16_TM_1 = {17{1'bZ}};   part_S_CR_17_TM_1 = {19{1'bZ}};   part_S_CR_18_TM_1 = {19{1'bZ}};   part_S_CR_19_TM_1 = {19{1'bZ}};   part_S_CR_20_TM_1 = {17{1'bZ}};   
      meas_OR_1 = {20{1'bX}};   meas_OR_2 = {20{1'bX}};   meas_OR_3 = {20{1'bX}};   meas_OR_4 = {20{1'bX}};   meas_OR_5 = {20{1'bX}};   meas_OR_6 = {20{1'bX}};   meas_OR_7 = {20{1'bX}};   meas_OR_8 = {20{1'bX}};   meas_OR_9 = {20{1'bX}};   meas_OR_10 = {20{1'bX}};   meas_OR_11 = {20{1'bX}};   meas_OR_12 = {20{1'bX}};   meas_OR_13 = {20{1'bX}};   meas_OR_14 = {20{1'bX}};   meas_OR_15 = {20{1'bX}};   meas_OR_16 = {20{1'bX}};   meas_OR_17 = {20{1'bX}};   meas_OR_18 = {20{1'bX}};   meas_OR_19 = {20{1'bX}};   meas_OR_20 = {20{1'bX}};   

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
      part_PIs [5] = stim_PIs [5];      // pinName = ScanIn_10;  tf =  SI9 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [6] = stim_PIs [6];      // pinName = ScanIn_11;  tf =  SI10 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [7] = stim_PIs [7];      // pinName = ScanIn_12;  tf =  SI11 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [8] = stim_PIs [8];      // pinName = ScanIn_13;  tf =  SI12 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [9] = stim_PIs [9];      // pinName = ScanIn_14;  tf =  SI13 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [10] = stim_PIs [10];      // pinName = ScanIn_15;  tf =  SI14 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [11] = stim_PIs [11];      // pinName = ScanIn_16;  tf =  SI15 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [12] = stim_PIs [12];      // pinName = ScanIn_17;  tf =  SI16 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [13] = stim_PIs [13];      // pinName = ScanIn_18;  tf =  SI17 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [14] = stim_PIs [14];      // pinName = ScanIn_19;  tf =  SI18 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [15] = stim_PIs [15];      // pinName = ScanIn_2;  tf =  SI1 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [16] = stim_PIs [16];      // pinName = ScanIn_20;  tf =  SI19 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [17] = stim_PIs [17];      // pinName = ScanIn_3;  tf =  SI2 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [18] = stim_PIs [18];      // pinName = ScanIn_4;  tf =  SI3 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [19] = stim_PIs [19];      // pinName = ScanIn_5;  tf =  SI4 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [20] = stim_PIs [20];      // pinName = ScanIn_6;  tf =  SI5 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [21] = stim_PIs [21];      // pinName = ScanIn_7;  tf =  SI6 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [22] = stim_PIs [22];      // pinName = ScanIn_8;  tf =  SI7 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [23] = stim_PIs [23];      // pinName = ScanIn_9;  tf =  SI8 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [24] = stim_PIs [24];      // pinName = TestMode;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [26] = stim_PIs [26];      // pinName = UART_RX_IN; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_PIs [1];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [25] = stim_PIs [25];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_CIs [1];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [25] = stim_CIs [25];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 72.000000 ns;  From the start of the cycle.

      for ( POnum = 1; POnum <= 23; POnum = POnum + 1 ) begin 
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
      meas_POs = {23{1'bX}}; 

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
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 2;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_2 [ 0 + SCANCYCLE ], part_M_OR_2_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [12] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [12], PATTERN, SCANCYCLE, part_M_OR_2_TM_1 [ 0 + SCANCYCLE ] ); 
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
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 3;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_3 [ 0 + SCANCYCLE ], part_M_OR_3_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [14] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [14], PATTERN, SCANCYCLE, part_M_OR_3_TM_1 [ 0 + SCANCYCLE ] ); 
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
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 4;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_4 [ 0 + SCANCYCLE ], part_M_OR_4_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [15] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [15], PATTERN, SCANCYCLE, part_M_OR_4_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_4 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_5_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_5 [ 0 + SCANCYCLE ] ) & ( meas_OR_5 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_5;  tf =  SO4 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 5;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_5 [ 0 + SCANCYCLE ], part_M_OR_5_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [16] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [16], PATTERN, SCANCYCLE, part_M_OR_5_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_5 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_6_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_6 [ 0 + SCANCYCLE ] ) & ( meas_OR_6 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_6;  tf =  SO5 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 6;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_6 [ 0 + SCANCYCLE ], part_M_OR_6_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [17] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [17], PATTERN, SCANCYCLE, part_M_OR_6_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_6 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_7_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_7 [ 0 + SCANCYCLE ] ) & ( meas_OR_7 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_7;  tf =  SO6 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 7;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_7 [ 0 + SCANCYCLE ], part_M_OR_7_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [18] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [18], PATTERN, SCANCYCLE, part_M_OR_7_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_7 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_8_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_8 [ 0 + SCANCYCLE ] ) & ( meas_OR_8 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_8;  tf =  SO7 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 8;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_8 [ 0 + SCANCYCLE ], part_M_OR_8_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [19] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [19], PATTERN, SCANCYCLE, part_M_OR_8_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_8 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_9_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_9 [ 0 + SCANCYCLE ] ) & ( meas_OR_9 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_9;  tf =  SO8 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 9;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_9 [ 0 + SCANCYCLE ], part_M_OR_9_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [20] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [20], PATTERN, SCANCYCLE, part_M_OR_9_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_9 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_10_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_10 [ 0 + SCANCYCLE ] ) & ( meas_OR_10 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_10;  tf =  SO9 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 10;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_10 [ 0 + SCANCYCLE ], part_M_OR_10_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [2] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [2], PATTERN, SCANCYCLE, part_M_OR_10_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_10 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_11_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_11 [ 0 + SCANCYCLE ] ) & ( meas_OR_11 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_11;  tf =  SO10 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 11;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_11 [ 0 + SCANCYCLE ], part_M_OR_11_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [3] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [3], PATTERN, SCANCYCLE, part_M_OR_11_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_11 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_12_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_12 [ 0 + SCANCYCLE ] ) & ( meas_OR_12 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_12;  tf =  SO11 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 12;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_12 [ 0 + SCANCYCLE ], part_M_OR_12_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [4] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [4], PATTERN, SCANCYCLE, part_M_OR_12_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_12 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_13_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_13 [ 0 + SCANCYCLE ] ) & ( meas_OR_13 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_13;  tf =  SO12 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 13;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_13 [ 0 + SCANCYCLE ], part_M_OR_13_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [5] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [5], PATTERN, SCANCYCLE, part_M_OR_13_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_13 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_14_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_14 [ 0 + SCANCYCLE ] ) & ( meas_OR_14 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_14;  tf =  SO13 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 14;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_14 [ 0 + SCANCYCLE ], part_M_OR_14_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [6] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [6], PATTERN, SCANCYCLE, part_M_OR_14_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_14 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_15_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_15 [ 0 + SCANCYCLE ] ) & ( meas_OR_15 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_15;  tf =  SO14 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 15;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_15 [ 0 + SCANCYCLE ], part_M_OR_15_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [7] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [7], PATTERN, SCANCYCLE, part_M_OR_15_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_15 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_16_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_16 [ 0 + SCANCYCLE ] ) & ( meas_OR_16 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_16;  tf =  SO15 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 16;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_16 [ 0 + SCANCYCLE ], part_M_OR_16_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [8] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [8], PATTERN, SCANCYCLE, part_M_OR_16_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_16 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_17_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_17 [ 0 + SCANCYCLE ] ) & ( meas_OR_17 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_17;  tf =  SO16 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 17;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_17 [ 0 + SCANCYCLE ], part_M_OR_17_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [9] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [9], PATTERN, SCANCYCLE, part_M_OR_17_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_17 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_18_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_18 [ 0 + SCANCYCLE ] ) & ( meas_OR_18 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_18;  tf =  SO17 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 18;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_18 [ 0 + SCANCYCLE ], part_M_OR_18_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [10] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [10], PATTERN, SCANCYCLE, part_M_OR_18_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_18 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_19_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_19 [ 0 + SCANCYCLE ] ) & ( meas_OR_19 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_19;  tf =  SO18 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 19;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_19 [ 0 + SCANCYCLE ], part_M_OR_19_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [11] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [11], PATTERN, SCANCYCLE, part_M_OR_19_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_19 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_20_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_20 [ 0 + SCANCYCLE ] ) & ( meas_OR_20 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_20;  tf =  SO19 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 20;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_20 [ 0 + SCANCYCLE ], part_M_OR_20_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [13] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [13], PATTERN, SCANCYCLE, part_M_OR_20_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_20 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 
      end  
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 [1:20] = stim_CR_1 [1:20]; 
      part_S_CR_2_TM_1 [1:18] = stim_CR_2 [3:20]; 
      part_S_CR_3_TM_1 [1:20] = stim_CR_3 [1:20]; 
      part_S_CR_4_TM_1 [1:20] = stim_CR_4 [1:20]; 
      part_S_CR_5_TM_1 [1:18] = stim_CR_5 [3:20]; 
      part_S_CR_6_TM_1 [1:20] = stim_CR_6 [1:20]; 
      part_S_CR_7_TM_1 [1:20] = stim_CR_7 [1:20]; 
      part_S_CR_8_TM_1 [1:20] = stim_CR_8 [1:20]; 
      part_S_CR_9_TM_1 [1:18] = stim_CR_9 [3:20]; 
      part_S_CR_10_TM_1 [1:20] = stim_CR_10 [1:20]; 
      part_S_CR_11_TM_1 [1:19] = stim_CR_11 [2:20]; 
      part_S_CR_12_TM_1 [1:19] = stim_CR_12 [2:20]; 
      part_S_CR_13_TM_1 [1:17] = stim_CR_13 [4:20]; 
      part_S_CR_14_TM_1 [1:19] = stim_CR_14 [2:20]; 
      part_S_CR_15_TM_1 [1:19] = stim_CR_15 [2:20]; 
      part_S_CR_16_TM_1 [1:17] = stim_CR_16 [4:20]; 
      part_S_CR_17_TM_1 [1:19] = stim_CR_17 [2:20]; 
      part_S_CR_18_TM_1 [1:19] = stim_CR_18 [2:20]; 
      part_S_CR_19_TM_1 [1:19] = stim_CR_19 [2:20]; 
      part_S_CR_20_TM_1 [1:17] = stim_CR_20 [4:20]; 
     #16.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [1] = 1'b1;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [25] = 1'b1;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
      part_PIs [1] = 1'b0;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [25] = 1'b0;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 = {20{1'bZ}};   part_S_CR_2_TM_1 = {18{1'bZ}};   part_S_CR_3_TM_1 = {20{1'bZ}};   part_S_CR_4_TM_1 = {20{1'bZ}};   part_S_CR_5_TM_1 = {18{1'bZ}};   part_S_CR_6_TM_1 = {20{1'bZ}};   part_S_CR_7_TM_1 = {20{1'bZ}};   part_S_CR_8_TM_1 = {20{1'bZ}};   part_S_CR_9_TM_1 = {18{1'bZ}};   part_S_CR_10_TM_1 = {20{1'bZ}};   part_S_CR_11_TM_1 = {19{1'bZ}};   part_S_CR_12_TM_1 = {19{1'bZ}};   part_S_CR_13_TM_1 = {17{1'bZ}};   part_S_CR_14_TM_1 = {19{1'bZ}};   part_S_CR_15_TM_1 = {19{1'bZ}};   part_S_CR_16_TM_1 = {17{1'bZ}};   part_S_CR_17_TM_1 = {19{1'bZ}};   part_S_CR_18_TM_1 = {19{1'bZ}};   part_S_CR_19_TM_1 = {19{1'bZ}};   part_S_CR_20_TM_1 = {17{1'bZ}};   
     #0; 
      meas_OR_1 = {20{1'bX}};   meas_OR_2 = {20{1'bX}};   meas_OR_3 = {20{1'bX}};   meas_OR_4 = {20{1'bX}};   meas_OR_5 = {20{1'bX}};   meas_OR_6 = {20{1'bX}};   meas_OR_7 = {20{1'bX}};   meas_OR_8 = {20{1'bX}};   meas_OR_9 = {20{1'bX}};   meas_OR_10 = {20{1'bX}};   meas_OR_11 = {20{1'bX}};   meas_OR_12 = {20{1'bX}};   meas_OR_13 = {20{1'bX}};   meas_OR_14 = {20{1'bX}};   meas_OR_15 = {20{1'bX}};   meas_OR_16 = {20{1'bX}};   meas_OR_17 = {20{1'bX}};   meas_OR_18 = {20{1'bX}};   meas_OR_19 = {20{1'bX}};   meas_OR_20 = {20{1'bX}};   
      stim_CR_1 = {20{1'b0}};   stim_CR_2 = {20{1'b0}};   stim_CR_3 = {20{1'b0}};   stim_CR_4 = {20{1'b0}};   stim_CR_5 = {20{1'b0}};   stim_CR_6 = {20{1'b0}};   stim_CR_7 = {20{1'b0}};   stim_CR_8 = {20{1'b0}};   stim_CR_9 = {20{1'b0}};   stim_CR_10 = {20{1'b0}};   stim_CR_11 = {20{1'b0}};   stim_CR_12 = {20{1'b0}};   stim_CR_13 = {20{1'b0}};   stim_CR_14 = {20{1'b0}};   stim_CR_15 = {20{1'b0}};   stim_CR_16 = {20{1'b0}};   stim_CR_17 = {20{1'b0}};   stim_CR_18 = {20{1'b0}};   stim_CR_19 = {20{1'b0}};   stim_CR_20 = {20{1'b0}};   
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
            rc_read = $fscanf ( DATAID, "%b", stim_PIs [1:26] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        201: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_CIs [1:26] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        202: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", meas_POs [1:23] ); 
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
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_1 [1:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_2 [3:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    3: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_3 [1:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    4: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_4 [1:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    5: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_5 [3:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    6: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_6 [1:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    7: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_7 [1:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    8: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_8 [1:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    9: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_9 [3:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    10: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_10 [1:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    11: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_11 [2:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    12: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_12 [2:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    13: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_13 [4:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    14: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_14 [2:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    15: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_15 [2:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    16: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_16 [4:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    17: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_17 [2:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    18: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_18 [2:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    19: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_19 [2:20] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    20: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_20 [4:20] ); 
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
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_1 [1:20] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_1 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_2 [1:18] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_2 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    3: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_3 [1:20] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_3 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    4: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_4 [1:20] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_4 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    5: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_5 [1:18] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_5 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    6: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_6 [1:20] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_6 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    7: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_7 [1:20] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_7 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    8: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_8 [1:20] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_8 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    9: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_9 [1:18] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_9 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    10: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_10 [1:20] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_10 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    11: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_11 [1:19] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_11 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    12: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_12 [1:19] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_12 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    13: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_13 [1:17] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_13 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    14: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_14 [1:19] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_14 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    15: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_15 [1:19] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_15 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    16: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_16 [1:17] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_16 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    17: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_17 [1:19] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_17 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    18: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_18 [1:19] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_18 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    19: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_19 [1:19] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_19 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    20: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_20 [1:17] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_20 = 'bx;
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
