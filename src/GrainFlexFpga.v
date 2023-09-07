// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : GrainFlexFpga
// Git hash  : 6636fe19c59eba9b6b9f4fcaf450cb24789c8260

`timescale 1ns/1ps

module GrainFlexFpga (
  input      [7:0]    io_ioPins_read,
  output     [7:0]    io_ioPins_write,
  output     [7:0]    io_ioPins_writeEnable,
  input               io_progIface_clk,
  input               io_progIface_reset,
  input               io_progIface_en,
  input               io_progIface_dIn,
  output              io_progIface_dOut,
  input               io_designEnable,
  input               clk,
  input               reset
);

  reg        [3:0]    clb0_io_clbIn;
  wire                ioBuf_1_progIface_dOut;
  wire       [7:0]    ioBuf_1_io_buffs_write;
  wire       [7:0]    ioBuf_1_io_buffs_writeEnable;
  wire                ioBuf_1_io_fabricIn_0;
  wire                ioBuf_1_io_fabricIn_1;
  wire                ioBuf_1_io_fabricIn_2;
  wire                ioBuf_1_io_fabricIn_3;
  wire                ioBuf_1_io_fabricIn_4;
  wire                ioBuf_1_io_fabricIn_5;
  wire                ioBuf_1_io_fabricIn_6;
  wire                ioBuf_1_io_fabricIn_7;
  wire                clb0_progIface_dOut;
  wire       [3:0]    clb0_io_clbOut;
  wire                clb0InputMuxs_0_progIface_dOut;
  wire                clb0InputMuxs_0_io_muxOut;
  wire                clb0InputMuxs_1_progIface_dOut;
  wire                clb0InputMuxs_1_io_muxOut;
  wire                clb0InputMuxs_2_progIface_dOut;
  wire                clb0InputMuxs_2_io_muxOut;
  wire                clb0InputMuxs_3_progIface_dOut;
  wire                clb0InputMuxs_3_io_muxOut;
  wire                fabricOutputPinMuxs_0_progIface_dOut;
  wire                fabricOutputPinMuxs_0_io_muxOut;
  wire                fabricOutputPinMuxs_1_progIface_dOut;
  wire                fabricOutputPinMuxs_1_io_muxOut;
  wire                fabricOutputPinMuxs_2_progIface_dOut;
  wire                fabricOutputPinMuxs_2_io_muxOut;
  wire                fabricOutputPinMuxs_3_progIface_dOut;
  wire                fabricOutputPinMuxs_3_io_muxOut;
  wire                fabricOutputPinMuxs_4_progIface_dOut;
  wire                fabricOutputPinMuxs_4_io_muxOut;
  wire                fabricOutputPinMuxs_5_progIface_dOut;
  wire                fabricOutputPinMuxs_5_io_muxOut;
  wire                fabricOutputPinMuxs_6_progIface_dOut;
  wire                fabricOutputPinMuxs_6_io_muxOut;
  wire                fabricOutputPinMuxs_7_progIface_dOut;
  wire                fabricOutputPinMuxs_7_io_muxOut;
  wire                _zz_io_muxIn_0;
  wire                _zz_io_muxIn_1;
  wire                _zz_io_muxIn_2;
  wire                _zz_io_muxIn_3;

  IOBuf ioBuf_1 (
    .progIface_clk        (io_progIface_clk                 ), //i
    .progIface_reset      (io_progIface_reset               ), //i
    .progIface_en         (io_progIface_en                  ), //i
    .progIface_dIn        (io_progIface_dIn                 ), //i
    .progIface_dOut       (ioBuf_1_progIface_dOut           ), //o
    .io_buffs_read        (io_ioPins_read[7:0]              ), //i
    .io_buffs_write       (ioBuf_1_io_buffs_write[7:0]      ), //o
    .io_buffs_writeEnable (ioBuf_1_io_buffs_writeEnable[7:0]), //o
    .io_fabricIn_0        (ioBuf_1_io_fabricIn_0            ), //o
    .io_fabricIn_1        (ioBuf_1_io_fabricIn_1            ), //o
    .io_fabricIn_2        (ioBuf_1_io_fabricIn_2            ), //o
    .io_fabricIn_3        (ioBuf_1_io_fabricIn_3            ), //o
    .io_fabricIn_4        (ioBuf_1_io_fabricIn_4            ), //o
    .io_fabricIn_5        (ioBuf_1_io_fabricIn_5            ), //o
    .io_fabricIn_6        (ioBuf_1_io_fabricIn_6            ), //o
    .io_fabricIn_7        (ioBuf_1_io_fabricIn_7            ), //o
    .io_fabricOut_0       (fabricOutputPinMuxs_0_io_muxOut  ), //i
    .io_fabricOut_1       (fabricOutputPinMuxs_1_io_muxOut  ), //i
    .io_fabricOut_2       (fabricOutputPinMuxs_2_io_muxOut  ), //i
    .io_fabricOut_3       (fabricOutputPinMuxs_3_io_muxOut  ), //i
    .io_fabricOut_4       (fabricOutputPinMuxs_4_io_muxOut  ), //i
    .io_fabricOut_5       (fabricOutputPinMuxs_5_io_muxOut  ), //i
    .io_fabricOut_6       (fabricOutputPinMuxs_6_io_muxOut  ), //i
    .io_fabricOut_7       (fabricOutputPinMuxs_7_io_muxOut  )  //i
  );
  Clb clb0 (
    .progIface_clk   (io_progIface_clk      ), //i
    .progIface_reset (io_progIface_reset    ), //i
    .progIface_en    (io_progIface_en       ), //i
    .progIface_dIn   (ioBuf_1_progIface_dOut), //i
    .progIface_dOut  (clb0_progIface_dOut   ), //o
    .io_clbIn        (clb0_io_clbIn[3:0]    ), //i
    .io_clbOut       (clb0_io_clbOut[3:0]   ), //o
    .io_designEnable (io_designEnable       ), //i
    .clk             (clk                   ), //i
    .reset           (reset                 )  //i
  );
  ProgMux_12 clb0InputMuxs_0 (
    .progIface_clk   (io_progIface_clk              ), //i
    .progIface_reset (io_progIface_reset            ), //i
    .progIface_en    (io_progIface_en               ), //i
    .progIface_dIn   (clb0_progIface_dOut           ), //i
    .progIface_dOut  (clb0InputMuxs_0_progIface_dOut), //o
    .io_muxIn_0      (ioBuf_1_io_fabricIn_0         ), //i
    .io_muxIn_1      (ioBuf_1_io_fabricIn_1         ), //i
    .io_muxIn_2      (ioBuf_1_io_fabricIn_2         ), //i
    .io_muxIn_3      (ioBuf_1_io_fabricIn_3         ), //i
    .io_muxIn_4      (ioBuf_1_io_fabricIn_4         ), //i
    .io_muxIn_5      (ioBuf_1_io_fabricIn_5         ), //i
    .io_muxIn_6      (ioBuf_1_io_fabricIn_6         ), //i
    .io_muxIn_7      (ioBuf_1_io_fabricIn_7         ), //i
    .io_muxOut       (clb0InputMuxs_0_io_muxOut     )  //o
  );
  ProgMux_12 clb0InputMuxs_1 (
    .progIface_clk   (io_progIface_clk              ), //i
    .progIface_reset (io_progIface_reset            ), //i
    .progIface_en    (io_progIface_en               ), //i
    .progIface_dIn   (clb0InputMuxs_0_progIface_dOut), //i
    .progIface_dOut  (clb0InputMuxs_1_progIface_dOut), //o
    .io_muxIn_0      (ioBuf_1_io_fabricIn_0         ), //i
    .io_muxIn_1      (ioBuf_1_io_fabricIn_1         ), //i
    .io_muxIn_2      (ioBuf_1_io_fabricIn_2         ), //i
    .io_muxIn_3      (ioBuf_1_io_fabricIn_3         ), //i
    .io_muxIn_4      (ioBuf_1_io_fabricIn_4         ), //i
    .io_muxIn_5      (ioBuf_1_io_fabricIn_5         ), //i
    .io_muxIn_6      (ioBuf_1_io_fabricIn_6         ), //i
    .io_muxIn_7      (ioBuf_1_io_fabricIn_7         ), //i
    .io_muxOut       (clb0InputMuxs_1_io_muxOut     )  //o
  );
  ProgMux_12 clb0InputMuxs_2 (
    .progIface_clk   (io_progIface_clk              ), //i
    .progIface_reset (io_progIface_reset            ), //i
    .progIface_en    (io_progIface_en               ), //i
    .progIface_dIn   (clb0InputMuxs_1_progIface_dOut), //i
    .progIface_dOut  (clb0InputMuxs_2_progIface_dOut), //o
    .io_muxIn_0      (ioBuf_1_io_fabricIn_0         ), //i
    .io_muxIn_1      (ioBuf_1_io_fabricIn_1         ), //i
    .io_muxIn_2      (ioBuf_1_io_fabricIn_2         ), //i
    .io_muxIn_3      (ioBuf_1_io_fabricIn_3         ), //i
    .io_muxIn_4      (ioBuf_1_io_fabricIn_4         ), //i
    .io_muxIn_5      (ioBuf_1_io_fabricIn_5         ), //i
    .io_muxIn_6      (ioBuf_1_io_fabricIn_6         ), //i
    .io_muxIn_7      (ioBuf_1_io_fabricIn_7         ), //i
    .io_muxOut       (clb0InputMuxs_2_io_muxOut     )  //o
  );
  ProgMux_12 clb0InputMuxs_3 (
    .progIface_clk   (io_progIface_clk              ), //i
    .progIface_reset (io_progIface_reset            ), //i
    .progIface_en    (io_progIface_en               ), //i
    .progIface_dIn   (clb0InputMuxs_2_progIface_dOut), //i
    .progIface_dOut  (clb0InputMuxs_3_progIface_dOut), //o
    .io_muxIn_0      (ioBuf_1_io_fabricIn_0         ), //i
    .io_muxIn_1      (ioBuf_1_io_fabricIn_1         ), //i
    .io_muxIn_2      (ioBuf_1_io_fabricIn_2         ), //i
    .io_muxIn_3      (ioBuf_1_io_fabricIn_3         ), //i
    .io_muxIn_4      (ioBuf_1_io_fabricIn_4         ), //i
    .io_muxIn_5      (ioBuf_1_io_fabricIn_5         ), //i
    .io_muxIn_6      (ioBuf_1_io_fabricIn_6         ), //i
    .io_muxIn_7      (ioBuf_1_io_fabricIn_7         ), //i
    .io_muxOut       (clb0InputMuxs_3_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_0 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (clb0InputMuxs_3_progIface_dOut      ), //i
    .progIface_dOut  (fabricOutputPinMuxs_0_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_0_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_1 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (fabricOutputPinMuxs_0_progIface_dOut), //i
    .progIface_dOut  (fabricOutputPinMuxs_1_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_1_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_2 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (fabricOutputPinMuxs_1_progIface_dOut), //i
    .progIface_dOut  (fabricOutputPinMuxs_2_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_2_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_3 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (fabricOutputPinMuxs_2_progIface_dOut), //i
    .progIface_dOut  (fabricOutputPinMuxs_3_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_3_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_4 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (fabricOutputPinMuxs_3_progIface_dOut), //i
    .progIface_dOut  (fabricOutputPinMuxs_4_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_4_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_5 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (fabricOutputPinMuxs_4_progIface_dOut), //i
    .progIface_dOut  (fabricOutputPinMuxs_5_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_5_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_6 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (fabricOutputPinMuxs_5_progIface_dOut), //i
    .progIface_dOut  (fabricOutputPinMuxs_6_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_6_io_muxOut     )  //o
  );
  ProgMux_4 fabricOutputPinMuxs_7 (
    .progIface_clk   (io_progIface_clk                    ), //i
    .progIface_reset (io_progIface_reset                  ), //i
    .progIface_en    (io_progIface_en                     ), //i
    .progIface_dIn   (fabricOutputPinMuxs_6_progIface_dOut), //i
    .progIface_dOut  (fabricOutputPinMuxs_7_progIface_dOut), //o
    .io_muxIn_0      (_zz_io_muxIn_0                      ), //i
    .io_muxIn_1      (_zz_io_muxIn_1                      ), //i
    .io_muxIn_2      (_zz_io_muxIn_2                      ), //i
    .io_muxIn_3      (_zz_io_muxIn_3                      ), //i
    .io_muxOut       (fabricOutputPinMuxs_7_io_muxOut     )  //o
  );
  assign io_ioPins_write = ioBuf_1_io_buffs_write;
  assign io_ioPins_writeEnable = ioBuf_1_io_buffs_writeEnable;
  always @(*) begin
    clb0_io_clbIn[0] = clb0InputMuxs_0_io_muxOut;
    clb0_io_clbIn[1] = clb0InputMuxs_1_io_muxOut;
    clb0_io_clbIn[2] = clb0InputMuxs_2_io_muxOut;
    clb0_io_clbIn[3] = clb0InputMuxs_3_io_muxOut;
  end

  assign _zz_io_muxIn_0 = clb0_io_clbOut[0];
  assign _zz_io_muxIn_1 = clb0_io_clbOut[1];
  assign _zz_io_muxIn_2 = clb0_io_clbOut[2];
  assign _zz_io_muxIn_3 = clb0_io_clbOut[3];
  assign io_progIface_dOut = fabricOutputPinMuxs_7_progIface_dOut;

endmodule

//ProgMux_11 replaced by ProgMux_4

//ProgMux_10 replaced by ProgMux_4

//ProgMux_9 replaced by ProgMux_4

//ProgMux_8 replaced by ProgMux_4

//ProgMux_7 replaced by ProgMux_4

//ProgMux_6 replaced by ProgMux_4

//ProgMux_5 replaced by ProgMux_4

module ProgMux_4 (
  input               progIface_clk,
  input               progIface_reset,
  input               progIface_en,
  input               progIface_dIn,
  output              progIface_dOut,
  input               io_muxIn_0,
  input               io_muxIn_1,
  input               io_muxIn_2,
  input               io_muxIn_3,
  output              io_muxOut
);

  reg                 _zz_io_muxOut;
  wire       [1:0]    sel;
  reg                 progClkArea_selMem_0;
  reg                 progClkArea_selMem_1;

  always @(*) begin
    case(sel)
      2'b00 : _zz_io_muxOut = io_muxIn_0;
      2'b01 : _zz_io_muxOut = io_muxIn_1;
      2'b10 : _zz_io_muxOut = io_muxIn_2;
      default : _zz_io_muxOut = io_muxIn_3;
    endcase
  end

  assign progIface_dOut = progClkArea_selMem_1;
  assign sel = {progClkArea_selMem_1,progClkArea_selMem_0};
  assign io_muxOut = (progIface_en ? 1'b0 : _zz_io_muxOut);
  always @(posedge progIface_clk or posedge progIface_reset) begin
    if(progIface_reset) begin
      progClkArea_selMem_0 <= 1'b0;
      progClkArea_selMem_1 <= 1'b0;
    end else begin
      if(progIface_en) begin
        progClkArea_selMem_0 <= progIface_dIn;
      end
      if(progIface_en) begin
        progClkArea_selMem_1 <= progClkArea_selMem_0;
      end
    end
  end


endmodule

//ProgMux_3 replaced by ProgMux_12

//ProgMux_2 replaced by ProgMux_12

//ProgMux_1 replaced by ProgMux_12

//ProgMux replaced by ProgMux_12

module Clb (
  input               progIface_clk,
  input               progIface_reset,
  input               progIface_en,
  input               progIface_dIn,
  output              progIface_dOut,
  input      [3:0]    io_clbIn,
  output     [3:0]    io_clbOut,
  input               io_designEnable,
  input               clk,
  input               reset
);

  reg        [3:0]    bels_0_io_belIn;
  reg        [3:0]    bels_1_io_belIn;
  reg        [3:0]    bels_2_io_belIn;
  reg        [3:0]    bels_3_io_belIn;
  wire                belInputPinsMux_0_0_io_muxIn_0;
  wire                belInputPinsMux_0_0_io_muxIn_1;
  wire                belInputPinsMux_0_0_io_muxIn_2;
  wire                belInputPinsMux_0_0_io_muxIn_3;
  wire                belInputPinsMux_0_0_io_muxIn_4;
  wire                belInputPinsMux_0_0_io_muxIn_5;
  wire                belInputPinsMux_0_0_io_muxIn_6;
  wire                belInputPinsMux_0_0_io_muxIn_7;
  wire                belInputPinsMux_0_1_io_muxIn_0;
  wire                belInputPinsMux_0_1_io_muxIn_1;
  wire                belInputPinsMux_0_1_io_muxIn_2;
  wire                belInputPinsMux_0_1_io_muxIn_3;
  wire                belInputPinsMux_0_1_io_muxIn_4;
  wire                belInputPinsMux_0_1_io_muxIn_5;
  wire                belInputPinsMux_0_1_io_muxIn_6;
  wire                belInputPinsMux_0_1_io_muxIn_7;
  wire                belInputPinsMux_0_2_io_muxIn_0;
  wire                belInputPinsMux_0_2_io_muxIn_1;
  wire                belInputPinsMux_0_2_io_muxIn_2;
  wire                belInputPinsMux_0_2_io_muxIn_3;
  wire                belInputPinsMux_0_2_io_muxIn_4;
  wire                belInputPinsMux_0_2_io_muxIn_5;
  wire                belInputPinsMux_0_2_io_muxIn_6;
  wire                belInputPinsMux_0_2_io_muxIn_7;
  wire                belInputPinsMux_0_3_io_muxIn_0;
  wire                belInputPinsMux_0_3_io_muxIn_1;
  wire                belInputPinsMux_0_3_io_muxIn_2;
  wire                belInputPinsMux_0_3_io_muxIn_3;
  wire                belInputPinsMux_0_3_io_muxIn_4;
  wire                belInputPinsMux_0_3_io_muxIn_5;
  wire                belInputPinsMux_0_3_io_muxIn_6;
  wire                belInputPinsMux_0_3_io_muxIn_7;
  wire                belInputPinsMux_1_0_io_muxIn_0;
  wire                belInputPinsMux_1_0_io_muxIn_1;
  wire                belInputPinsMux_1_0_io_muxIn_2;
  wire                belInputPinsMux_1_0_io_muxIn_3;
  wire                belInputPinsMux_1_0_io_muxIn_4;
  wire                belInputPinsMux_1_0_io_muxIn_5;
  wire                belInputPinsMux_1_0_io_muxIn_6;
  wire                belInputPinsMux_1_0_io_muxIn_7;
  wire                belInputPinsMux_1_1_io_muxIn_0;
  wire                belInputPinsMux_1_1_io_muxIn_1;
  wire                belInputPinsMux_1_1_io_muxIn_2;
  wire                belInputPinsMux_1_1_io_muxIn_3;
  wire                belInputPinsMux_1_1_io_muxIn_4;
  wire                belInputPinsMux_1_1_io_muxIn_5;
  wire                belInputPinsMux_1_1_io_muxIn_6;
  wire                belInputPinsMux_1_1_io_muxIn_7;
  wire                belInputPinsMux_1_2_io_muxIn_0;
  wire                belInputPinsMux_1_2_io_muxIn_1;
  wire                belInputPinsMux_1_2_io_muxIn_2;
  wire                belInputPinsMux_1_2_io_muxIn_3;
  wire                belInputPinsMux_1_2_io_muxIn_4;
  wire                belInputPinsMux_1_2_io_muxIn_5;
  wire                belInputPinsMux_1_2_io_muxIn_6;
  wire                belInputPinsMux_1_2_io_muxIn_7;
  wire                belInputPinsMux_1_3_io_muxIn_0;
  wire                belInputPinsMux_1_3_io_muxIn_1;
  wire                belInputPinsMux_1_3_io_muxIn_2;
  wire                belInputPinsMux_1_3_io_muxIn_3;
  wire                belInputPinsMux_1_3_io_muxIn_4;
  wire                belInputPinsMux_1_3_io_muxIn_5;
  wire                belInputPinsMux_1_3_io_muxIn_6;
  wire                belInputPinsMux_1_3_io_muxIn_7;
  wire                belInputPinsMux_2_0_io_muxIn_0;
  wire                belInputPinsMux_2_0_io_muxIn_1;
  wire                belInputPinsMux_2_0_io_muxIn_2;
  wire                belInputPinsMux_2_0_io_muxIn_3;
  wire                belInputPinsMux_2_0_io_muxIn_4;
  wire                belInputPinsMux_2_0_io_muxIn_5;
  wire                belInputPinsMux_2_0_io_muxIn_6;
  wire                belInputPinsMux_2_0_io_muxIn_7;
  wire                belInputPinsMux_2_1_io_muxIn_0;
  wire                belInputPinsMux_2_1_io_muxIn_1;
  wire                belInputPinsMux_2_1_io_muxIn_2;
  wire                belInputPinsMux_2_1_io_muxIn_3;
  wire                belInputPinsMux_2_1_io_muxIn_4;
  wire                belInputPinsMux_2_1_io_muxIn_5;
  wire                belInputPinsMux_2_1_io_muxIn_6;
  wire                belInputPinsMux_2_1_io_muxIn_7;
  wire                belInputPinsMux_2_2_io_muxIn_0;
  wire                belInputPinsMux_2_2_io_muxIn_1;
  wire                belInputPinsMux_2_2_io_muxIn_2;
  wire                belInputPinsMux_2_2_io_muxIn_3;
  wire                belInputPinsMux_2_2_io_muxIn_4;
  wire                belInputPinsMux_2_2_io_muxIn_5;
  wire                belInputPinsMux_2_2_io_muxIn_6;
  wire                belInputPinsMux_2_2_io_muxIn_7;
  wire                belInputPinsMux_2_3_io_muxIn_0;
  wire                belInputPinsMux_2_3_io_muxIn_1;
  wire                belInputPinsMux_2_3_io_muxIn_2;
  wire                belInputPinsMux_2_3_io_muxIn_3;
  wire                belInputPinsMux_2_3_io_muxIn_4;
  wire                belInputPinsMux_2_3_io_muxIn_5;
  wire                belInputPinsMux_2_3_io_muxIn_6;
  wire                belInputPinsMux_2_3_io_muxIn_7;
  wire                belInputPinsMux_3_0_io_muxIn_0;
  wire                belInputPinsMux_3_0_io_muxIn_1;
  wire                belInputPinsMux_3_0_io_muxIn_2;
  wire                belInputPinsMux_3_0_io_muxIn_3;
  wire                belInputPinsMux_3_0_io_muxIn_4;
  wire                belInputPinsMux_3_0_io_muxIn_5;
  wire                belInputPinsMux_3_0_io_muxIn_6;
  wire                belInputPinsMux_3_0_io_muxIn_7;
  wire                belInputPinsMux_3_1_io_muxIn_0;
  wire                belInputPinsMux_3_1_io_muxIn_1;
  wire                belInputPinsMux_3_1_io_muxIn_2;
  wire                belInputPinsMux_3_1_io_muxIn_3;
  wire                belInputPinsMux_3_1_io_muxIn_4;
  wire                belInputPinsMux_3_1_io_muxIn_5;
  wire                belInputPinsMux_3_1_io_muxIn_6;
  wire                belInputPinsMux_3_1_io_muxIn_7;
  wire                belInputPinsMux_3_2_io_muxIn_0;
  wire                belInputPinsMux_3_2_io_muxIn_1;
  wire                belInputPinsMux_3_2_io_muxIn_2;
  wire                belInputPinsMux_3_2_io_muxIn_3;
  wire                belInputPinsMux_3_2_io_muxIn_4;
  wire                belInputPinsMux_3_2_io_muxIn_5;
  wire                belInputPinsMux_3_2_io_muxIn_6;
  wire                belInputPinsMux_3_2_io_muxIn_7;
  wire                belInputPinsMux_3_3_io_muxIn_0;
  wire                belInputPinsMux_3_3_io_muxIn_1;
  wire                belInputPinsMux_3_3_io_muxIn_2;
  wire                belInputPinsMux_3_3_io_muxIn_3;
  wire                belInputPinsMux_3_3_io_muxIn_4;
  wire                belInputPinsMux_3_3_io_muxIn_5;
  wire                belInputPinsMux_3_3_io_muxIn_6;
  wire                belInputPinsMux_3_3_io_muxIn_7;
  wire                bels_0_progIface_dOut;
  wire                bels_0_io_belOut;
  wire                bels_1_progIface_dOut;
  wire                bels_1_io_belOut;
  wire                bels_2_progIface_dOut;
  wire                bels_2_io_belOut;
  wire                bels_3_progIface_dOut;
  wire                bels_3_io_belOut;
  wire                belInputPinsMux_0_0_progIface_dOut;
  wire                belInputPinsMux_0_0_io_muxOut;
  wire                belInputPinsMux_0_1_progIface_dOut;
  wire                belInputPinsMux_0_1_io_muxOut;
  wire                belInputPinsMux_0_2_progIface_dOut;
  wire                belInputPinsMux_0_2_io_muxOut;
  wire                belInputPinsMux_0_3_progIface_dOut;
  wire                belInputPinsMux_0_3_io_muxOut;
  wire                belInputPinsMux_1_0_progIface_dOut;
  wire                belInputPinsMux_1_0_io_muxOut;
  wire                belInputPinsMux_1_1_progIface_dOut;
  wire                belInputPinsMux_1_1_io_muxOut;
  wire                belInputPinsMux_1_2_progIface_dOut;
  wire                belInputPinsMux_1_2_io_muxOut;
  wire                belInputPinsMux_1_3_progIface_dOut;
  wire                belInputPinsMux_1_3_io_muxOut;
  wire                belInputPinsMux_2_0_progIface_dOut;
  wire                belInputPinsMux_2_0_io_muxOut;
  wire                belInputPinsMux_2_1_progIface_dOut;
  wire                belInputPinsMux_2_1_io_muxOut;
  wire                belInputPinsMux_2_2_progIface_dOut;
  wire                belInputPinsMux_2_2_io_muxOut;
  wire                belInputPinsMux_2_3_progIface_dOut;
  wire                belInputPinsMux_2_3_io_muxOut;
  wire                belInputPinsMux_3_0_progIface_dOut;
  wire                belInputPinsMux_3_0_io_muxOut;
  wire                belInputPinsMux_3_1_progIface_dOut;
  wire                belInputPinsMux_3_1_io_muxOut;
  wire                belInputPinsMux_3_2_progIface_dOut;
  wire                belInputPinsMux_3_2_io_muxOut;
  wire                belInputPinsMux_3_3_progIface_dOut;
  wire                belInputPinsMux_3_3_io_muxOut;
  wire       [3:0]    belsOut;
  wire       [7:0]    _zz_io_muxIn_0;
  wire       [7:0]    _zz_io_muxIn_0_1;
  wire       [7:0]    _zz_io_muxIn_0_2;
  wire       [7:0]    _zz_io_muxIn_0_3;
  wire       [7:0]    _zz_io_muxIn_0_4;
  wire       [7:0]    _zz_io_muxIn_0_5;
  wire       [7:0]    _zz_io_muxIn_0_6;
  wire       [7:0]    _zz_io_muxIn_0_7;
  wire       [7:0]    _zz_io_muxIn_0_8;
  wire       [7:0]    _zz_io_muxIn_0_9;
  wire       [7:0]    _zz_io_muxIn_0_10;
  wire       [7:0]    _zz_io_muxIn_0_11;
  wire       [7:0]    _zz_io_muxIn_0_12;
  wire       [7:0]    _zz_io_muxIn_0_13;
  wire       [7:0]    _zz_io_muxIn_0_14;
  wire       [7:0]    _zz_io_muxIn_0_15;
  wire                progChainInput_clk;
  wire                progChainInput_reset;
  wire                progChainInput_en;
  wire                progChainInput_dIn;
  wire                progChainInput_dOut;

  Bel bels_0 (
    .progIface_clk   (progChainInput_clk   ), //i
    .progIface_reset (progChainInput_reset ), //i
    .progIface_en    (progChainInput_en    ), //i
    .progIface_dIn   (progChainInput_dOut  ), //i
    .progIface_dOut  (bels_0_progIface_dOut), //o
    .io_belIn        (bels_0_io_belIn[3:0] ), //i
    .io_belOut       (bels_0_io_belOut     ), //o
    .clk             (clk                  ), //i
    .reset           (reset                )  //i
  );
  Bel bels_1 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_0_3_progIface_dOut), //i
    .progIface_dOut  (bels_1_progIface_dOut             ), //o
    .io_belIn        (bels_1_io_belIn[3:0]              ), //i
    .io_belOut       (bels_1_io_belOut                  ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Bel bels_2 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_1_3_progIface_dOut), //i
    .progIface_dOut  (bels_2_progIface_dOut             ), //o
    .io_belIn        (bels_2_io_belIn[3:0]              ), //i
    .io_belOut       (bels_2_io_belOut                  ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  Bel bels_3 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_2_3_progIface_dOut), //i
    .progIface_dOut  (bels_3_progIface_dOut             ), //o
    .io_belIn        (bels_3_io_belIn[3:0]              ), //i
    .io_belOut       (bels_3_io_belOut                  ), //o
    .clk             (clk                               ), //i
    .reset           (reset                             )  //i
  );
  ProgMux_12 belInputPinsMux_0_0 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (bels_0_progIface_dOut             ), //i
    .progIface_dOut  (belInputPinsMux_0_0_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_0_0_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_0_0_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_0_0_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_0_0_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_0_0_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_0_0_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_0_0_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_0_0_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_0_0_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_0_1 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_0_0_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_0_1_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_0_1_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_0_1_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_0_1_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_0_1_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_0_1_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_0_1_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_0_1_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_0_1_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_0_1_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_0_2 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_0_1_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_0_2_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_0_2_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_0_2_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_0_2_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_0_2_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_0_2_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_0_2_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_0_2_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_0_2_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_0_2_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_0_3 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_0_2_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_0_3_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_0_3_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_0_3_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_0_3_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_0_3_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_0_3_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_0_3_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_0_3_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_0_3_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_0_3_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_1_0 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (bels_1_progIface_dOut             ), //i
    .progIface_dOut  (belInputPinsMux_1_0_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_1_0_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_1_0_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_1_0_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_1_0_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_1_0_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_1_0_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_1_0_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_1_0_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_1_0_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_1_1 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_1_0_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_1_1_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_1_1_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_1_1_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_1_1_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_1_1_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_1_1_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_1_1_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_1_1_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_1_1_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_1_1_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_1_2 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_1_1_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_1_2_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_1_2_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_1_2_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_1_2_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_1_2_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_1_2_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_1_2_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_1_2_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_1_2_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_1_2_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_1_3 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_1_2_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_1_3_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_1_3_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_1_3_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_1_3_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_1_3_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_1_3_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_1_3_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_1_3_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_1_3_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_1_3_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_2_0 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (bels_2_progIface_dOut             ), //i
    .progIface_dOut  (belInputPinsMux_2_0_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_2_0_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_2_0_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_2_0_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_2_0_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_2_0_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_2_0_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_2_0_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_2_0_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_2_0_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_2_1 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_2_0_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_2_1_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_2_1_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_2_1_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_2_1_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_2_1_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_2_1_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_2_1_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_2_1_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_2_1_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_2_1_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_2_2 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_2_1_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_2_2_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_2_2_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_2_2_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_2_2_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_2_2_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_2_2_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_2_2_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_2_2_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_2_2_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_2_2_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_2_3 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_2_2_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_2_3_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_2_3_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_2_3_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_2_3_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_2_3_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_2_3_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_2_3_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_2_3_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_2_3_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_2_3_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_3_0 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (bels_3_progIface_dOut             ), //i
    .progIface_dOut  (belInputPinsMux_3_0_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_3_0_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_3_0_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_3_0_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_3_0_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_3_0_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_3_0_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_3_0_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_3_0_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_3_0_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_3_1 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_3_0_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_3_1_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_3_1_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_3_1_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_3_1_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_3_1_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_3_1_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_3_1_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_3_1_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_3_1_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_3_1_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_3_2 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_3_1_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_3_2_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_3_2_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_3_2_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_3_2_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_3_2_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_3_2_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_3_2_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_3_2_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_3_2_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_3_2_io_muxOut     )  //o
  );
  ProgMux_12 belInputPinsMux_3_3 (
    .progIface_clk   (progChainInput_clk                ), //i
    .progIface_reset (progChainInput_reset              ), //i
    .progIface_en    (progChainInput_en                 ), //i
    .progIface_dIn   (belInputPinsMux_3_2_progIface_dOut), //i
    .progIface_dOut  (belInputPinsMux_3_3_progIface_dOut), //o
    .io_muxIn_0      (belInputPinsMux_3_3_io_muxIn_0    ), //i
    .io_muxIn_1      (belInputPinsMux_3_3_io_muxIn_1    ), //i
    .io_muxIn_2      (belInputPinsMux_3_3_io_muxIn_2    ), //i
    .io_muxIn_3      (belInputPinsMux_3_3_io_muxIn_3    ), //i
    .io_muxIn_4      (belInputPinsMux_3_3_io_muxIn_4    ), //i
    .io_muxIn_5      (belInputPinsMux_3_3_io_muxIn_5    ), //i
    .io_muxIn_6      (belInputPinsMux_3_3_io_muxIn_6    ), //i
    .io_muxIn_7      (belInputPinsMux_3_3_io_muxIn_7    ), //i
    .io_muxOut       (belInputPinsMux_3_3_io_muxOut     )  //o
  );
  assign belsOut = {bels_3_io_belOut,{bels_2_io_belOut,{bels_1_io_belOut,bels_0_io_belOut}}};
  assign _zz_io_muxIn_0 = {belsOut,io_clbIn};
  assign belInputPinsMux_0_0_io_muxIn_0 = _zz_io_muxIn_0[0];
  assign belInputPinsMux_0_0_io_muxIn_1 = _zz_io_muxIn_0[1];
  assign belInputPinsMux_0_0_io_muxIn_2 = _zz_io_muxIn_0[2];
  assign belInputPinsMux_0_0_io_muxIn_3 = _zz_io_muxIn_0[3];
  assign belInputPinsMux_0_0_io_muxIn_4 = _zz_io_muxIn_0[4];
  assign belInputPinsMux_0_0_io_muxIn_5 = _zz_io_muxIn_0[5];
  assign belInputPinsMux_0_0_io_muxIn_6 = _zz_io_muxIn_0[6];
  assign belInputPinsMux_0_0_io_muxIn_7 = _zz_io_muxIn_0[7];
  always @(*) begin
    bels_0_io_belIn[0] = ((belInputPinsMux_0_0_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_0_io_belIn[1] = ((belInputPinsMux_0_1_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_0_io_belIn[2] = ((belInputPinsMux_0_2_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_0_io_belIn[3] = ((belInputPinsMux_0_3_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
  end

  assign _zz_io_muxIn_0_1 = {belsOut,io_clbIn};
  assign belInputPinsMux_0_1_io_muxIn_0 = _zz_io_muxIn_0_1[0];
  assign belInputPinsMux_0_1_io_muxIn_1 = _zz_io_muxIn_0_1[1];
  assign belInputPinsMux_0_1_io_muxIn_2 = _zz_io_muxIn_0_1[2];
  assign belInputPinsMux_0_1_io_muxIn_3 = _zz_io_muxIn_0_1[3];
  assign belInputPinsMux_0_1_io_muxIn_4 = _zz_io_muxIn_0_1[4];
  assign belInputPinsMux_0_1_io_muxIn_5 = _zz_io_muxIn_0_1[5];
  assign belInputPinsMux_0_1_io_muxIn_6 = _zz_io_muxIn_0_1[6];
  assign belInputPinsMux_0_1_io_muxIn_7 = _zz_io_muxIn_0_1[7];
  assign _zz_io_muxIn_0_2 = {belsOut,io_clbIn};
  assign belInputPinsMux_0_2_io_muxIn_0 = _zz_io_muxIn_0_2[0];
  assign belInputPinsMux_0_2_io_muxIn_1 = _zz_io_muxIn_0_2[1];
  assign belInputPinsMux_0_2_io_muxIn_2 = _zz_io_muxIn_0_2[2];
  assign belInputPinsMux_0_2_io_muxIn_3 = _zz_io_muxIn_0_2[3];
  assign belInputPinsMux_0_2_io_muxIn_4 = _zz_io_muxIn_0_2[4];
  assign belInputPinsMux_0_2_io_muxIn_5 = _zz_io_muxIn_0_2[5];
  assign belInputPinsMux_0_2_io_muxIn_6 = _zz_io_muxIn_0_2[6];
  assign belInputPinsMux_0_2_io_muxIn_7 = _zz_io_muxIn_0_2[7];
  assign _zz_io_muxIn_0_3 = {belsOut,io_clbIn};
  assign belInputPinsMux_0_3_io_muxIn_0 = _zz_io_muxIn_0_3[0];
  assign belInputPinsMux_0_3_io_muxIn_1 = _zz_io_muxIn_0_3[1];
  assign belInputPinsMux_0_3_io_muxIn_2 = _zz_io_muxIn_0_3[2];
  assign belInputPinsMux_0_3_io_muxIn_3 = _zz_io_muxIn_0_3[3];
  assign belInputPinsMux_0_3_io_muxIn_4 = _zz_io_muxIn_0_3[4];
  assign belInputPinsMux_0_3_io_muxIn_5 = _zz_io_muxIn_0_3[5];
  assign belInputPinsMux_0_3_io_muxIn_6 = _zz_io_muxIn_0_3[6];
  assign belInputPinsMux_0_3_io_muxIn_7 = _zz_io_muxIn_0_3[7];
  assign _zz_io_muxIn_0_4 = {belsOut,io_clbIn};
  assign belInputPinsMux_1_0_io_muxIn_0 = _zz_io_muxIn_0_4[0];
  assign belInputPinsMux_1_0_io_muxIn_1 = _zz_io_muxIn_0_4[1];
  assign belInputPinsMux_1_0_io_muxIn_2 = _zz_io_muxIn_0_4[2];
  assign belInputPinsMux_1_0_io_muxIn_3 = _zz_io_muxIn_0_4[3];
  assign belInputPinsMux_1_0_io_muxIn_4 = _zz_io_muxIn_0_4[4];
  assign belInputPinsMux_1_0_io_muxIn_5 = _zz_io_muxIn_0_4[5];
  assign belInputPinsMux_1_0_io_muxIn_6 = _zz_io_muxIn_0_4[6];
  assign belInputPinsMux_1_0_io_muxIn_7 = _zz_io_muxIn_0_4[7];
  always @(*) begin
    bels_1_io_belIn[0] = ((belInputPinsMux_1_0_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_1_io_belIn[1] = ((belInputPinsMux_1_1_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_1_io_belIn[2] = ((belInputPinsMux_1_2_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_1_io_belIn[3] = ((belInputPinsMux_1_3_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
  end

  assign _zz_io_muxIn_0_5 = {belsOut,io_clbIn};
  assign belInputPinsMux_1_1_io_muxIn_0 = _zz_io_muxIn_0_5[0];
  assign belInputPinsMux_1_1_io_muxIn_1 = _zz_io_muxIn_0_5[1];
  assign belInputPinsMux_1_1_io_muxIn_2 = _zz_io_muxIn_0_5[2];
  assign belInputPinsMux_1_1_io_muxIn_3 = _zz_io_muxIn_0_5[3];
  assign belInputPinsMux_1_1_io_muxIn_4 = _zz_io_muxIn_0_5[4];
  assign belInputPinsMux_1_1_io_muxIn_5 = _zz_io_muxIn_0_5[5];
  assign belInputPinsMux_1_1_io_muxIn_6 = _zz_io_muxIn_0_5[6];
  assign belInputPinsMux_1_1_io_muxIn_7 = _zz_io_muxIn_0_5[7];
  assign _zz_io_muxIn_0_6 = {belsOut,io_clbIn};
  assign belInputPinsMux_1_2_io_muxIn_0 = _zz_io_muxIn_0_6[0];
  assign belInputPinsMux_1_2_io_muxIn_1 = _zz_io_muxIn_0_6[1];
  assign belInputPinsMux_1_2_io_muxIn_2 = _zz_io_muxIn_0_6[2];
  assign belInputPinsMux_1_2_io_muxIn_3 = _zz_io_muxIn_0_6[3];
  assign belInputPinsMux_1_2_io_muxIn_4 = _zz_io_muxIn_0_6[4];
  assign belInputPinsMux_1_2_io_muxIn_5 = _zz_io_muxIn_0_6[5];
  assign belInputPinsMux_1_2_io_muxIn_6 = _zz_io_muxIn_0_6[6];
  assign belInputPinsMux_1_2_io_muxIn_7 = _zz_io_muxIn_0_6[7];
  assign _zz_io_muxIn_0_7 = {belsOut,io_clbIn};
  assign belInputPinsMux_1_3_io_muxIn_0 = _zz_io_muxIn_0_7[0];
  assign belInputPinsMux_1_3_io_muxIn_1 = _zz_io_muxIn_0_7[1];
  assign belInputPinsMux_1_3_io_muxIn_2 = _zz_io_muxIn_0_7[2];
  assign belInputPinsMux_1_3_io_muxIn_3 = _zz_io_muxIn_0_7[3];
  assign belInputPinsMux_1_3_io_muxIn_4 = _zz_io_muxIn_0_7[4];
  assign belInputPinsMux_1_3_io_muxIn_5 = _zz_io_muxIn_0_7[5];
  assign belInputPinsMux_1_3_io_muxIn_6 = _zz_io_muxIn_0_7[6];
  assign belInputPinsMux_1_3_io_muxIn_7 = _zz_io_muxIn_0_7[7];
  assign _zz_io_muxIn_0_8 = {belsOut,io_clbIn};
  assign belInputPinsMux_2_0_io_muxIn_0 = _zz_io_muxIn_0_8[0];
  assign belInputPinsMux_2_0_io_muxIn_1 = _zz_io_muxIn_0_8[1];
  assign belInputPinsMux_2_0_io_muxIn_2 = _zz_io_muxIn_0_8[2];
  assign belInputPinsMux_2_0_io_muxIn_3 = _zz_io_muxIn_0_8[3];
  assign belInputPinsMux_2_0_io_muxIn_4 = _zz_io_muxIn_0_8[4];
  assign belInputPinsMux_2_0_io_muxIn_5 = _zz_io_muxIn_0_8[5];
  assign belInputPinsMux_2_0_io_muxIn_6 = _zz_io_muxIn_0_8[6];
  assign belInputPinsMux_2_0_io_muxIn_7 = _zz_io_muxIn_0_8[7];
  always @(*) begin
    bels_2_io_belIn[0] = ((belInputPinsMux_2_0_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_2_io_belIn[1] = ((belInputPinsMux_2_1_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_2_io_belIn[2] = ((belInputPinsMux_2_2_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_2_io_belIn[3] = ((belInputPinsMux_2_3_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
  end

  assign _zz_io_muxIn_0_9 = {belsOut,io_clbIn};
  assign belInputPinsMux_2_1_io_muxIn_0 = _zz_io_muxIn_0_9[0];
  assign belInputPinsMux_2_1_io_muxIn_1 = _zz_io_muxIn_0_9[1];
  assign belInputPinsMux_2_1_io_muxIn_2 = _zz_io_muxIn_0_9[2];
  assign belInputPinsMux_2_1_io_muxIn_3 = _zz_io_muxIn_0_9[3];
  assign belInputPinsMux_2_1_io_muxIn_4 = _zz_io_muxIn_0_9[4];
  assign belInputPinsMux_2_1_io_muxIn_5 = _zz_io_muxIn_0_9[5];
  assign belInputPinsMux_2_1_io_muxIn_6 = _zz_io_muxIn_0_9[6];
  assign belInputPinsMux_2_1_io_muxIn_7 = _zz_io_muxIn_0_9[7];
  assign _zz_io_muxIn_0_10 = {belsOut,io_clbIn};
  assign belInputPinsMux_2_2_io_muxIn_0 = _zz_io_muxIn_0_10[0];
  assign belInputPinsMux_2_2_io_muxIn_1 = _zz_io_muxIn_0_10[1];
  assign belInputPinsMux_2_2_io_muxIn_2 = _zz_io_muxIn_0_10[2];
  assign belInputPinsMux_2_2_io_muxIn_3 = _zz_io_muxIn_0_10[3];
  assign belInputPinsMux_2_2_io_muxIn_4 = _zz_io_muxIn_0_10[4];
  assign belInputPinsMux_2_2_io_muxIn_5 = _zz_io_muxIn_0_10[5];
  assign belInputPinsMux_2_2_io_muxIn_6 = _zz_io_muxIn_0_10[6];
  assign belInputPinsMux_2_2_io_muxIn_7 = _zz_io_muxIn_0_10[7];
  assign _zz_io_muxIn_0_11 = {belsOut,io_clbIn};
  assign belInputPinsMux_2_3_io_muxIn_0 = _zz_io_muxIn_0_11[0];
  assign belInputPinsMux_2_3_io_muxIn_1 = _zz_io_muxIn_0_11[1];
  assign belInputPinsMux_2_3_io_muxIn_2 = _zz_io_muxIn_0_11[2];
  assign belInputPinsMux_2_3_io_muxIn_3 = _zz_io_muxIn_0_11[3];
  assign belInputPinsMux_2_3_io_muxIn_4 = _zz_io_muxIn_0_11[4];
  assign belInputPinsMux_2_3_io_muxIn_5 = _zz_io_muxIn_0_11[5];
  assign belInputPinsMux_2_3_io_muxIn_6 = _zz_io_muxIn_0_11[6];
  assign belInputPinsMux_2_3_io_muxIn_7 = _zz_io_muxIn_0_11[7];
  assign _zz_io_muxIn_0_12 = {belsOut,io_clbIn};
  assign belInputPinsMux_3_0_io_muxIn_0 = _zz_io_muxIn_0_12[0];
  assign belInputPinsMux_3_0_io_muxIn_1 = _zz_io_muxIn_0_12[1];
  assign belInputPinsMux_3_0_io_muxIn_2 = _zz_io_muxIn_0_12[2];
  assign belInputPinsMux_3_0_io_muxIn_3 = _zz_io_muxIn_0_12[3];
  assign belInputPinsMux_3_0_io_muxIn_4 = _zz_io_muxIn_0_12[4];
  assign belInputPinsMux_3_0_io_muxIn_5 = _zz_io_muxIn_0_12[5];
  assign belInputPinsMux_3_0_io_muxIn_6 = _zz_io_muxIn_0_12[6];
  assign belInputPinsMux_3_0_io_muxIn_7 = _zz_io_muxIn_0_12[7];
  always @(*) begin
    bels_3_io_belIn[0] = ((belInputPinsMux_3_0_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_3_io_belIn[1] = ((belInputPinsMux_3_1_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_3_io_belIn[2] = ((belInputPinsMux_3_2_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
    bels_3_io_belIn[3] = ((belInputPinsMux_3_3_io_muxOut && (progIface_en == 1'b0)) && (io_designEnable == 1'b1));
  end

  assign _zz_io_muxIn_0_13 = {belsOut,io_clbIn};
  assign belInputPinsMux_3_1_io_muxIn_0 = _zz_io_muxIn_0_13[0];
  assign belInputPinsMux_3_1_io_muxIn_1 = _zz_io_muxIn_0_13[1];
  assign belInputPinsMux_3_1_io_muxIn_2 = _zz_io_muxIn_0_13[2];
  assign belInputPinsMux_3_1_io_muxIn_3 = _zz_io_muxIn_0_13[3];
  assign belInputPinsMux_3_1_io_muxIn_4 = _zz_io_muxIn_0_13[4];
  assign belInputPinsMux_3_1_io_muxIn_5 = _zz_io_muxIn_0_13[5];
  assign belInputPinsMux_3_1_io_muxIn_6 = _zz_io_muxIn_0_13[6];
  assign belInputPinsMux_3_1_io_muxIn_7 = _zz_io_muxIn_0_13[7];
  assign _zz_io_muxIn_0_14 = {belsOut,io_clbIn};
  assign belInputPinsMux_3_2_io_muxIn_0 = _zz_io_muxIn_0_14[0];
  assign belInputPinsMux_3_2_io_muxIn_1 = _zz_io_muxIn_0_14[1];
  assign belInputPinsMux_3_2_io_muxIn_2 = _zz_io_muxIn_0_14[2];
  assign belInputPinsMux_3_2_io_muxIn_3 = _zz_io_muxIn_0_14[3];
  assign belInputPinsMux_3_2_io_muxIn_4 = _zz_io_muxIn_0_14[4];
  assign belInputPinsMux_3_2_io_muxIn_5 = _zz_io_muxIn_0_14[5];
  assign belInputPinsMux_3_2_io_muxIn_6 = _zz_io_muxIn_0_14[6];
  assign belInputPinsMux_3_2_io_muxIn_7 = _zz_io_muxIn_0_14[7];
  assign _zz_io_muxIn_0_15 = {belsOut,io_clbIn};
  assign belInputPinsMux_3_3_io_muxIn_0 = _zz_io_muxIn_0_15[0];
  assign belInputPinsMux_3_3_io_muxIn_1 = _zz_io_muxIn_0_15[1];
  assign belInputPinsMux_3_3_io_muxIn_2 = _zz_io_muxIn_0_15[2];
  assign belInputPinsMux_3_3_io_muxIn_3 = _zz_io_muxIn_0_15[3];
  assign belInputPinsMux_3_3_io_muxIn_4 = _zz_io_muxIn_0_15[4];
  assign belInputPinsMux_3_3_io_muxIn_5 = _zz_io_muxIn_0_15[5];
  assign belInputPinsMux_3_3_io_muxIn_6 = _zz_io_muxIn_0_15[6];
  assign belInputPinsMux_3_3_io_muxIn_7 = _zz_io_muxIn_0_15[7];
  assign progChainInput_clk = progIface_clk;
  assign progChainInput_reset = progIface_reset;
  assign progChainInput_en = progIface_en;
  assign progChainInput_dIn = progIface_dIn;
  assign progChainInput_dOut = progChainInput_dIn;
  assign progIface_dOut = belInputPinsMux_3_3_progIface_dOut;
  assign io_clbOut = belsOut;

endmodule

module IOBuf (
  input               progIface_clk,
  input               progIface_reset,
  input               progIface_en,
  input               progIface_dIn,
  output              progIface_dOut,
  input      [7:0]    io_buffs_read,
  output     [7:0]    io_buffs_write,
  output     [7:0]    io_buffs_writeEnable,
  output              io_fabricIn_0,
  output              io_fabricIn_1,
  output              io_fabricIn_2,
  output              io_fabricIn_3,
  output              io_fabricIn_4,
  output              io_fabricIn_5,
  output              io_fabricIn_6,
  output              io_fabricIn_7,
  input               io_fabricOut_0,
  input               io_fabricOut_1,
  input               io_fabricOut_2,
  input               io_fabricOut_3,
  input               io_fabricOut_4,
  input               io_fabricOut_5,
  input               io_fabricOut_6,
  input               io_fabricOut_7
);

  wire       [7:0]    pinDir;
  reg                 progClkArea_pinDirMem_0;
  reg                 progClkArea_pinDirMem_1;
  reg                 progClkArea_pinDirMem_2;
  reg                 progClkArea_pinDirMem_3;
  reg                 progClkArea_pinDirMem_4;
  reg                 progClkArea_pinDirMem_5;
  reg                 progClkArea_pinDirMem_6;
  reg                 progClkArea_pinDirMem_7;

  assign io_fabricIn_0 = io_buffs_read[0];
  assign io_fabricIn_1 = io_buffs_read[1];
  assign io_fabricIn_2 = io_buffs_read[2];
  assign io_fabricIn_3 = io_buffs_read[3];
  assign io_fabricIn_4 = io_buffs_read[4];
  assign io_fabricIn_5 = io_buffs_read[5];
  assign io_fabricIn_6 = io_buffs_read[6];
  assign io_fabricIn_7 = io_buffs_read[7];
  assign io_buffs_write = {io_fabricOut_7,{io_fabricOut_6,{io_fabricOut_5,{io_fabricOut_4,{io_fabricOut_3,{io_fabricOut_2,{io_fabricOut_1,io_fabricOut_0}}}}}}};
  assign io_buffs_writeEnable = pinDir;
  assign progIface_dOut = progClkArea_pinDirMem_7;
  assign pinDir = {progClkArea_pinDirMem_7,{progClkArea_pinDirMem_6,{progClkArea_pinDirMem_5,{progClkArea_pinDirMem_4,{progClkArea_pinDirMem_3,{progClkArea_pinDirMem_2,{progClkArea_pinDirMem_1,progClkArea_pinDirMem_0}}}}}}};
  always @(posedge progIface_clk or posedge progIface_reset) begin
    if(progIface_reset) begin
      progClkArea_pinDirMem_0 <= 1'b0;
      progClkArea_pinDirMem_1 <= 1'b0;
      progClkArea_pinDirMem_2 <= 1'b0;
      progClkArea_pinDirMem_3 <= 1'b0;
      progClkArea_pinDirMem_4 <= 1'b0;
      progClkArea_pinDirMem_5 <= 1'b0;
      progClkArea_pinDirMem_6 <= 1'b0;
      progClkArea_pinDirMem_7 <= 1'b0;
    end else begin
      if(progIface_en) begin
        progClkArea_pinDirMem_0 <= progIface_dIn;
      end
      if(progIface_en) begin
        progClkArea_pinDirMem_1 <= progClkArea_pinDirMem_0;
      end
      if(progIface_en) begin
        progClkArea_pinDirMem_2 <= progClkArea_pinDirMem_1;
      end
      if(progIface_en) begin
        progClkArea_pinDirMem_3 <= progClkArea_pinDirMem_2;
      end
      if(progIface_en) begin
        progClkArea_pinDirMem_4 <= progClkArea_pinDirMem_3;
      end
      if(progIface_en) begin
        progClkArea_pinDirMem_5 <= progClkArea_pinDirMem_4;
      end
      if(progIface_en) begin
        progClkArea_pinDirMem_6 <= progClkArea_pinDirMem_5;
      end
      if(progIface_en) begin
        progClkArea_pinDirMem_7 <= progClkArea_pinDirMem_6;
      end
    end
  end


endmodule

//ProgMux_27 replaced by ProgMux_12

//ProgMux_26 replaced by ProgMux_12

//ProgMux_25 replaced by ProgMux_12

//ProgMux_24 replaced by ProgMux_12

//ProgMux_23 replaced by ProgMux_12

//ProgMux_22 replaced by ProgMux_12

//ProgMux_21 replaced by ProgMux_12

//ProgMux_20 replaced by ProgMux_12

//ProgMux_19 replaced by ProgMux_12

//ProgMux_18 replaced by ProgMux_12

//ProgMux_17 replaced by ProgMux_12

//ProgMux_16 replaced by ProgMux_12

//ProgMux_15 replaced by ProgMux_12

//ProgMux_14 replaced by ProgMux_12

//ProgMux_13 replaced by ProgMux_12

module ProgMux_12 (
  input               progIface_clk,
  input               progIface_reset,
  input               progIface_en,
  input               progIface_dIn,
  output              progIface_dOut,
  input               io_muxIn_0,
  input               io_muxIn_1,
  input               io_muxIn_2,
  input               io_muxIn_3,
  input               io_muxIn_4,
  input               io_muxIn_5,
  input               io_muxIn_6,
  input               io_muxIn_7,
  output              io_muxOut
);

  reg                 _zz_io_muxOut;
  wire       [2:0]    sel;
  reg                 progClkArea_selMem_0;
  reg                 progClkArea_selMem_1;
  reg                 progClkArea_selMem_2;

  always @(*) begin
    case(sel)
      3'b000 : _zz_io_muxOut = io_muxIn_0;
      3'b001 : _zz_io_muxOut = io_muxIn_1;
      3'b010 : _zz_io_muxOut = io_muxIn_2;
      3'b011 : _zz_io_muxOut = io_muxIn_3;
      3'b100 : _zz_io_muxOut = io_muxIn_4;
      3'b101 : _zz_io_muxOut = io_muxIn_5;
      3'b110 : _zz_io_muxOut = io_muxIn_6;
      default : _zz_io_muxOut = io_muxIn_7;
    endcase
  end

  assign progIface_dOut = progClkArea_selMem_2;
  assign sel = {progClkArea_selMem_2,{progClkArea_selMem_1,progClkArea_selMem_0}};
  assign io_muxOut = (progIface_en ? 1'b0 : _zz_io_muxOut);
  always @(posedge progIface_clk or posedge progIface_reset) begin
    if(progIface_reset) begin
      progClkArea_selMem_0 <= 1'b0;
      progClkArea_selMem_1 <= 1'b0;
      progClkArea_selMem_2 <= 1'b0;
    end else begin
      if(progIface_en) begin
        progClkArea_selMem_0 <= progIface_dIn;
      end
      if(progIface_en) begin
        progClkArea_selMem_1 <= progClkArea_selMem_0;
      end
      if(progIface_en) begin
        progClkArea_selMem_2 <= progClkArea_selMem_1;
      end
    end
  end


endmodule

//Bel_3 replaced by Bel

//Bel_2 replaced by Bel

//Bel_1 replaced by Bel

module Bel (
  input               progIface_clk,
  input               progIface_reset,
  input               progIface_en,
  input               progIface_dIn,
  output              progIface_dOut,
  input      [3:0]    io_belIn,
  output              io_belOut,
  input               clk,
  input               reset
);

  wire                lut_4_progIface_dOut;
  wire                lut_4_io_lutOut;
  wire                pMux_progIface_dOut;
  wire                pMux_io_muxOut;
  wire                when_Bel_l19;
  reg                 dFF;

  Lut_3 lut_4 (
    .progIface_clk   (progIface_clk       ), //i
    .progIface_reset (progIface_reset     ), //i
    .progIface_en    (progIface_en        ), //i
    .progIface_dIn   (progIface_dIn       ), //i
    .progIface_dOut  (lut_4_progIface_dOut), //o
    .io_lutIn        (io_belIn[3:0]       ), //i
    .io_lutOut       (lut_4_io_lutOut     )  //o
  );
  ProgMux_31 pMux (
    .progIface_clk   (progIface_clk       ), //i
    .progIface_reset (progIface_reset     ), //i
    .progIface_en    (progIface_en        ), //i
    .progIface_dIn   (lut_4_progIface_dOut), //i
    .progIface_dOut  (pMux_progIface_dOut ), //o
    .io_muxIn_0      (dFF                 ), //i
    .io_muxIn_1      (lut_4_io_lutOut     ), //i
    .io_muxOut       (pMux_io_muxOut      )  //o
  );
  assign when_Bel_l19 = (progIface_en == 1'b0);
  assign io_belOut = pMux_io_muxOut;
  assign progIface_dOut = pMux_progIface_dOut;
  always @(posedge clk) begin
    if(reset) begin
      dFF <= 1'b0;
    end else begin
      if(when_Bel_l19) begin
        dFF <= lut_4_io_lutOut;
      end
    end
  end


endmodule

//ProgMux_28 replaced by ProgMux_31

//Lut replaced by Lut_3

//ProgMux_29 replaced by ProgMux_31

//Lut_1 replaced by Lut_3

//ProgMux_30 replaced by ProgMux_31

//Lut_2 replaced by Lut_3

module ProgMux_31 (
  input               progIface_clk,
  input               progIface_reset,
  input               progIface_en,
  input               progIface_dIn,
  output              progIface_dOut,
  input               io_muxIn_0,
  input               io_muxIn_1,
  output              io_muxOut
);

  reg                 _zz_io_muxOut;
  wire       [0:0]    sel;
  reg                 progClkArea_selMem_0;

  always @(*) begin
    case(sel)
      1'b0 : _zz_io_muxOut = io_muxIn_0;
      default : _zz_io_muxOut = io_muxIn_1;
    endcase
  end

  assign progIface_dOut = progClkArea_selMem_0;
  assign sel = progClkArea_selMem_0;
  assign io_muxOut = (progIface_en ? 1'b0 : _zz_io_muxOut);
  always @(posedge progIface_clk or posedge progIface_reset) begin
    if(progIface_reset) begin
      progClkArea_selMem_0 <= 1'b0;
    end else begin
      if(progIface_en) begin
        progClkArea_selMem_0 <= progIface_dIn;
      end
    end
  end


endmodule

module Lut_3 (
  input               progIface_clk,
  input               progIface_reset,
  input               progIface_en,
  input               progIface_dIn,
  output              progIface_dOut,
  input      [3:0]    io_lutIn,
  output              io_lutOut
);

  reg                 _zz__zz_io_lutOut;
  wire       [3:0]    _zz__zz_io_lutOut_1;
  wire                lut_0;
  wire                lut_1_1;
  wire                lut_2_1;
  wire                lut_3_1;
  wire                lut_4;
  wire                lut_5;
  wire                lut_6;
  wire                lut_7;
  wire                lut_8;
  wire                lut_9;
  wire                lut_10;
  wire                lut_11;
  wire                lut_12;
  wire                lut_13;
  wire                lut_14;
  wire                lut_15;
  reg                 progClkArea_lutMem_0;
  reg                 progClkArea_lutMem_1;
  reg                 progClkArea_lutMem_2;
  reg                 progClkArea_lutMem_3;
  reg                 progClkArea_lutMem_4;
  reg                 progClkArea_lutMem_5;
  reg                 progClkArea_lutMem_6;
  reg                 progClkArea_lutMem_7;
  reg                 progClkArea_lutMem_8;
  reg                 progClkArea_lutMem_9;
  reg                 progClkArea_lutMem_10;
  reg                 progClkArea_lutMem_11;
  reg                 progClkArea_lutMem_12;
  reg                 progClkArea_lutMem_13;
  reg                 progClkArea_lutMem_14;
  reg                 progClkArea_lutMem_15;
  wire                _zz_io_lutOut;

  assign _zz__zz_io_lutOut_1 = io_lutIn;
  always @(*) begin
    case(_zz__zz_io_lutOut_1)
      4'b0000 : _zz__zz_io_lutOut = lut_0;
      4'b0001 : _zz__zz_io_lutOut = lut_1_1;
      4'b0010 : _zz__zz_io_lutOut = lut_2_1;
      4'b0011 : _zz__zz_io_lutOut = lut_3_1;
      4'b0100 : _zz__zz_io_lutOut = lut_4;
      4'b0101 : _zz__zz_io_lutOut = lut_5;
      4'b0110 : _zz__zz_io_lutOut = lut_6;
      4'b0111 : _zz__zz_io_lutOut = lut_7;
      4'b1000 : _zz__zz_io_lutOut = lut_8;
      4'b1001 : _zz__zz_io_lutOut = lut_9;
      4'b1010 : _zz__zz_io_lutOut = lut_10;
      4'b1011 : _zz__zz_io_lutOut = lut_11;
      4'b1100 : _zz__zz_io_lutOut = lut_12;
      4'b1101 : _zz__zz_io_lutOut = lut_13;
      4'b1110 : _zz__zz_io_lutOut = lut_14;
      default : _zz__zz_io_lutOut = lut_15;
    endcase
  end

  assign progIface_dOut = progClkArea_lutMem_15;
  assign lut_0 = progClkArea_lutMem_0;
  assign lut_1_1 = progClkArea_lutMem_1;
  assign lut_2_1 = progClkArea_lutMem_2;
  assign lut_3_1 = progClkArea_lutMem_3;
  assign lut_4 = progClkArea_lutMem_4;
  assign lut_5 = progClkArea_lutMem_5;
  assign lut_6 = progClkArea_lutMem_6;
  assign lut_7 = progClkArea_lutMem_7;
  assign lut_8 = progClkArea_lutMem_8;
  assign lut_9 = progClkArea_lutMem_9;
  assign lut_10 = progClkArea_lutMem_10;
  assign lut_11 = progClkArea_lutMem_11;
  assign lut_12 = progClkArea_lutMem_12;
  assign lut_13 = progClkArea_lutMem_13;
  assign lut_14 = progClkArea_lutMem_14;
  assign lut_15 = progClkArea_lutMem_15;
  assign _zz_io_lutOut = _zz__zz_io_lutOut;
  assign io_lutOut = _zz_io_lutOut;
  always @(posedge progIface_clk or posedge progIface_reset) begin
    if(progIface_reset) begin
      progClkArea_lutMem_0 <= 1'b0;
      progClkArea_lutMem_1 <= 1'b0;
      progClkArea_lutMem_2 <= 1'b0;
      progClkArea_lutMem_3 <= 1'b0;
      progClkArea_lutMem_4 <= 1'b0;
      progClkArea_lutMem_5 <= 1'b0;
      progClkArea_lutMem_6 <= 1'b0;
      progClkArea_lutMem_7 <= 1'b0;
      progClkArea_lutMem_8 <= 1'b0;
      progClkArea_lutMem_9 <= 1'b0;
      progClkArea_lutMem_10 <= 1'b0;
      progClkArea_lutMem_11 <= 1'b0;
      progClkArea_lutMem_12 <= 1'b0;
      progClkArea_lutMem_13 <= 1'b0;
      progClkArea_lutMem_14 <= 1'b0;
      progClkArea_lutMem_15 <= 1'b0;
    end else begin
      if(progIface_en) begin
        progClkArea_lutMem_0 <= progIface_dIn;
      end
      if(progIface_en) begin
        progClkArea_lutMem_1 <= progClkArea_lutMem_0;
      end
      if(progIface_en) begin
        progClkArea_lutMem_2 <= progClkArea_lutMem_1;
      end
      if(progIface_en) begin
        progClkArea_lutMem_3 <= progClkArea_lutMem_2;
      end
      if(progIface_en) begin
        progClkArea_lutMem_4 <= progClkArea_lutMem_3;
      end
      if(progIface_en) begin
        progClkArea_lutMem_5 <= progClkArea_lutMem_4;
      end
      if(progIface_en) begin
        progClkArea_lutMem_6 <= progClkArea_lutMem_5;
      end
      if(progIface_en) begin
        progClkArea_lutMem_7 <= progClkArea_lutMem_6;
      end
      if(progIface_en) begin
        progClkArea_lutMem_8 <= progClkArea_lutMem_7;
      end
      if(progIface_en) begin
        progClkArea_lutMem_9 <= progClkArea_lutMem_8;
      end
      if(progIface_en) begin
        progClkArea_lutMem_10 <= progClkArea_lutMem_9;
      end
      if(progIface_en) begin
        progClkArea_lutMem_11 <= progClkArea_lutMem_10;
      end
      if(progIface_en) begin
        progClkArea_lutMem_12 <= progClkArea_lutMem_11;
      end
      if(progIface_en) begin
        progClkArea_lutMem_13 <= progClkArea_lutMem_12;
      end
      if(progIface_en) begin
        progClkArea_lutMem_14 <= progClkArea_lutMem_13;
      end
      if(progIface_en) begin
        progClkArea_lutMem_15 <= progClkArea_lutMem_14;
      end
    end
  end


endmodule
