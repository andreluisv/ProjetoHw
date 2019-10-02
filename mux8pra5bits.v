module mux8pra5bits (input logic [2:0] controlador, input logic [4:0] input0, input1, input2, input3, input4, input5, input6, input7, output logic [4:0] outputMux);
always_comb begin
	case(controlador)
	3'b000:begin
		outputMux <= input0;
		end
	3'b001:begin
		outputMux <= input1;
		end
	3'b010:begin
		outputMux <= input2;
		end
	3'b011:begin
		outputMux <= input3;
		end
	3'b100:begin
		outputMux <= input4;
		end
	3'b101:begin
		outputMux <= input5;
		end
	3'b110:begin
		outputMux <= input6;
		end
	3'b111:begin
		outputMux <= input7;
		end
	endcase
endmodule: mux8pra5bits