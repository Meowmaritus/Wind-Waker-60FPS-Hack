#To be inserted at 80201ce8
########################################
##FPSHack_TEST_UpdateBreathMeter_LowHz##
########################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate

#####
cmpwi r17, 0
beq- 0x000C
## == 1
subi r0, r3, 1 #Vanilla
b 0x0008
## == 0
mr r0, r3
#####