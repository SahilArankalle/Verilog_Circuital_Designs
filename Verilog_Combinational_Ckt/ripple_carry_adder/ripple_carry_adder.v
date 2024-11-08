module ripple_carry_adder(input [3:0] a, b, output [3:0]sum, output carry);
wire w1,w2,w3;
full_adder FA1(a[0], b[0], 0, sum[0], w1);
full_adder FA2(a[1], b[1], w1, sum[1], w2);
full_adder FA3(a[2], b[2], w2, sum[2], w3);
full_adder FA4(a[3], b[3], w3, sum[3], carry);
endmodule
