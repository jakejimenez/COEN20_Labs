// Jacob Jimenez
// February 10th, 2021
// reversi.s
// Lab 6E

    .syntax     unified
    .cpu        cortex-m4
    .text       

// int Between (int min, int value, int max);
    .global     Between
    .align
    .thumb_func

Between:

    // Register Stores: R0 = min, R1 = value, R2 = max
    // BEGIN Between function

    // Perform arithmetic
    SUB     R1,R1,R0 // R1 = R1 - R0 ----> (value - min)
    SUB     R0,R2,R0 // R0 = R2 - R0 ----> (max - min)
    
    // Compare both results using CMP
    CMP     R0,R1 // R0 > R1

    // IT Block
    ITE     LS
    LDRLS   R0,=0
    LDRHI   R0,=1

    // Return function
    BX      LR

    // End Between function

// int Count (int cells[], int numb, int value);
    .global     Count
    .align
    .thumb_func

Count:
    // Register Stores: R0 = cells[0], R1 = numb, R2 = value
    // BEGIN Count function
    LDR     R12,=0 // R12 = 0
    ADD     R1,R0,R1,LSL 2 //   beginning index of array cells[] + numb (or the incrementer) by a logical shift left of 2 = R1

L1:
    // Compare numb to 0 
    CMP     R0, R1 // R1 > R1
    BEQ     Exit  // Branch to exit loop if equal

    // Add compare to cells[numb] to R2
    LDR     R3,[R0],4 // Auto incrementing
    CMP     R3,R2 // Compare R3 > R2
    IT      EQ // If equal
    ADDEQ   R12,R12,1 // Add R12 = R12 + 1
    B       L1 // Branch back to beginning of loop

 Exit:
    MOV     R0,R12 // Move R12 into R0
    BX      LR // Return function

    // END Count function
    .end