#To be inserted at 800d6c54
###################################
##FPSHack_TEST_SlowArrowReturnVel##
###################################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

lfs     f1, -0x65C4 (rtoc) #Vanilla
fmuls f1, f1, f17