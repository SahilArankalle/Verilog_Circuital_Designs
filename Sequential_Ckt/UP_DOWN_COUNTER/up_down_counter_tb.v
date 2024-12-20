module up_down_counter_tb();
reg mode,clk,rst;
wire [3:0] count;

parameter cycle = 10;
up_down_counter dut (mode,clk,rst,count);

always 
begin
	#(cycle/2);
	clk = 1'b0;
	#(cycle/2);
	clk = 1'b1;
end

task rst_dut;
begin
	@ (negedge clk);
	rst = 1'b1;
	@ (negedge clk);
	rst = 1'b0;
end
endtask


initial 
begin
@ (negedge clk);
	mode = 1'b0;
	rst_dut;
	#100;
	@ (negedge clk);
	mode = 1'b1;
	#100;
	$finish;
end
endmodule

