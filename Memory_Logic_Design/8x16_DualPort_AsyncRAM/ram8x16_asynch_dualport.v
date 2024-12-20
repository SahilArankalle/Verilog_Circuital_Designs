module ram8x16_asynch_dualport (wr_clk, rd_clk, clr, we, re, data_in, rd_addr, wr_addr, data_out);

parameter RAM_WIDTH = 16;
parameter RAM_DEPTH = 8;
parameter ADDR_SIZE = 3;

input wr_clk, rd_clk, clr, we, re;
input [RAM_WIDTH-1:0] data_in;
input [ADDR_SIZE-1:0] wr_addr, rd_addr;
output reg [RAM_WIDTH-1:0] data_out;

reg [RAM_WIDTH-1:0] mem [RAM_DEPTH-1:0];
integer i;

always @ (posedge wr_clk or posedge clr)
begin
    if (clr)
    begin
        for (i = 0; i < RAM_DEPTH; i = i + 1)
        begin
            mem[i] <= 0;
        end
    end
    else
    begin
        if (we)
            mem[wr_addr] <= data_in;
    end
end

always @ (posedge rd_clk or posedge clr)
begin
    if (clr)
    begin
        data_out <= 0;
    end
    else if (re)
    begin
        data_out <= mem[rd_addr];
    end
end

endmodule
