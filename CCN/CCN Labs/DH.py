# This is for the creating a working implementation of diffe hellman key exchange algorithm
# Let us consider two ppl Asha and Bharath
# Each person will have private Keys. 
# working of DH algo understood from this website : https://www.geeksforgeeks.org/implementation-diffie-hellman-algorithm/

# The public keys visible to everyone
P,G = map(int,input("Enter the two Public keys\n").split())
# P, G = 123,45

# Asha and Bharath's private keys
AshaPriv = int(input("Enter Asha's Private Key\n"))
BharathPriv =int(input("Enter Bharath's Private Key\n"))
# AshaPriv , BharathPriv = 10,20

# Creation of public messages using private key that will be transported acorss the network
AshaPub = (G^AshaPriv)%P
BharathPub = (G^BharathPriv)%P

# Assuming that the exchange of keys between Asha and Bharath happens, Asha has bharath's key and bharath has asha's public key
# For Bharath
SecKeyB = (AshaPub^AshaPriv)%P
# For Asha
SecKeyA = (BharathPub^BharathPriv)%P

print("Keys getting verified.....\n",SecKeyB == SecKeyA)
print("Keys successfully got verified!")
print("The secret key shared is ",SecKeyA)
