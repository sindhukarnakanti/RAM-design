# RAM-DESIGN

*COMPANY*: CODTECH IT SOLUTIONS

*NAME*: KARNAKANTI SINDHU

*INTER ID*: CTIS7239

*DOMAIN*: VLSI

*DURATION*: 4 WEEKS

*MENTOR*: NEELA SANTHOSH KUMAR  

# RAM Design using Verilog

This project implements a Synchronous Random Access Memory (RAM) using Verilog HDL.
The design supports both read and write operations, verified using a testbench and simulation waveform
# RAM
RAM (Random Access Memory) is a type of memory used to:
- Store data temporarily
- Access any memory location using an address
- Perform read and write operations

 # Synchronous RAM
A synchronous RAM operates based on a clock signal.
- All operations occur at the rising edge of the clock
- Ensures stable and controlled data transfer
- Used in real hardware systems
  
# RAM Design Details

Specifications:
- Memory Size: 8 locations
- Data Width: 8 bits
- Address Width: 3 bits
- 
Inputs and Outputs
Signal| Type| Description
"clk"| Input| Clock signal
"we"| Input| Write Enable (1 = Write, 0 = Read)
"addr"| Input| Address (0–7)
"din"| Input| Data input
"dout"| Output| Data output


# Verilog Code (Design)

module ram (
    input clk,
    input we,
    input [2:0] addr,
    input [7:0] din,
    output reg [7:0] dout
);

    reg [7:0] mem [0:7];

    always @(posedge clk) begin
        if (we)
            mem[addr] <= din;   // Write operation
        else
            dout <= mem[addr];  // Read operation
    end

endmodule


# Code Explanation

- "mem[0:7]" → 8 memory locations
- "posedge clk" → operations occur at clock edge
- "we = 1" → write data into memory
- "we = 0" → read data from memory

# Testbench Code

module ram_tb();
reg clk;
reg we;
reg [2:0] addr;
reg [7:0] din;
wire [7:0] dout;

    ram uut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;

        // Write operations
        we = 1; addr = 3'b000; din = 8'hAA; #10;
        addr = 3'b001; din = 8'hBB; #10;

        // Read operations
        we = 0; addr = 3'b000; #10;
        addr = 3'b001; #10;

        $finish;
    end

endmodule


#  Testbench Explanation

- Generates clock signal
- Applies write inputs
- Then applies read inputs
- Verifies if output matches expected values


# Operation Flow

# Write Operation
- "we = 1"
- Data is stored in memory at "addr"
Example:
mem[0] = AA
mem[1] = BB

# Read Operation
- "we = 0"
- Data is retrieved from memory
Example:
dout = AA
dout = BB

# Waveform Explanation
Expected Behavior:
Time   clk   we   addr   din   dout
------------------------------------
0      0     1    000    AA    X
5      ↑     1    000    AA    X
10     0     1    001    BB    X
15     ↑     1    001    BB    X
20     0     0    000    BB    X
25     ↑     0    000    BB    AA
30     0     0    001    BB    AA
35     ↑     0    001    BB    BB

# Tools Used
- XILINX VIVADO
- VS Code
- Git & GitHub


 <img width="2674" height="1586" alt="Image" src="https://github.com/user-attachments/assets/763f89bc-f60b-4fb6-8568-88c3ab61bee7" />





