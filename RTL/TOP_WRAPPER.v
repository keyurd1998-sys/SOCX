module TOP_WRAPPER (
    // ---------------------------------------------------------
    // PHYSICAL PACKAGE PINS
    // ---------------------------------------------------------
    input  wire PIN_REF_CLK,
    input  wire PIN_UART_CLK,      // Added missing UART_CLK package pin
    input  wire PIN_UART_RX_IN,
    input  wire PIN_RST_N,
    
    output wire PIN_UART_TX_O,
    output wire PIN_parity_error,
    output wire PIN_framing_error,

    // Dedicated Scan Pins (For 2 Scan Chains)
    input  wire PIN_ScanIn_1,
    input  wire PIN_ScanIn_2,
    output wire PIN_ScanOut_1,
    output wire PIN_ScanOut_2,
    
    // Shared DFT Control Pins
    input  wire PIN_ScanEnable,
    input  wire PIN_TestMode

    // JTAG Pins 
    input  wire PIN_TCK,
    input  wire PIN_TMS,
    input  wire PIN_TDI,
    input  wire PIN_TRST,
    output wire PIN_TDO
);

    // ---------------------------------------------------------
    // INTERNAL WIRES (Routing pads to the core)
    // ---------------------------------------------------------
    wire core_ref_clk, core_uart_clk, core_uart_rx, core_rst_n;
    wire core_uart_tx, core_parity_err, core_framing_err;
    wire core_si_1, core_si_2, core_so_1, core_so_2;
    wire core_se, core_tm;

    // ---------------------------------------------------------
    // INPUT PAD INSTANTIATIONS (PADDI)
    // ---------------------------------------------------------
    PADDI pad_ref_clk   (.PAD(PIN_REF_CLK),    .Y(core_ref_clk));
    PADDI pad_uart_clk  (.PAD(PIN_UART_CLK),   .Y(core_uart_clk)); // Added UART_CLK pad
    PADDI pad_uart_rx   (.PAD(PIN_UART_RX_IN), .Y(core_uart_rx));
    PADDI pad_rst_n     (.PAD(PIN_RST_N),      .Y(core_rst_n));
    
    PADDI pad_si_1      (.PAD(PIN_ScanIn_1),   .Y(core_si_1));
    PADDI pad_si_2      (.PAD(PIN_ScanIn_2),   .Y(core_si_2));
    PADDI pad_se        (.PAD(PIN_ScanEnable), .Y(core_se));
    PADDI pad_tm        (.PAD(PIN_TestMode),   .Y(core_tm));

    // ---------------------------------------------------------
    // OUTPUT PAD INSTANTIATIONS (PADDO)
    // ---------------------------------------------------------
    PADDO pad_uart_tx   (.A(core_uart_tx),     .PAD(PIN_UART_TX_O));
    PADDO pad_parity    (.A(core_parity_err),  .PAD(PIN_parity_error));
    PADDO pad_framing   (.A(core_framing_err), .PAD(PIN_framing_error));
    
    PADDO pad_so_1      (.A(core_so_1),        .PAD(PIN_ScanOut_1));
    PADDO pad_so_2      (.A(core_so_2),        .PAD(PIN_ScanOut_2));

    // ---------------------------------------------------------
    // CORE LOGIC INSTANTIATION
    // ---------------------------------------------------------
    // Passing the parameters: {8 4 16 2048 11} explicitly to the core
    TOP #(8, 4, 16, 2048, 11) u_core (
        .REF_CLK(core_ref_clk),
        .UART_CLK(core_uart_clk),  // Connected internal UART_CLK
        .UART_RX_IN(core_uart_rx),
        .RST_N(core_rst_n),
        .UART_TX_O(core_uart_tx),
        .parity_error(core_parity_err),
        .framing_error(core_framing_err)
    );

    // Add to internal wires
    wire core_tck, core_tms, core_tdi, core_trst, core_tdo;

    // Add to Pad Instantiations
    // NOTE: TDO requires a 3-state output pad (PADDOZ) driven by the JTAG enable signal
    wire tdo_enable;
    
    PADDI pad_tck  (.PAD(PIN_TCK),  .Y(core_tck));
    PADDI pad_tms  (.PAD(PIN_TMS),  .Y(core_tms));
    PADDI pad_tdi  (.PAD(PIN_TDI),  .Y(core_tdi));
    PADDI pad_trst (.PAD(PIN_TRST), .Y(core_trst));
    PADDOZ pad_tdo (.A(core_tdo),   .OEN(tdo_enable), .PAD(PIN_TDO));

endmodule