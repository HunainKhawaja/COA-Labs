 module mux2_for_alu (input A, input B, input select, output Y);

    wire n_select;
    wire w1, w2;

    not (n_select, select);
   and (w1, A, n_select);
   and (w2, B, select);
    or (Y, w1, w2);

 endmodule


 module alu_32bit (input [31:0] A, input [31:0] B,
            input [3:0] alu_op,
            output [31:0] Result, output zero);

    wire n0, n1, n2, n3;
    wire s_add, s_sub, s_and, s_or, s_xor;
    wire s_slt, s_sltu, s_sll, s_srl, s_sra;
    wire subtract;

    wire [32:0] carry;
    wire [31:0] B_new;
    wire [31:0] sum;
    wire [31:0] and_result, or_result, xor_result;

    wire overflow, signed_less, unsigned_less;

    wire [31:0] left_stage [0:5];
    wire [31:0] right_stage [0:5];
    wire [31:0] arithmetic_stage [0:5];

    not (n0, alu_op[0]);
    not (n1, alu_op[1]);
    not (n2, alu_op[2]);
    not (n3, alu_op[3]);

   and (s_add, n3, n2, n1, n0);                // 0000
   and (s_sub, n3, n2, n1, alu_op[0]);         // 0001
   and (s_and, n3, n2, alu_op[1], n0);         // 0010
   and (s_or, n3, n2, alu_op[1], alu_op[0]);    // 0011
   and (s_xor, n3, alu_op[2], n1, n0);        // 0100
   and (s_slt, n3, alu_op[2], n1, alu_op[0]);   // 0101
   and (s_sltu, n3, alu_op[2], alu_op[1], n0);  // 0110
   and (s_sll, n3, alu_op[2], alu_op[1], alu_op[0]); // 0111
   and (s_srl, alu_op[3], n2, n1, n0);        // 1000
   and (s_sra, alu_op[3], n2, n1, alu_op[0]);  // 1001

    or (subtract, s_sub, s_slt, s_sltu);
    buf (carry[0], subtract);

    xor (overflow, carry[31], carry[32]);
    xor (signed_less, sum[31], overflow);
    not (unsigned_less, carry[32]);

    genvar i, stage;
  generate
     for (i = 0; i < 32; i = i + 1) begin : arithmetic_bits

       wire w1, w2, w3;

       xor (B_new[i], B[i], subtract);
       xor (w1, A[i], B_new[i]);
       xor (sum[i], w1, carry[i]);

      and (w2, A[i], B_new[i]);
      and (w3, w1, carry[i]);
       or (carry[i+1], w2, w3);

      and (and_result[i], A[i], B[i]);
       or (or_result[i], A[i], B[i]);
       xor (xor_result[i], A[i], B[i]);

       buf (left_stage[0][i], A[i]);
       buf (right_stage[0][i], A[i]);
       buf (arithmetic_stage[0][i], A[i]);

    end


