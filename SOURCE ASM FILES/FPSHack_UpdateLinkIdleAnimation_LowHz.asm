#To be inserted at 801133a0
#To be inserted at 801133a0
#########################################
##FPSHack_UpdateLinkIdleAnimation_LowHz##
#########################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate

cmpwi r17, 0
beq- 0x000C
##If LowHzUpdate != 0
subi r0, r3, 1 #Vanilla
b 0x0008 #Skip over the move register function
##If LowHzUpdate = 0
mr r0, r3 #Move r3 to r0 without subtracting from it
nop #Blank spot to branch to