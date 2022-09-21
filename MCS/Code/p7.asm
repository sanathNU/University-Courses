// timer to toggle p3.0 bit
org 00h
	mov TMOD, #01h
	here: mov tl0, #0f2h
		mov th0, #0ffh
		cpl p3.0
		acall delay
		
		sjmp here
		
		delay: setb tr0
		again: jnb tf0, again
			clr tr0
			clr tf0
			ret
end
	
	
	
	
	
	
	
	