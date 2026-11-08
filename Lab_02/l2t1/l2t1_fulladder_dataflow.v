module full_adder (a,b,cin,s,c);


input a,b,cin;


output s,c;


assign s = a ^ b ^ cin;


assign c = (a & b) | (b & cin) | (a & cin);


endmodule


module testbench4();


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
