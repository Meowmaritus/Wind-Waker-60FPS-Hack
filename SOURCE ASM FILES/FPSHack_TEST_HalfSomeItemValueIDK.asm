#To be inserted at 800f57fc
#####################################
##FPSHack_TEST_HalfSomeItemValueIDK##
#####################################

lfs     f1, -0x5E54 (rtoc) #Vanilla

lis     r17, 0x817F
lfs     f17, 0x0004 (r17)

fmuls   f1, f1, f17