//Nomes:
//Pablo Miranda Batista 3482
//Roniel Nunes Barbosa 3464
//Samuel Aparecido D. Rodrigues 3476

module controlador (clk, entrada, regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite, aluop);
  input wire clk;
  input wire [5:0] entrada;
  output reg regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite;
  output reg [1:0] aluop;

  always @ ( posedge clk ) begin
    case (entrada)
      6'b000000:begin //tipo R
                  regdst = 1;
                  alusrc = 0;
                  memtoreg = 0;
                  regwrite = 1;
                  memread = 0;
                  memwrite = 0;
                  branch = 0;
                  aluop = 2'b10;
                end
      6'b100011:begin // lw
                  regdst = 0;
                  alusrc = 1;
                  memtoreg = 1;
                  regwrite = 1;
                  memread = 1;
                  memwrite = 0;
                  branch = 0;
                  aluop = 2'b00;
                end
      6'b101011:begin //sw
                  alusrc = 1;
                  regwrite = 0;
                  memread = 0;
                  memwrite = 1;
                  branch = 0;
                  aluop = 2'b00;
                end
      6'b000100:begin //beq
                  alusrc = 0;
                  regwrite = 0;
                  memread = 0;
                  memwrite = 0;
                  branch = 1;
                  aluop = 2'b01;
                end
      default: ;
    endcase
  end

endmodule //
