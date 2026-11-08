module register_file_32x32(
  output [31:0] rdata1, rdata2,
  input [31:0] wdata,
  input [4:0] rs1, rs2, rd,
  input we, clk, rst
);

reg [31:0] registers [0:31];

always @(posedge clk) begin
   if (rst) begin
     registers[0] <= 32'b00000000000000000000000000000000;
     registers[1] <= 32'b00000000000000000000000000000000;
     registers[2] <= 32'b00000000000000000000000000000000;
     registers[3] <= 32'b00000000000000000000000000000000;
     registers[4] <= 32'b00000000000000000000000000000000;
     registers[5] <= 32'b00000000000000000000000000000000;
     registers[6] <= 32'b00000000000000000000000000000000;
     registers[7] <= 32'b00000000000000000000000000000000;
     registers[8] <= 32'b00000000000000000000000000000000;
     registers[9] <= 32'b00000000000000000000000000000000;
     registers[10] <= 32'b00000000000000000000000000000000;
     registers[11] <= 32'b00000000000000000000000000000000;
     registers[12] <= 32'b00000000000000000000000000000000;
     registers[13] <= 32'b00000000000000000000000000000000;
     registers[14] <= 32'b00000000000000000000000000000000;
     registers[15] <= 32'b00000000000000000000000000000000;
     registers[16] <= 32'b00000000000000000000000000000000;
     registers[17] <= 32'b00000000000000000000000000000000;
     registers[18] <= 32'b00000000000000000000000000000000;
     registers[19] <= 32'b00000000000000000000000000000000;
     registers[20] <= 32'b00000000000000000000000000000000;
     registers[21] <= 32'b00000000000000000000000000000000;
     registers[22] <= 32'b00000000000000000000000000000000;
     registers[23] <= 32'b00000000000000000000000000000000;
     registers[24] <= 32'b00000000000000000000000000000000;
     registers[25] <= 32'b00000000000000000000000000000000;
     registers[26] <= 32'b00000000000000000000000000000000;
     registers[27] <= 32'b00000000000000000000000000000000;
     registers[28] <= 32'b00000000000000000000000000000000;
     registers[29] <= 32'b00000000000000000000000000000000;
     registers[30] <= 32'b00000000000000000000000000000000;
     registers[31] <= 32'b00000000000000000000000000000000;
  end
   else if (we && rd != 5'b00000) begin
     registers[rd] <= wdata;
  end
end

assign rdata1 = registers[rs1];
assign rdata2 = registers[rs2];

endmodule


// TESTBENCH
module tb_task3;

reg clk, rst, we;
reg [4:0] rs1, rs2, rd;
reg [31:0] wdata;

wire [31:0] rdata1, rdata2;

register_file_32x32 reg_file(
   .rdata1(rdata1),
   .rdata2(rdata2),
  .wdata(wdata),
   .rs1(rs1),
   .rs2(rs2),
   .rd(rd),
  .we(we),
   .clk(clk),
   .rst(rst)
);

initial begin
  clk = 0;
  forever #5 clk = ~clk;
end

initial begin

   rst = 1;
  we = 0;
  rs1 = 5'b00000;
  rs2 = 5'b00000;
  rd = 5'b00000;
  wdata = 32'b00000000000000000000000000000000;

  #12 rst = 0;

    // Write 6 in register 1
  #1;
  we = 1;
  rd = 5'b00001;
  wdata = 32'b00000000000000000000000000000110;

    // Write 3 in register 2
  #10;
  rd = 5'b00010;
  wdata = 32'b00000000000000000000000000000011;

    // Write 13 in register 3
  #10;
  rd = 5'b00011;
  wdata = 32'b00000000000000000000000000001101;

    // Read register 1 and register 2
  #10;
  we = 0;
  rs1 = 5'b00001;
  rs2 = 5'b00010;

    // Read register 3 and register 1
  #10;
  rs1 = 5'b00011;
  rs2 = 5'b00001;
  #10;
  we = 1;
  rd = 5'b00000;
  wdata = 32'b00000000000000000000000001100011;

  #10;
  we = 0;
  rs1 = 5'b00000;
  rs2 = 5'b00011;

  #10;
  rs1 = 5'b00010;
  rs2 = 5'b00011;

  #10;
   rst = 1;

  #10;
   rst = 0;

end

endmodule
