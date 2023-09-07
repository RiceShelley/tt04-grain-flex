`default_nettype none
`timescale 1ns/1ps

module tt_um_riceshelley_tinyFPGA (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display

    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)

    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire reset = ~rst_n;

    wire progClk = ui_in[0];
    wire progRst = ui_in[1];
    wire progEn = ui_in[2];
    wire progDataIn = ui_in[3];
    wire progDataOut;


    assign uo_out[0] = progDataOut;
    assign uo_out[7:1] = 7'd0;

    GrainFlexFpga grainFlex(
        .io_ioPins_read(uio_in),
        .io_ioPins_write(uio_out),
        .io_ioPins_writeEnable(uio_oe),
        .io_progIface_clk(progClk),
        .io_progIface_reset(progRst),
        .io_progIface_en(progEn),
        .io_progIface_dIn(progDataIn),
        .io_progIface_dOut(progDataOut),
        .io_designEnable(ena),
        .clk(clk),
        .reset(reset)
    );

endmodule
