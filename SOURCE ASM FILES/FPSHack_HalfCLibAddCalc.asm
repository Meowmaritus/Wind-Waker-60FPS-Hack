#To be inserted at 802528e4
###########################
##FPSHack_HalfCLibAddCalc##
###########################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

fmuls f1, f1, f17 #Multiply f1 (step) by FloatSlowdown
fmuls f2, f2, f17 #Multiply f2 (step error) by FloatSlowdown
fmuls f3, f3, f17 #Multiply f3 (max step error) by FloatSlowdown

lfs f5, 0 (r3) #Vanilla