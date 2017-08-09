#To be inserted at 8026EFF0
############################################
##FPSHack_12_SlowCutsceneVariableTimeScale##
############################################

lfd f31, 0x0058 (r3) #Vanilla

lis r17, 0x817F
lfs f17, 0x0004 (r17)

fmuls f31, f31, f17