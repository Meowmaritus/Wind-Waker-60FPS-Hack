#To be inserted at 800e250c
##########################################
##FPSHack_TEST_HalfSomeBoomerangValueIDK##
##########################################

lis     r17, 0x817F
lfs     f17, 0x0004 (r17)

fmuls   f0, f0, f17

stfs    f0, 0x000C (sp) #Vanilla