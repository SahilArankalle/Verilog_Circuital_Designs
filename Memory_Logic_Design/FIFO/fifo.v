module fifo(
    input clk,          
    input rst,          
    input [7:0] din,    
    input we,           
    input re,           
    output reg [7:0] dout,   
    output full,        
    output empty        
);

reg [4:0] wr_ptr, rd_ptr;
reg [7:0] fifo [15:0];
integer k;

assign full = ((wr_ptr == 5'd16) && (rd_ptr == 5'd0)) ? 1'b1 : 1'b0;
assign empty = (rd_ptr == wr_ptr) ? 1'b1 : 1'b0;

always @(posedge clk)
begin
    if (rst == 1'b1)
    begin
  
        for (k = 0; k < 16; k = k + 1)
        begin
            fifo[k] <= 0;
        end
        wr_ptr <= 0;
    end
    else if ((we == 1'b1) && (full == 1'b0))
    begin
        fifo[wr_ptr] <= din;
        wr_ptr <= wr_ptr + 1'b1;
    end
end



always @(posedge clk) begin
    if (rst == 1'b1) begin
        dout <= 0;
        rd_ptr <= 0;
    end
    else if ((re == 1'b1) && (empty == 1'b0)) 
	 begin
        dout <= fifo[rd_ptr];
        rd_ptr <= rd_ptr + 1'b1;
    end
end

endmodule 



