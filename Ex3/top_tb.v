//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
	parameter clk_period = 10;


//Todo: Regitsers and wires
	reg clk;
	wire [7:0] count
	reg [7:0] count_prev;
	reg rst;
	reg enable;
	reg direction;
	reg err;

	
//Todo: Clock generation


//Todo: User logic
    
//Todo: Finish test, check for success

//Todo: Instantiate counter module
 
endmodule 
