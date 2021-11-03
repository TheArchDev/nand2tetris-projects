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
	// check if at end of for loop; ie if at final screen register
	@screenregister
	D=M
	// number of registers in screen output
	@8192
	D=D-A
	// starting location of screen output
	@SCREEN
	D=D-A
	@SCANINPUT
	D;JEQ

	// get paint colour
	@paintcolour
	D=M

	// set all pixels in given screen register to the colour
	@screenregister
	A=M
	M=D

	// increment to next screen address
	@screenregister
	M=M+1

	// repeat paint loop
	@PAINT
	0;JMP
