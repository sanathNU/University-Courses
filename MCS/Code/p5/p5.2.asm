//Block Transfer with overlap
org 00h
	mov r0,#3ah
	mov r1,#3fh
	mov r2,#0ah
	
	L1: mov a, @r0
	mov @r1, a
	dec r0
	dec r1
	djnz r2, L1
	J: sjmp J
end