module clk_buffer_tb();

    reg mclk;
    wire bclk;
    time t1, t2, t3, t4, t5, t6;

    clk_buffer dut(mclk, bclk);

    always
        begin
            #5 mclk = 1'b0;
            #5 mclk = 1'b1;
        end

    task mst_clk();
        begin
            @ (posedge mclk)
                t1 = $time;

            @ (posedge mclk)
                t2 = $time;
        end
    endtask

    task buff_clk();
        begin
            @ (posedge bclk)
                t3 = $time;

            @ (posedge bclk)
                t4 = $time;
        end
    endtask

    initial
        begin
            fork
                mst_clk;
                buff_clk;
            join

            if ((t1 == t3) && (t2 == t4))
                $display("Phase is same");

            t5 = t2 - t1;
            t6 = t4 - t3;

            if (t5 == t6)
                $display("Freq is same");

            #1000 $finish;
        end

endmodule
