// Program to add 2, 8 bit numbers
org 00h
	mov r0, #30h
	mov r1, #31h
	mov a, @r0
	add a,@r1
	mov r3,a
	H: sjmp H
end