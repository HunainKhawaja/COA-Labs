 module program_counter3 (
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

 module instruction_memory3 (
    input [3:0] addr,
    output reg [7:0] instruction
  );

 reg [7:0] memory [0:15];
  integer i;

  initial begin
    for (i = 0; i < 16; i = i + 1)
      memory[i] = 8'h00;

   memory[0] = 8'h11;
   memory[4] = 8'h22;
   memory[8] = 8'h33;
   memory[12] = 8'h44;
 end

 always @(*) begin
    instruction = memory[addr];
 end

 endmodule

 module tb_task3;

 reg clk;
 reg reset;
 wire [31:0] pc_out;
 wire [3:0] im_addr;
 wire [7:0] instruction;

 program_counter3 pc (
     .clk(clk),
     .reset(reset),
    .pc_out(pc_out)
  );

       i     i   dd          t[3 0]
 instruction_memory3 im (
    .addr(im_addr),
    .instruction(instruction)
  );

 always #5 clk = ~clk;

  initial begin
    clk = 0;
    reset = 1;

   #10 reset = 0;
   #50 reset = 1;
   #10 reset = 0;
 end

 endmodule
