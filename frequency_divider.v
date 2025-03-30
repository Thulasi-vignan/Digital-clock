`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 11:39:01 AM
// Design Name: 
// Module Name: frequency_divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module frequency_divid(
input clk,reset,
output reg clk_1hz , clk_out
    );
    
//    parameter divisor = 50000000;
    reg[31:0] counter1 , counter2;
    always@(posedge clk or posedge reset) begin
        if(reset) begin 
            counter1 <=0;
            clk_1hz<=0;
            end
        else if(counter == 49999999)begin 
              counter1<=0;
              clk_1hz=~clk_1hz;
              end
         else 
            counter1 <= counter1 + 1;
      end         
            
      always@(posedge clk or posedge reset)begin 
      	if(reset)begin 
      	       counter2 <=0;	      
		clk_out <=0;
		end 
		else if (counter2 == 49999)begin 
			counter2 <=0;
			clk_out = ~clk_out;
		end 
		else 
			counter2 <= counter2 + 1;
	end				            
endmodule
