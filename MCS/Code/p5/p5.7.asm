// Code to sort ten numbers in descending order
org 00h
	mov r3,#09h  //setting for 10 numbers
	l3: mov r0, #30h //location of numbers
	mov r2,03h
	mov a,@r0 //moving the first number to a
	mov r1,a  //i = no[0]
	
	l1: inc r0 
	mov r1,a //keeping the first number in r1 number
	mov a, @r0 // moving the next element to a
	subb a,r1 // a-value at r1
	jc l2   // if carry doesn't exist, a(second number) is greater than r1(first number) so xchange, else go to next part
	mov a,@r0 //getting back the value to exchange
	xch a,r1  //exchanging
	mov @r0,a //move the smaller value to second location
	dec r0 
	mov @r0,01h //moving the bigger number to earlier location
	inc r0  
	
	l2: mov a,@r0
	djnz r2,l1 //first loop
	djnz r3,l3 //second loop
	J: sjmp J
end