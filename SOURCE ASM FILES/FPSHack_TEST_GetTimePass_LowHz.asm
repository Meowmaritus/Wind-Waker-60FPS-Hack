#To be inserted at 80190a18
##################################
##FPSHack_TEST_GetTimePass_LowHz##
##################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate

cmpwi r17, 0

li r3, 0 #Load 0 by default

beq- 0x0008
lbz r3, -0x765C (r13) #Vanilla
nop