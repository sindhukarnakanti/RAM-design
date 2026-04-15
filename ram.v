module ram (input clk, input we, input [2:0] addr, input [7:0] din, output reg [7:0] dout );
reg [7:0] mem [0:7];   
always @(posedge clk) begin
if (we)
mem[addr] <= din;   
else
dout <= mem[addr];  
end
endmodule
