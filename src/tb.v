
`timescale 1ns/10ps
`define CYCLE      10.0 
`define PAT        "./golden.txt"

module testbench;
reg clk,rst,flag;
wire [3:0]out;


reg [3:0] expect_v [1:30];
reg [4:0]cnt=0;
reg [4:0]err=0;

shifter s0(.clk(clk),.rst(rst),.flag(flag),.out(out));


always begin #(`CYCLE/2) clk=~clk; end

initial begin
	$readmemb(`PAT,expect_v);
	clk=0;
	rst=0;
	flag=0;
		
    @(posedge clk);  #2 rst = 1'b1; 
    #(`CYCLE*2);  
    @(posedge clk);  #2  rst = 1'b0;
	#(`CYCLE*11); flag=1;
	#(`CYCLE*11); flag=0;
	@(negedge clk); flag=1;
	@(negedge clk); flag=0;
	@(negedge clk); flag=1;


end
/*
initial begin
    $fsdbDumpfile("shifter.fsdb");
    $fsdbDumpvars();
    $fsdbDumpMDA;
end*/

always@(posedge clk)
begin
	cnt<=cnt+1;
	//your[cnt]<=out;
	//$display("out:%b",out);
end


always@(negedge clk)
begin
	if(out!==expect_v[cnt])
	begin
		err=err+1;
		$display("your:%b , expect:%b",out,expect_v[cnt]);
	end
end

initial begin
	wait(cnt==31); 
	if(err==0)
	begin
		$display("----------------------------------");
		$display("-- Simulation finish,  ALL PASS --");
		$display("            $$              ");
        $display("           $  $");
        $display("           $  $");
        $display("          $   $");
        $display("         $    $");
        $display("$$$$$$$$$     $$$$$$$$");
        $display("$$$$$$$               $");
        $display("$$$$$$$              $");
        $display("$$$$$$$              $");
        $display("$$$$$$$              $");
        $display("$$$$$$$              $");
        $display("$$$$$$$$$$$$         $$");
        $display("$$$$$      $$$$$$$$$$");
	end
	else
	begin
		$display("----------------------------------");
		$display("------ There is %d errors --------",err);
		$display("-- FAIL! Please check your code --");
		$display("----------------------------------");
	end
	$finish;
end

/*
integer i,fp_w;
initial begin
	wait(cnt==31);  
   
	fp_w = $fopen("golden.txt", "w");

	for(i =1 ;i<31;i=i+1)
	   begin
		$fwrite(fp_w,"%b\n",your[i]);
	   end

	$fclose(fp_w);
end	*/

endmodule