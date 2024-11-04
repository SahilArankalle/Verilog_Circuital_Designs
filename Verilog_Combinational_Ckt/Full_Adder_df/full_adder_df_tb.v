module full_adder_df_tb();
reg a,b,c;
wire sum,carry;

integer i;
full_adder_df DUF(.a(a), .b(b), .c(c), .sum(sum), .carry(carry));
initial
begin
for(i = 0; i< 8; i=i+1)
	begin
	{a,b,c} = i;
	#10;
	end
	$finish;
end
endmodule
