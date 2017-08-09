#To be inserted at 801094bc
##############################
##FPSHack_04_SlowLinkGravity##
##############################

lfs f0, 0x0258 (r30) #VANILLA
lis r17, 0x817F
lfs f17, 0x0004 (r17)
fmuls f0, f0, f17