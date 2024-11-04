module priority_encoder_8_3_tb();
reg [7:0] in;      
wire [2:0] out;    

priority_encoder_8_3 dut(in, out);  


task initialize;
begin
    in = 8'b00000000;  
end
endtask

task stimulus(input [7:0] i);
begin
    #10;
    in = i;
end
endtask

initial
begin
    initialize;
    #10 stimulus(8'b00000001);  
    #10 stimulus(8'b00000010);
    #10 stimulus(8'b00000100);
    #10 stimulus(8'b00001000);
    #10 stimulus(8'b00010000);
    #10 stimulus(8'b00100000);
    #10 stimulus(8'b01000000);
    #10 stimulus(8'b10000000);  
end

initial
begin
    $monitor("At time %t, input = %b, output = %b", $time, in, out);
end


initial
begin
    #100 $finish;
end

endmodule
