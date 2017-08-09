#To be inserted at 801094cc
##############################
##FPSHack_SlowLinkGravityAcc##
##############################

lfs f1, 0x025C (r30) #VANILLA
lis r17, 0x817F
lfs f17, 0x0004 (r17)
fmuls f1, f1, f17