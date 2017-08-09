#To be inserted at 80058340
###########################################
##FPSHack_07_STControl_CheckTrigger_LowHz##
###########################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzFuncsRunThisFrame into r0

cmpwi r17, 1 #Check if LowHzFuncsRunThisFrame == true

#####
beq- 0x0008
##False
blr
##True
stwu r1, -0x20 (r1) #VANILLA
#####