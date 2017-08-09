#To be inserted at 800529b8
########################################
##FPSHack_15_ExecuteEventManager_LowHz##
########################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate

cmplwi r17, 0
bne- 0x0008
blr
stwu sp, -0x0010 (sp) #Vanilla
