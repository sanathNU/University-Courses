// program to find the cube of a number
//main number present in 30h, results will be stored from 31h-33h
org 00h
	mov r0, #30h //r0 = 30h
	mov a, @r0   // a = num
	mov r1, a 	 //r1 = num
	mov b,a      // b = num
	mul ab		 // a = num^2L, b = num^2H
	//first multiplication done
	mov r2, b    // r2 = num^2H
	mov b, r1    // b  = num
	mul ab		//  a = num^3L , b = num_int^3H
	inc r0		
	mov @r0, a    //31h = num^3L
	mov r3, b     // r3 = num_int^3H
	mov a, r1     // a = num
	mov b, r2     // b = num^2H
	mul ab        // a = num_int^3L, b = num^3H
	add a, r3     // a = num_int^3L + num_int^3H
	inc r0   
	mov @r0, a    // 32h = num^2I
	inc r0        
	//mov a, b      // a = num^3H //this works without moving a and all..indirect addressing works
	mov @r0, b    // 33h = num^3H
	s: sjmp s
end
	