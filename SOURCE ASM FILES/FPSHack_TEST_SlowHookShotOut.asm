#To be inserted at 800f1de0
################################
##FPSHack_TEST_SlowHookShotOut##
################################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

lfs     f1, -0x5F00 (rtoc) #Vanilla
fmuls f0, f0, f17