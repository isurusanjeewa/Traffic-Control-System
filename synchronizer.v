module synchro (clk, reset, sensor,walk_requst, reprogram, reset_sync, sensor_sync,wr_sync_out,prog_sync);
  
	input clk,reset, sensor, walk_requst, reprogram;
	output  reset_sync, sensor_sync,wr_sync_out,prog_sync;
  
	reg reset_sync, sensor_sync,wr_sync_out,prog_sync;	
  
 
	always @ (posedge clk)
		begin : sync
    
		reset_sync <= reset;
		sensor_sync <= sensor;
		wr_sync_out <= walk_requst;
		prog_sync <= reprogram ;
    
	end
  
endmodule
