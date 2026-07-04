//***************************************************************************//
//                           VERILOG MAINSIM FILE                            //
// Modus(TM) DFT Software Solution, Version 25.10-p027_1, built Mar 13 2025  //
//***************************************************************************//
//                                                                           //
//  FILE CREATED..............July 04, 2026 at 15:06:52                      //
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
//  SCAN FORMAT...............serial   SCAN OVERLAP..............yes         //
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

// Command Line: write_vectors -WORKDIR /home/admin/DFT/SOCX/ATPG -TESTMODE FULLSCAN -INEXPERIMENT TOP_atpg -STDOUT summary -language verilog -outputfilename serial_vectors -scanformat serial

  `timescale 1 ns / 1 ps

  module ATPG_FULLSCAN_TOP_atpg ;

//***************************************************************************//
//                DEFINE VARIABLES FOR ALL PRIMARY I/O PORTS                 //
//***************************************************************************//

  reg [1:26] stim_PIs;   
  reg [1:26] part_PIs;   

  reg [1:26] stim_CIs;   

  reg [1:23] meas_POs;   
  wire [1:23] part_POs;   

//***************************************************************************//
//                   DEFINE VARIABLES FOR ALL SHIFT CHAINS                   //
//***************************************************************************//

  reg [1:20] stim_CR_1;   reg [1:20] stim_CR_2;   reg [1:20] stim_CR_3;   reg [1:20] stim_CR_4;   reg [1:20] stim_CR_5;   reg [1:20] stim_CR_6;   reg [1:20] stim_CR_7;   reg [1:20] stim_CR_8;   reg [1:20] stim_CR_9;   reg [1:20] stim_CR_10;   reg [1:20] stim_CR_11;   reg [1:20] stim_CR_12;   reg [1:20] stim_CR_13;   reg [1:20] stim_CR_14;   reg [1:20] stim_CR_15;   reg [1:20] stim_CR_16;   reg [1:20] stim_CR_17;   reg [1:20] stim_CR_18;   reg [1:20] stim_CR_19;   reg [1:20] stim_CR_20;   

  reg [1:20] meas_OR_1;   reg [1:20] meas_OR_2;   reg [1:20] meas_OR_3;   reg [1:20] meas_OR_4;   reg [1:20] meas_OR_5;   reg [1:20] meas_OR_6;   reg [1:20] meas_OR_7;   reg [1:20] meas_OR_8;   reg [1:20] meas_OR_9;   reg [1:20] meas_OR_10;   reg [1:20] meas_OR_11;   reg [1:20] meas_OR_12;   reg [1:20] meas_OR_13;   reg [1:20] meas_OR_14;   reg [1:20] meas_OR_15;   reg [1:20] meas_OR_16;   reg [1:20] meas_OR_17;   reg [1:20] meas_OR_18;   reg [1:20] meas_OR_19;   reg [1:20] meas_OR_20;   


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
      START = 0; 
      for ( SCANCYCLE = 1; SCANCYCLE <= MAX; SCANCYCLE = SCANCYCLE + 1 ) begin 
        CYCLE = CYCLE + 1; 
        SERIALCYCLE = SERIALCYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
        part_PIs [4] = stim_CR_1 [ 0 + SCANCYCLE ];      // pinName = ScanIn_1;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [15] = stim_CR_2 [ 0 + SCANCYCLE ];      // pinName = ScanIn_2;  tf =  SI1 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [17] = stim_CR_3 [ 0 + SCANCYCLE ];      // pinName = ScanIn_3;  tf =  SI2 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [18] = stim_CR_4 [ 0 + SCANCYCLE ];      // pinName = ScanIn_4;  tf =  SI3 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [19] = stim_CR_5 [ 0 + SCANCYCLE ];      // pinName = ScanIn_5;  tf =  SI4 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [20] = stim_CR_6 [ 0 + SCANCYCLE ];      // pinName = ScanIn_6;  tf =  SI5 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [21] = stim_CR_7 [ 0 + SCANCYCLE ];      // pinName = ScanIn_7;  tf =  SI6 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [22] = stim_CR_8 [ 0 + SCANCYCLE ];      // pinName = ScanIn_8;  tf =  SI7 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [23] = stim_CR_9 [ 0 + SCANCYCLE ];      // pinName = ScanIn_9;  tf =  SI8 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [5] = stim_CR_10 [ 0 + SCANCYCLE ];      // pinName = ScanIn_10;  tf =  SI9 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [6] = stim_CR_11 [ 0 + SCANCYCLE ];      // pinName = ScanIn_11;  tf =  SI10 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [7] = stim_CR_12 [ 0 + SCANCYCLE ];      // pinName = ScanIn_12;  tf =  SI11 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [8] = stim_CR_13 [ 0 + SCANCYCLE ];      // pinName = ScanIn_13;  tf =  SI12 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [9] = stim_CR_14 [ 0 + SCANCYCLE ];      // pinName = ScanIn_14;  tf =  SI13 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [10] = stim_CR_15 [ 0 + SCANCYCLE ];      // pinName = ScanIn_15;  tf =  SI14 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [11] = stim_CR_16 [ 0 + SCANCYCLE ];      // pinName = ScanIn_16;  tf =  SI15 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [12] = stim_CR_17 [ 0 + SCANCYCLE ];      // pinName = ScanIn_17;  tf =  SI16 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [13] = stim_CR_18 [ 0 + SCANCYCLE ];      // pinName = ScanIn_18;  tf =  SI17 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [14] = stim_CR_19 [ 0 + SCANCYCLE ];      // pinName = ScanIn_19;  tf =  SI18 ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [16] = stim_CR_20 [ 0 + SCANCYCLE ];      // pinName = ScanIn_20;  tf =  SI19 ; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.

        if (( part_POs [1] !== meas_OR_1 [ 0 + SCANCYCLE ] ) & ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_1;  tf =  SO  ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 1;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_1 [ 0 + SCANCYCLE ], part_POs [1], SCANCYCLE, name_POs [1] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [1], PATTERN, SCANCYCLE, part_POs [1] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [12] !== meas_OR_2 [ 0 + SCANCYCLE ] ) & ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_2;  tf =  SO1 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 2;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_2 [ 0 + SCANCYCLE ], part_POs [12], SCANCYCLE, name_POs [12] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [12], PATTERN, SCANCYCLE, part_POs [12] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [14] !== meas_OR_3 [ 0 + SCANCYCLE ] ) & ( meas_OR_3 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_3;  tf =  SO2 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 3;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_3 [ 0 + SCANCYCLE ], part_POs [14], SCANCYCLE, name_POs [14] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [14], PATTERN, SCANCYCLE, part_POs [14] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_3 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [15] !== meas_OR_4 [ 0 + SCANCYCLE ] ) & ( meas_OR_4 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_4;  tf =  SO3 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 4;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_4 [ 0 + SCANCYCLE ], part_POs [15], SCANCYCLE, name_POs [15] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [15], PATTERN, SCANCYCLE, part_POs [15] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_4 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [16] !== meas_OR_5 [ 0 + SCANCYCLE ] ) & ( meas_OR_5 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_5;  tf =  SO4 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 5;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_5 [ 0 + SCANCYCLE ], part_POs [16], SCANCYCLE, name_POs [16] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [16], PATTERN, SCANCYCLE, part_POs [16] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_5 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [17] !== meas_OR_6 [ 0 + SCANCYCLE ] ) & ( meas_OR_6 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_6;  tf =  SO5 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 6;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_6 [ 0 + SCANCYCLE ], part_POs [17], SCANCYCLE, name_POs [17] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [17], PATTERN, SCANCYCLE, part_POs [17] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_6 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [18] !== meas_OR_7 [ 0 + SCANCYCLE ] ) & ( meas_OR_7 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_7;  tf =  SO6 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 7;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_7 [ 0 + SCANCYCLE ], part_POs [18], SCANCYCLE, name_POs [18] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [18], PATTERN, SCANCYCLE, part_POs [18] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_7 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [19] !== meas_OR_8 [ 0 + SCANCYCLE ] ) & ( meas_OR_8 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_8;  tf =  SO7 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 8;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_8 [ 0 + SCANCYCLE ], part_POs [19], SCANCYCLE, name_POs [19] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [19], PATTERN, SCANCYCLE, part_POs [19] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_8 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [20] !== meas_OR_9 [ 0 + SCANCYCLE ] ) & ( meas_OR_9 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_9;  tf =  SO8 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 9;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_9 [ 0 + SCANCYCLE ], part_POs [20], SCANCYCLE, name_POs [20] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [20], PATTERN, SCANCYCLE, part_POs [20] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_9 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [2] !== meas_OR_10 [ 0 + SCANCYCLE ] ) & ( meas_OR_10 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_10;  tf =  SO9 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 10;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_10 [ 0 + SCANCYCLE ], part_POs [2], SCANCYCLE, name_POs [2] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [2], PATTERN, SCANCYCLE, part_POs [2] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_10 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [3] !== meas_OR_11 [ 0 + SCANCYCLE ] ) & ( meas_OR_11 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_11;  tf =  SO10 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 11;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_11 [ 0 + SCANCYCLE ], part_POs [3], SCANCYCLE, name_POs [3] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [3], PATTERN, SCANCYCLE, part_POs [3] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_11 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [4] !== meas_OR_12 [ 0 + SCANCYCLE ] ) & ( meas_OR_12 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_12;  tf =  SO11 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 12;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_12 [ 0 + SCANCYCLE ], part_POs [4], SCANCYCLE, name_POs [4] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [4], PATTERN, SCANCYCLE, part_POs [4] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_12 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [5] !== meas_OR_13 [ 0 + SCANCYCLE ] ) & ( meas_OR_13 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_13;  tf =  SO12 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 13;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_13 [ 0 + SCANCYCLE ], part_POs [5], SCANCYCLE, name_POs [5] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [5], PATTERN, SCANCYCLE, part_POs [5] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_13 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [6] !== meas_OR_14 [ 0 + SCANCYCLE ] ) & ( meas_OR_14 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_14;  tf =  SO13 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 14;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_14 [ 0 + SCANCYCLE ], part_POs [6], SCANCYCLE, name_POs [6] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [6], PATTERN, SCANCYCLE, part_POs [6] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_14 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [7] !== meas_OR_15 [ 0 + SCANCYCLE ] ) & ( meas_OR_15 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_15;  tf =  SO14 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 15;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_15 [ 0 + SCANCYCLE ], part_POs [7], SCANCYCLE, name_POs [7] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [7], PATTERN, SCANCYCLE, part_POs [7] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_15 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [8] !== meas_OR_16 [ 0 + SCANCYCLE ] ) & ( meas_OR_16 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_16;  tf =  SO15 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 16;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_16 [ 0 + SCANCYCLE ], part_POs [8], SCANCYCLE, name_POs [8] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [8], PATTERN, SCANCYCLE, part_POs [8] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_16 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [9] !== meas_OR_17 [ 0 + SCANCYCLE ] ) & ( meas_OR_17 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_17;  tf =  SO16 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 17;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_17 [ 0 + SCANCYCLE ], part_POs [9], SCANCYCLE, name_POs [9] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [9], PATTERN, SCANCYCLE, part_POs [9] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_17 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [10] !== meas_OR_18 [ 0 + SCANCYCLE ] ) & ( meas_OR_18 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_18;  tf =  SO17 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 18;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_18 [ 0 + SCANCYCLE ], part_POs [10], SCANCYCLE, name_POs [10] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [10], PATTERN, SCANCYCLE, part_POs [10] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_18 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [11] !== meas_OR_19 [ 0 + SCANCYCLE ] ) & ( meas_OR_19 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_19;  tf =  SO18 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 19;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_19 [ 0 + SCANCYCLE ], part_POs [11], SCANCYCLE, name_POs [11] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [11], PATTERN, SCANCYCLE, part_POs [11] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_19 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [13] !== meas_OR_20 [ 0 + SCANCYCLE ] ) & ( meas_OR_20 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_20;  tf =  SO19 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 20;   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_20 [ 0 + SCANCYCLE ], part_POs [13], SCANCYCLE, name_POs [13] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP", name_POs [13], PATTERN, SCANCYCLE, part_POs [13] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_20 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
        part_PIs [1] = 1'b1;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
        part_PIs [25] = 1'b1;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
        part_PIs [1] = 1'b0;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
        part_PIs [25] = 1'b0;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      end  
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
