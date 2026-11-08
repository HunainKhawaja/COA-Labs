module mux8x1_dataflow(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);


input i0,i1,i2,i3,i4,i5,i6,i7;


input s0,s1,s2;


output y;


assign y = (~s2 & ~s1 & ~s0 & i0) |


      (~s2 & ~s1 & s0 & i1) |


      (~s2 & s1 & ~s0 & i2) |


      (~s2 & s1 & s0 & i3) |


       (s2 & ~s1 & ~s0 & i4) |


       (s2 & ~s1 & s0 & i5) |


       (s2 & s1 & ~s0 & i6) |


       (s2 & s1 & s0 & i7);


endmodule


module testbench5();


reg i0,i1,i2,i3,i4,i5,i6,i7;


reg s0,s1,s2;


wire y;


mux8x1_dataflow m1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);


initial


begin


  i0=0; i1=1; i2=0; i3=1;


  i4=0; i5=1; i6=0; i7=1;


  s0=0; s1=0; s2=0;


  #50


  s0=1; s1=0; s2=0;


  #50


  s0=0; s1=1; s2=0;
  #50


  s0=1; s1=1; s2=0;


  #50


  s0=0; s1=0; s2=1;


  #50


  s0=1; s1=0; s2=1;


  #50


  s0=0; s1=1; s2=1;


  #50


  s0=1; s1=1; s2=1;


end


endmodule
