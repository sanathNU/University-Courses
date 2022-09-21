def stuffing(message):
    counter = 0
    final =[]
    for item in message:
        if item=='0':
            counter = 0
            final.append('0')
        if item=='1':
            counter+=1
            if counter==5:
                counter=0
                final.append('10')
            else:
                final.append('1')
    return ''.join(final)

def destuffing(message):
    test = message.replace('111110','11111')
    return test
                

def framing(message):
    return ''.join(['01111110',message,'01111110'])

def deframing(fram_message):
    return fram_message.replace('01111110','')

if __name__=='__main__':
    msg = '0011111111010100011111001'
    # starting the pipeline
    # First the message is stuffed with 0's in the right places
    stuffed = stuffing(msg)
    # Then the mesg is framed
    framed = framing(stuffed)
    #Transfering!
    #Transfering!
    # Assuming that our ppl received the message
    deframe = deframing(framed)
    destuff = destuffing(deframe)
    
    print('Original Message',msg)
    print('Stuffed Message',stuffed)
    print('Framed Message',framed)
    print('DeFramed message',deframe)
    print('Decoded message',destuff)
