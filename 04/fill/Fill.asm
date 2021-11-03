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

// LOOP PSEUDOCODE
// initially paint screen white
// while loop
//		check keyboard input
// 		if keyboard press
//			PAINT screen black
// 		else
//			PAINT screen white
//
// PAINT PSEUDOCODE
// for pixel in range(SCREEN)
//		set all bits/pixels to 1/black

// keyboard = 24576

// Put your code here.

	// Get starting address of screen, 16384
	@SCREEN
	D=A
	@screenaddress
	M=D

	// Store length of screen memory, 8192
	@8192
	D=A
	@screenlength
	M=D

	// Store address of keyboard
	@KBD
	D=A
	@keyboardaddress
	M=D

(WHILE)
	// initial for loop counter
	@i
	M=0

	@keyboardaddress
	A=M
	D=M
	@PAINTBLACK
	D;JNE
	@PAINTWHITE
	0;JMP

(PAINTWHITE)
	// for loop END logic check
	@i
	D=M
	@screenlength
	D=D-M
	@WHILE
	D;JEQ

	// update to next part of screen memory
	@i
	D=M
	@screenaddress
	A=D+M
	// set all pixels in this register to black
	M=0

	// increment for loop counter
	@i
	M=M+1

	// Continue loop
	@PAINTWHITE
	0;JMP

(PAINTBLACK)
	// for loop END logic check
	@i
	D=M
	@screenlength
	D=D-M
	@WHILE
	D;JEQ

	// update to next part of screen memory
	@i
	D=M
	@screenaddress
	A=D+M
	// set all pixels in this register to black
	M=-1

	// increment for loop counter
	@i
	M=M+1

	// Continue loop
	@PAINTBLACK
	0;JMP
