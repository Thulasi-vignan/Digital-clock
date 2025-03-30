`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 12:20:11 PM
// Design Name: 
// Module Name: seven_seg_display
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


module seven_seg_display(
    input clk_out,reset,
    input [4:0]hr,
    input [5:0]min,
    input [5:0]sec,
    output reg [6:0]seg,
    output reg[7:0]an
    );
    
    reg [2:0]state;
    reg [6:0]val
  
    
    always@(posedge clk_out or posedge reset) begin 
        if(reset) state <=0;
        else state <= state + 1;
     end 
     
     always@(clk_out) begin 
        case(state)
           3'b000 : begin 
                       val = sec % 10;       // for ones place 
                      an = 11111110;
                    end
           3'b001 : begin
                      val= sec / 10;      // for tens place 
                      an = 11111101;
                    end
           3'b010 : begin 
                      val = min % 10;
                      an = 11111011;
                    end  
           3'b011 : begin
                      val = min / 10;
                      an = 11110111;
                    end
           3'b100 : begin 
                      val = hr % 10;
                      an = 11101111;
                    end 
           3'b101 : begin 
                      val = hr / 10;
                      an = 11011111;
                    end 
              default : begin 
                      val = 10000000;
                      an  = 11000000;
                      end 
              endcase       
           state <= (state == 3'b101) ? (3'b000) : state+1;
        end 
       Bcd_7segment seven_seg (.a(val),.y(seg));     
                                                                    
endmodule
