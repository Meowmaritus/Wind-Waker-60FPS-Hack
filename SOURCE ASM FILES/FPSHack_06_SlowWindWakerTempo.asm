#To be inserted at 8014e438
#################################
##FPSHack_06_SlowWindWakerTempo##
#################################

lfs f2, -0x5BFC (rtoc) #Vanilla
lis r17, 0x817F
lfs f17, 0x0004 (r17)
fmul f2, f2, f17