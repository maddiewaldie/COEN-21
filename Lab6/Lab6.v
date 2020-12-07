module myfulladd(A,B,Cin,Cout,S);
	input A,B,Cin;
	output S,Cout;

	assign S = A ^ B ^ Cin;
	assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

module myadder4(X, Y, c0, S, v, c4);
	input [3:0] X;
	input [3:0] Y;
	input c0;
	output [3:0] S;
	output v, c4;
	wire w1,w2,w3;
	myfulladd F1(X[0], Y[0], c0, w1, S[0]);
	myfulladd F2(X[1], Y[1], w1, w2, S[1]);
	myfulladd F3(X[2], Y[2], w2, w3, S[2]);
	myfulladd F4(X[3], Y[3], w3, c4, S[3]);
	assign v = c4 ^ w3;
endmodule

module myALU4(A, B, P, C4, Z, V, R);
	input [3:0] A;
	input [3:0] B;
	input [3:0] P;
	reg[3:0] w;
	output C4, Z, V;
	output [3:0] R;
	
	always @(*) begin
		case (P[2:1])
			2'b00: w = B;
			2'b01: w = ~B;
			2'b10: w = 4'b000;
			2'b11: w = 4'b1111;
		endcase
	end
	myadder4(A, w, P[0], R, V, C4);
	assign Z = ~|R;
endmodule 

