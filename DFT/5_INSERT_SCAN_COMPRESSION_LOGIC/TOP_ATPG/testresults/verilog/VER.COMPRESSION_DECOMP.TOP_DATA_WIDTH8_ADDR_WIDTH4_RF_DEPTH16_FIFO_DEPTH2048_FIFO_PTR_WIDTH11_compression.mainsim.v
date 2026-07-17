//***************************************************************************//
//                           VERILOG MAINSIM FILE                            //
// Modus(TM) DFT Software Solution, Version 25.10-p027_1, built Mar 13 2025  //
//***************************************************************************//
//                                                                           //
//  FILE CREATED..............July 17, 2026 at 13:10:22                      //
//                                                                           //
//  PROJECT NAME..............TOP_ATPG                                       //
//                                                                           //
//  TESTMODE..................COMPRESSION_DECOMP                             //
//                                                                           //
//  INEXPERIMENT..............TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEP//
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
//  "DFT_mask_clk" (PI # 2)                                                  //
//  TEST OFFSET...............0.000                                          //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  "REF_CLK" (PI # 5)                                                       //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  "UART_CLK" (PI # 11)                                                     //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  Active TESTMODEs TM = 3 ..COMPRESSION_DECOMP                             //
//                                                                           //
//***************************************************************************//

