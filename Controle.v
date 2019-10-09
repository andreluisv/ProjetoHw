module Controle(input wire clk, reset, input wire [5:0] OpCode, funct,
output reg PCWrite, MemCtrl, IRWrite, SEControl, A_Control, B_Control, RegControl, ALUOutControl, EPCWrite,
output reg [1:0] IorD, ALUSrcA, ALUSrcB,
output reg [2:0] RegDst, PCSource, ALUControl,
output reg [3:0] DataSrc);

parameter Fetch1 = 4'd0;
parameter Espera1Fetch = 4'd1;
parameter Espera2Fetch = 4'd2;
parameter Fetch2 = 4'd3;
parameter Decode1 = 4'd4;
parameter EsperaDecode = 4'd5;
parameter Decode2 = 4'd6;
parameter Instruction = 4'd7;
parameter AddSubAnd = 4'd8;
reg[3:0] estado;

parameter Add = 6'b100000;
parameter Sub = 6'b100010;
parameter And = 6'b100100;

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
			SEControl = 1'b0;
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
			SEControl = 1'b0;
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
			SEControl = 1'b0;
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
			SEControl = 1'b0;
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
			SEControl = 1'b1;
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
			SEControl = 1'b1;
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
			SEControl = 1'b1;
			A_Control = 1'b1;
			B_Control = 1'b1;
			ALUOutControl = 1'b1;
			RegDst = 3'b000;
			DataSrc = 4'b0000;
			estado = Instruction;
		end
		Instruction: begin
			case(OpCode)
				6'b0: begin //aritmeticos
					case(funct)
						Add: begin
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
							SEControl = 1'b0;
							A_Control = 1'b0;
							B_Control = 1'b0;
							ALUOutControl = 1'b1;
							RegDst = 3'b000;
							DataSrc = 4'b0000;
							estado = AddSubAnd;
						end
						Sub: begin
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
							SEControl = 1'b0;
							A_Control = 1'b0;
							B_Control = 1'b0;
							ALUOutControl = 1'b1;
							RegDst = 3'b000;
							DataSrc = 4'b0000;
							estado = AddSubAnd;
						end
						And: begin
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
							SEControl = 1'b0;
							A_Control = 1'b0;
							B_Control = 1'b0;
							ALUOutControl = 1'b1;
							RegDst = 3'b000;
							DataSrc = 4'b0000;
							estado = AddSubAnd;
						end
					endcase
				end
			endcase
		end
		AddSubAnd: begin
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
			SEControl = 1'b0;
			A_Control = 1'b0;
			B_Control = 1'b0;
			ALUOutControl = 1'b0;
			RegDst = 3'b001;
			DataSrc = 4'b0000;
			estado = Fetch1;
		end
	endcase
end

endmodule