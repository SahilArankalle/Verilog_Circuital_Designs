module fsm_divisible_by_3(
    input clk,
    input reset,
    input data_in,
    output reg output_bit
);

    reg [1:0] state, next_state;
    reg [1:0] remainder;

    parameter  S0 = 2'b00,
               S1 = 2'b01,
               S2 = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            remainder <= 2'b00;
        end else begin
            state <= next_state;
        end
    end

    always @(*) begin
        remainder = ((2 * remainder) + data_in) % 3;
        case (remainder)
            2'b00: begin
                next_state <= S0;
                output_bit <= 1;
            end
            2'b01: begin
                next_state <= S1;
                output_bit <= 0;
            end
            2'b10: begin
                next_state <= S2;
                output_bit <= 0;
            end
            default: begin
                next_state <= S0;
                output_bit <= 1;
            end
        endcase
    end
endmodule
