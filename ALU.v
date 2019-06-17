//Nomes:
//Pablo Miranda Batista 3482
//Roniel Nunes Barbosa 3464
//Samuel Aparecido D. Rodrigues 3476

module ALU (clk, alusrc, comando, imediato, valor1, valor2, aluresult, zero);
 input wire clk, alusrc;
 input wire [31:0] valor1, valor2, imediato;
 input wire [3:0] comando;

 output reg [31:0] aluresult;
 output reg zero;

always @ ( posedge clk ) begin
  if(alusrc) begin
    case(comando)
        4'b0000:begin
                  aluresult = valor1 & imediato;
                  zero = 0;
                end
        4'b0001:begin
                  aluresult = valor1 | imediato;
                  zero = 0;
              end
        4'b0010:begin
                  aluresult = valor1 + imediato;
                  zero = 0;
              end
        4'b0110:begin
                  aluresult = valor1 - imediato;
                  if(aluresult == 32'b00000000000000000000000000000000)begin
                    zero = 1;
                  end else begin
                    zero = 0;
                  end
              end
        4'b0111:begin
                  aluresult = valor1 * imediato;
                  zero =  0;
              end
        4'b1100:begin
                  aluresult = ~(valor1 | imediato);
              end
      endcase
  end else begin
      case(comando)
          4'b0000:begin
                    aluresult = valor1 & valor2;
                    zero = 0;
                  end
          4'b0001:begin
                    aluresult = valor1 | valor2;
                    zero = 0;
                end
          4'b0010:begin
                    aluresult = valor1 + valor2;
                    zero = 0;
                end
          4'b0110:begin
                    aluresult = valor1 - valor2;
                    if(aluresult == 32'b00000000000000000000000000000000)begin
                      zero = 1;
                    end else begin
                      zero = 0;
                    end
                end
          4'b0111:begin
                    aluresult = valor1 * valor2;
                    zero =  0;
                end
          4'b1100:begin
                    aluresult = ~(valor1 | valor2);
                end
        endcase
    end
  end
endmodule
