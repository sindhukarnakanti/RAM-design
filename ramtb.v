module ram_tb();
reg clk;
reg we;
reg [2:0] addr;
reg [7:0] din;
wire [7:0] dout;
ram uut (.clk(clk),.we(we),.addr(addr),.din(din),.dout(dout));
always #5 clk = ~clk;
initial begin
        clk = 0;
// Write data
we = 1; addr = 3'b000; din = 8'hAA; #10;
addr = 3'b001; din = 8'hBB; #10;
// Read data
we = 0; addr = 3'b000; #10;
addr = 3'b001; #10;
$finish;
end
endmodule