//program to convert hex value to decimal value
org 00h
	
	mov a, #0ffh //input of hex humber
	mov b, #100  //dividing by 100 for the lowest bit
	div ab
	
	mov r3, a    //moving the most significant bit to r3
	mov a, 0f0h  //sending whatever values left in b again (0f0 is the interal address of b)
	
	mov b, #10   //dividing by 10 for 2nd digit
	div ab        
	mov r2, a    //second important digit
	mov r1, b    //least significant digit

end
	
	
	
	
	
	
	
	