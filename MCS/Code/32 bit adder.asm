//Random Program to do 32 bit Addition
//Since 8bit=1 byte, and each register is 1 byte in sizse, we can fit a 32 bit number in 4 registers
//So let the first few numbers be stored in R4-R0 follwing the same MSB-LSB thing...same with other number as R7-R4
//									R3 R2 R1 R0
//								*	R7 R6 R5 R4
//								----------------------------------
//							    B7 B6 B5 B4 B3 B2 B1 B0

// In total we would have to do 25 operations including 16 mulitplications and 9 additions
// Since both numbers are 32 bit, the answer is going to be 64 bit or 8 registers worth

//As given idea by a paper, I would store the addends in register bank 0 and the answer in register bank 1
//Since there are 8 register, I will list out the total logical expression for each byte in the 8 byte answer
// B0 - R4*R0												
// B1 -(R4*R1)+(R5*R0)
// B2 -(R4*R2)+(R5*R1)+(R6*R0)
// B3 -(R4*R3)+(R5*R2)+(R6*R1)+(R7*R0)
// B4 - 	   (R5*R3)+(R6*R2)+(R7*R1)
// B5 - 	   		   (R6*R3)+(R7*R2)
// B6 -						   (R&*R3)
// B7 -	This is just the last extra bit left of B6 since it is a 16 bit number

// Ahh...I wish I could write a loop in assemly for adding 16 bit numbers....
// I will use the register bank from 30h to 4Fh for storing the addition result answers and r0 to r7 of bank 2 for storing the final answers
// I am planning to use nested calls for performing 16 bit addition as I cannot write assembly for each addition.

//This is main function where all operations will be implemented which also contains calls and all
org 00h
	//(R4*R0)
	mov a,r4 ;
	mov b,r0
	mul ab
	mov a,50h
	mov b,51h
	
	//(R4*R1)
	mov a,r4
	mov b,r1
	mul ab
	mov a,52h
	mov b,53h
	
	//(R4*R2)
	mov a,r4
	mov b,r2
	mul ab
	mov a,54h
	mov b,55h

	//(R4*R3)
	mov a,r4
	mov b,r3
	mul ab
	mov a,56h
	mov b,57h
//---------------------------------------
	//(R5*R0)
	mov a,r5
	mov b,r0
	mul ab
	mov a,58h
	mov b,59h

	//(R5*R1)
	mov a,r5
	mov b,r1
	mul ab
	mov a,5ah
	mov b,5bh

	//(R5*R2)
	mov a,r5
	mov b,r2
	mul ab
	mov a,5ch
	mov b,5dh

	//(R5*R3)
	mov a,r5
	mov b,r3
	mul ab
	mov a,5eh
	mov b,5fh
//-----------------------------------------
//(R6*R0)
	mov a,r6
	mov b,r0
	mul ab
	mov a,60h
	mov b,61h

	//(R6*R1)
	mov a,r6
	mov b,r1
	mul ab
	mov a,62h
	mov b,63h

	//(R6*R2)
	mov a,r6
	mov b,r2
	mul ab
	mov a,64h
	mov b,65h

	//(R6*R3)
	mov a,r6
	mov b,r3
	mul ab
	mov a,66h
	mov b,67h
//-------------------------------------------
//(R7*R0)
	mov a,r7
	mov b,r0
	mul ab
	mov a,68h
	mov b,69h

	//(R7*R1)
	mov a,r7
	mov b,r1
	mul ab
	mov a,6ah
	mov b,6bh

	//(R7*R2)
	mov a,r7
	mov b,r2
	mul ab
	mov a,6ch
	mov b,6dh

	//(R7*R3)
	mov a,r7
	mov b,r3
	mul ab
	mov a,6eh
	mov b,6fh
//---------------------------------------------
// Made a huge mistake here, insteak of adding requentially, I'm just adding they bit wise, So the answer would be 16 bytes long instead of 8 bytes....so gotta do changes
	mov psw, #08h
	mov r0, 50h
	mov r1, 51h //B0 - R4*R0
	
	mov 34h,52h
	mov 35h,53h
	mov 36h,58h
	mov 37h,59h
	lcall add16
	mov r2,7fh
	mov r3,7eh // B1 -(R4*R1)+(R5*R0)
	
	//(R4*R2)+(R5*R1)+(R6*R0) 54,55-5a,5b-60,61
	mov 34h,54h
	mov 35h,55h
	mov 36h,5ah
	mov 37h,5bh
	lcall add16
	mov 34h,7fh
	mov 35h,7ef
	mov 36h,60h
	mov 37h,61h
	lcall add16
	mov r4,7fh
	mov r5,7eh
	
// B3 -(R4*R3)+(R5*R2)+(R6*R1)+(R7*R0)	56,57--5c,5d--62,63--68,69
	mov 34h,56h
	mov 35h,57h
	mov 36h,5ch
	mov 37h,5dh
	lcall add16
	mov 34h,7fh
	mov 35h,7ef
	mov 36h,62h
	mov 37h,63h
	lcall add16
	mov 34h,7fh
	mov 35h,7ef
	mov 36h,68h
	mov 37h,69h
	lcall add16
	mov r6,7fh
	mov r7,7ef

// B4 - 	   (R5*R3)+(R6*R2)+(R7*R1)  5e,5f--64,65--6a,6b
	mov 34h,5eh
	mov 35h,5fh
	mov 36h,64h
	mov 37h,65h
	lcall add16
	mov 34h,7fh
	mov 35h,7ef
	mov 36h,6ah
	mov 37h,6bh
	lcall add16
	
	s: sjmp s
		
org 300h
		add8: mov a,30h
		addc a,31h
		ret
		
		add16: mov 30h, 34h
		mov 31h,36h
		lcall add8
		//setb psw.4
		//clr psw.3
		mov 7fh,a
		//mov r0,a
		mov 30h,35h
		mov 31h,37h
		lcall add8
		//mov r1,a
		mov 7eh,a
		
		ret
	
end