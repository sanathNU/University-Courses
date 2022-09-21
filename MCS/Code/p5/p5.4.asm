//MOvement of data from internal memory to external memory
org 00h
	mov r1,#0ah
	mov r0,#30h
	mov dptr,#1000h
	
	L1: mov a,@r0
	movx @dptr,a
	inc r0
	inc dptr
	djnz r1,L1
	J: sjmp J
end