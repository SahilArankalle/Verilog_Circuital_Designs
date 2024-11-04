module dualport_tb();

    parameter RAM_WIDTH = 16;
    parameter RAM_DEPTH = 8;
    parameter ADDR_SIZE = 3;
    parameter CYCLE = 10;

    reg wr_clk, rd_clk, clr, we, re;
    reg [RAM_WIDTH-1:0] data_in;
    wire [RAM_WIDTH-1:0] data_out;
    reg [ADDR_SIZE-1:0] rd_addr, wr_addr;
    integer i, j;

    ram8x16_asynch_dualport dut(wr_clk, rd_clk, clr, we, re, data_in, rd_addr, wr_addr, data_out);

    task initialize();
        begin
            wr_clk = 1'b0;
            rd_clk = 1'b0;
            clr = 1'b0;
            we = 1'b0;
            re = 1'b0;
            wr_addr = 1'b0;
            rd_addr = 1'b0;
        end
    endtask

    always #10 wr_clk = ~wr_clk;
    always #20 rd_clk = ~rd_clk;

    task clr_t;
        begin
            clr = 1'b1;
            #50;
            clr = 1'b0;
        end
    endtask

    task write_t(input [15:0] a, input [2:0] b, input w);
        begin
            @ (negedge wr_clk)
            we = w;
            wr_addr = b;
            data_in = a;
        end
    endtask

    task read_t(input [2:0] a, input r);
        begin
            @ (negedge rd_clk)
            re = r;
            rd_addr = a;
        end
    endtask

    initial 
        begin
            initialize;
            #10;
            clr_t;

            for (i = 0; i < 8; i = i + 1)
                begin
                    write_t({$random} % 16, i, 1'b1);
                end

            for (j = 0; j < 8; j = j + 1)
                begin
                    read_t(j, 1'b1);
                end 
				#100 $finish;
        end
endmodule
