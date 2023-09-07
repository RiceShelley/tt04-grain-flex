`default_nettype none
`timescale 1ns/1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

module tb (
    // testbench is controlled by test.py
    input wire clk,
    input wire rst_n,

    input wire progClk,
    input wire progRst,
    input wire progEn,
    input wire progDataIn,
    output wire progDataOut,

    input wire [7:0] fpgaInputs,
    output wire [7:0] fpgaOutputs
   );

    // this part dumps the trace to a vcd file that can be viewed with GTKWave
    initial begin
        $dumpfile ("tb.vcd");
        $dumpvars (0, tb);
        #1;
    end

    // wire up the inputs and outputs
    /* verilator lint_off UNOPTFLAT */
    wire [7:0] inputs = {4'd0, progDataIn, progEn, progRst, progClk};
    /* verilator lint_on UNOPTFLAT */

    /* verilator lint_off UNUSED */
    wire [7:0] outputs;
    /* verilator lint_on UNUSED */

    assign progDataOut = outputs[0];

    tt_um_riceshelley_tinyFPGA dut(
        .ui_in(inputs),
        .uo_out(outputs),

        .uio_in(fpgaInputs),
        .uio_out(fpgaOutputs),
        .uio_oe(),

        .ena(1'b1),
        .clk(clk),
        .rst_n(rst_n)
    );

endmodule
