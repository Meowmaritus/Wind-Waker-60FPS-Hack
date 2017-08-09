#To be inserted at 801287f4
####################################
##FPSHack_17_SlowLinkSimpleAnmPlay##
####################################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

fmuls f1, f1, f17

fadds   f2,f1,f0 #Vanilla