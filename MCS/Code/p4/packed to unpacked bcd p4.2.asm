// program to mask a unmasked bcd number
org 00h
	mov r0, #35h
	clr a
	mov a, r0
	anl a, #0fh
	mov r1, a
	mov a, r0
	anl a, #0f0h
	swap a
	mov r2, a
	s: sjmp s
end