// This is a controller written for a VGA Monitor with resolution 1280 by 1024 with an refresh rate of 60 fps
// VGA Controller use to generate signals for the monitor
module VGAController (PixelClock,
							 inRed,
							 inGreen,
							 inBlue,
							 outRed,
							 outGreen,
							 outBlue,
							 VertSynchOut,
							 HorSynchOut,
							 XPosition,
							 YPosition);
//======================================================= 
// Parameter Declarations 				
//=======================================================
// Parameters are set for a 1280 by 1024 pixel monitor running at 60 frames per second
// X Screen Constants	 
parameter XLimit = 1688;
parameter XVisible = 1280;
parameter XSynchPulse = 112;
parameter XBackPorch = 248;
// Y Screen Constants
parameter YLimit = 1066;
parameter YVisible = 1024;
parameter YSynchPulse = 3;
parameter YBackPorch = 38;

//=======================================================			 
// Port Declarations 				
//=======================================================
input PixelClock;
input [7:0] inRed;
input [7:0] inGreen;
input [7:0] inBlue;
output [7:0] outRed;
output [7:0] outGreen;
output [7:0] outBlue;
output VertSynchOut;
output HorSynchOut;
output [10:0] XPosition;
output [10:0] YPosition;

//========================================================
// REG/WIRE declarations
//========================================================

reg [10:0] XTiming;
reg [10:0] YTiming;
reg HorSynch;
reg VertSynch;

//========================================================
// Structural coding
//========================================================
assign XPosition = XTiming - (XSynchPulse + XBackPorch);
assign YPosition = YTiming - (YSynchPulse + YBackPorch);


always@(posedge PixelClock)// Control X Timing
begin
	if (XTiming >= XLimit)
		XTiming <= 11'd0;
	else
		XTiming <= XTiming + 1;
end
	
always@(posedge PixelClock)// Control Y Timing
begin
	if (YTiming >= YLimit && XTiming >= XLimit)
		YTiming <= 11'd0;
	else if (XTiming >= XLimit && YTiming < YLimit)
		YTiming <= YTiming + 1;
	else
		YTiming <= YTiming;
end

always@(posedge PixelClock)// Control Vertical Synch Signal
begin
	if (YTiming >= 0 && YTiming < YSynchPulse)
		VertSynch <= 1'b0;
	else
		VertSynch <= 1'b1;
end
	
always@(posedge PixelClock)// Control Horizontal Synch Signal
begin
	if (XTiming >= 0 && XTiming < XSynchPulse)
		HorSynch <= 1'b0;
	else
		HorSynch <= 1'b1;
end
	
// Draw black in off screen areas of screen
assign outRed = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inRed : 8'b0;
assign outGreen = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inGreen : 8'b0;
assign outBlue = (XTiming >= (XSynchPulse + XBackPorch) && XTiming <= (XSynchPulse + XBackPorch + XVisible)) ? inBlue : 8'b0;

assign VertSynchOut = VertSynch;
assign HorSynchOut = HorSynch;


// Initialization registers block
initial
begin
	XTiming = 11'b0;
	YTiming = 11'b0;
	HorSynch = 1'b1;
	VertSynch = 1'b1;
end
	
	
endmodule 
