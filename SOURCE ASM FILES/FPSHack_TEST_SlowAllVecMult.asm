#To be inserted at 80245714
###############################
##FPSHack_TEST_SlowAllVecMult##
###############################

lis r17, 0x817F
lfs f17, 0x0004 (r17)

fmuls f1, f1, f17

stwu    sp, -0x0020 (sp) #Vanilla