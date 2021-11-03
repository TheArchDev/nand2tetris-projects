// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
	// x = R0
	@R0
	D=M
	@x
	M=D

	// y = R1
	@R1
	D=M
	@y
	M=D

	// sum = 0
	@sum
	M=0

	// clear final output field, R2
	@R2
	M=0

	// i = 0
	@i
	M=0

(LOOP)
	// if i>=y, then END
	@i
	D=M
	@y
	D=D-M
	@SET
	D;JEQ

	// sum = sum + x
	@x
	D=M
	@sum
	M=M+D

	// i++
	@i
	M=M+1

	// loop again
	@LOOP
	0;JMP

(SET)
	// Set final output, R2, equal to sum variable
	@sum
	D=M
	@R2
	M=D

(END)
	@END
	0;JMP