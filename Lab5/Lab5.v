// Full adder
module myfulladd(A, B, CIN, SOUT, COUT);
    input A, B, CIN;
    output SOUT, COUT;

    assign SOUT = A ^ B ^ CIN; 
    assign COUT = A&B | (B & CIN) | (A & CIN); 
endmodule

// My Adder 4
module myadder4(x, y, c0, c4, s, v);
	input [3:0]x, y;
	input c0;
	output [3:0]s;
	output c4, v;
	wire cout1, cout2, cout3;
	
	myfulladd(x[0], y[0], c0, s[0], cout1);
	myfulladd(x[1], y[1], cout1, s[1], cout2);
	myfulladd(x[2], y[2], cout2, s[2], cout3);
	myfulladd(x[3], y[3], cout3, s[3], c4);
	assign v = (cout3 ^ c4);
endmodule
