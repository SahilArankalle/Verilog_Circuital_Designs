module mux2_1(i0,i1,s,y);
input i0,i1,s;
output y;

assign y = ((~s)&i0) | (s&i1);
endmodule

module mux4_1(a,b,c,d,s0,s1,z);
input a,b,c,d,s0,s1;
output z;
wire w1,w2;

mux2_1 m1(a,b,s1,w1);
mux2_1 m2(c,d,s1,w2);
mux2_1 m3(w1,w2,s0,z);

endmodule
