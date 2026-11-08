 module mux8x1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);


  input i0,i1,i2,i3,i4,i5,i6,i7;


  input s0,s1,s2;


  output y;


  wire ns0,ns1,ns2;


  wire w0,w1,w2,w3,w4,w5,w6,w7;


  not n1(ns0,s0);


  not n2(ns1,s1);


  not n3(ns2,s2);


 and a1(w0,i0,ns2,ns1,ns0);


 and a2(w1,i1,ns2,ns1,s0);


 and a3(w2,i2,ns2,s1,ns0);


 and a4(w3,i3,ns2,s1,s0);


 and a5(w4,i4,s2,ns1,ns0);


 and a6(w5,i5,s2,ns1,s0);


 and a7(w6,i6,s2,s1,ns0);


 and a8(w7,i7,s2,s1,s0);


  or o1(y,w0,w1,w2,w3,w4,w5,w6,w7);


 endmodule


 module testbench1();


  reg i0,i1,i2,i3,i4,i5,i6,i7;


  reg s0,s1,s2;


  wire y;


 mux8x1 m1(i0,i1,i2,i3,i4,i5,i6,i7,s0,s1,s2,y);


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
