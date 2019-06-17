//Nomes:
//Pablo Miranda Batista 3482
//Roniel Nunes Barbosa 3464
//Samuel Aparecido D. Rodrigues 3476

module banco_registradores (clk, regdst, registrador1, registrador2, registrador3, regwrite, restoinstrucao, valorsalvar, valor1, valor2, imediato, funct);
  input wire clk;
  input wire regdst, regwrite;
  input wire [4:0] registrador1, registrador2, registrador3;
  input wire [31:0] valorsalvar;
  input wire [15:0] restoinstrucao;

  output reg [31:0] valor1, valor2, imediato = 32'b00000000000000000000000000000000;
  output reg [5:0] funct;

  reg [31:0] RegistradorMemoria [31:0];   //Banco de Registradores

  initial begin
      RegistradorMemoria[0] = 32'b00000000000000000000000000000000; //0
      RegistradorMemoria[1] = 32'b00000000000000000000000000000001; //1
      RegistradorMemoria[2] = 32'b00000000000000000000000000001000; //8
      RegistradorMemoria[3] = 32'b00000000000000000000000000000110; //6
      RegistradorMemoria[4] = 32'b00000000000000000000000000100111; //39
      RegistradorMemoria[5] = 32'b00000000000000000000000000100000; //32
      RegistradorMemoria[6] = 32'b00000000000000000000000000010000; //16
      RegistradorMemoria[7] = 32'b00000000000000000000000000000111; //7
      RegistradorMemoria[8] = 32'b00000000000000000000000000000101;  //5
      RegistradorMemoria[9] = 32'b00000000000000000000000000100011;  //35
      RegistradorMemoria[10] = 32'b00000000000000000000000000001001; //9
      RegistradorMemoria[11] = 32'b00000000000000000000000000001110; //14
      RegistradorMemoria[12] = 32'b00000000000000000000000000010010; //18
      RegistradorMemoria[13] = 32'b00000000000000000000000000011100; //28
      RegistradorMemoria[14] = 32'b00000000000000000000000000011101; //29
      RegistradorMemoria[15] = 32'b00000000000000000000000000001111;  //15
      RegistradorMemoria[16] = 32'b00000000000000000000000000001011;  //11
      RegistradorMemoria[17] = 32'b00000000000000000000000000010000; //16
      RegistradorMemoria[18] = 32'b00000000000000000000000000000011; //3
      RegistradorMemoria[19] = 32'b00000000000000000000000000000110; //6
      RegistradorMemoria[20] = 32'b00000000000000000000000000011111; //31
      RegistradorMemoria[21] = 32'b00000000000000000000000000010000; //16
      RegistradorMemoria[22] = 32'b00000000000000000000000000010001; //17
      RegistradorMemoria[23] = 32'b00000000000000000000000000010010; //18
      RegistradorMemoria[24] = 32'b00000000000000000000000000000111; //7
      RegistradorMemoria[25] = 32'b00000000000000000000000000010100; //20
      RegistradorMemoria[26] = 32'b00000000000000000000000000010011; //19
      RegistradorMemoria[27] = 32'b00000000000000000000000010001010; //10
      RegistradorMemoria[28] = 32'b00000000000000000000000000001001; //9
      RegistradorMemoria[29] = 32'b00000000000000000000000000100011; //35
      RegistradorMemoria[30] = 32'b00000000000000000000000000001100; //12
      RegistradorMemoria[31] = 32'b00000000000000000000000000000100; //4
  end


  always @ ( posedge clk ) begin
    valor1 = RegistradorMemoria[registrador1];
    valor2 = RegistradorMemoria[registrador2];
    imediato = restoinstrucao;
    funct = restoinstrucao[5:0];
    if (regwrite) begin
      if (regdst) begin
        RegistradorMemoria[registrador3] = valorsalvar;
      end else begin
        RegistradorMemoria[registrador2] = valorsalvar;
      end
    end
  end

endmodule //
