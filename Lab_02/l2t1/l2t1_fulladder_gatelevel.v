 module full_adder(a,b,cin,s,c);


  input a,b,cin;


  output s,c;


  wire s1,c1,c2;


  xor a1(s1,a,b);


  xor a2(s,s1,cin);


 and a3(c1,a,b);


 and a4(c2,s1,cin);


  or a5(c,c1,c2);


 endmodule


 module testbench3();


  reg x,y,cin;
  wire s,c;


  full_adder f1(x,y,cin,s,c);


  initial


  begin


    x=0; y=0; cin=0;


   #50


    x=0; y=0; cin=1;


   #50


    x=0; y=1; cin=0;


   #50


    x=0; y=1; cin=1;


   #50


    x=1; y=0; cin=0;


   #50


    x=1; y=0; cin=1;


   #50


    x=1; y=1; cin=0;


   #50


    x=1; y=1; cin=1;


 end


 endmodule
