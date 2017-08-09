#To be inserted at 800238d4
###########################################
##FPSHack_14_ActorEventMoveApproval_LowHz##
###########################################

lis r17, 0x817F
lwz r17, 0x0000 (r17) #Load LowHzUpdate

#####
cmpwi r17, 0
bne- 0x0008
#####
li r3, 0
#####
cmpwi r3, 2 #Vanilla