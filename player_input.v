`timescale 1ns / 1ps

module player_input (
    input wire clk,
    input wire [3:0] switches,
    input wire btn0,
    output reg [3:0] player_guess,
    output reg guess_submitted
);
    always @(posedge clk) begin
        if (btn0) begin
            player_guess <= switches; // Capture the player's guess
            guess_submitted <= 1;    // Indicate that a guess has been submitted
        end else begin
            guess_submitted <= 0;
        end
    end
endmodule