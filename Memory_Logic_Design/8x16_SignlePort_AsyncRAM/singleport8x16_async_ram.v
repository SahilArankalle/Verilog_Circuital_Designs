module singleport8x16_async_ram(addr, we, re, data);

    input [2:0] addr;
    input we, re;
    inout [15:0] data;
    reg [15:0] mem [7:0];

    always @ (*)
        begin
            if (we && ~re)
                mem[addr] = data;
        end

    assign data = (re && !we) ? mem[addr] : 16'bz;

endmodule
