module top ( reset_local, clk , sensor, wlk_requst, reprogram, time_para_sel, time_val_in, out,WR, c_out, sel_out);
  
	input reset_local, clk, sensor, wlk_requst, reprogram;
	input [1:0] time_para_sel;
	input [3:0] time_val_in;
  
	output [6:0] out;
	output WR;
	output [7 :0] c_out;
	output  [3:0] sel_out;
  
	wire RESET;
  
	wire SEN_SYN, WLK_SYNC, PROG_SYNC, WR, WR_RESET, EXP, ST_TIMER, DEVIDER_OUT;
	wire [1:0] INTERVEL;
	wire [3:0] TIME_VAL, COUNT;


   
  
  
	fsm fsm_1(.clk(clk), .reset(RESET), .sensor_snyc(SEN_SYN), .wr(WR), .prog_sync(PROG_SYNC), .exp(EXP), .wr_reset(WR_RESET), .intervel(INTERVEL), .st_time(ST_TIMER), .out(out));
	timer_blk_2 tmr_1(.sys_clk(clk),.clk(DEVIDER_OUT),.reset(RESET), .st_timer(ST_TIMER), .time_val(TIME_VAL), .timer_exp( EXP), .count_down(COUNT),.repro(PROG_SYNC));
	divider_2 div_1( .sys_clk(clk), .divider_out(DEVIDER_OUT), .reset(RESET));
	time_para ti_pra_1(.clk(clk), .reset(RESET), .time_para_sel(time_para_sel), .time_val_in(time_val_in) , .prog_sync(PROG_SYNC), .intervel(INTERVEL), .time_val_out(TIME_VAL) );
	walk_reg wlk_1( .clk(clk),.reset(RESET), .wr_sync(WLK_SYNC), .wr_reset(WR_RESET), .walk_reg(WR) );
	synchro syn_1(.clk(clk), .reset(reset_local), .sensor(sensor),.walk_requst(wlk_requst), .reprogram(reprogram), .reset_sync(RESET), .sensor_sync(SEN_SYN),.wr_sync_out(WLK_SYNC),.prog_sync(PROG_SYNC));
	decoder deco_1( .reset(RESET), .count(COUNT), .clk(clk) , .c_out(c_out), .sel_out(sel_out));

endmodule
