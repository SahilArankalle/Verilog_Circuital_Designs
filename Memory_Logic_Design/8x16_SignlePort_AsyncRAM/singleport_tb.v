module singleport_tb();

    reg [2:0] addr;
    reg we, re;
    wire [15:0] data;
    reg [15:0] temp;
    integer i;

    singleport8x16_async_ram dut(addr, we, re, data);

    task initialize();
        begin
            we = 1'b0;
            re = 1'b0;
            addr = 3'b0;
            temp = 16'b0;
        end
    endtask

    assign data = (we && !re) ? temp : 16'bz;

    task write_t();
        begin
            we = 1'b1;
            re = 1'b0;
        end
    endtask

    task read_t();
        begin
            we = 1'b0;
            re = 1'b1;
        end
    endtask

    task stimulusw(input [2:0] a, input [15:0] d);
        begin
            addr = a;
            temp = d;
        end
    endtask

    task stimulusr(input [2:0] ad);
        begin
            addr = ad;
        end
    endtask

    initial 
        begin
            initialize;
            #10;
            write_t;
            
            for (i = 0; i < 8; i = i + 1)
                begin
                    stimulusw(i, {$random} % 65536);
                    #10;
                end
            
            read_t;
            
            for (i = 0; i < 8; i = i + 1)
                begin
                    stimulusr(i);
                    #10;
                end
            
            #1000;
            $finish;
        end

endmodule
