 module program_counter2 (
    input clk,
    input reset,
    output reg [7:0] pc_out
  );

 always @(posedge clk or posedge reset) begin
     if (reset)
      pc_out <= 8'b00000000;
    else
      pc_out <= pc_out + 1;
 end

 endmodule

 module instruction_memory2 (
    input [7:0] addr,
    output reg [7:0] instruction
  );

 reg [7:0] memory [0:15];
  integer i;

  initial begin
   for (i = 0; i < 16; i = i + 1)
    memory[i] = i + 1;
end

always @(*) begin
   if (addr < 16)
     instruction = memory[addr[3:0]];
   else
     instruction = 8'b00000000;
end

endmodule

module tb_task2;

reg clk;
reg reset;
wire [7:0] pc_out;
wire [7:0] instruction;

program_counter2 pc (
   .clk(clk),
   .reset(reset),
  .pc_out(pc_out)
);

instruction_memory2 im (
   .addr(pc_out),
   .instruction(instruction)
);

always #5 clk = ~clk;

initial begin
  clk = 0;
   reset = 1;

  #10 reset = 0;
end

endmodule
