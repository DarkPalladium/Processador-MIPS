//Nomes:
//Pablo Miranda Batista 3482
//Roniel Nunes Barbosa 3464
//Samuel Aparecido D. Rodrigues 3476

module alucontrol (clk, aluop, funct, comando);//entrada(aluop,[5:0] instrucao) e saida([3:0] comando)
  input wire clk;
  input wire [1:0] aluop;
  input wire [5:0] funct;

  output reg [3:0] comando;

  always @ ( posedge clk ) begin
    case (aluop)
      2'b00:begin
        comando = 4'b0010; //lw e sw
      end
      2'b01:begin //beq
        comando = 4'b0110;
      end
      2'b10:begin // tipo r
        case (funct)
          6'b100100:begin//and
          comando = 4'b0000;
          end
          6'b100101:begin//or
          comando = 4'b0001;
          end
          6'b100000:begin//add
          comando = 4'b0010;
          end
          6'b100010:begin//sub
          comando = 4'b0110;
          end
          6'b101010:begin
          comando = 4'b0111;//set on lees than
          end
          6'b000000:begin//nor
          comando = 4'b1100;
          end

        endcase
      end
    endcase

  end
endmodule
