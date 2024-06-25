module moore_detector(
 input clk, nrst,
 input x,
 output reg y
 );
 
 //states encoding
 
 localparam [2:0] s0 = 3'b000,
                  s1 = 3'b001,
                  s2 = 3'b010,
                  s3 = 3'b011,
                  s4 = 3'b100;
 // next and current state signals
  reg [2:0] state, next_state;
 
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
  y = 1'b0;
  case(state)
   s0 :begin
        if(~x)
         next_state = s0;
        else
         next_state = s1; 
       end
   s1 :begin
            if(~x)
             next_state = s0;
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
              next_state = s4; 
         end
   s4 :begin
           y = 1'b1;
           if(~x)
              next_state = s0;
           else
              next_state = s2; 
        end                                  
  endcase
 end
endmodule