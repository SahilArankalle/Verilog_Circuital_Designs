module dualport_tb();

parameter RAM_WIDTH = 8;
parameter RAM_DEPTH = 16;
parameter ADDR_SIZE = 4;
parameter CYCLE = 10;


reg clk,rst,write,read;
reg [RAM_WIDTH-1:0] data_in;
wire [RAM_WIDTH-1:0] data_out;
reg [ADDR_SIZE-1:0] rd_addr,wr_addr;
integer i;

dualport16x8_ram dut(clk,read,write,rst,rd_addr,wr_addr,data_in,data_out);

always 
begin
#(CYCLE/2) clk = 1'b0;
#(CYCLE/2) clk = 1'b1;
end

task rst_t;
begin
@ (negedge clk)
rst = 1'b0;
@ (negedge clk)
rst = 1'b1;
end
endtask

task write_t(input [7:0] a, input [3:0] b, input w,r);
begin
@ (negedge clk)
write = w;
read = r;
wr_addr = b;
data_in = a;
end
endtask

task read_t(input [3:0] a, input r,w);
begin
@ (negedge clk)
write = w;
read = r;
rd_addr = a;
end
endtask

initial 
begin

rst_t;
repeat(10)
write_t({$random}%256, {$random}%16,1'b1,1'b0);
repeat(10)
read_t({$random}%16,1'b1,1'b0);
#100 $finish;
end
endmodule




