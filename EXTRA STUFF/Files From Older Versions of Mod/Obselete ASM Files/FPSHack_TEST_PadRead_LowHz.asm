#To be inserted at 800078c0
##############################
##FPSHack_TEST_PadRead_LowHz##
##############################

lis r17, 0x817F
lwz r17, 0x0000 (r17)

cmpwi r17, 0

beq- 0x0008
blr
stwu sp, -0x0020 (sp) #Vanilla