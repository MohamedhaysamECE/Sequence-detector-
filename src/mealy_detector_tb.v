`timescale 1ns/1ns
module mealy_detector_tb();
reg clk, nrst, x;
wire y;

// period of clock
localparam T = 20;

//instantiation
mealy_detector M2(
 .clk(clk),
 .nrst(nrst),
 .x(x),
 .y(y)
 );
 
 //clock generation
 always begin
 clk = 1'b0;
 #(T/2);
 clk = 1'b1;
 #(T/2);
 end
 
 //reset generation
 initial begin
 nrst = 1'b0;
 #(3*T/2);
 nrst = 1'b1; 
 end

//stimulus generation
initial begin
 x = 1'b0;
 #(5*T);
 @(negedge clk);
 x = 1'b1;
 repeat (10) @(negedge clk);
 x = 1'b0;
 #T
 x = 1'b1;
 repeat (4) @(negedge clk);
 x = 1'b0;
 #T;
 x = 1'b1;
 repeat (4) @(negedge clk);
 nrst = 1'b0;
 #(2*T);
 x = 1'b1;
 repeat (10) @(negedge clk);
 x = 1'b0;
 #T;  
 $stop;
end
endmodule 