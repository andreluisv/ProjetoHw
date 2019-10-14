module Controle(input logic clk, input logic [5:0] OpCode, funct,
output logic PCWrite, MemCtrl, IRWrite, A_Control, B_Control, RegControl, ALUOutControl, EPCWrite, MDControl, HI_Control, LO_Control,
output logic [1:0] IorD, ALUSrcA, ALUSrcB, ExcpCtrl, ShiftSrc, ShiftAmt, SSControl, LSControl,
output logic [2:0] RegDst, PCSource, ALUControl, ShiftControl,
output logic [3:0] DataSrc,
output logic [6:0] estado,
output logic reset);//11 + 8 + 4 + 1 = 24 sinais de controle

/*
PCWrite = 1'b0;
MemCtrl = 1'b0;
IRWrite = 1'b0;
A_Control = 1'b0;
B_Control = 1'b0;
RegControl = 1'b0;
ALUOutControl = 1'b0;
EPCWrite = 1'b0;
MDControl = 1'b0;
HI_Control = 1'b0;
LO_Control = 1'b0;
IorD = 2'b00;
ALUSrcA = 2'b00;
ALUSrcB = 2'b00;
ExcpCtrl = 2'b00;
ShiftSrc = 2'b00;
ShiftAmt = 2'b00;
SSControl = 2'b00;
LSControl = 2'b00;
RegDst = 3'b000;
PCSource = 3'b000;
ALUControl = 3'b000;
ShiftControl = 3'b000;
DataSrc = 4'b0000;
estado = 7'b0000000;
*/

//Estados
parameter Fetch1 = 7'd0;
parameter Espera1Fetch = 7'd1;
parameter Espera2Fetch = 7'd2;
parameter Fetch2 = 7'd3;
parameter Decode1 = 7'd4;
parameter EsperaDecode = 7'd5;
parameter Decode2 = 7'd6;
parameter Instrucao = 7'd7;
parameter Add2 = 7'd8;
parameter Sub2 = 7'd9;
parameter And2 = 7'd10;
parameter AddSubAnd = 7'd11;
parameter AddSubAnd2 = 7'd12;

//Func do Tipo R
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter AND = 6'b100100;
//Opcodes
parameter ARIT = 6'b000000;
parameter ADDI = 6'b001000;
parameter ADDIU = 6'b001001;

initial begin
	estado = Fetch1;
	reset = 1'b1;
end

