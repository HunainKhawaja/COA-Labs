 module alu_parameterized #(parameter N = 8)
            (input [N-1:0] A, input [N-1:0] B,
            input [2:0] op,
            output [N-1:0] Result);

    wire [N:0] carry;
    wire [N-1:0] B_new;
    wire [N-1:0] sum;
    wire [N-1:0] and_result, or_result, xor_result, not_result;

    wire n0, n1, n2;
    wire s_add, s_sub, s_and, s_or, s_not, s_xor;


    not (n0, op[0]);
    not (n1, op[1]);
    not (n2, op[2]);

   and (s_add, n2, n1, n0);
   and (s_sub, n2, n1, op[0]);
   and (s_and, n2, op[1], n0);
   and (s_or, n2, op[1], op[0]);
   and (s_not, op[2], n1, n0);
   and (s_xor, op[2], n1, op[0]);


    buf (carry[0], s_sub);

    genvar i;

    generate
       for (i = 0; i < N; i = i + 1) begin : bit_loop

        wire w1, w2, w3;
        wire y0, y1, y2, y3, y4, y5;


        xor (B_new[i], B[i], s_sub);
        xor (w1, A[i], B_new[i]);
        xor (sum[i], w1, carry[i]);

        and (w2, A[i], B_new[i]);
        and (w3, w1, carry[i]);
         or (carry[i+1], w2, w3);


        and (and_result[i], A[i], B[i]);
         or (or_result[i], A[i], B[i]);
         not (not_result[i], A[i]);
        xor (xor_result[i], A[i], B[i]);

        and (y0, sum[i], s_add);
        and (y1, sum[i], s_sub);
        and (y2, and_result[i], s_and);
        and (y3, or_result[i], s_or);
        and (y4, not_result[i], s_not);
      and (y5, xor_result[i], s_xor);

       or (Result[i], y0, y1, y2, y3, y4, y5);

    end
  endgenerate

endmodule


module tb_alu_parameterized;

  parameter N = 8;

  reg [N-1:0] A;
  reg [N-1:0] B;
  reg [2:0] op;

  wire [N-1:0] Result;

  alu_parameterized #(.N(N)) uut (A, B, op, Result);

   initial begin

    op = 3'b000; A = 8'd5; B = 8'd3;
     #20;

    op = 3'b000; A = 8'd150; B = 8'd20;
     #20;


    op = 3'b001; A = 8'd9; B = 8'd4;
     #20;

    op = 3'b001; A = 8'd5; B = 8'd5;
     #20;

    op = 3'b001; A = 8'd2; B = 8'd7;
     #20;


    op = 3'b010; A = 8'b11001100; B = 8'b10101010;
     #20;


    op = 3'b011; A = 8'b11001100; B = 8'b10101010;
     #20;


    op = 3'b100; A = 8'b11001100; B = 8'b00000000;
     #20;


    op = 3'b101; A = 8'b11001100; B = 8'b10101010;
     #20;


  end

endmodule
