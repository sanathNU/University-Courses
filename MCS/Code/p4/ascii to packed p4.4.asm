// program to convert
// ASCII code to packed BCD
org 00h
	mov r0, #34h
	mov a, r0
	anl a, #0fh
	mov r0, a
	mov r1, #35h
	mov a, r1
	anl A, #0fh
	swap A
	mov r1,a
	orl a, r0
	mov r3,a
	h: sjmp h
end
		