always @(posedge clk) begin
	if (reset) begin
		reset = 1'b0;
	end
	else begin
		case(estado)
			Fetch1: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b1;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b01;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b000;
				PCSource = 3'b000;
				ALUControl = 3'b001;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = Espera1Fetch;
			end
			Espera1Fetch: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b1;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b01;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b000;
				PCSource = 3'b000;
				ALUControl = 3'b001;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = Espera2Fetch;
			end
			Espera2Fetch: begin
				PCWrite = 1'b1;
				MemCtrl = 1'b0;
				IRWrite = 1'b1;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b01;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b000;
				PCSource = 3'b000;
				ALUControl = 3'b000;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = Fetch2;
			end
			Fetch2: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b1;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b1;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b01;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b000;
				PCSource = 3'b000;
				ALUControl = 3'b001;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = Decode1;
			end
			Decode1: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b11;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b000;
				PCSource = 3'b000;
				ALUControl = 3'b001;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = EsperaDecode;
			end
			EsperaDecode: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b1;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b11;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b000;
				PCSource = 3'b000;
				ALUControl = 3'b001;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = Decode2;
			end
			Decode2: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b1;
				B_Control = 1'b1;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b01;
				ALUSrcB = 2'b00;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b000;
				PCSource = 3'b000;
				ALUControl = 3'b000;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = Instrucao;
			end
			Instrucao: begin
				case(OpCode)
					ARIT: begin //aritmeticos
						case(funct)
							ADD: begin
								PCWrite = 1'b0;
								MemCtrl = 1'b0;
								IRWrite = 1'b0;
								A_Control = 1'b0;
								B_Control = 1'b0;
								RegControl = 1'b0;
								ALUOutControl = 1'b1;//mudar
								EPCWrite = 1'b0;
								MDControl = 1'b0;
								HI_Control = 1'b0;
								LO_Control = 1'b0;
								IorD = 2'b00;
								ALUSrcA = 2'b01;
								ALUSrcB = 2'b00;
								ExcpCtrl = 2'b00;
								ShiftSrc = 2'b00;
								ShiftAmt = 2'b00;
								SSControl = 2'b00;
								LSControl = 2'b00;
								RegDst = 3'b000;
								PCSource = 3'b000;
								ALUControl = 3'b001;
								ShiftControl = 3'b000;
								DataSrc = 4'b0000;
								estado = Add2;
							end
							SUB: begin
								PCWrite = 1'b0;
								MemCtrl = 1'b0;
								IRWrite = 1'b0;
								A_Control = 1'b0;
								B_Control = 1'b0;
								RegControl = 1'b0;
								ALUOutControl = 1'b1;//mudar
								EPCWrite = 1'b0;
								MDControl = 1'b0;
								HI_Control = 1'b0;
								LO_Control = 1'b0;
								IorD = 2'b00;
								ALUSrcA = 2'b01;
								ALUSrcB = 2'b00;
								ExcpCtrl = 2'b00;
								ShiftSrc = 2'b00;
								ShiftAmt = 2'b00;
								SSControl = 2'b00;
								LSControl = 2'b00;
								RegDst = 3'b000;
								PCSource = 3'b000;
								ALUControl = 3'b010;
								ShiftControl = 3'b000;
								DataSrc = 4'b0000;
								estado = Sub2;
							end
							AND: begin
								PCWrite = 1'b0;
								MemCtrl = 1'b0;
								IRWrite = 1'b0;
								A_Control = 1'b0;
								B_Control = 1'b0;
								RegControl = 1'b0;
								ALUOutControl = 1'b1;//mudar
								EPCWrite = 1'b0;
								MDControl = 1'b0;
								HI_Control = 1'b0;
								LO_Control = 1'b0;
								IorD = 2'b00;
								ALUSrcA = 2'b01;
								ALUSrcB = 2'b00;
								ExcpCtrl = 2'b00;
								ShiftSrc = 2'b00;
								ShiftAmt = 2'b00;
								SSControl = 2'b00;
								LSControl = 2'b00;
								RegDst = 3'b000;
								PCSource = 3'b000;
								ALUControl = 3'b011;
								ShiftControl = 3'b000;
								DataSrc = 4'b0000;
								estado = And2;
							end
						endcase
					end
				endcase
			end
			Add2: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b01;
				ALUSrcB = 2'b00;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b001;
				PCSource = 3'b000;
				ALUControl = 3'b010;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = AddSubAnd;
			end
			Sub2: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b01;
				ALUSrcB = 2'b00;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b001;
				PCSource = 3'b000;
				ALUControl = 3'b011;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = AddSubAnd;
			end
			And2: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b01;
				ALUSrcB = 2'b00;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b001;
				PCSource = 3'b000;
				ALUControl = 3'b001;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = AddSubAnd;
			end
			AddSubAnd: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b0;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b00;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b001;
				PCSource = 3'b000;
				ALUControl = 3'b000;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = AddSubAnd2;
			end
			AddSubAnd2: begin
				PCWrite = 1'b0;
				MemCtrl = 1'b0;
				IRWrite = 1'b0;
				A_Control = 1'b0;
				B_Control = 1'b0;
				RegControl = 1'b1;
				ALUOutControl = 1'b0;
				EPCWrite = 1'b0;
				MDControl = 1'b0;
				HI_Control = 1'b0;
				LO_Control = 1'b0;
				IorD = 2'b00;
				ALUSrcA = 2'b00;
				ALUSrcB = 2'b00;
				ExcpCtrl = 2'b00;
				ShiftSrc = 2'b00;
				ShiftAmt = 2'b00;
				SSControl = 2'b00;
				LSControl = 2'b00;
				RegDst = 3'b001;
				PCSource = 3'b000;
				ALUControl = 3'b000;
				ShiftControl = 3'b000;
				DataSrc = 4'b0000;
				estado = Fetch1;
			end
		endcase
	end
end

endmodule: Controle