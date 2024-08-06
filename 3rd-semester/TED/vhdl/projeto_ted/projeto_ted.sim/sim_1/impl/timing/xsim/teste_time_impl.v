// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Wed May 31 15:17:09 2023
// Host        : Lipe_Lenovo running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {C:/Users/felip/OneDrive/rea de
//               Trabalho/UNB/3 Semestre/TEDVHDL/projeto_ted/projeto_ted.sim/sim_1/impl/timing/xsim/teste_time_impl.v}
// Design      : teste
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "f372663b" *) 
(* NotValidForBitStream *)
module teste
   (IN1,
    IN2,
    IN3,
    IN4,
    OUT3);
  input IN1;
  input IN2;
  input IN3;
  input IN4;
  output OUT3;

  wire IN1;
  wire IN1_IBUF;
  wire IN2;
  wire IN2_IBUF;
  wire IN3;
  wire IN3_IBUF;
  wire IN4;
  wire IN4_IBUF;
  wire OUT3;
  wire OUT3_OBUF;

initial begin
 $sdf_annotate("teste_time_impl.sdf",,,,"tool_control");
end
  IBUF IN1_IBUF_inst
       (.I(IN1),
        .O(IN1_IBUF));
  IBUF IN2_IBUF_inst
       (.I(IN2),
        .O(IN2_IBUF));
  IBUF IN3_IBUF_inst
       (.I(IN3),
        .O(IN3_IBUF));
  IBUF IN4_IBUF_inst
       (.I(IN4),
        .O(IN4_IBUF));
  OBUF OUT3_OBUF_inst
       (.I(OUT3_OBUF),
        .O(OUT3));
  LUT4 #(
    .INIT(16'hF888)) 
    OUT3_OBUF_inst_i_1
       (.I0(IN3_IBUF),
        .I1(IN4_IBUF),
        .I2(IN1_IBUF),
        .I3(IN2_IBUF),
        .O(OUT3_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
