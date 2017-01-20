# Pong-Game
This Pong Game was programmed with Verilog using Altera's DE2-115 Field-Programmable Gate Array (FPGA) Board and a VGA Interface

Altera's DE2-115 Board can be purchased from: http://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&No=502
  - Note: Altera has been acquired by Intel as of December 28, 2015.

The main code files can be found in the "src" folder with VGAInterface.v being the top module.

Main Goals for this project:
  - Learning how to use ALtera's FPGA Board
  - Learning how to draw color patterns on a computer monitor by implementing RGB Signals with the VGA Port
  - Utilizing Verilog to create a game of Pong
  
Project Features:
  - Implementing green borders on the screen to indicate the left and right boundaries
  - Implementing magenta borders on the screen to indicate top and bottom boundaries
  - Two blue rectangles are used as paddles
  - A red circle as the ball
  - Two seven-segment displays on the FPGA Board are used to display the players' scores. 
  - SW0 on the FPGA Board is used to reset the scores and the position of the ball
  - Push Buttons 0 and 1 are set up to move the left paddle up and down
  - Push Buttons 2 and 3 are set up to move the right paddle up and down
  - The paddles will move vertically but are now allowed to overlap the magenta borders
  - The ball should always be moving diagonally on the screen - X and Y component for movement
  - The background of the game is set to black
