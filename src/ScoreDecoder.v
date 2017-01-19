module ScoreDecoder(in, Hex2, Hex1);
input [4:0]in;
output reg [6:0] Hex2,Hex1;

	parameter zero = 7'b1000000;
	parameter one = 7'b1111001;
	parameter two = 7'b0100100;
	parameter three = 7'b0110000;
	parameter four = 7'b0011001;
	parameter five = 7'b0010010;
	parameter six = 7'b0000010;
	parameter seven = 7'b1111000;
	parameter eight = 7'b0000000;
	parameter nine = 7'b0011000;
		
	parameter blank = 7'b1111111;
	
	always@(*) begin
	case(in)
		0:		begin
				Hex1 <= zero;
				Hex2 <= blank;
				end
		1:		begin
				Hex1 <= one;
				Hex2 <= blank;
				end
		2:		begin
				Hex1 <= two;
				Hex2 <= blank;
				end
		3:		begin
				Hex1 <= three;
				Hex2 <= blank;
				end
		4:		begin
				Hex1 <= four;
				Hex2 <= blank;
				end
		5:		begin
				Hex1 <= five;
				Hex2 <= blank;
				end
		6:		begin
				Hex1 <= six;
				Hex2 <= blank;
				end
		7:		begin
				Hex1 <= seven;
				Hex2 <= blank;
				end
		8:		begin
				Hex1 <= eight;
				Hex2 <= blank;
				end
		9:		begin
				Hex1 <= nine;
				Hex2 <= blank;
				end
		10:	begin
				Hex1 <= zero;
				Hex2 <= one;
				end
		11:	begin
				Hex1 <= one;
				Hex2 <= one;
				end
		12:	begin
				Hex1 <= two;
				Hex2 <= one;
				end
		13:	begin
				Hex1 <= three;
				Hex2 <= one;
				end
		14:	begin
				Hex1 <= four;
				Hex2 <= one;
				end
		15:	begin
				Hex1 <= five;
				Hex2 <= one;
				end
	endcase
	end
	
	endmodule
	