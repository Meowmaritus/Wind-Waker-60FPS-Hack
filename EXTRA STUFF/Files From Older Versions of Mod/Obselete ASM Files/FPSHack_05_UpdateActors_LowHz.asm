#To be inserted at 8002362c
#################################
##FPSHack_05_UpdateActors_LowHz##
#################################

lis r17, 0x817F

lwz r18, 0x0050 (r17) #Load IsEventCut
cmpwi r18, 0
beq- 0x0020 #If we aren't in an event cutscene, always update.

lwz r18, 0x000C (r17) #Load PTR->Link
cmpw r3, r18
beq- 0x0014 #If this actor is Link, always update.

lwz r19, 0x0000 (r17) #Load LowHzUpdate

cmpwi r19, 0
bne- 0x0008

##No update
blr
##Update
stwu sp, -0x0030 (sp) #Vanilla
