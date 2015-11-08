module divider_2( sys_clk, divider_out, reset);
  
  input reset;
  input sys_clk;
  output divider_out;
  parameter para_count = 10;//50000000; // value to change divider out
  
  reg divider_out;
  reg[31:0] count ; // register for count
  
  always @ (posedge sys_clk)
  begin : counter
    if (reset == 1)begin
		divider_out <= 0;
		count <= 1;
    end
    else if (count == para_count  ) begin
		divider_out <= 1;
		count <= 1;
    end
    else
		begin
		count <= count +1;
		divider_out <= 0;
      
    end
  
 end  
  
  
endmodule


