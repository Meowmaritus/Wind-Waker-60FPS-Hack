##########################
##FPSHack_HalfCameraZoom##
##########################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

fmuls f0, f0, f17 #Multiply camera zoom speed by FloatSlowdown

stfs f0, 0x02D8 (sp) #Vanilla