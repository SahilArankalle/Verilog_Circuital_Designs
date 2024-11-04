module mux4x1_buffer(input [3:0] in, input [1:0] sel, output out);

wire [3:0] w,t;
decoder2x4 dut(sel,w);
tri_state_buffer t1(in[0],w[0],t[0]);
tri_state_buffer t2(in[1],w[1],t[1]);
tri_state_buffer t3(in[2],w[2],t[2]);
tri_state_buffer t4(in[3],w[3],t[3]);

assign out = t[sel];
endmodule
