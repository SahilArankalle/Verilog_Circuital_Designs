module fsm_tb;
    reg clk;
    reg reset;
    reg data_in;
    wire output_bit;

    fsm_divisible_by_3 dut (
        .clk(clk),
        .reset(reset),
        .data_in(data_in),
        .output_bit(output_bit)
    );

    task initialize;
        begin
            clk = 0;
            reset = 0;
            data_in = 0;
        end
    endtask

    always #10 clk = ~clk; 

    task apply_reset;
        begin
            reset = 1;
            #10;
            reset = 0;
				
        end
    endtask

    task send_input(input [4:0] data);
        integer i;
        begin
            for (i = 4; i >= 0; i = i - 1) begin
                data_in = data[i];
                #10;  
            end
        end
    endtask

    initial begin
        initialize;
        apply_reset;
        send_input(5'b10101);  

        $finish;
    end

    initial begin
        $monitor("Time = %0d, data_in = %b, output_bit = %b", $time, data_in, output_bit);
    end
endmodule
