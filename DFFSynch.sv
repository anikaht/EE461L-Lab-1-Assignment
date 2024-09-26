// Code your testbench here
module DFFSynch(
    input d_i,
    input rst_i,
    input clk_i,
    output reg q_o
);
    always @(posedge clk_i) begin
        if (rst_i)
            q_o <= 0;
        else
            q_o <= d_i;
    end
endmodule

// Include stimulus directly inside the file
module test_DFFSynch();
    reg d_i, rst_i, clk_i;
    wire q_o;

    // Instantiate DFFSynch module
    DFFSynch uut (
        .d_i(d_i),
        .rst_i(rst_i),
        .clk_i(clk_i),
        .q_o(q_o)
    );

    // Clock generation
    always #5 clk_i = ~clk_i; // Toggle clock every 5 time units

    // Stimulus
    initial begin
        // Initialize signals
        clk_i = 0; 
        rst_i = 1; 
        d_i = 0;

        // Reset the DFF
        #10 rst_i = 0;  // Release reset after 10 time units

        // Apply test stimulus
        #10 d_i = 1;    // Set d_i to 1
        #10 d_i = 0;    // Set d_i back to 0
        #10 d_i = 1;    // Set d_i to 1
        #10 rst_i = 1;  // Apply reset
        #10 rst_i = 0;  // Release reset again

        // Finish simulation
        #50 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time: %0t | clk_i: %b | rst_i: %b | d_i: %b | q_o: %b", $time, clk_i, rst_i, d_i, q_o);
    end
endmodule
