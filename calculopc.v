//Nomes:
//Pablo Miranda Batista 3482
//Roniel Nunes Barbosa 3464
//Samuel Aparecido D. Rodrigues 3476

module calculopc (clk, pc, imediato, branch, zero, proximopc);
  input wire branch, zero, clk;
  input wire [31:0] pc, imediato;
  output reg [31:0] proximopc;

  always @ ( posedge clk ) begin
    if (branch & zero) begin
      proximopc = proximopc + (imediato * 4);
    end else begin
      proximopc =  pc + 32'b00000000000000000000000000000001;
    end
  end

endmodule //calculopc
