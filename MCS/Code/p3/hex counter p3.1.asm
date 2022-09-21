// program to use HEX up and down counter

org 00h
	mov a, #00h
	cjne a, 30h, Down //if a not equal to 0x30h = 00h, go to down counting
	
	Up: mov r0, #00h
	Loop1: inc r0      //main loop for up counting
		   cjne r0, #0ffh , Loop1  //values will be either <0ffh or equal to ffh
		   sjmp Up       // this is to make sure the register overflows from ff to 00
								   // before moving on to down counting
	
	Down: mov r0, #0ffh //main loop for down counting
	Loop2: dec r0 
		   cjne r0,#00h,Loop2 //decrease from 0ffh to 00h and then exit this loop
		   sjmp Down			//this will keep on executing the down counter forever
	s: sjmp s
end