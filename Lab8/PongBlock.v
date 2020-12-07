// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
// CREATED		"Thu Dec 03 20:52:31 2020"

module PongBlock(
	clk,
	iRESET,
	iRSRV,
	LSI,
	q,
	S
);


input wire	clk;
input wire	iRESET;
input wire	iRSRV;
output wire	LSI;
output wire	[3:0] q;
output wire	[1:0] S;

wire	lsi_ALTERA_SYNTHESIZED;
wire	[3:3] q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_0;
wire	[1:0] SYNTHESIZED_WIRE_1;

assign	S = SYNTHESIZED_WIRE_1;
assign	SYNTHESIZED_WIRE_0 = 1;




pong_controller1	b2v_inst(
	.CLK(clk),
	.QLEFT(q_ALTERA_SYNTHESIZED),
	.iRESET(iRESET),
	.iRSRV(iRSRV),
	.LSI(lsi_ALTERA_SYNTHESIZED),
	.S(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst.sENDL = 2'b11;
	defparam	b2v_inst.sIDLE = 2'b00;
	defparam	b2v_inst.sMOVL = 2'b10;
	defparam	b2v_inst.sRSRV = 2'b01;


pong4	b2v_inst1(
	.rsi(SYNTHESIZED_WIRE_0),
	.lsi(lsi_ALTERA_SYNTHESIZED),
	.clk(clk),
	.s(SYNTHESIZED_WIRE_1),
	.q(q));


assign	LSI = lsi_ALTERA_SYNTHESIZED;

endmodule
