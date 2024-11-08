module siso(clk,rst,serial_input,serial_output);
input clk,rst,serial_input;
output reg serial_output;
reg [3:0] w;

always @ (posedge clk)
begin
if (rst)
w <= 4'b0000;
else
begin
w <= w << 1;
end
w[0] <= serial_input;
serial_output = w[3];

end


endmodule
