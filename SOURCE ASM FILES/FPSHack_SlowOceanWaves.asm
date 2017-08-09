#To be inserted at 8015b524
##########################
##FPSHack_SlowOceanWaves##
##########################

lis r21, 0x817F
lfs f17, 0x0004 (r21)

fdivs f0,f0,f17

fdivs f1,f1,f0 #VANILLA

mr r21,r4