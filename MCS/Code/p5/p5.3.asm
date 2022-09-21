//program to exchange chunks of data
org 00h
	mov r0, #30h
	mov r1, #40h
	mov r2, #0ah
	l1: mov a, @r0
	xch a, @r1
	xch a, @r0
	inc r0
	inc r1
	djnz r2,l1
	j: sjmp j
end