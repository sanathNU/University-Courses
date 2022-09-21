//Program to find the square of a number
org 00h
	clr c
	mov a, #5h
	mov b,a
	mul ab
	mov r0,a
	mov r1,b
	h: sjmp h
end