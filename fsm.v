 /* 
This module is design using 2 always block 
 


*/


 module fsm(clk, reset, sensor_snyc, wr, prog_sync, exp, wr_reset, intervel, st_time, out);
  
  input clk, reset, sensor_snyc, wr, prog_sync, exp;
  output [1:0] intervel;
  output wr_reset,  st_time; 
  output [6:0] out;
  
  reg [2:0] state, next_state;
  
  reg [1:0] intervel;
  reg [6:0] out;
  reg wr_reset,  st_time, sen; 
  
	always @ (posedge clk)
	begin : next_st
    
    
		if (reset == 1 || prog_sync ==1)
		begin
			state  <= 3'b000;
		end
		else 
		begin
			state <= next_state;
		end
  
	end 
	always @ (posedge clk)
	begin	
		if (exp ==1)
			st_time <=0;
		else
			st_time <= 1;
	end
  
 

  
  always @ (exp, sensor_snyc, wr, state )
	begin
    case(state)
		3'b000 : begin
	
			intervel = 2'b00;
			out = 7'b1000010; //0111101;
			if (exp )
			begin
				next_state = 3'b001;
				wr_reset =0;
			end 
			else 
			begin
				next_state = 3'b000;
				wr_reset =0;
			end

			if (sensor_snyc)
			begin 
				sen <= 1;
			end
			else
				sen <= 0;
			begin
			
			end
		end  
		3'b001 : begin
			wr_reset = 0;
			out = 7'b1000010;//0111101;
			if (sen) 
			begin
				intervel <= 2'b01;
			end
			else	
			begin
				intervel <= 2'b00;
			end
			
			if (exp)
				begin
					next_state = 3'b010;
				end 
				else 
				begin
					next_state = 3'b001;
				end 
			end
			

        
        3'b010 : begin
			out = 7'b0100010; //1011101;
			intervel = 2'b10;
			if (exp && wr )
			begin
				next_state = 3'b011;
				wr_reset = 1;
			end 
        
			else if (exp && ~wr )
			begin
				next_state = 3'b100;
				wr_reset =0;
			end 
			else 
			begin
				next_state = 3'b010;
				wr_reset =0;
			end 
		end
      
      
      
		3'b011 : begin
			
			out = 7'b0010011; //1101100 ;
			intervel = 2'b01;
			if (exp )
			begin
				next_state = 3'b100;
				wr_reset = 0;
			end 
			else 
			begin
				next_state = 3'b011;
				wr_reset =0;
			end 
		end
      
      
        3'b100 : begin
			wr_reset = 0;
			out = 7'b0011000; //1100111;
			intervel = 2'b00;
			if (exp && sensor_snyc )
			begin
				next_state = 3'b101;
			end 
        
			else if (exp && ~sensor_snyc )
			begin
				next_state = 3'b110;
			end 
			else 
			begin
				next_state = 3'b100;
			end 
		end  
        
        3'b101 : begin
			out = 7'b0011000; //1100111;
			intervel = 2'b01;
			wr_reset = 0;
            if (exp  )
			begin
				next_state = 3'b110;
			end 
			else 
			begin
				next_state = 3'b101;
			end 
		end 
      
      
        default : begin
   			out = 7'b0010100; //1101011;
			intervel = 2'b10;
			wr_reset = 0;
			if (exp  )
			begin
				next_state = 3'b000;
			end  
			else 
			begin
				next_state = 3'b110;
			end 
		end  
    endcase
      
	end
	

    
  
endmodule
