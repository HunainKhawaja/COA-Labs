module logicgate (a,b,c,d,w,x,y,z);


input a,b,c,d;


output w,x,y,z ;


assign w = ~a;


assign x = ~b;


assign y = ~c;


assign z = ~d;


endmodule


module testbench();


reg a;


reg b;


reg c;


reg d;


wire w;


wire x;


wire y;


wire z;


integer i;


logicgate aut(a,b,c,d,w,x,y,z);


initial


begin


          for(i=0; i<16; i=i+1)


        begin
                   {a,b,c,d} = i;


                #50;


       end


end


endmodule


/*


not efficient, hardcode.


a = 0; b = 0; c = 0; d = 0;


#50


a = 0; b = 0; c = 0; d = 1;


#50


a = 0; b = 0; c = 1; d = 0;


#50


a = 0; b = 0; c = 1; d = 1;


#50


a = 0; b = 1; c = 0; d = 0;


#50


a = 0; b = 1; c = 0; d = 1;


#50


a = 0; b = 1; c = 1; d = 0;


#50


a = 0; b = 1; c = 1; d = 1;


#50


a = 1; b = 0; c = 0; d = 0;
#50


a = 1; b = 0; c = 0; d = 1;


#50


a = 1; b = 0; c = 1; d = 0;


#50


a = 1; b = 0; c = 1; d = 1;


#50


a = 1; b = 1; c = 0; d = 0;


#50


a = 1; b = 1; c = 0; d = 1;


#50


a = 1; b = 1; c = 1; d = 0;


#50


a = 1; b = 1; c = 1; d = 1;


*/
