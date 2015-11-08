module walk_reg ( clk,reset, wr_sync, wr_reset, walk_reg );

	input wr_sync, wr_reset,clk, reset;
	output walk_reg;

	

	reg walk_reg;

	always @ (posedge clk)
		begin : walk_rege
		
		if ( wr_reset == 1 || reset ==1)
			walk_reg <= 0;
 
		else if ( wr_sync ==1)
			walk_reg <= 1;
    
  
		end

endmodule
