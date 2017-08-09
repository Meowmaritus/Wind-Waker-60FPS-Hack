#To be inserted at 800d4cc4
###############################
##FPSHack_TEST_SlowArrowShoot##
###############################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

lfs     f1, -0x6614 (rtoc) #Vanilla
fmuls f1, f1, f17