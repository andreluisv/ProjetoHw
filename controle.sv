module Controle(input logic clk, reset, input logic [5:0] OpCode, funct,
output logic PCWrite, MemCtrl, IRWrite, A_Control, B_Control, RegControl, ALUOutControl, EPCWrite, MDControl, HI_Control, LO_Control,
output logic [1:0] IorD, ALUSrcA, ALUSrcB, ExcpCtrl, ShiftSrc, ShiftAmt, SSControl, LSControl,
output logic [2:0] RegDst, PCSource, ALUControl, ShiftControl,
output logic [3:0] DataSrc,
output logic [6:0] estado);//11 + 8 + 4 + 1 = 24 sinais de controle

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
/*
enum logic [6:0] {
	Fetch1 = 7'd0,
	Espera1Fetch = 7'd1,
	Espera2Fetch = 7'd2,
	Fetch2 = 7'd3,
	Decode1 = 7'd4,
	EsperaDecode = 7'd5,
	Decode2 = 7'd6,
	Instrucao = 7'd7,
	AddSubAnd = 7'd8,
	Fetch1x = 7'd9,//empty
	Fetcxh1x = 7'd10,
	Fetchx1 = 7'd11,
	Fetcxxh1 = 7'd12,
	Fetcxxxh1 = 7'd13,
	Fxetch1 = 7'd14,
	xFetch1 = 7'd15,
	Fetch1 = 7'd16,
	Fextxxxch1 = 7'd17,
	Fexxtxxch1 = 7'd18,
	xxFetcxxh1 = 7'd19,
	xFetch1x = 7'd20
} estado;
*/
parameter Fetch1 = 7'd0;
parameter Espera1Fetch = 7'd1;
parameter Espera2Fetch = 7'd2;
parameter Fetch2 = 7'd3;
parameter Decode1 = 7'd4;
parameter EsperaDecode = 7'd5;
parameter Decode2 = 7'd6;
parameter Instrucao = 7'd7;
parameter Add2 = 7'd8;
parameter AddSubAnd = 7'd11;
//parameter AddSubAnd2 = 7'd12;

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
end

always @(posedge clk) begin
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
							ALUOutControl = 1'b0;//mudar
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
							ALUOutControl = 1'b0;//mudar
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
							estado = AddSubAnd;
						end
						AND: begin
							PCWrite = 1'b0;
							MemCtrl = 1'b0;
							IRWrite = 1'b0;
							A_Control = 1'b0;
							B_Control = 1'b0;
							RegControl = 1'b0;
							ALUOutControl = 1'b0;//mudar
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
							estado = AddSubAnd;
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
			ALUOutControl = 1'b1;
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
			estado = 7'd11;//AddSubAnd
		end
		7'd11: begin//AddSubAnd
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
			estado = 7'd12;//AddSubAnd2
		end
		7'd12: begin//AddSubAnd2
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

endmodule: Controle