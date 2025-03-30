`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 11:44:48 AM
// Design Name: 
// Module Name: digital_clock
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


module digital_clock(
    input clk_1hz,reset,
    output reg [5:0]sec,min,
    output reg [4:0]hr
    );
    
    
    wire clk_out;
    
    //frequency_divid uut(.clk(clk),.reset(reset),.clk_out(clk_out));
    
    always@(posedge clk_1hz or posedge reset) begin 
        if(reset)begin 
            sec <= 0;
            min <= 0;
            hr <= 0;
          end 
        else begin
        if(clk == 1'b1)
        	sec <= sec+1;
            if(sec == 59)begin 
                sec <=0 ;
                if(min <= 59)begin 
                    min <= 0;
                    if(hr == 23)begin 
                        hr <= 0;
                     end
                     else hr = hr + 1;
                  end else min = min + 1;
             end else sec = sec + 1;
         end                
    
    end
endmodule
