#To be inserted at 800251a0
#################################
##FPSHack_05_SlowActorMovements##
#################################

lis r17, 0x817F
lfs f17, 0x0004 (r17)

lwz r17, 0x0050 (r17) #Load IsEventCut

##### Original Function #####
#lfs f1, 0x01F8 (r3)
#lfs f0, 0x0220 (r3)
#fadds f0,f1,f0
#stfs f0, 0x01F8 (r3)
#lfs f1, 0x01FC (r3)
#lfs f0, 0x0224 (r3)
#fadds f0,f1,f0
#stfs f0, 0x01FC (r3)
#lfs f1, 0x0200 (r3)
#lfs f0, 0x0228 (r3)
#fadds f0,f1,f0
#stfs f0, 0x0200 (r3)
#cmplwi r4, 0
#beqlr-
#lfs f1, 0x01F8 (r3)
#lfs f0, 0 (r4)
#fadds f0,f1,f0
#stfs f0, 0x01F8 (r3)
#lfs f1, 0x01FC (r3)
#lfs f0, 0x0004 (r4)
#fadds f0,f1,f0
#stfs f0, 0x01FC (r3)
#lfs f1, 0x0200 (r3)
#lfs f0, 0x0008 (r4)
#fadds f0,f1,f0
#stfs f0, 0x0200 (r3)
#blr

lfs f1, 0x01F8 (r3)
lfs f0, 0x0220 (r3)

cmplwi r17, 0
bne 0x0008
fmuls f0, f0, f17 #Multiply velocity X by FloatSlowdown
fadds f0,f1,f0

stfs f0, 0x01F8 (r3)
lfs f1, 0x01FC (r3)
lfs f0, 0x0224 (r3)

cmplwi r17, 0
bne 0x0008
fmuls f0, f0, f17 #Multiply velocity y by FloatSlowdown
fadds f0,f1,f0

stfs f0, 0x01FC (r3)
lfs f1, 0x0200 (r3)
lfs f0, 0x0228 (r3)

cmplwi r17, 0
bne 0x0008

cmplwi r17, 0
bne 0x0008
fmuls f0, f0, f17 #Multiply velocity z by FloatSlowdown
fadds f0,f1,f0

stfs f0, 0x0200 (r3)
cmplwi r4, 0
beqlr-
lfs f1, 0x01F8 (r3)
lfs f0, 0 (r4)

cmplwi r17, 0
bne 0x0008
fmuls f0, f0, f17 #Multiply velocity X by FloatSlowdown
fadds f0,f1,f0

stfs f0, 0x01F8 (r3)
lfs f1, 0x01FC (r3)
lfs f0, 0x0004 (r4)

cmplwi r17, 0
bne 0x0008
fmuls f0, f0, f17 #Multiply velocity y by FloatSlowdown
fadds f0,f1,f0

stfs f0, 0x01FC (r3)
lfs f1, 0x0200 (r3)
lfs f0, 0x0008 (r4)

cmplwi r17, 0
bne 0x0008
fmuls f0, f0, f17 #Multiply velocity z by FloatSlowdown
fadds f0,f1,f0

stfs f0, 0x0200 (r3)
blr
