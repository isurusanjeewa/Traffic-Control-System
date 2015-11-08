module timer_blk_2(sys_clk,clk,reset, st_timer, time_val, timer_exp, count_down,repro);
  
  input repro;
  input sys_clk, clk, reset, st_timer;
  input [3:0] time_val;
  
  output  timer_exp;
  output[3:0] count_down;
  reg timer_exp;
  reg [3:0] count;
reg [3:0] count_down;
 
  
  always @ (posedge sys_clk)
  begin : counter
    
    if (reset == 1 || repro)// || st_timer == 0)
      begin
      count <= 4'b0000;
      timer_exp <=0;
    end

else if ( clk  == 1 && st_timer == 1 && count != time_val)
    begin
      count <= count +1;
      count_down <=  time_val - count-1;
    end
    
  else if (count == time_val)
    begin
      timer_exp <=1;
      count <= 4'b0000;
    end
  else begin
   timer_exp <=0;
  
end
  
end
  

  
endmodule


