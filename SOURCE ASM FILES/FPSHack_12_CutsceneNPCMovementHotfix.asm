#To be inserted at 8021cc4c
########################################
##FPSHack_12_CutsceneNPCMovementHotfix##
########################################

lis r17, 0x817F

li r18, 2
stw r18, 0x0050 (r17) #Save IsEventCut

lwz r18, 0x0000 (r17) # Load LowHzUpdate
cmpwi r18, 0
bne- 0x000C
li r3, 0
blr
stwu sp, -0x0020 (sp) #Vanilla
