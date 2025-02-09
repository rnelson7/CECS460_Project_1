`timescale 1ns / 1ps

module feedback (
    input wire clk,
    input wire [3:0] player_guess,
    input wire [3:0] bram_data,
    input wire guess_submitted,
    output reg led0, // Green LED
    output reg led1  // Red LED
);
    always @(posedge clk) begin
        if (guess_submitted) begin
            if (player_guess == bram_data) begin
                led0 <= 1; // Correct guess
                led1 <= 0;
            end else begin
                led0 <= 0;
                led1 <= 1; // Incorrect guess
            end
        end else begin
            led0 <= 0;
            led1 <= 0;
        end
    end
endmodule