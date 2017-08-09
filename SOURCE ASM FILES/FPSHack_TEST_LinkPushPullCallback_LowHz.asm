#To be inserted at 80151514
###########################################
##FPSHack_TEST_LinkPushPullCallback_LowHz##
###########################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate

cmpwi r17, 0
beq 0x0024

mflr r17 #Backup LR
mfctr r18 #Backup CTR
lis r19, 0x800A
ori r19, r19, 0x1ED0 #Load address
mtctr r19 #Move address to CTR
bctrl #Branch to CTR
mtlr r17
mtctr r18

nop #Branch to here idk