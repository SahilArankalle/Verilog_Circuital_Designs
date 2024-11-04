module decoder3_8_tb();
reg [2:0] in;
wire [7:0] out;

decoder3_8 dut(in, out); 

task initialize;
begin
    in = 0;
end
endtask

task stimulus(input [2:0] i);
begin
    #10;
    in = i;
end
endtask

initial
begin
    initialize;
    stimulus(3'd0);
    stimulus(3'd1);
    stimulus(3'd2);
    stimulus(3'd3);
    stimulus(3'd4);
    stimulus(3'd5);
    stimulus(3'd6);
    stimulus(3'd7);
end

// Monitor to display outputs
initial
begin
    $monitor("At time %t, input = %b, out = %b", $time, in, out);
end

// Terminate simulation after some time
initial
begin
    #100 $finish;
end

endmodule
