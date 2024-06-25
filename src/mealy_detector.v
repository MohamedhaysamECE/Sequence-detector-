module mealy_detector(
 input clk, nrst,
 input x,
 output y
 );
 
 //states encoding
 
 localparam [1:0] s0 = 3'b00,
                  s1 = 3'b01,
                  s2 = 3'b10,
                  s3 = 3'b11;
                 
 // next and current state signals
  reg [1:0] state, next_state;
 
 // state register
 always@(posedge clk, negedge nrst)
  begin
   if(!nrst)
    state <= s0;
   else
    state <= next_state; 
  end


//next state and output
always @(*)
 begin
  next_state = state;
  case(state)
   s0 :begin
        if(~x)
         next_state = s0;
        else
         next_state = s1; 
       end
   s1 :begin
            if(~x)
             next_state = s1;
            else
             next_state = s2; 
           end
   s2 :begin
           if(~x)
              next_state = s3;
            else
              next_state = s2; 
         end
   s3 :begin
            if(~x)
              next_state = s0;
             else
              next_state = s1; 
         end
             
  endcase
 end
  assign y = (state == s3)? ((x == 1)? 1'b1 : 1'b0) : 1'b0;
endmodule