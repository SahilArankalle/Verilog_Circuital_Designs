module seq101_detector_tb();

    reg din, clock, reset;
    wire dout;

    parameter CYCLE = 10;

    seq101_detector SqD(.seq_in(din), .clk(clock), .rst(reset), .det_o(dout));


    initial clock = 0;
    always #(CYCLE/2) clock = ~clock;

    task initialize();
        begin
            din = 0;
            reset = 0;
        end
    endtask

    task delay(input integer i);
        begin
            #i;
        end
    endtask

    task RESET();
        begin
            delay(5);
            reset = 1'b1;
            delay(10);
            reset = 1'b0;
        end
    endtask

    task stimulus(input data);
        begin
            @(negedge clock);
            din = data;
        end
    endtask

    initial
        $monitor("Reset=%b, state=%b, Din=%b, Output Dout=%b", reset, SqD.state, din, dout);

    always @(SqD.state or dout) begin
        if (SqD.state == 2'b11 && dout == 1)
            $display("Correct output at state %b", SqD.state);
    end

    initial begin
        initialize;
        RESET;
        stimulus(0);
        stimulus(1);
        stimulus(0);
        stimulus(1);
        stimulus(1);
        stimulus(0);
        stimulus(1);
        stimulus(1);
        RESET;
        stimulus(1);
        stimulus(0);
        stimulus(1);
        stimulus(1);
        delay(10);
        $finish;
    end
endmodule
