#To be inserted at 8006b15c
###################################
##FPSHack_13_CutsceneTicker_LowHz##
###################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzFuncsRunThisFrame

#Check if true
cmpwi r17, 1
bne- 0x24
##True
lis r17, 0x8027
ori r17, r17, 0x5560
mfctr r19
mtctr r17
mflr r18
bctrl
mtlr r18
mtctr r19
##False
nop