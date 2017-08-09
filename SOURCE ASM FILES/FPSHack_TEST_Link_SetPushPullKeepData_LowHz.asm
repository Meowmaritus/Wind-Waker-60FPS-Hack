#To be inserted at 801514b0
###############################################
##FPSHack_TEST_Link_SetPushPullKeepData_LowHz##
###############################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate
cmpwi r17, 0
bne- 0x0008
blr
stwu    sp, -0x0030 (sp) #Vanilla