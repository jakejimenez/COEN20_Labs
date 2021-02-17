// Jacob Jimenez
// February 3rd, 2021
// automobile.s
// Lab 5D for COEN 20L

// Directives
    .syntax     unified
    .cpu        cortex-m4
    .text

// uint64_t TireDiam (uint32_t W, uint32_t A, uint32_t R);
    .global TireDiam
    .thumb_func

TireDiam:
    // Registers: R0 = W, R1 = A, R2 = R
    // Begin TireDiam
    PUSH    {R4, LR}
    // Loads
    LDR     R3,=1270 // Load R3 = 1270

    // Arithmetic
    MUL     R4,R0,R1 // (A x W) -> R0 x R1 = R4
    UDIV    R0,R4,R3 // Unsigned division A x W / 1270 -> (R4 / 1270) = R0
    ADDS    R1,R0,R2 // R + (A x W) / 1270 -> R + R0 -> R2 + R0 = R0
    MLS     R0,R3,R0,R4 // Calculate remainder (R4 - (R3 * R0)) = R1

    POP     {R4, LR}

    // Return
    BX      LR // Return R1 = Quotient, R0 = Remainder
    // End TireDiam

// uint64_t TireCirc (uint32_t W, uint32_t A, uint32_t R);
    .global TireCirc
    .thumb_func

TireCirc:
    // Registers: R1 = Quotient, R0 = Remainder
    // Begin TireCirc
    // Push registers {R4, R5, R6} and LR onto the stack
    PUSH    {R4, R5, R6, LR}
    // Call TireDiam
    BL      TireDiam

    // Local Registers
    LDR     R2,=1587500 // Load constant into R2 = 1587500 [Divisor]
    LDR     R3,=4987290 // Load constant into R3 = 4987290
    LDR     R4,=3927 // Load constant into R4 = 3927

    // Arithmetic
    MUL     R5,R4,R0 // Multiply R4 * R0 -> R5
    MLA     R6,R3,R1,R5 // Multiply (R3 * R1) + R5 = R6 [Dividend]
    UDIV    R1,R6,R2 // Unsigned division R6 / R2 = R0 [Quotient]
    MLS     R0,R2,R1,R6 // Calculate remainder (R6 - (R2 * R0)) = R1

    // Pop registers {R4, R5, R6} and LR onto the stack
    POP     {R4, R5, R6, LR}

    // Return R1 = Quotient, R0 = Remainder
    BX      LR
    // End TireCirc

    .end