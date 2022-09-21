# This is simple code for caesear cipher written in python
#Caesar cipher is also a substitution cipher
import string
main_alpha = string.ascii_lowercase

def encrypt_message(message,key):
    temp1 = [ main_alpha.index(x) for x in message.lower()]
    e = [main_alpha[(x+key)%26] for x in temp1]
    return ''.join(e)

def decrypt_message(cipher,key):
    temp2 = [ main_alpha.index(x) for x in cipher]
    d = [main_alpha[(x-key)%26] for x in temp2]
    return ''.join(d)

if __name__ == "__main__":
    pass
    Message = input("Enter the lowercase message to be encrypted \n")
    Key = int(input("Enter the key for the monoalphabetic substitution cipher\n"))

    encrypted = encrypt_message(Message,Key)
    print('The Oringal message is:',Message)
    print("The encrypted message is:", encrypted)
    print("Decrypting....")
    print("The decrypted message is",decrypt_message(encrypted,Key+4))
