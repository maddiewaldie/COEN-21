// PART 1
module pong4 (x, rsi, lsi, clk, s, q);
	input [3:0] x;
	input [1:0] s;
	input lsi, rsi, clk;
	output reg [3:0] q;
	
	
	always @(posedge clk)
		if (s[1] == 0 && s[0] == 1)
			begin
				q[0] <= q[1];
				q[1] <= q[2];
				q[2] <= q[3];
				q[3] <= rsi;
				
				
			end
		else if (s[1] == 0 && s[0] == 0)
			begin
				q[3] <= q[3];
				q[2] <= q[2];
				q[1] <= q[1];
				q[0] <= q[0];
			end
		else if (s[1] == 1 && s[0] == 0)
			begin
				q[3] <= q[2];
				q[2] <= q[1];
				q[1] <= q[0];
				q[0] <= lsi;
			end
		else if (s[1] == 1 && s[0] == 1)
			begin
				q[3] <= 0;
				q[2] <= 0;
				q[1] <= 0;
				q[0] <= 0;
			end 
endmodule

//PART 2
module pong_controller1(input CLK, QLEFT, iRESET, iRSRV,
                        output reg LSI,
                        output reg [1:0] S);
    reg [1:0] currState, nextState;
    parameter sIDLE = 2'b00, sRSRV = 2'b01, sMOVL = 2'b10, sENDL = 2'b11;

    always @(posedge CLK) currState <= nextState;

    always @(*) begin
        nextState = sIDLE;
        case(currState)
            sIDLE: begin
                    if(iRSRV) nextState = sRSRV;
                    {LSI, S} = 3'b011;
                end
            sRSRV: begin
                    if(!iRESET) nextState = sMOVL;
                    {LSI, S} = 3'b110;
                end
            sMOVL: begin
                    if(iRESET) nextState = sIDLE;
                    else if(QLEFT) nextState = sENDL;
                    else nextState = sMOVL;
                    {LSI, S} = 3'b010;
                end
            sENDL: begin
                    nextState = sIDLE;
                    {LSI, S} = 3'b000;
                end
            default: begin
                    nextState = sIDLE;
                    {LSI, S} = 3'b000;
                end
        endcase
    end
endmodule