module tb();
  // clk, iRSRV, iRESET
  reg clk;
  reg iRESET;
  reg iRSRV;
  // LSI, q, S
  wire LSI;
  wire [3:0] q;
  wire [1:0] S;
 

PongBlock dut(.clk(clk), .iRESET(iRESET), .iRSRV(iRSRV), .LSI(LSI), .q(q), .S(S));

  initial begin
    clk = 0;

  forever #25 clk = ~clk;
  end

initial begin

iRESET = 1;
iRSRV = 0;

#50;

iRESET = 0;

#100;

iRSRV = 1;
//state should go to sRightPlayerServes (01)

#500;

$finish;
end
endmodule
