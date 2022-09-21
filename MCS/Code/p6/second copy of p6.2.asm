//program to convert decimal to hex
org 00h
	mov a, #99h
	mov r0, a
	mov b, #16h //divide first by 16 for lower byte
	div ab
	add a, #0
	da a
	mov r1,a
	
	mov a,b
	add a,#0
	da a
	
	swap a
	orl a,r1
	mov r2,a
	s: sjmp s
end