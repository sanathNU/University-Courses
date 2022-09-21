//Data transfer without overlap
ORG 00H
MOV R0, #30H // Copy address 30h to R0
MOV R1, #40H // Copy address 40h to R1
MOV R2, #0AH // Set up a counter using R2

L1: MOV A, @R0 // Move value pointed by R0 to A
    MOV @R1, A // Copy data to address pointed by R1
    INC R0
    INC R1
    DJNZ R2, L1 // Continue till entire data is copied
H: SJMP H
END