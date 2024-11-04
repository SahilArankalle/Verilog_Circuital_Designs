module bidirectional_buffer(a,b,ctrl);
inout a,b;
input ctrl;


bufif1 (a,b,ctrl);
bufif0(b,a,ctrl);

endmodule
