

module principal (clk, saida, reset, pro);
  input wire clk, reset;
  output reg [31:0] saida, pro;
  wire regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite;
  wire [1:0] aluop;
  wire [3:0] comando;
  wire [5:0] funct;
  wire [31:0] valor1, valor2, imediato;
  wire [31:0] instrucao;
  reg [31:0] pc;
  wire [31:0] saida_alu, valorsalvar, proximopc;
  reg [5:0] operacao;
  reg [4:0] rt, rd, rs;
  reg [15:0] resto;

  reg [31:0] oi = 32'b00000000000000000000000000000000;
  reg co, id, alu, mem, wb, ifd, ic;
  reg [3:0] cont = 4'b0000;


leitor_instrucao f (oi, ifd, instrucao);
controlador c (co , operacao, regdst, branch, memread, memtoreg, memwrite, alusrc, regwrite, aluop);
banco_registradores b(id, regdst, rt, rd, rs, regwrite, resto, valorsalvar, valor1, valor2, imediato, funct);
alucontrol ac(ic, aluop, funct, comando);
ALU a(alu, alusrc, comando, imediato, valor1, valor2, saida_alu, zero);
calculopc cp(co, pc, imediato, branch, zero, proximopc);
memoria m(mem, memwrite, memread, memtoreg, saida_alu, valor2, valorsalvar);

always @ ( posedge clk ) begin
  if (reset) begin
    saida = 32'b00000000000000000000000000000000;
    cont = 4'b0000;
    oi = 32'b00000000000000000000000000000000;
    pro = oi;
  end else begin
    case (cont)
      4'b0000:begin
        ifd = 1;
        co = 0;
        id = 0;
        alu = 0;
        mem = 0;
        ic = 0;
        cont = cont + 4'b0001;
      end
      4'b0001:begin
        operacao = instrucao[31:26];
        rt = instrucao[25:21];
        rd = instrucao[20:16];
        rs = instrucao[15:11];
        resto = instrucao[15:0];
        ifd = 0;
        co = 0;
        id = 0;
        alu = 0;
        mem = 0;
        ic = 0;
        cont = cont + 4'b0001;
      end
      4'b0010:begin
        ifd = 0;
        co = 1;
        id = 0;
        alu = 0;
        mem = 0;
        ic = 0;
        cont = cont + 4'b0001;
      end
      4'b0011:begin
        ifd = 0;
        co = 0;
        id = 1;
        alu = 0;
        mem = 0;
        ic = 0;
        pc = proximopc;
        cont = cont + 4'b0001;
      end
      4'b0100:begin
        ifd = 0;
        co = 0;
        id = 0;
        alu = 0;
        mem = 0;
        ic = 1;
        cont = cont + 4'b0001;
      end
      4'b0101:begin
        ifd = 0;
        co = 0;
        id = 0;
        alu = 1;
        mem = 0;
        ic = 0;
        cont = cont + 4'b0001;
      end
      4'b0110:begin
        ifd = 0;
        co = 0;
        id = 0;
        alu = 0;
        mem = 1;
        ic = 0;
        cont = cont + 4'b0001;
      end
      4'b0111:begin
        ifd = 0;
        co = 0;
        id = 1;
        alu = 0;
        mem = 0;
        ic = 0;
        cont = cont + 4'b0001;
      end
      4'b1000:begin
        saida = saida_alu;
        cont = 4'b0000;
        oi = oi + 32'b00000000000000000000000000000001;
        pro = oi;
      end
    endcase
  end
end
endmodule // principal
