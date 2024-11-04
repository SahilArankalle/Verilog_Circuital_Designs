module vending_machine_tb;

    reg clk, rst, I, J;
    wire X, Y;

    parameter CYCLE = 10;

    vending_machine vm(.clk(clk), .rst(rst), .I(I), .J(J), .X(X), .Y(Y));

    initial clk = 0;
    always #(CYCLE / 2) clk = ~clk;

    task initialize();
        begin
            I = 0;
            J = 0;
            rst = 0;
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
            rst = 1'b1;
            delay(10);
            rst = 1'b0;
        end
    endtask

    task insert_coin(input bit1, input bit0);
        begin
            @(negedge clk);
            I = bit1;
            J = bit0;
        end
    endtask

    initial
        $monitor("Time=%0t | Reset=%b, I=%b, J=%b, X=%b, Y=%b", $time, rst, I, J, X, Y);

    initial begin
        initialize;
        RESET;

        insert_coin(1, 0);
        
        insert_coin(1, 1);
                
        insert_coin(1, 0);
        
        insert_coin(1, 1);
        
        RESET;
        insert_coin(1, 1);

        insert_coin(1, 0);

        delay(10);
        $finish;
    end

endmodule
