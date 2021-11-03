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

	// store length of screen memory in a variable
	@8192
	D=A
	@screenlength
	M=D

(SCANINPUT)
	// initialise counter used in for loop to paint all screen registers
	// TODO can remove??
	@i
	M=0

	// initialise screen register variable with start of screen memory
	@SCREEN
	D=A
	@screenregister
	M=D

	// check keyboard input
	@KBD
	D=M

	// paint screen black if non-zero input
	@PAINTBLACK
	D;JNE

	// otherwise paint screen white
	@PAINTWHITE

	// always repeat loop to keep scanning keyboard input
	0;JMP

(PAINTWHITE)
	// input to set all pixels in a 16-bit screen register to 0
	@paintcolour
	M=0
	@PAINT
	0;JMP

(PAINTBLACK)
	// input to set all pixels in a 16-bit screen register to 1
	@paintcolour
	M=-1
	@PAINT
	0;JMP

(PAINT)
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

	// get paint colour
	@paintcolour
	D=M
	@screenregister
	A=M
	// set all pixels in this register to the colour
	M=D

	// increment for loop counter
	@i
	M=M+1
	// increment address as well
	@screenregister
	M=M+1

	// Continue loop
	@PAINT
	0;JMP
