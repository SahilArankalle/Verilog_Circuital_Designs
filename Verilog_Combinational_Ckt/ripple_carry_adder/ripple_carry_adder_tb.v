module ripple_Carry_adder_tb();
reg [3:0] a,b;
wire [3:0] sum,carry;

ripple_carry_adder dut(a,b,sum,carry);
integer i;
initial 
begin
for (i = 0; i < 8; i = i + 1)
begin
a = i;
b = i + 1;

#10;
end
end
endmodule

