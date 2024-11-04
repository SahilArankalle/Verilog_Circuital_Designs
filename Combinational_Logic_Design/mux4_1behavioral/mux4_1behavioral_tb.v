module mux4_1behavioral_tb();
reg [3:0] d;
reg [1:0] s;
wire [3:0] o;

mux4_1behavioral dut(d,s,o);

task initialize;
begin
{d,s} = 0;
end
endtask


task stimulus(input [3:0]i, input[1:0]j);
begin
#10;
d = i;
s = j;
end
endtask

initial 
begin
initialize;
stimulus(4'd5,2'd2);
stimulus(4'd15,2'd3);
stimulus(4'd6,2'd1);

end


initial
begin
$monitor("Values of data = %b, sel = %b, output = %b",d,s,o);
end


initial 
begin
#100 $finish;
end


endmodule

