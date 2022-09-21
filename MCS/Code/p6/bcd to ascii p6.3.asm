//Program to convert BCD to ASCII

org 00h
	mov a, #98h
	mov r2, a
	anl a,#0fh // removing the upper bit
	orl a,#30h 
	mov r6,a   //storing the first number in r6
	mov a,r2   
	anl a,#0f0h// removing the lower bit
	swap a     // swapping the nibbles
	orl a,#30h
	mov r2,a   //storing the second number in r2
	
end
	
	
	
	
	
	
	
	