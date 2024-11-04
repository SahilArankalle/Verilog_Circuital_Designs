module half_adder_tb();
	reg a,b;
	wire sum,carry;
	integer i;
	half_adder DUT(.a(a), .b(b), .sum(sum), .carry(carry));
	initial 
	begin 
	for(i = 0; i < 8; i= i+1)
		begin
		{a,b} = i;
		#10;
		end
		$finish;
	end
endmodule
		