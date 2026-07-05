`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: JOHN WICK(BOOGYMAN)
// 
// Create Date: 05.07.2026 17:06:00
// Design Name: HDLC PROTOCOL
// Module Name: paralel_serial
// Project Name: HDLC
// 
//////////////////////////////////////////////////////////////////////////////////

module pralel_serial(
    input clk,
    input rst,
    input [7:0] data_in,
    output reg data_out,
    output reg EOF
    );
    reg [2:0]count;
    reg [7:0]data;
    always@(posedge clk) begin
        if (rst)begin
            count<=3'b0;
            data_out<=0;
            data<=data_in;
            EOF<=0;
        end
        else begin
            if (count==3'b111) begin
                EOF<=1;
            end
        end
    end
    
    always@(posedge clk) begin
        if (EOF) begin
            count<=0;
            data_out<=0;
        end
        else begin
            data_out<=data[count];
            count=count+1;      
        end
    end
endmodule
