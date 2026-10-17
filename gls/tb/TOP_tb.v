`timescale 1ns / 1ps

module TOP_tb;

  // Clocks and Resets
  reg         RST_N;
  reg         UART_CLK;
  reg         REF_CLK;

  // UART Functional Interface
  reg         UART_RX_IN;
  wire        UART_TX_O;
  wire        parity_error;
  wire        framing_error;

  // DFT Test Ports (Added during Scan Synthesis)
  reg         SCAN_ENABLE;
  reg         test_mode;
  reg         scan_in_0;
  reg         scan_in_1;
  wire        scan_out_0;
  wire        scan_out_1;

  // DUT Instantiation
  TOP dut (
      .RST_N          (RST_N),
      .UART_CLK       (UART_CLK),
      .REF_CLK        (REF_CLK),
      .UART_RX_IN     (UART_RX_IN),
      .UART_TX_O      (UART_TX_O),
      .parity_error   (parity_error),
      .framing_error  (framing_error),

      // DFT Scan Ports
      .SCAN_ENABLE    (SCAN_ENABLE),
      .test_mode      (test_mode),
      .scan_in_0      (scan_in_0),
      .scan_in_1      (scan_in_1),
      .scan_out_0     (scan_out_0),
      .scan_out_1     (scan_out_1)
  );

  // REF_CLK Generation: 50 MHz (Period = 20ns)
  initial begin
    REF_CLK = 1'b0;
    forever #10 REF_CLK = ~REF_CLK;
  end

  // UART_CLK Generation: ~3.68 MHz (Period = 271.267ns -> Half-period ~ 135.633ns)
  initial begin
    UART_CLK = 1'b0;
    forever #135.633 UART_CLK = ~UART_CLK;
  end

  // Test Stimulus
  initial begin
    $display("==========================================================");
    $display(" Starting Gate-Level Simulation for TOP (SOCX)");
    $display("==========================================================");

    // Initialize all input signals
    RST_N         = 1'b0;
    UART_RX_IN    = 1'b1; // UART idle line is high

    // DFT signals inactive in functional mode
    SCAN_ENABLE   = 1'b0;
    test_mode     = 1'b0;
    scan_in_0     = 1'b0;
    scan_in_1     = 1'b0;

    // Reset sequence
    #100;
    RST_N = 1'b1;
    $display("[%0t ns] Reset released. System active...", $time);

    // Run for several UART and REF clock cycles
    #2000;

    // Verify error flags remain low
    if (parity_error === 1'b1 || framing_error === 1'b1) begin
      $display("ERROR: Unexpected error flag asserted! parity_error=%b, framing_error=%b", parity_error, framing_error);
    end else begin
      $display("[%0t ns] Functional smoke test passed successfully!", $time);
    end

    $display("==========================================================");
    $finish;
  end

endmodule
