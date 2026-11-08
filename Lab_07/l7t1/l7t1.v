 module alu_1bit (input A, input B, input carry_in, input b_inv,
            input [1:0] select,
           output Result, output carry_out);

    wire B_new;
    wire w1, w2, w3;
    wire and_result, or_result, sum_result;
    wire n0, n1;
    wire s_and, s_or, s_add;
    wire y0, y1, y2;

    xor (B_new, B, b_inv);

    xor (w1, A, B_new);
    xor (sum_result, w1, carry_in);

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

   and (y0, and_result, s_and);
   and (y1, or_result, s_or);
   and (y2, sum_result, s_add);
    or (Result, y0, y1, y2);

 endmodule


 module tb_alu_1bit;

    reg A;
    reg B;
    reg carry_in;
    reg b_inv;
    reg [1:0] select;

    wire Result;
    wire carry_out;

    alu_1bit uut (A, B, carry_in, b_inv, select, Result, carry_out);

     initial begin

       select = 2'b00; A = 1'b0; B = 1'b1; carry_in = 1'b0; b_inv = 1'b0;
      #20;

       select = 2'b00; A = 1'b1; B = 1'b1; carry_in = 1'b0; b_inv = 1'b0;
     #20;

     select = 2'b01; A = 1'b0; B = 1'b1; carry_in = 1'b0; b_inv = 1'b0;
     #20;

     select = 2'b01; A = 1'b0; B = 1'b0; carry_in = 1'b0; b_inv = 1'b0;
     #20;

     select = 2'b10; A = 1'b0; B = 1'b1; carry_in = 1'b0; b_inv = 1'b0;
     #20;

     select = 2'b10; A = 1'b1; B = 1'b1; carry_in = 1'b0; b_inv = 1'b0;
     #20;

     select = 2'b10; A = 1'b1; B = 1'b0; carry_in = 1'b1; b_inv = 1'b0;
     #20;

     select = 2'b10; A = 1'b1; B = 1'b0; carry_in = 1'b1; b_inv = 1'b1;
     #20;

     select = 2'b10; A = 1'b0; B = 1'b1; carry_in = 1'b1; b_inv = 1'b1;
     #20;

     select = 2'b10; A = 1'b1; B = 1'b1; carry_in = 1'b1; b_inv = 1'b1;
     #20;

  end

endmodule
