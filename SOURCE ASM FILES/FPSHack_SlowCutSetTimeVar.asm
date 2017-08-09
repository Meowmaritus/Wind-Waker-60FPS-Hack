#To be inserted at 8026f0b8
#############################
##FPSHack_SlowCutSetTimeVar##
#############################

lis r3, 0x8027 #Vanilla

lis r17, 0x817F
lfs f17, 0x0004 (r17)
fmuls f0, f0, f17