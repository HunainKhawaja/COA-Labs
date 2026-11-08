 module alu_1bit_slice (input A, input B, input carry_in, input b_inv,
                input Less, input [1:0] select,
               output Result, output carry_out, output sum);

    wire B_new;
    wire w1, w2, w3;
    wire and_result, or_result;
    wire n0, n1;
    wire s_and, s_or, s_add, s_slt;
    wire y0, y1, y2, y3;


    xor (B_new, B, b_inv);
    xor (w1, A, B_new);
    xor (sum, w1, carry_in);

   and (w2, A, B_new);
   and (w3, w1, carry_in);
    or (carry_out, w2, w3);


   and (and_result, A, B);
    or (or_result, A, B);


    not (n0, select[0]);
    not (n1, select[1]);

   and (s_and, n1, n0);
   and (s_or, n1, select[0]);
   and (s_add, select[1], n0);
   and (s_slt, select[1], select[0]);


   and (y0, and_result, s_and);
   and (y1, or_result, s_or);
   and (y2, sum, s_add);
   and (y3, Less, s_slt);
    or (Result, y0, y1, y2, y3);

 endmodule


 module alu_4bit (input [3:0] A, input [3:0] B,
            input [1:0] select, input b_inv,
           output [3:0] Result,
           output CF, output SF, output ZF, output OF);

    wire [4:0] carry;
    wire [3:0] sum;
    wire sub, slt, arithmetic, invert_B;
    wire n_select0, overflow, signed_less;
    wire n_carry, add_carry, sub_borrow, n_invert;


    not (n_select0, select[0]);
   and (arithmetic, select[1], n_select0);
  and (slt, select[1], select[0]);
  and (sub, arithmetic, b_inv);
  or (invert_B, sub, slt);

  buf (carry[0], invert_B);


  xor (overflow, carry[3], carry[4]);
  xor (signed_less, sum[3], overflow);


   alu_1bit_slice ALU0 (A[0], B[0], carry[0], invert_B,
                signed_less, select, Result[0], carry[1], sum[0]);

   alu_1bit_slice ALU1 (A[1], B[1], carry[1], invert_B,
                1'b0, select, Result[1], carry[2], sum[1]);

   alu_1bit_slice ALU2 (A[2], B[2], carry[2], invert_B,
                1'b0, select, Result[2], carry[3], sum[2]);

   alu_1bit_slice ALU3 (A[3], B[3], carry[3], invert_B,
                1'b0, select, Result[3], carry[4], sum[3]);


  not (n_carry, carry[4]);
  not (n_invert, invert_B);
  and (add_carry, arithmetic, n_invert, carry[4]);
  and (sub_borrow, arithmetic, invert_B, n_carry);
  or (CF, add_carry, sub_borrow);

  and (SF, slt, signed_less);
  nor (ZF, Result[0], Result[1], Result[2], Result[3]);
  and (OF, arithmetic, overflow);

endmodule


module tb_alu_4bit;

  reg [3:0] A;
  reg [3:0] B;
  reg [1:0] select;
  reg b_inv;

  wire [3:0] Result;
  wire CF;
  wire SF;
  wire ZF;
  wire OF;

  alu_4bit uut (A, B, select, b_inv, Result, CF, SF, ZF, OF);

   initial begin

     select = 2'b00; b_inv = 1'b0; A = 4'b1100; B = 4'b1010;
     #20;


     select = 2'b01; b_inv = 1'b0; A = 4'b1100; B = 4'b1010;
     #20;
     select = 2'b10; b_inv = 1'b0; A = 4'd5; B = 4'd3;
     #20;

     select = 2'b10; b_inv = 1'b0; A = 4'd15; B = 4'd1;
     #20;

     select = 2'b10; b_inv = 1'b0; A = 4'd7; B = 4'd1;
     #20;


     select = 2'b10; b_inv = 1'b1; A = 4'd9; B = 4'd4;
     #20;

     select = 2'b10; b_inv = 1'b1; A = 4'd5; B = 4'd5;
     #20;

     select = 2'b10; b_inv = 1'b1; A = 4'd2; B = 4'd5;
     #20;


     select = 2'b11; b_inv = 1'b0; A = 4'd3; B = 4'd5;
     #20;

     select = 2'b11; b_inv = 1'b0; A = 4'd7; B = 4'd2;
     #20;

     select = 2'b11; b_inv = 1'b0; A = 4'b1110; B = 4'b0011;
     #20;

     select = 2'b11; b_inv = 1'b0; A = 4'b0111; B = 4'b1000;
     #20;
  end

endmodule
