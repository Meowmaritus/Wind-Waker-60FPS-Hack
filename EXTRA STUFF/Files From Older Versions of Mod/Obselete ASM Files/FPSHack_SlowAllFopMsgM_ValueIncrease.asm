#To be inserted at 8003bec8
########################################
##FPSHack_SlowAllFopMsgM_ValueIncrease##
########################################

lis r17, 0x817F
lwz r17, 0x0008 (r17) #Load FramerateFactor
mullw r3, r3, r17 #Multiply value increase denominator by the FramerateFactor

cmpwi r3, 0 #Vanilla