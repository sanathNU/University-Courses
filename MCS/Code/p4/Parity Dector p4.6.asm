//Parity Detector 
ORG 00h
MOV R0, #55h
MOV R2, #00h // 0's count
MOV R3, #00h // 1's count
MOV R1, #08h // Loop counter is initialized to 0x08
MOV A, R0 

L1: RRC A
    JC L2 // If carry is 0, goto L2
    INC R3
    AJMP L3
L2: INC R2 // If carry count is 0, zeros count is incremented
L3: DJNZ R1, L1
H: SJMP H
END
	
	//55h == 0101 0101 --4 1's and 4 0's