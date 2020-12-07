module Mux2to1 (x1,x2,A1,f);
	input x1,x2,A1;
	output f;
	
	assign f= (~A1&x1)|(A1&x2);
	
endmodule



module f00 (A0,B0,s0f0);
	input A0,B0;
	output s0f0;
	
	assign s0f0=A0^B0;
	
endmodule



module f01 (A0,B0,s0f1);
	input A0,B0;
	output s0f1;
	
	assign s0f1=A0^B0;
	
endmodule


module f10(A0,B1,B0,s1f0);
	input A0,B1,B0;
	output s1f0;
	
	assign s1f0=(~A0 & B1)|(B1 & ~B0)|(A0 & ~B1 & B0);
	
endmodule


module f11(A0,B1,B0,s1f1);
	input A0,B1,B0;
	output s1f1;
	
	assign s1f1=(~A0 & ~B1)|(~B1 & ~B0)|(A0 & B1 & B0);
	
endmodule