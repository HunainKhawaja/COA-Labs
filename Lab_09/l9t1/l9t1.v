 module decoder_2_to4(
    output reg [3:0] dec_out,
    input [1:0] wr,
    input write_enable
  );

 always @(*) begin
     if (write_enable) begin
      case (wr)
         2'b00: dec_out = 4'b0001;
         2'b01: dec_out = 4'b0010;
         2'b10: dec_out = 4'b0100;
         2'b11: dec_out = 4'b1000;
          default: dec_out = 4'b0000;
      endcase
   end
    else begin
      dec_out = 4'b0000;
   end
 end

 endmodule


 module mux4_1(
    output reg [3:0] out,
    input [3:0] in0, in1, in2, in3,
    input [1:0] sel
  );

 always @(*) begin
     if (sel == 2'b00)
      out = in0;
    else if (sel == 2'b01)
      out = in1;
    else if (sel == 2'b10)
      out = in2;
    else if (sel == 2'b11)
      out = in3;
    else
      out = 4'b0000;
 end

 endmodule


 module register_4bit(
    output reg [3:0] q,
    input [3:0] d,
    input load,
    input clk
  );

 always @(posedge clk) begin
     if (load)
     q <= d;
 end

 endmodule


 module register_file_4x4(
    data_out1, data_out2, data_in,
    wr, write_enable, rd1, rd2, clk
  );

 output [3:0] data_out1, data_out2;

  input [3:0] data_in;
  input [1:0] wr;
  input write_enable;
  input [1:0] rd1, rd2;
  input clk;

 wire [3:0] dec_out;
 wire [3:0] q0, q1, q2, q3;

 decoder_2_to4 decoder(dec_out, wr, write_enable);

  register_4bit R0(q0, data_in, dec_out[0], clk);
  register_4bit R1(q1, data_in, dec_out[1], clk);
  register_4bit R2(q2, data_in, dec_out[2], clk);
  register_4bit R3(q3, data_in, dec_out[3], clk);

 mux4_1 MUX1(data_out1, q0, q1, q2, q3, rd1);
 mux4_1 MUX2(data_out2, q0, q1, q2, q3, rd2);

 endmodule
