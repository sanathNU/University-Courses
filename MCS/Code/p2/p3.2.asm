//Program for a decimal counter!
ORG 00H
MOV R0, #30H
CJNE @R0, #00H, DOWN  //conditional for doing up or down counting

UP: MOV A, #00H
ADD A, #00H
DA A			//initializing the value of decimal 00
MOV R1, A		//setting up a backup value of the count in r1
L1: INC A
ADD A, #00H
DA A			//incrementing by 1 and converting to decimal if necessary
MOV R1, A
CJNE A, #99H, L1 //end of loop , keep repeating the same stuff forever!!
SJMP UP


DOWN: MOV A, #99H //initializing the value of decimal to decimal 99
ADD A, #00H
DA A			  //without doing this the value of 63 is loaded into A, which is wrong
MOV R1, A		  //setting up a backup value of the count in r1
L2: DEC A
MOV R3, A
ANL 03, #0FH
CJNE R3, #0FH, L4 //unpacking the hex number to see if it decremented from 60 to 5f 
				  //if it not the case, then go back to normal counting
L3: SUBB A, #06H  //if it is the case, then subract six to make 5f to 59
L4: ADD A, #00H    
DA A 			  //Converting the hex number to decimal again	
MOV R1, A		  //the normal backing up the number to r1 stuff
CJNE A, #00H, L2  //if the loop is completed, go back and do the loop again!!
SJMP DOWN
END