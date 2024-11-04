module fifo_tb ();

    reg clk, rst, we, re;
    reg [7:0] din;
    wire [7:0] dout;
    wire full, empty;
	 
    fifo dut (
        .clk(clk),
        .rst(rst),
        .din(din),
        .we(we),
        .re(re),
        .dout(dout),
        .full(full),
        .empty(empty)
    );
	 
	 integer i,j;
	
	
    parameter CYCLE = 10;
    always #(CYCLE / 2) clk = ~clk;
	 
    initial 
	 begin
        clk = 0;
        rst = 1;
        we = 0;
        re = 0;
        din = 8'd0;
        #20 rst = 0; 
    end
	 
    task reset_t;
        begin
            rst = 1;
            #20;
            rst = 0;
        end
    endtask
	 
	 
    task write_data(input [7:0] data);
        begin
            @(negedge clk);
            if (!full) 
				begin
                we = 1;
                din = data;
            end
            @(negedge clk);
            we = 0;
        end
    endtask
	 
    task read_data();
        begin
            @(negedge clk);
            if (!empty) 
				begin
                re = 1;
            end
            @(negedge clk);
            re = 0;
        end
    endtask
	 
	initial 
	begin
	
	reset_t;
	
	for(i = 0; i < 16; i = i + 1)
	begin
	write_data(i);
	end
	
	write_data(8'hFF);
	
	for(j = 0; j < 16; j = j + 1)
	begin
	read_data();
	end
	
	#100 $finish;
	
	end
endmodule
	
	 