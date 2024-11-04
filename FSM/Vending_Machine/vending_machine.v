module vending_machine(
    input clk,
    input rst,
    input I,
    input J,
    output reg X,
    output reg Y
);

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    
    reg [1:0] state, next_state;

    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end

    always @(*) begin
        X = 0;
        Y = 0;

        case (state)
            S0: begin
                if ({I, J} == 2'b10)
                    next_state = S1;
                else if ({I, J} == 2'b11)
                    next_state = S2;
                else
                    next_state = S0;
            end
            
            S1: begin
                if ({I, J} == 2'b10)
                    next_state = S2;
                else if ({I, J} == 2'b11) begin
                    next_state = S0;
                    X = 1;
                end else
                    next_state = S1;
            end
            
            S2: begin
                if ({I, J} == 2'b10) begin
                    next_state = S0;
                    X = 1;
                end else if ({I, J} == 2'b11) begin
                    next_state = S0;
                    X = 1;
                    Y = 1;
                end else
                    next_state = S2;
            end

            default: next_state = S0;
        endcase
    end

endmodule
