`timescale 1ns / 1ps

module address_counter (
    input wire clk,
    input wire guess_submitted,
    output reg [3:0] addr
);
    always @(posedge clk) begin
        if (guess_submitted) begin
            if (addr == 9) begin
                addr <= 0; // Loop back to the start
            end else begin
                addr <= addr + 1; // Increment address
            end
        end
    end
endmodule