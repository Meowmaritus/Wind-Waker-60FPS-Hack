#To be inserted at 800e1fe4
######################################
##FPSHack_TEST_SlowBoomerangVelocity##
######################################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

lfs    f0, -0x635C (rtoc) #Vanilla
fmuls f0, f0, f17