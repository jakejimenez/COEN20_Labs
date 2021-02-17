// Jacob Jimenez
// January 22nd 2020
// functions.s
// Lab 2a: Functions and Parameters

	.syntax		unified
	.cpu		cortex-m4
	.text
	
// int32_t Add(int32_t a, int32_t b);
	.global		Add
	.thumb_func
	
Add:
	ADD		R0,R0,R1
	BX		LR
	
// int32_t Less1(int32_t a)
	.global		Less1
	.thumb_func
	
Less1:
	SUB		R0,R0,1
	BX		LR
	
// int32_t Square2x(int32_t x)
	.global		Square2x
	.thumb_func

Square2x:
	// Adding register 0 with register 0 with the function Square
	ADD		R0,R0,R0
	B		Square
	
// int32_t Last(int32_t x)
	.global		Last
	.thumb_func
	
Last:
	// Preserve R4
	PUSH	{R4,LR}
	// Move R0 to R4
	MOV		R4,R0
	// Call and link the SquareRoot Function
	BL		SquareRoot
	// Add R0 and R4
	ADD		R0,R0,R4
	POP		{R4,PC}		
.end