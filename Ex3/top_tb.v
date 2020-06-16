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
	wire [7:0] count;
	reg [7:0] count_prev;
	reg rst;
	reg enable;
	reg direction;
	reg err;


//Todo: Clock generation
	//general clock
	initial begin
	clk = 1'b1;
	forever 
	#(clk_period/2) clk = ~clk;
	end

	//for reset
	initial begin
	rst = 1;
	#(clk_period) rst = 0;
	end

	// for enable
	initial begin
	enable = 1;
	#(3*clk_period) enable = 0;
	#(clk_period) enable = 1;
	#(10*clk_period) enable = 0 ;
	end

	// for direction
	initial begin
	direction = 1;
	#(3*clk_period) direction = 0;
	#(clk_period) direction = 1;
	#(5*clk_period) enable = 0 ;
	#(clk_period) direction = 1;
	end


	
//Todo: User logic
    
	initial begin

	err = 0;
	count_prev = count;
	#1 
	
	forever begin
	#(clk_period)

// en = 0, rst = 0, counter = count_prev
	if (rst!=1&&enable==0&&(count!=count_prev))
	begin
	$display("***Test failed, enable is zero***");
	err = 1;
	end

// rst = 1, counter = 0 
	if (rst==1&&count!=0)
	begin 
	$display("***Test failed, no reset***");
	err = 1;
	end

// direction = 1 count up
	if(rst!=1&&enable!=0&&clk==1&&direction==1&&(count_prev!= count-1)) begin
	$display("***Test failed when direction = 1, needs to count up!***");
	err = 1;
	end

// direction = 0 count down 
	if(rst!=1&&enable!=0&&clk==1&&direction==0&&(count_prev!= count+1)) begin
	$display("***Test failed when direction = 0, needs to count down!***");
	err = 1;
 	end	

count_prev = count;
	end
	end



//Todo: Finish test, check for success
	initial begin
	#200
	if (err==0)
	$display("***Test Passed***");
	$finish;
	end



//Todo: Instantiate counter module
 	counter top(
	.clk(clk),
	.rst(rst),
	.enable(enable),
	.direction(direction),
	.counter_out(counter)
	);


endmodule 
