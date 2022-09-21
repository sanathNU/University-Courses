//program to receive in 8051
org 00h
MOV TMOD, #20H ; timer 1 mode 2
MOV TH1,#-3    ; baud rate 9600
MOV SCON, #50H ; mode 1 communication
SETB TR1   ; start timer
MOV R0, #2FH  ; location of address to monitor

HERE1: JNB RI, HERE1  ; you know all this
MOV A, SBUF
MOV @R0,A
MOV P1,A
INC R0
CLR RI
SJMP HERE1
END
	
	
	
	
		