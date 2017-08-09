#To be inserted at 800f2620
###############################
##FPSHack_TEST_SlowHookShotIn##
###############################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

lfs     f0, -0x5EE8 (rtoc) #Vanilla
fmuls f0, f0, f17