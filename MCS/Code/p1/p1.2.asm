// Program to add two 16 bit numbers
org 00h
	clr c
	mov a, 30h
	add a,32h
	mov r6,a
	mov a, 31h
	addc a, 33h
	mov r7,a
	H: sjmp H
end