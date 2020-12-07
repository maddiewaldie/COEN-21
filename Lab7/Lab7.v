// Counter Block
module updown(clk, rstn, dir, en, count_up, count_down);
	input clk, rstn, dir, en;
	output reg [2:0]count_up,count_down;

	always @(posedge clk)
		if(rstn == 1) begin

			count_up = 3'b000;
			count_down = 3'b110;
		end
		else begin

			if(en == 1) begin
				if (dir == 1)
					  begin
						 if(count_up == 3'b110)
							begin
							  count_up = 3'b001;
							end
						 else
							begin
							  count_up <= count_up + 1;
							end
					  end
				 else
					begin
					  if(count_down == 3'b001)
						 begin
							count_down = 3'b110;
						 end
					  else
						 begin
							count_down <= count_down - 1;
						 end
					end

			end


			else begin
				count_up = count_up;
				count_down = count_down;
			end
	end
endmodule


// Win/Lose Block
module winlose(count_up, count_down, w, l, stp, en);
	input [2:0]count_up, count_down;
	input stp;
	output reg w,l,en;

	always @(count_up or count_down)
	begin
		w=0; l=0; //i=0;
		if(stp == 1)
		begin
		en = 0;
			if(count_up==count_down)
				 w=1;
			else
				 l=1;
		end
		else
			en = 1;
	end
endmodule
