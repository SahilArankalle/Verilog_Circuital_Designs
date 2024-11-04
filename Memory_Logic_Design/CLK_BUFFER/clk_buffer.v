module clk_buffer(mclk, bclk);

    input mclk;
    output bclk;

    buf buff(bclk, mclk);

endmodule
