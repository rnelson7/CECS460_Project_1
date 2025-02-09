`timescale 1ns / 1ps

module memory_game_top (
    input wire clk,
    input wire [3:0] switches,
    input wire btn0,
    output wire led0,
    output wire led1
);
    wire [3:0] player_guess;
    wire guess_submitted;
    wire [3:0] bram_data;
    wire [3:0] addr;

    // Instantiate modules
    bram_init bram (
        .clk(clk),
        .addr(addr),
        .data_out(bram_data)
    );

    player_input input_module (
        .clk(clk),
        .switches(switches),
        .btn0(btn0),
        .player_guess(player_guess),
        .guess_submitted(guess_submitted)
    );

    feedback feedback_module (
        .clk(clk),
        .player_guess(player_guess),
        .bram_data(bram_data),
        .guess_submitted(guess_submitted),
        .led0(led0),
        .led1(led1)
    );

    address_counter counter (
        .clk(clk),
        .guess_submitted(guess_submitted),
        .addr(addr)
    );
endmodule
