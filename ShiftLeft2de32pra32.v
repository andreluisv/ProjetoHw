module ShiftLeft2de32pra32(input wire clk, input wire [31:0] inputSL, output reg [31:0] outputSL);
	
always @(posedge clk) begin
	outputSL = inputSL * 4;
end
endmodule