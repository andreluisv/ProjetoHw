module Controle(input wire clk, reset, input wire [5:0] OpCode, funct,
output reg PCWrite, MemCtrl, IRWrite, A_Control, B_Control, RegControl, ALUOutControl, EPCWrite,
output reg [1:0] IorD, ALUSrcA, ALUSrcB,
output reg [2:0] RegDst, PCSource, ALUControl,
output reg [3:0] DataSrc, output reg [6:0] estado);

parameter Fetch1 = 7'b0000000;
parameter Espera1Fetch = 7'b0000001;
parameter Espera2Fetch = 7'b0000010;
parameter Fetch2 = 7'b0000011;
parameter Decode1 = 7'b0000100;
parameter EsperaDecode = 7'b0000101;
parameter Decode2 = 7'b0000110;
parameter EsperaDecode2 = 7'd7;
parameter Instruction = 7'd8;
parameter Add2 = 7'd9;//9
parameter Sub2 = 7'd10;//10
parameter And2 = 7'd11;//11
parameter AddSubAnd = 7'd12;//12
parameter AddiAddiu = 7'd13;//13
parameter Addi2 = 7'd14;//14
//Tipo R
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter AND = 6'b100100;
//Tipo I
parameter ADDI = 6'b001000;
parameter ADDIU = 6'b001001;

initial begin
	estado = Fetch1;
end

always @(posedge clk) begin
	case(estado)
		Fetch1: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b1;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b01;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = Espera1Fetch;
		end
		Espera1Fetch: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b1;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b01;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = Espera2Fetch;
		end
		Espera2Fetch: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b1;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b01;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = Fetch2;
		end
		Fetch2: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b1;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b01;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b1;
			EPCWrite = 1'b1;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = Decode1;
		end
		Decode1: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b11;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = EsperaDecode;
		end
		EsperaDecode: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b11;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = Decode2;
		end
		Decode2: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b11;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b1;
			B_Control = 1'b1;
			ALUOutControl = 1'b1;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = 7'd7;
		end
		7'd7: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b00;
			ALUControl = 3'b000;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = 7'd8;
		end
		7'd8: begin
			case(OpCode)
				6'b0: begin //aritmeticos
					case(funct)
						ADD: begin
							IorD = 2'b00;
							MemCtrl = 1'b0;
							IRWrite = 1'b0;
							ALUSrcA = 2'b01;
							ALUSrcB = 2'b00;
							ALUControl = 3'b001;
							PCSource = 3'b000;
							PCWrite = 1'b0;
							EPCWrite = 1'b0;
							RegControl = 1'b0;
							A_Control = 1'b0;
							B_Control = 1'b0;
							ALUOutControl = 1'b0;
							RegDst = 3'b000;
							DataSrc = 4'b0000;
							estado = 7'd9;
						end
						SUB: begin
							IorD = 2'b00;
							MemCtrl = 1'b0;
							IRWrite = 1'b0;
							ALUSrcA = 2'b01;
							ALUSrcB = 2'b00;
							ALUControl = 3'b010;
							PCSource = 3'b000;
							PCWrite = 1'b0;
							EPCWrite = 1'b0;
							RegControl = 1'b0;
							A_Control = 1'b0;
							B_Control = 1'b0;
							ALUOutControl = 1'b0;
							RegDst = 3'b000;
							DataSrc = 4'b0000;
							estado = Sub2;
						end
						AND: begin
							IorD = 2'b00;
							MemCtrl = 1'b0;
							IRWrite = 1'b0;
							ALUSrcA = 2'b01;
							ALUSrcB = 2'b00;
							ALUControl = 3'b011;
							PCSource = 3'b000;
							PCWrite = 1'b0;
							EPCWrite = 1'b0;
							RegControl = 1'b0;
							A_Control = 1'b0;
							B_Control = 1'b0;
							ALUOutControl = 1'b0;
							RegDst = 3'b000;
							DataSrc = 4'b0000;
							estado = And2;
						end
					endcase
				end
				ADDI: begin
					IorD = 2'b00;
					MemCtrl = 1'b0;
					IRWrite = 1'b0;
					ALUSrcA = 2'b01;
					ALUSrcB = 2'b10;
					ALUControl = 3'b001;
					PCSource = 3'b000;
					PCWrite = 1'b0;
					EPCWrite = 1'b0;
					RegControl = 1'b0;
					A_Control = 1'b0;
					B_Control = 1'b0;
					ALUOutControl = 1'b0;
					RegDst = 3'b000;
					DataSrc = 4'b0000;
					estado = 7'b0001110;
				end
				ADDIU: begin
					IorD = 2'b00;
					MemCtrl = 1'b0;
					IRWrite = 1'b0;
					ALUSrcA = 2'b01;
					ALUSrcB = 2'b10;
					ALUControl = 3'b001;
					PCSource = 3'b000;
					PCWrite = 1'b0;
					EPCWrite = 1'b0;
					RegControl = 1'b0;
					A_Control = 1'b0;
					B_Control = 1'b0;
					ALUOutControl = 1'b0;
					RegDst = 3'b000;
					DataSrc = 4'b0000;
					estado = 7'b0001110;
				end
			endcase
		end
		7'd9: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b01;
			ALUSrcB = 2'b00;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b1;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = 7'b0001100;
		end
		Sub2: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b01;
			ALUSrcB = 2'b00;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b1;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = 7'b0001100;
		end
		And2: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b01;
			ALUSrcB = 2'b00;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b1;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = 7'b0001100;
		end
		7'b0001100: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b00;
			ALUControl = 3'b000;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b1;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b001;
			DataSrc = 4'b0000;
			estado = Fetch1;
		end
		7'b0001110: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b01;
			ALUSrcB = 2'b10;
			ALUControl = 3'b001;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b1;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = 7'b0001101;
		end
		7'b0001101: begin
			IorD = 2'b00;
			MemCtrl = 1'b0;
			IRWrite = 1'b0;
			ALUSrcA = 2'b00;
			ALUSrcB = 2'b00;
			ALUControl = 3'b000;
			PCSource = 3'b000;
			PCWrite = 1'b0;
			EPCWrite = 1'b0;
			RegControl = 1'b1;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = Fetch1;
		end
	endcase
end

endmodule