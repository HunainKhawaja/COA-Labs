 module half_adder(a,b,s,c);
  input a,b;
  output s,c;

  xor a1(s,a,b);
 and a2(c,a,b);

 endmodule


 module testbench1();
  reg x,y;
  wire s,c;

  half_adder h1(x,y,s,c);

  initial
  begin
    x=0; y=0;
   #50
    x=0; y=1;
   #50
    x=1; y=0;
   #50
    x=1; y=1;

 end
 endmodule
