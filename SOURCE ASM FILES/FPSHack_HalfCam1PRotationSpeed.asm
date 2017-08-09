#To be inserted at 8017056c
##################################
##FPSHack_HalfCam1PRotationSpeed##
##################################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

fmuls f29, f29, f17 #Multiply Rotation Speed by FloatSlowdown

rlwinm. r0, r30, 0, 24, 31 #Vanilla