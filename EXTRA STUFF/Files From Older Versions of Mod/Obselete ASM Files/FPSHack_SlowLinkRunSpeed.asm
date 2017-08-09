#To be inserted at 8010e948
############################
##FPSHack_SlowLinkRunSpeed##
############################

lfs f0, 0x0018 (r3) #VANILLA
lis r17, 0x817F
lfs f17, 0x0004 (r17)
fmuls f0, f0, f17