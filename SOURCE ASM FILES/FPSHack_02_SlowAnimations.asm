#To be inserted at 802efbbc
#############################
##FPSHack_02_SlowAnimations##
#############################

lis r17, 0x817F
lfs f17, 0x0004 (r17)

lwz r18, 0x000C (r17)
cmpw r18, r26 #For animation updates, r3's actor pointer is moved to r26 (before the function is called)
beq- 0x0010 #If it's Link's jump straight to halfing those values. Otherwise proceed.

lwz r18, 0x0050 (r17)
cmpwi r18, 0
bne- 0x0008 #Don't half frame values if it's a cutscene.

fmuls f0, f0, f17

fadds f0,f1,f0 #vanilla - add elapsed frame count to frame