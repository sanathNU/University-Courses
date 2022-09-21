// Block transfer of 10bytes data from 
//external memory to internal memory from 1000h to 30h
org 00h
	mov r1, #0ah
	mov r0, #30h
	mov dptr, #1000h
	l1: movx a,@dptr
	mov @r0, a
	inc r0
	inc dptr
	djnz r1,l1
	J: sjmp J
end