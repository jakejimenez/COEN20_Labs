// Jacob Jimenez
// January 15th 2020

#include <stdint.h>
#include <math.h>

uint32_t Bits2Unsigned(int8_t bits[8]) {
	
	int x = 0;
	for (int i = 7; i >= 0; i--) {
		x = 2 * x + bits[i];
	}
	
	return x;
}
// Convert array of bits to unsigned int
int32_t Bits2Signed(int8_t bits[8]) {
	
	// Call above function and convert the result to int32_t
	uint32_t beforeConv = Bits2Unsigned(bits);
	int32_t afterConv = (int32_t) beforeConv;
	
	if (afterConv > 127) {
		afterConv -= 256;
	}
	
	// Return the value
	return afterConv;
}
// Convert array of bits to signed int.
void Increment(int8_t bits[8]) {
	
	// Increment from 0 to 1 and 1's to 0's
	for (int i = 0; i < 8; i++) {
		if (bits[i] == 0) {
			bits[i] = 1;
			return;
		} else {
			bits[i] = 0;
		}
	}

}
// Add 1 to value represented by bit pattern
void Unsigned2Bits(uint32_t n, int8_t bits[8]) {
	// Opposite functionality of Bits2UnSigned, n % 2
	for (int x = 0; x < 8; x++) {
		bits[x] = n % 2;
		n = n / 2;
	}
}
// Opposite of Bits2Unsigned.
