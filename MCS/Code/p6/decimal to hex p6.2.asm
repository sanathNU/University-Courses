//program to convert decimal to hexadecimal
mov a,#99h
mov r0,a  //keeping a copy in r0
anl a, #0fh //masking the higher bit

mov r1, a  //moving the lower bit to r1 
mov a, r0  //moving the orignal number to to a
swap a     //swapping the nibbles
anl a, #0fh//masking the lower bit
mov b, #10 
mul ab     //multiplying the higher bit by 10(decimal multiplication)
add a, r1  //adding the lower bit to higher bit
mov r4,a   //moving the higher bit to r4
//mov r5,b number is stored in r4 r3

k: sjmp k
end