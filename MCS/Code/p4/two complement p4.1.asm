// program to find 2's complement of a number
org 00h
	mov r3, #45h
	mov a, r3
	cpl a
	add a, #1
	mov r4, a
	s: sjmp s
end
	