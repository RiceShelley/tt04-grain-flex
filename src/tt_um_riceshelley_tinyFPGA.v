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

    assign uio_out[0] = progDataOut;

    GrainFlexFpga grainFlex(
        .io_ioPins_read(uio_in),
        .io_ioPins_write(uio_out),
        .io_ioPins_writeEnable(uio_oe),
        .io_progIface_clk(progClk),
        .io_progIface_reset(progRst),
        .io_progIface_en(progEn),
        .io_progIface_dIn(progDataIn),
        .io_progIface_dOut(progDataOut),
        .clk(clk),
        .reset(reset)
    );

/*
    localparam BEL_INPUT_WIDTH = 5;
    localparam BELS = 4;
    localparam CLUSTER_INPUT_WIDTH = 5;

    // FPGA programming interface
    wire prog_clk = clk;
    wire prog_en = ui_in[1];
    wire prog_in = ui_in[0];
    wire prog_out;

    wire rst = (!rst_n) & (prog_en == 1'b0);

    wire [BELS - 1 : 0] fpga_out;

    // assign inputs to cluster
    wire [4:0] cluster_in = ui_in[6:2];

    assign uo_out[0 +: BELS] = fpga_out;
    assign uo_out[BELS] = 0;
    assign uo_out[BELS + 1] = prog_en;
    assign uo_out[BELS + 2] = prog_out;
    assign uo_out[BELS + 3] = rst;

    // outputs from cluster
    wire [BELS - 1 : 0] cluster_out;
    wire cluster_prog_out;
    logic_cluster #(
        .BEL_INPUT_WIDTH(BEL_INPUT_WIDTH),
        .BELS(BELS),
        .CLUSTER_INPUT_WIDTH(CLUSTER_INPUT_WIDTH)
    ) logic_cluster_dut (
        // Programming interface
        .prog_clk       (prog_clk),
        .prog_en        (prog_en),
        .prog_in        (prog_in),
        .prog_out       (cluster_prog_out),
        // logic cluster
        .clk            (clk),
        .rst            (rst),
        .cluster_in     (cluster_in),
        .cluster_out    (cluster_out)
    );

    // Mux FPGA outputs
    genvar i;
    generate
        wire prog_mux_prog[BELS : 0];
        assign prog_mux_prog[0] = cluster_prog_out;

        for (i = 0; i < BELS; i = i + 1) begin : gen_output_mux
            prog_mux #(
                .INPUTS(BELS)
            ) prog_mux_inst (
                // Programming interface
                .prog_clk(prog_clk),
                .prog_en(prog_en),
                .prog_in(prog_mux_prog[i]),
                .prog_out(prog_mux_prog[i + 1]),
                // Mux signals
                .mux_in(cluster_out),
                .mux_out(fpga_out[i])
            );
        end

        assign prog_out = prog_mux_prog[BELS];
    endgenerate
    */

endmodule
