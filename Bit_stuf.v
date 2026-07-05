`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: JOHN WICK(BOOGYMAN)
// 
// Create Date: 05.07.2026 17:06:00
// Design Name: HDLC PROTOCOL
// Module Name: Bit_stuf
// Project Name: HDLC
// 
//////////////////////////////////////////////////////////////////////////////////

module Bit_stuf(
    input clk,
    input rst,
    input data_in,
    output reg data_out
    );
    reg [2:0]count;
    //------Checking--------
    always@(posedge clk) begin
        if (rst)begin
            count<=3'b0;
            data_out<=1'b0;
        end
        else begin
            if (count==3'd5)begin
                count<=3'b0;
                data_out<=1'b0;
            end
            else begin
                if (data_in) begin
                    count=count+1;
                end
                data_out<=data_in;
            end
        end
    end
endmodule
