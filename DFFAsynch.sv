// Code your testbench here
module DFFAsynch(
    input d_i,
    input rst_i,
    input clk_i,
    output reg q_o
);
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i)
            q_o <= 0;    // Asynchronous reset sets q_o to 0
        else
            q_o <= d_i;  // Else q_o follows d_i at the rising edge of clk_i
    end
endmodule

// Directly adding test logic inside the same file
module test_DFFAsynch();
    reg d_i, rst_i, clk_i;
    wire q_o;

    // Instantiate DFFAsynch module
    DFFAsynch uut (
        .d_i(d_i),
        .rst_i(rst_i),
        .clk_i(clk_i),
        .q_o(q_o)
    );

    // Clock generation
    always #5 clk_i = ~clk_i;  // Generate a clock with a period of 10 time units

    // Stimulus
    initial begin
        // Initialize signals
        clk_i = 0; 
        rst_i = 1; 
        d_i = 0;

        // Asynchronous reset
        #10 rst_i = 0;  // Release reset after 10 time units

        // Apply test stimulus
        #10 d_i = 1;    // Set d_i to 1
        #10 d_i = 0;    // Set d_i back to 0
        #10 d_i = 1;    // Set d_i to 1
        #10 rst_i = 1;  // Apply asynchronous reset, should reset q_o immediately
        #10 rst_i = 0;  // Release reset again

        // Finish simulation
        #50 $finish;
    end

    // Monitor changes
    initial begin
        $monitor("Time: %0t | clk_i: %b | rst_i: %b | d_i: %b | q_o: %b", $time, clk_i, rst_i, d_i, q_o);
    end
endmodule
