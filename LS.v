module LS(
input[31:0] EntradaMDR,
input[1:0] LSControl,
output reg[31:0] LSOut
);

always @ (*) begin
	if (LSControl == 2'b00) begin //lb
		LSOut <= {24'b0, EntradaMDR[7:0]};
		end
	if (LSControl == 2'b01) begin //lh
		LSOut <= {16'b0, EntradaMDR[15:0]};
		end
	if (LSControl == 2'b10) begin  //lw
		LSOut <= EntradaMDR;
		end
	if (LSControl == 2'b00) begin  //nada
		LSOut <= 32'b0;
		end
end

endmodule