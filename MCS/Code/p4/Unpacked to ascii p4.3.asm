//program to convert unpacked bcd to ascii
org 00h
	mov r0, #04h
	mov r1, #05h
	mov a, r0
	orl a, #30h
	mov r0, a
	mov a, r1
	orl a, #30h
	mov r1, a
	s: sjmp s
end