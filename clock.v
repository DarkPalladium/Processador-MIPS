module clk_div (clk, clk_out);
  input wire clk;
  output reg clk_out = 0;

  reg [31:0] fraclk = 0;

  always @ ( posedge clk ) begin
    fraclk <= fraclk + 1;
    if (fraclk == 50000000) begin
      fraclk <= 0;
      clk_out <= ~clk_out;
    end
  end

endmodule //clk_div