.
     for (stage = 0; stage < 5; stage = stage + 1) begin : shifter_stages
        for (i = 0; i < 32; i = i + 1) begin : shifter_bits

             if (i >= (1 << stage)) begin : left_valid
           mux2_for_alu L (left_stage[stage][i],
                        left_stage[stage][i-(1 << stage)],
                      B[stage], left_stage[stage+1][i]);
        end
          else begin : left_zero
           mux2_for_alu L (left_stage[stage][i],
                       1'b0,
                      B[stage], left_stage[stage+1][i]);
        end

             if ((i + (1 << stage)) < 32) begin : right_valid
           mux2_for_alu R (right_stage[stage][i],
                       right_stage[stage][i+(1 << stage)],
                      B[stage], right_stage[stage+1][i]);

           mux2_for_alu AR (arithmetic_stage[stage][i],
                       arithmetic_stage[stage][i+(1 << stage)],
                       B[stage], arithmetic_stage[stage+1][i]);
        end
          else begin : right_fill
           mux2_for_alu R (right_stage[stage][i],
                       1'b0,
                      B[stage], right_stage[stage+1][i]);

           mux2_for_alu AR (arithmetic_stage[stage][i],
                       arithmetic_stage[stage][31],
                       B[stage], arithmetic_stage[stage+1][i]);
        end

      end
    end
     for (i = 0; i < 32; i = i + 1) begin : result_bits

       wire y0, y1, y2, y3, y4;
       wire y5, y6, y7, y8, y9;

      and (y0, sum[i], s_add);
      and (y1, sum[i], s_sub);
      and (y2, and_result[i], s_and);
      and (y3, or_result[i], s_or);
      and (y4, xor_result[i], s_xor);

          if (i == 0) begin : comparison_bit
        and (y5, signed_less, s_slt);
        and (y6, unsigned_less, s_sltu);
      end
        else begin : other_bits
         buf (y5, 1'b0);
         buf (y6, 1'b0);
      end

      and (y7, left_stage[5][i], s_sll);
      and (y8, right_stage[5][i], s_srl);
      and (y9, arithmetic_stage[5][i], s_sra);

       or (Result[i], y0, y1, y2, y3, y4, y5, y6, y7, y8, y9);

    end
  endgenerate

  nor (zero, Result[0], Result[1], Result[2], Result[3],
         Result[4], Result[5], Result[6], Result[7],
         Result[8], Result[9], Result[10], Result[11],
         Result[12], Result[13], Result[14], Result[15],
         Result[16], Result[17], Result[18], Result[19],
         Result[20], Result[21], Result[22], Result[23],
         Result[24], Result[25], Result[26], Result[27],
         Result[28], Result[29], Result[30], Result[31]);

endmodule


module tb_alu_32bit;

  reg [31:0] A;
  reg [31:0] B;
  reg [3:0] alu_op;

  wire [31:0] Result;
  wire zero;

  alu_32bit uut (A, B, alu_op, Result, zero);

   initial begin
       // ADD
    alu_op = 4'b0000; A = 32'd5; B = 32'd3;
     #20;

    alu_op = 4'b0000; A = 32'hFFFFFFFF; B = 32'd1;
     #20;

       // SUB
    alu_op = 4'b0001; A = 32'd9; B = 32'd4;
     #20;

    alu_op = 4'b0001; A = 32'd5; B = 32'd5;
     #20;

       // AND
    alu_op = 4'b0010; A = 32'h0000000C; B = 32'h0000000A;
     #20;

       // OR
    alu_op = 4'b0011; A = 32'h0000000C; B = 32'h0000000A;
     #20;

       // XOR
    alu_op = 4'b0100; A = 32'h0000000C; B = 32'h0000000A;
     #20;

       // Signed SLT
    alu_op = 4'b0101; A = 32'd3; B = 32'd5;
     #20;

    alu_op = 4'b0101; A = 32'hFFFFFFFF; B = 32'd2; // -1 < 2
     #20;

    alu_op = 4'b0101; A = 32'h7FFFFFFF; B = 32'h80000000; // positive < negative is false
     #20;

       // Unsigned SLTU
    alu_op = 4'b0110; A = 32'd3; B = 32'd5;
     #20;

    alu_op = 4'b0110; A = 32'hFFFFFFFF; B = 32'd2;
     #20;

       // Shift Left Logical (SLL)
    alu_op = 4'b0111; A = 32'd5; B = 32'd2;
     #20;

    alu_op = 4'b0111; A = 32'd1; B = 32'd31;
     #20;

       // Shift Right Logical (SRL)
    alu_op = 4'b1000; A = 32'h80000000; B = 32'd1;
     #20;

    alu_op = 4'b1000; A = 32'h80000000; B = 32'd40; // low five bits = 8
     #20;

       // Shift Right Arithmetic (SRA)
    alu_op = 4'b1001; A = 32'h80000000; B = 32'd1;
     #20;

    alu_op = 4'b1001; A = 32'hFFFFFFF8; B = 32'd2; // -8 >> 2 = -2
     #20;


  end

endmodule
