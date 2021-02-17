// Jacob Jimenez
// January 27th, 2020
// Programming Lab: Address Alignment
// Topic: Address alignment, execution time, and the .REPT and .ENDR directives
// Lab 4A for COEN20

// Compile Requirements
	.syntax		unified
	.cpu		cortex-m4
	.text

	.global		OffBy0
	.thumb_func
	.align

// void OffBy0(void *dst, const void *src);
OffBy0:

	// OffBy0 function code start
	// Repetition starts with 
	.REPT		250
	LDR			R2,[R1],4 // Load register
	STR			R2,[R0],4 // Store register
	.ENDR
	BX			LR
	// OffBy0 function code end

	.global		OffBy1
	.thumb_func
	.align

// void OffBy1(void *dst, const void *src);
OffBy1:

	// OffBy1 function code start
	// First loop
	.REPT		3
	LDRB		R2,[R1],1 // Load register
	STRB		R2,[R0],1 // Store register
	.ENDR

	// Second loop
	.REPT		249
	LDR			R2,[R1],4 // Load register
	STR			R2,[R0],4 // Store register
	.ENDR

	// Third loop
	.REPT		1
	LDRB		R2,[R1],1 // Load register
	STRB		R2,[R0],1 // Store register
	.ENDR

	BX			LR
	// OffBy1 function code end

	.global		OffBy2
	.thumb_func
	.align

// void OffBy2(void *dst, const void *src);
OffBy2:

	// OffBy2 function code start
	// First loop
	.REPT		2
	LDRB		R2,[R1],1 // Load register
	STRB    	R2,[R0],1 // Store register
	.ENDR

	// Second loop
	.REPT		249
	LDR			R2,[R1],4 // Load register
	STR			R2,[R0],4 // Store register
	.ENDR

	// Third loop
	.REPT		2
	LDRB		R2,[R1],1 // Load register
	STRB		R2,[R0],1 // Store register
	.ENDR

	BX			LR
	// OffBy2 function code end

	.global		OffBy3
	.thumb_func
	.align

// void OffBy3(void *dst, const void *src);
OffBy3:

	
	// OffBy3 function code start
	// First loop
	.REPT		1
	LDRB		R2,[R1],1 // Load register
	STRB		R2,[R0],1 // Store register
	.ENDR

	// Second loop
	.REPT		249
	LDR			R2,[R1],4 // Load register
	STR			R2,[R0],4 // Store register
	.ENDR

	// Third loop
	.REPT		3
	LDRB		R2,[R1],1 // Load register
	STRB		R2,[R0],1 // Store register
	.ENDR

	BX			LR
	// OffBy3 function code end

	.end

