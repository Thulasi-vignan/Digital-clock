`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2024 12:53:22 PM
// Design Name: 
// Module Name: Top_module
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


module Top_module(
input clk_in,reset,
output [6:0]seg,
output [7:0]an 
    );
    wire clk_1hz;
    wire [5:0]sec,min;
    wire [4:0]hr;
    
    //function call for frequency divider module
    frequency_divid freq_div(.clk(clk_in),.reset(reset),.clk_out(clk_1hz));
    
    // function call for digital clock module
    digital_clock uut(.clk(clk_1hz),.reset(reset),.sec(sec),.min(min),.hr(hr));
    
    // function call for seven_seg_diaplay
    seven_seg_display uutq(.clk(clk_in),.reset(reset),.sec(sec),.min(min),.hr(hr),.seg(seg),.an(an));
    
endmodule
