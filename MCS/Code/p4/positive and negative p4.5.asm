//program to count number of positive and negative
//values in 10 bytes of data from 0x30-0x3a
org 00h
	mov r3,#00h //positive number counter
	mov r4,#00h //counter is initiliazed to 0 negative no's
	mov r2,#0ah //counter is initlaized to 10
	mov r0,#30h //memory pointer
	
	L1: mov a, @r0
	rlc a
	inc r0
	jc L2
	inc r3
	ajmp L3
	L2: inc r4
	L3: djnz r2, L1
	
	s: sjmp s
end