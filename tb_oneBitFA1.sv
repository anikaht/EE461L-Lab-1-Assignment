// Anika Haque, 20283
// EE 461L, Lab Assignment 1, Q3
//-----------------------------------------------------
module tb_oneBitFA1();  // Testbench, no inputs or outputs
  // Declare testbench variables (registers)
  reg a_i;
  reg b_i;
  reg ci_i;
  
  // Declare wires for design output
  wire sum_o;
  wire co_o;

  // Instantiate DUT
  oneBitFA1 dut (
    .a_i(a_i),
    .b_i(b_i),
    .ci_i(ci_i),
    .sum_o(sum_o),
    .co_o(co_o)
  );

  // Testbench initial block to apply inputs
  initial begin
    // Display headers for output
    $display("a_i b_i ci_i | sum_o co_o");
    $monitor("%b   %b   %b   |  %b    %b", a_i, b_i, ci_i, sum_o, co_o);
    
    // Apply test vectors
    a_i = 0; b_i = 0; ci_i = 0; #10;  // Wait 10 time units
    a_i = 0; b_i = 0; ci_i = 1; #10;
    a_i = 0; b_i = 1; ci_i = 0; #10;
    a_i = 0; b_i = 1; ci_i = 1; #10;
    a_i = 1; b_i = 0; ci_i = 0; #10;
    a_i = 1; b_i = 0; ci_i = 1; #10;
    a_i = 1; b_i = 1; ci_i = 0; #10;
    a_i = 1; b_i = 1; ci_i = 1; #10;

    $finish;  // End the simulation
  end
endmodule
