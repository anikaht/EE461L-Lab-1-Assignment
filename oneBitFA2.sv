module oneBitFA2(
  		input wire a_i,
 		input wire b_i,
 		input wire ci_i,
 		output reg sum_o,
 		output reg co_o
);
			   
always @(a_i, b_i, ci_i)begin
 		{co_o, sum_o} = a_i + b_i + ci_i; 
end
endmodule

