// program to find the largest of ten numbers
org 00h
	mov r2, #0ah
	mov r0, #30h
	mov a, @r0
	mov r1, a
	
	l1: inc r0
	mov a,@r0
	clr c
	subb a,r1
	jc l2
	mov a,@r0
	mov r1,a
	
	l2: djnz r2,l1
	J: sjmp J
end