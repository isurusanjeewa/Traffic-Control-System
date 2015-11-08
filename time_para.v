module time_para (clk, reset, time_para_sel, time_val_in , prog_sync, intervel, time_val_out );

	input clk, reset, prog_sync;
	input [1:0]  time_para_sel, intervel;
	input [3:0] time_val_in;

	output [3:0] time_val_out;

	reg [3:0] time_val_out;

	parameter default_tbase = 4'b0110;    // default time values
	parameter default_text = 4'b0011;
	parameter default_tyel = 4'b0010;

	reg [3:0] tbase,text, tyel;            // reg for time values
 
 
	always @ (posedge clk)
		begin 
  
		if (reset == 1) 
			begin
			tbase <= default_tbase;
			text <= default_text;
			tyel <= default_tyel;
		end 
		
		else if (prog_sync == 1)
			begin
			case ( time_para_sel)
				2'b00 : tbase <= time_val_in;
				2'b01 : text <= time_val_in;
				2'b10 : tyel <= time_val_in;
				default :begin
					tbase <= default_tbase;
					text <= default_text;
					tyel <= default_tyel;
				end
			endcase    
		end
	end


    
	always @ (posedge clk)
		begin : val_out
    
		case ( intervel)
			2'b00 : time_val_out <= tbase;
			2'b01 : time_val_out <= text;
			2'b10 : time_val_out <= tyel;
			default: time_val_out <= tbase;
       
		endcase    
	end
   


endmodule