// Command Line: write_vectors -WORKDIR /home/admin/DFT/SOCX/DFT/5_INSERT_SCAN_COMPRESSION_LOGIC/TOP_ATPG -TESTMODE COMPRESSION_DECOMP -INEXPERIMENT TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_compression -STDOUT summary -language verilog -scanformat serial

  `timescale 1 ns / 1 ps

  module TOP_ATPG_COMPRESSION_DECOMP_TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_compression ;

//***************************************************************************//
//                DEFINE VARIABLES FOR ALL PRIMARY I/O PORTS                 //
//***************************************************************************//

  reg [1:12] stim_PIs;   
  reg [1:12] part_PIs;   

  reg [1:12] stim_CIs;   

  reg [1:5] meas_POs;   
  wire [1:5] part_POs;   

//***************************************************************************//
//                   DEFINE VARIABLES FOR ALL SHIFT CHAINS                   //
//***************************************************************************//

  reg [1:29] stim_CR_1;   reg [1:29] stim_CR_2;   

  reg [1:29] meas_OR_1;   reg [1:29] meas_OR_2;   


//***************************************************************************//
//       DEFINE VARIABLES FOR ALL CHANNEL MASK AND MASK ENABLE CHAINS        //
//***************************************************************************//

  reg [1:147] stim_CMSR_1;   reg [1:147] stim_CMSR_2;   



  reg [1:29] stim_CME_0;   

//***************************************************************************//
//                             OTHER DEFINITIONS                             //
//***************************************************************************//

  integer  CYCLE, SCANCYCLE, SERIALCYCLE, PInum, POnum, ORnum, MODENUM, EXPNUM, SCANOPNUM, SEQNUM, TASKNUM, START, NUM_SHIFTS, MultiShift, maxMultiShifts, MultiShiftsLeft, forcePointStart, forcePoint, SCANNUM, FREQNUM ; 
  integer  CMD, DATAID, SAVEID, TID, num_files, rc_read, repeat_depth, repeat_heart, MAX, FAILSETID, DIAG_DATAID; 
  integer  test_num, test_num_prev, failed_test_num, num_tests, num_failed_tests, total_num_tests, total_num_failed_tests, total_cycles, scan_num, overlap; 
  integer  repeat_num  [1:15]; 
  integer  num_repeats [1:15]; 
  reg      [1:8185] name_POs [1:5]; 
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

  TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11
    TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_inst (
      .RST_N                  ( part_PIs[0006] ),      // pinName = RST_N;  tf = -SC  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .UART_CLK               ( part_PIs[0011] ),      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .REF_CLK                ( part_PIs[0005] ),      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .UART_RX_IN             ( part_PIs[0012] ),      // pinName = UART_RX_IN; testOffset = 0.000000;  scanOffset = 0.000000;  
      .UART_TX_O              ( part_POs[0003] ),      // pinName = UART_TX_O; 
      .parity_error           ( part_POs[0005] ),      // pinName = parity_error; 
      .framing_error          ( part_POs[0004] ),      // pinName = framing_error; 
      .ScanEnable             ( part_PIs[0007] ),      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .TestMode               ( part_PIs[0010] ),      // pinName = TestMode;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanIn_1               ( part_PIs[0008] ),      // pinName = ScanIn_1;  tf =  SI   CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_1              ( part_POs[0001] ),      // pinName = ScanOut_1;  tf =  SO  ; 
      .ScanIn_2               ( part_PIs[0009] ),      // pinName = ScanIn_2;  tf =  SI1  CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .ScanOut_2              ( part_POs[0002] ),      // pinName = ScanOut_2;  tf =  SO1 ; 
      .DFT_compression_enable ( part_PIs[0001] ),      // pinName = DFT_compression_enable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_spreader           ( part_PIs[0004] ),      // pinName = DFT_spreader;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_mask_enable        ( part_PIs[0003] ),      // pinName = DFT_mask_enable;  tf = -TC  -CME  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_mask_clk           ( part_PIs[0002] )     // pinName = DFT_mask_clk;  tf = -CML  ; testOffset = 0.000000;  scanOffset = 16.000000;  
      );

//***************************************************************************//
//                        MAKE SOME OTHER CONNECTIONS                        //
//***************************************************************************//

  assign ( weak0, weak1 ) // Termination 
    part_POs [1] = global_term,     // pinName = ScanOut_1;  tf =  SO  ; 
    part_POs [2] = global_term,     // pinName = ScanOut_2;  tf =  SO1 ; 
    part_POs [3] = global_term,     // pinName = UART_TX_O; 
    part_POs [4] = global_term,     // pinName = framing_error; 
    part_POs [5] = global_term;      // pinName = parity_error; 

//***************************************************************************//
//                     OPEN THE FILE AND RUN SIMULATION                      //
//***************************************************************************//

  initial 
    begin 

      $timeformat ( -12, 2, " ps", 10 ); 

      `ifdef sdf_annotate 
        `ifdef SDF_Minimum 
          $sdf_annotate ("default.sdf",TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_inst,,"sdf_Min.log","MINIMUM");
        `endif 
        `ifdef SDF_Maximum 
          $sdf_annotate ("default.sdf",TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_inst,,"sdf_Max.log","MAXIMUM");
        `endif 
        `ifdef SDF_Typical
          $sdf_annotate ("default.sdf",TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_inst,,"sdf_Typ.log","TYPICAL");
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
        $dumpvars(0,TOP_ATPG_COMPRESSION_DECOMP_TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_compression ); 
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
      name_POs [3] = "UART_TX_O";      // pinName = UART_TX_O; 
      name_POs [4] = "framing_error";      // pinName = framing_error; 
      name_POs [5] = "parity_error";      // pinName = parity_error; 



      if ( $test$plusargs ( "MODUS_DEBUG" ) )  sim_trace = 1'b1; 

      if ( $test$plusargs ( "HEARTBEAT" ) )  sim_heart = 1'b1; 

      if ( $value$plusargs ( "START_RANGE=%s", SOD ) )  sim_range = 1'b0; 
      if ( $value$plusargs ( "START_RANGE=%s", SOD ) ) sim_range_measure = 1'b0;

      if ( $value$plusargs ( "END_RANGE=%s", EOD ) ); 

      if ( $value$plusargs ( "miscompare_limit=%0f", miscompare_limit ) ); 

      if ( $test$plusargs ( "FAILSET" ) )  failset = 1'b1; 

      stim_PIs = {12{1'bX}};   
      stim_CIs = 12'bX0XX0XXXXX0X; 
      meas_POs = {5{1'bX}};   
      stim_CR_1 = {29{1'b0}};   stim_CR_2 = {29{1'b0}};   
      meas_OR_1 = {29{1'bX}};   meas_OR_2 = {29{1'bX}};   
      stim_CME_0 = {29{1'b0}};   
      stim_CMSR_1 = {147{1'b0}};   stim_CMSR_2 = {147{1'b0}};   

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

      $display ( "\nINFO (TVE-189): Design:  TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11   Test Mode:  COMPRESSION_DECOMP   InExperiment:  TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_compression " ); 
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
      part_PIs [1] = stim_PIs [1];      // pinName = DFT_compression_enable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [2] = stim_PIs [2];      // pinName = DFT_mask_clk;  tf = -CML  ; testOffset = 0.000000;  scanOffset = 16.000000;  
      part_PIs [3] = stim_PIs [3];      // pinName = DFT_mask_enable;  tf = -TC  -CME  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [4] = stim_PIs [4];      // pinName = DFT_spreader;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [6] = stim_PIs [6];      // pinName = RST_N;  tf = -SC  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [7] = stim_PIs [7];      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [8] = stim_PIs [8];      // pinName = ScanIn_1;  tf =  SI   CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [9] = stim_PIs [9];      // pinName = ScanIn_2;  tf =  SI1  CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [10] = stim_PIs [10];      // pinName = TestMode;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [12] = stim_PIs [12];      // pinName = UART_RX_IN; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.
      part_PIs [5] = stim_PIs [5];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [11] = stim_PIs [11];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [5] = stim_CIs [5];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [11] = stim_CIs [11];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 72.000000 ns;  From the start of the cycle.

      for ( POnum = 1; POnum <= 5; POnum = POnum + 1 ) begin 
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
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11", name_POs [ POnum ], PATTERN, -1, part_POs [ POnum ] ); 
          end  
        end  
        else if ( meas_POs [ POnum ] !== 1'bX )  good_compares = good_compares + 1; 
      end  
     #8.000000;        // 80.000000 ns;  From the start of the cycle.
      meas_POs = {5{1'bX}}; 

    end  
  endtask  

//***************************************************************************//
//                       DEFINE SCAN PRECOND PROCEDURE                       //
//***************************************************************************//

  task Scan_Preconditioning_Sequence_TM_3_SEQ_1_SOP_1; 
    begin 

      PROCESSNAME = "SCAN PRECONDITIONING (Scan_Preconditioning_Sequence)";
      stim_PIs [1] = 1'b1;      // pinName = DFT_compression_enable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      stim_PIs [3] = 1'b0;      // pinName = DFT_mask_enable;  tf = -TC  -CME  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      stim_PIs [4] = 1'b1;      // pinName = DFT_spreader;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      stim_PIs [7] = 1'b1;      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  

      test_cycle; 
      PROCESSNAME = "";
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                DEFINE CHANNEL MASK SCAN SEQUENCE PROCEDURE                //
//***************************************************************************//

  task ChannelMask_Cycle_Sequence_TM_3_SEQ_2_SOP_1; 
    begin 

      PROCESSNAME = "CHANNEL MASK SCAN SEQUENCE (ChannelMask_Cycle_Sequence)";
      START = MAX - NUM_SHIFTS; 
      for ( SCANCYCLE = 1; SCANCYCLE <= MAX; SCANCYCLE = SCANCYCLE + 1 ) begin 
        CYCLE = CYCLE + 1; 
        SERIALCYCLE = SERIALCYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
        part_PIs [8] = stim_CMSR_1 [ 0 + SCANCYCLE ];      // pinName = ScanIn_1;  tf =  SI   CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [9] = stim_CMSR_2 [ 0 + SCANCYCLE ];      // pinName = ScanIn_2;  tf =  SI1  CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
     #16.000000;        // 16.000000 ns;  From the start of the cycle.
        part_PIs [2] = 1'b1;      // pinName = DFT_mask_clk;  tf = -CML  ; testOffset = 0.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
        part_PIs [2] = 1'b0;      // pinName = DFT_mask_clk;  tf = -CML  ; testOffset = 0.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      end  
      stim_CMSR_1 = {147{1'b0}};   stim_CMSR_2 = {147{1'b0}};   
      stim_PIs = part_PIs; 
      SCANCYCLE = 0; 
      NUM_SHIFTS = 0; 
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                      DEFINE SCAN SEQUENCE PROCEDURE                       //
//***************************************************************************//

  task Scan_Sequence_TM_3_SEQ_3_SOP_1; 
    begin 

      PROCESSNAME = "SCAN SEQUENCE (Scan_Sequence)";
      if (sim_range ) sim_range_measure = 1'b1 ;
      if ( overlap )  test_num = test_num - 1; 
      START = 0; 
      for ( SCANCYCLE = 1; SCANCYCLE <= MAX; SCANCYCLE = SCANCYCLE + 1 ) begin 
        CYCLE = CYCLE + 1; 
        SERIALCYCLE = SERIALCYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
        part_PIs [3] = stim_CME_0 [ 0 + SCANCYCLE ];      // pinName = DFT_mask_enable;  tf = -TC  -CME  ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [8] = stim_CR_1 [ 0 + SCANCYCLE ];      // pinName = ScanIn_1;  tf =  SI   CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
        part_PIs [9] = stim_CR_2 [ 0 + SCANCYCLE ];      // pinName = ScanIn_2;  tf =  SI1  CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.

        if (( part_POs [1] !== meas_OR_1 [ 0 + SCANCYCLE ] ) & ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_1;  tf =  SO  ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_1 [ 0 + SCANCYCLE ], part_POs [1], SCANCYCLE, name_POs [1] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11", name_POs [1], PATTERN, SCANCYCLE, part_POs [1] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_POs [2] !== meas_OR_2 [ 0 + SCANCYCLE ] ) & ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = ScanOut_2;  tf =  SO1 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Serial scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Measured on Scan Cycle: %0d   Measured at SO: %0s   ", meas_OR_2 [ 0 + SCANCYCLE ], part_POs [2], SCANCYCLE, name_POs [2] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11", name_POs [2], PATTERN, SCANCYCLE, part_POs [2] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
        part_PIs [11] = 1'b1;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
        part_PIs [5] = 1'b1;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
        part_PIs [11] = 1'b0;      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
        part_PIs [5] = 1'b0;      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      end  
      meas_OR_1 = {29{1'bX}};   meas_OR_2 = {29{1'bX}};   
      stim_CR_1 = {29{1'b0}};   stim_CR_2 = {29{1'b0}};   
      stim_CME_0 = {29{1'b0}};   
      stim_PIs = part_PIs; 
      SCANCYCLE = 0; 
      NUM_SHIFTS = 0; 
      if ( overlap )  test_num = test_num + 1; 
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                        DEFINE SCAN EXIT PROCEDURE                         //
//***************************************************************************//

  task Scan_Exit_Sequence_TM_3_SEQ_4_SOP_1; 
    begin 

      PROCESSNAME = "SCAN EXIT (Scan_Exit_Sequence)";
      stim_PIs [3] = 1'b0;      // pinName = DFT_mask_enable;  tf = -TC  -CME  ; testOffset = 0.000000;  scanOffset = 0.000000;  

      scan_cycle; 
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                           DEFINE SCAN PROCEDURE                           //
//***************************************************************************//

  task scan_cycle; 
    begin 

      if ( count_cycles )  begin 
        CYCLE = CYCLE + 1; 
        SERIALCYCLE = SERIALCYCLE + 1; 
      end 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_PIs [1];      // pinName = DFT_compression_enable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [3] = stim_PIs [3];      // pinName = DFT_mask_enable;  tf = -TC  -CME  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [4] = stim_PIs [4];      // pinName = DFT_spreader;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [6] = stim_PIs [6];      // pinName = RST_N;  tf = -SC  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [7] = stim_PIs [7];      // pinName = ScanEnable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [8] = stim_PIs [8];      // pinName = ScanIn_1;  tf =  SI   CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [9] = stim_PIs [9];      // pinName = ScanIn_2;  tf =  SI1  CMI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [10] = stim_PIs [10];      // pinName = TestMode;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [12] = stim_PIs [12];      // pinName = UART_RX_IN; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.

      for ( POnum = 1; POnum <= 5; POnum = POnum + 1 ) begin 
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
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11", name_POs [ POnum ], PATTERN, -1, part_POs [ POnum ] ); 
          end  
        end  
        else if ( meas_POs [ POnum ] !== 1'bX )  good_compares = good_compares + 1; 
      end  
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [2] = stim_PIs [2];      // pinName = DFT_mask_clk;  tf = -CML  ; testOffset = 0.000000;  scanOffset = 16.000000;  
      part_PIs [5] = stim_PIs [5];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [11] = stim_PIs [11];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
      part_PIs [2] = stim_CIs [2];      // pinName = DFT_mask_clk;  tf = -CML  ; testOffset = 0.000000;  scanOffset = 16.000000;  
      part_PIs [5] = stim_CIs [5];      // pinName = REF_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      part_PIs [11] = stim_CIs [11];      // pinName = UART_CLK;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      meas_POs = {5{1'bX}}; 

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
            rc_read = $fscanf ( DATAID, "%b", stim_PIs [1:12] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        201: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_CIs [1:12] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        202: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", meas_POs [1:5] ); 
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

              3: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_1 [1:29] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_2 [1:29] ); 
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

              3: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_1 [1:29] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_1 = 'bx;
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_2 [1:29] ); 
                        if (sim_range_measure == 1'b0 ) meas_OR_2 = 'bx;
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

        302: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              3: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    0: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CME_0 [1:29] ); 
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

        303: begin 
          rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( SCANNUM ) 

              1: begin 

                if ( rc_read > 0 )  begin 
                  rc_read = $fscanf ( DATAID, "%b", stim_CMSR_1 [1:147] ); 
                  if ( rc_read <= 0 )  bad_cmd_code; 
                  line_number = line_number + 1; 
                end  
              end  

              2: begin 

                if ( rc_read > 0 )  begin 
                  rc_read = $fscanf ( DATAID, "%b", stim_CMSR_2 [1:147] ); 
                  if ( rc_read <= 0 )  bad_cmd_code; 
                  line_number = line_number + 1; 
                end  
              end  

            endcase  
          end  
        end  

        400: begin 
          if ( sim_range )  test_cycle; 
          line_number = line_number + 1; 
        end  

        403: begin 
          if ( sim_range )  scan_cycle; 
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

              3: begin 
                rc_read = $fscanf ( DATAID, "%d", SEQNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SEQNUM ) 

                    1: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Preconditioning_Sequence_TM_3_SEQ_1_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                    2: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  ChannelMask_Cycle_Sequence_TM_3_SEQ_2_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                    3: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Sequence_TM_3_SEQ_3_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                    4: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Exit_Sequence_TM_3_SEQ_4_SOP_1; 
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
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_inst", eventID ); 
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
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "TOP_DATA_WIDTH8_ADDR_WIDTH4_RF_DEPTH16_FIFO_DEPTH2048_FIFO_PTR_WIDTH11_inst", eventID ); 
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
