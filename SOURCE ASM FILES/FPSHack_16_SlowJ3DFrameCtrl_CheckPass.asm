#To be inserted at 802ef614
#########################################
##FPSHack_16_SlowJ3DFrameCtrl_CheckPass##
#########################################

lis r17, 0x817F
lfs f17, 0x0004 (r17)

fmuls f0, f0, f17 #Slow the frame delta thing?
fadds f3, f0, f2 #Vanilla