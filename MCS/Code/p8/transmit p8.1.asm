//program to serially transmit the letter 'A' again and again
org 00h
mov TMOD ,#20H ;timer 1, mode 2
mov TH1,#-3    ; baud rate 9600
mov SCON,#50H  ; serial mode 1 communication
setb TR1 ; start timer

Again:mov SBUF, # "A" 

Here:jnb TI,Here
clr TI
sjmp Again

end
	
	
	