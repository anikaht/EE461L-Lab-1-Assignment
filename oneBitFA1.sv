// Code your design here
module oneBitFA1(
    input wire a_i,
    input wire b_i,
    input wire ci_i,
    output wire sum_o,
    output wire co_o
);
  assign {co_o, sum_o} = a_i + b_i + ci_i; // Continuous assignment for full adder
endmodule
