
module sine_wave_gen(Clk,rst,ctrl,data_out,p_op,b_op);
    input Clk,rst;
	 input [1:0]ctrl;	
    output [7:0] data_out; 
    reg [7:0] sine [0:35];
    integer i;  
    reg [7:0] data_out; 
    output wire p_op,b_op;
    reg [31:0]counter;
	 
	 reg p,b;
	 
    initial begin
        i = 0;
        sine[0] = 0;
        sine[1] = 4;
        sine[2] = 9;
        sine[3] = 16;
        sine[4] = 31;
        sine[5] = 45;
        sine[6] = 60;
        sine[7] = 75;
        sine[8] = 90;
        sine[9] = 105;
		  sine[10] = 115;
        sine[11] = 120;
        sine[12] = 123;
        sine[13] = 125;
        sine[14] = 127;
        sine[15] = 127;
        sine[16] = 127;
        sine[17] = 125;		  
        sine[18] = 123;
        sine[19] = 120;
        sine[20] = 115;
        sine[21] = 105;
        sine[22] = 90;
        sine[23] = 75;
        sine[24] = 60;
        sine[25] = 45;
        sine[26] = 35;
        sine[27] = 27;
        sine[28] = 20;
        sine[29] = 14;
        sine[30] = 8;
        sine[31] = 5;
		  sine[32] = 3;
		  sine[33] = 1;
		  sine[34] = 0;
		  sine[35] = 0;
    end
    
	 assign p_op=p;
	 assign b_op=b;
	

always@(posedge Clk)
begin

if(rst)
begin
counter=32'b0;
end
else if(ctrl==2'b00)
begin

if(counter>=0 && counter<70)
p=1'b1;
else
p=1'b0;

if(counter<456)
counter=counter+1;
else if(counter==456)
counter=0;
    
    
end    
else if(ctrl==2'b10)
begin

//counter=counter+1;

if(counter>=0 && counter<176)
b=1'b1;
else if(counter>=176 && counter<246)
b=1'b0;
else if(counter>=246 && counter<316)
b=1'b1;
else if(counter>=316 && counter<351)
b=1'b0;
else if(counter>=351 && counter<386)
b=1'b1;
else if(counter>=386 && counter<421)
b=1'b0;
else if(counter>=421 && counter<456)
b=1'b1;

if(counter<456)
counter=counter+1;
else if(counter==456)
counter=0;



end


end


	
	 always@(posedge Clk)
    begin
	 
	 if(ctrl==2'b00 && p==1'b1)
	 begin
        data_out = sine[i];
        i = i+1;
        if(i==35)
            i = 0;
    end
    else if(ctrl==2'b01)
	 begin
        data_out = sine[i];
        i = i+2;
        if(i>34)
            i = 0;
    end
    else if(ctrl==2'b10  && b==1'b1)
	 begin
        data_out = sine[i];
        i = i+1;
        if(i==35)
            i = 0;
    end
    else if(ctrl==2'b10 && b==1'b0)
	 begin
        data_out = sine[i];
        i = i-1;
        if(i==0)
            i = 35;
    end
    else
        data_out = 0;
    
	 
    end
	 	 
	  
	 
endmodule


