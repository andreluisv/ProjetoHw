module SignExtend1to32bits(input wire clk, input wire inputSE, output reg [31:0] outputSE);
	
always @(posedge clk) begin
	if (inputSE == 0) begin
		outputSE = {31'b0, inputSE};
	end
	else begin
		outputSE = {31'b1, inputSE};
	end
end
endmodule