`timescale 1ns / 1ps

module bram_init (
    input wire clk,
    input wire [3:0] addr,
    output reg [3:0] data_out
);
    reg [3:0] bram [0:9]; // 10 locations of 4-bit data

    // Initialize BRAM with random values
    initial begin
        bram[0] = 4'b1010;
        bram[1] = 4'b0110;
        bram[2] = 4'b1100;
        bram[3] = 4'b0011;
        bram[4] = 4'b1001;
        bram[5] = 4'b0101;
        bram[6] = 4'b1111;
        bram[7] = 4'b0000;
        bram[8] = 4'b1011;
        bram[9] = 4'b0111;
    end

    // Read data from BRAM
    always @(posedge clk) begin
        data_out <= bram[addr];
    end
endmodule