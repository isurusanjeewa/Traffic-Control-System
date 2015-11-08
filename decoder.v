module decoder( reset, count, clk , c_out, sel_out);

input [3:0] count;
input clk, reset;

output [7:0] c_out;
output [3:0] sel_out;


reg  [7:0] c_out;
reg [3:0] sel_out;

reg[3:0] fst;
reg sec, check;

reg [10 :0] st_change;

always @ (posedge clk)
begin
	if (count  >= 10)
  	  begin
    		  fst <= count - 10;
     		 sec <= 1;			 
  	end 
else 
  begin
  sec <= 0;
  fst <= count;
end





end
always @ (posedge clk)
begin
  if (reset == 1)
    begin
		check <= 0 ;
		st_change <= 0;
    end
 
	 
	
  else if (check  == 0 && st_change[10] == 1)
    
    begin
      sel_out[0] <= 1;
		sel_out[1] <= 0;
      check <= 1;
	  st_change <= 0;
      
      case (fst)
        4'b0000 : begin
          c_out[0] <= 0;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 0;
          c_out[4] <= 0;
          c_out[5] <= 0;
          c_out[6] <= 1;
          c_out[7] <= 1;
        end
        
        4'b0001 : begin
          c_out[0] <= 1;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 1;
          c_out[4] <= 1;
          c_out[5] <= 1;
          c_out[6] <= 1;
          c_out[7] <= 1;
        end
        
        4'b0010 : begin
          c_out[0] <= 0;
          c_out[1] <= 0;
          c_out[2] <= 1;
          c_out[3] <= 0;
          c_out[4] <= 0;
          c_out[5] <= 1;
          c_out[6] <= 0;
          c_out[7] <= 1;
        end
        
        4'b0011 : begin
          c_out[0] <= 0;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 0;
          c_out[4] <= 1;
          c_out[5] <= 1;
          c_out[6] <= 0;
          c_out[7] <= 1;
        end
        
        4'b0100 : begin
          c_out[0] <= 1;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 1;
          c_out[4] <= 1;
          c_out[5] <= 0;
          c_out[6] <= 0;
          c_out[7] <= 1;
        end
        
        4'b0101 : begin
          c_out[0] <= 0;
          c_out[1] <= 1;
          c_out[2] <= 0;
          c_out[3] <= 0;
          c_out[4] <= 1;
          c_out[5] <= 0;
          c_out[6] <= 0;
          c_out[7] <= 1;
        end
        
        4'b0110 : begin
          c_out[0] <= 0;
          c_out[1] <= 1;
          c_out[2] <= 0;
          c_out[3] <= 0;
          c_out[4] <= 0;
          c_out[5] <= 0;
          c_out[6] <= 0;
          c_out[7] <= 1;
        end
        
        4'b0111 : begin
          c_out[0] <= 0;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 1;
          c_out[4] <= 1;
          c_out[5] <= 1;
          c_out[6] <= 1;
          c_out[7] <= 1;
        end
        
        4'b1000 : begin
          c_out[0] <= 0;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 0;
          c_out[4] <= 0;
          c_out[5] <= 0;
          c_out[6] <= 0;
          c_out[7] <= 1;
        end
       4'b1001 : begin
          c_out[0] <= 0;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 0;
          c_out[4] <= 1;
          c_out[5] <= 0;
          c_out[6] <= 0;
          c_out[7] <= 1;
        end
  endcase 
  
end

  else if(check == 1 &&  st_change[10] == 1)
  begin
   // sel_out <= 4'b1101;
	sel_out[0] <= 0;
	sel_out[1] <= 1;
	 check <= 0;
     st_change <= 0; 
      case (sec)
        0 : begin
           c_out[0] <= 0;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 0;
          c_out[4] <= 0;
          c_out[5] <= 0;
          c_out[6] <= 1;
          c_out[7] <= 1;
        end
        
        1 : begin
          c_out[0] <= 1;
          c_out[1] <= 0;
          c_out[2] <= 0;
          c_out[3] <= 1;
          c_out[4] <= 1;
          c_out[5] <= 1;
          c_out[6] <= 1;
          c_out[7] <= 1;
        end
  endcase

  end
  else
  begin
		st_change <= st_change +1;
		sel_out[2] <= 1;
		sel_out[3] <= 1;
  end
   
end


  
  
endmodule

