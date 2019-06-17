module leitor_instrucao (pc, clk, instrucao);

input [31:0] pc;
input wire clk;
output reg [31:0] instrucao;

reg [31:0] Memoria [10:0];

initial begin
    Memoria[0] = 32'b00000000011000010001000000100000;    //add R3, R1, R2    6+1=7
    Memoria[1] = 32'b00000010011100100011000000100010;	 //sub R19, R18, R6   6-3=3
    Memoria[2] = 32'b10101101000100010000000001100100;	 //sw R17  100(R8)    100+5=105
    Memoria[3] = 32'b00000000111010000100100000100101;  //or R7, R8, R9       R9 = R7 | R8
    Memoria[4] = 32'b00000000111010000100100000100100;  //and R7, R8, R9      R9 = R7 & R8
    Memoria[5] = 32'b00010000001000100000000000001010;	// beq R1, r2, 10

end

always @ ( posedge clk ) begin
    instrucao = Memoria[pc];
end

endmodule //leitor_instrucao
