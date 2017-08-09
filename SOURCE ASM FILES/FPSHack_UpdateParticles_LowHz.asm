#To be inserted at 8007d094
#################################
##FPSHack_UpdateParticles_LowHz##
#################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate

cmpwi r17, 0
beq- 0x000C
##If LowHzUpdate != 0
stwu sp, -0x0010 (sp) #Vanilla
b 0x0008 #Skip over the blr
##If LowHzUpdate = 0
blr
nop #Blank spot to branch to