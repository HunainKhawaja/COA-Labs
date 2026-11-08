 module program_counter4 (
    input clk,
    input reset,
    output reg [31:0] pc_out
  );

 always @(posedge clk or posedge reset) begin
     if (reset)
      pc_out <= 32'h00000000;
    else
      pc_out <= pc_out + 32'd4;
 end

 endmodule

 module instruction_memory4 (
    input [31:0] addr,
    output reg [31:0] instruction
  );

 reg [31:0] memory [0:15];
  integer i;
initial begin
   for (i = 0; i < 16; i = i + 1)
    memory[i] = 32'h00000013;

  memory[0] = 32'h00500093;
  memory[1] = 32'h00300113;
  memory[2] = 32'h002081B3;
  memory[3] = 32'h00302023;
end

always @(*) begin
   if ((addr < 64) && (addr[1:0] == 2'b00))
     instruction = memory[addr[5:2]];
   else
     instruction = 32'h00000000;
end

endmodule

module tb_task4;

reg clk;
reg reset;
wire [31:0] pc_out;
wire [31:0] instruction;

program_counter4 pc (
   .clk(clk),
   .reset(reset),
  .pc_out(pc_out)
);

instruction_memory4 im (
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
