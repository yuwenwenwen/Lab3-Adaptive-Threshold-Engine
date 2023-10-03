module ate00(clk,reset,pix_data,bin,threshold);

////////////////
//input&output//
////////////////

input 		 clk;
input 	     reset;
input [7:0]  pix_data;
output 		 bin;
output [7:0] threshold;

//////////////////////////////////

reg [7:0] threshold;
reg bin;
 
reg [7:0] data [63:0];  
reg [5:0]counter;
reg [7:0]min;
reg [7:0]max;
reg [4:0]block;
//reg [4:0]blockall;
reg [7:0]average;
reg [8:0]sum;
integer i; 


//block 
//block_all 取餘數=0 or 1 
always@(posedge clk or posedge reset)begin
if(reset)begin
    block<=0;  
end
else if((counter==63) && (block==5))begin
    block<=0;
end
else if(counter==63)begin
    block<=block+1;
end
end
    


//counter
always@(posedge clk or posedge reset)begin
if(reset)begin
    counter<=0;
end
else begin
    counter<=counter+1;
end
end



//紀錄pix_data數據
always@(posedge clk)begin
if(reset)begin
    for(i=0; i<=63; i=i+1)begin
        data[i]<=0;end
end
else begin
    data[counter]<=pix_data;
end
end


//max
always@(posedge clk)begin
if(reset)begin
    max<=0;
end
else if(counter==0)begin
    max<=pix_data;
    end
else if(pix_data > max)begin
    max<=pix_data;
    end
end

//min
always@(posedge clk)begin
if(reset)begin
    min<=0;
end
else if(counter==0)begin
    min<=pix_data;
    end
else if(pix_data < min)begin
    min<=pix_data;
    end
end



//sum
always@(*)begin
    sum=min+max;
end

//average
always@(*)begin
if(sum[0])begin
    sum=sum+1;
    average=sum/2;end
else begin
    average=sum/2; end
end   

//bin
always@(posedge clk or posedge reset)begin
if(reset)begin
    bin <= 0; end
else begin
    if((block==1) || (block==0))begin 
        bin<=0;end
    else if((counter==0) && (data[0] >= average)) begin 
        bin<=1;end
    else if ((counter!=0) && (data[counter] >= threshold))begin
        bin<=1;end
    else begin
        bin<=0;end
    end
end
  
//threshold
always@(posedge clk or posedge reset)begin
if(reset)begin
    threshold <= 0;
end
else if(counter==0)begin
    if (((block==1) || (block==0)))
        threshold<=0;
    else
        threshold<=average;
end
end








endmodule