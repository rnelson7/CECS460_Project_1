`timescale 1ns / 1ps

module memory_game_tb;

    // Inputs
    reg clk;
    reg [3:0] switches;
    reg btn0;

    // Outputs
    wire led0;
    wire led1;

    // Instantiate the top-level module
    memory_game_top uut (
        .clk(clk),
        .switches(switches),
        .btn0(btn0),
        .led0(led0),
        .led1(led1)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period (100 MHz)
    end

    // Test sequence
    initial begin
        // Initialize inputs
        switches = 4'b0000;
        btn0 = 0;

        // Wait for global reset
        #100;

        // Test case 1: Correct guess
        switches = 4'b1010; // First BRAM value is 4'b1010
        btn0 = 1; // Submit guess
        #20;
        btn0 = 0; // Release button
        #100; // Wait for feedback

        // Test case 2: Incorrect guess
        switches = 4'b0000; // Incorrect guess
        btn0 = 1; // Submit guess
        #20;
        btn0 = 0; // Release button
        #100; // Wait for feedback

        // Test case 3: Correct guess (second BRAM value is 4'b0110)
        switches = 4'b0110; // Correct guess
        btn0 = 1; // Submit guess
        #20;
        btn0 = 0; // Release button
        #100; // Wait for feedback

        // Test case 4: Loop back to the first BRAM address
        // Submit 8 more guesses to reach the end of BRAM
        repeat (8) begin
            switches = $random; // Random guess
            btn0 = 1; // Submit guess
            #20;
            btn0 = 0; // Release button
            #100; // Wait for feedback
        end

        // Test case 5: Correct guess (first BRAM value again)
        switches = 4'b1010; // Correct guess
        btn0 = 1; // Submit guess
        #20;
        btn0 = 0; // Release button
        #100; // Wait for feedback

        // End simulation
        $stop;
    end

endmodule
