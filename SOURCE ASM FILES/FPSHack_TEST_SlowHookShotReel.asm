#To be inserted at 800f23f8
#################################
##FPSHack_TEST_SlowHookShotReel##
#################################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

fdivs   f1,f0,f1 #Vanilla
fmuls f1, f1, f17