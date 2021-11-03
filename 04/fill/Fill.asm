// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

	// Store length of screen memory, 8192, in a variable
	@8192
	D=A
	@screenlength
	M=D

(SCANINPUT)
	// initialise counter used in for loop to paint all screen registers
	@i
	M=0

	// check keyboard input
	@KBD
	D=M

	// paint screen black if non-zero input
	@PAINTBLACK
	D;JNE

	// otherwise paint screen white
	@PAINTWHITE
	0;JMP

(PAINTWHITE)
	// check if end of for loop, ie if have painted all screen registers
	@i
	D=M
	@screenlength
	D=D-M
	@SCANINPUT
	D;JEQ

	// update to next register in screen memory
	@i
	D=M
	@SCREEN
	A=D+A
	// set all pixels in this register to white
	M=0

	// increment for loop counter
	@i
	M=M+1

	// Continue loop
	@PAINTWHITE
	0;JMP

(PAINTBLACK)
	// check if end of for loop, ie if have painted all screen registers
	@i
	D=M
	@screenlength
	D=D-M
	@SCANINPUT
	D;JEQ

	// update to next register in screen memory
	@i
	D=M
	@SCREEN
	A=D+A
	// set all pixels in this register to black
	M=-1

	// increment for loop counter
	@i
	M=M+1

	// Continue loop
	@PAINTBLACK
	0;JMP
