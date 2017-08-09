#To be inserted at 8012207c
##################################
##FPSHack_03_SlowAllLinkVelocity##
##################################

lis r17, 0x817F
lfs f17, 0x0004 (r17) #Load FloatSlowdown

#Velocity = (r31|0x0220), (r31|0x0224), (r31|0x0228)
#Position = (r31|0x01F8), (r31|0x01FC), (r31|0x0120)

##X-Axis##
lfs f18, 0x0220 (r31) #Load Velocity
lfs f19, 0x01F8 (r31) #Load Position
fsubs f19, f19, f18 #Subtract the previously applied velocity from Link's position
fmuls f18, f18, f17 #Slow that velocity by FloatSlowdown
fadds f19, f19, f18 #Add the slowed velocity to Link's position
#stfs f18, 0x0220 (r31) #Save new Velocity
stfs f19, 0x01F8 (r31) #Save new Position

##Y-Axis##
lfs f18, 0x0224 (r31) #Load Velocity
lfs f19, 0x01FC (r31) #Load Position
fsubs f19, f19, f18 #Subtract the previously applied velocity from Link's position
fmuls f18, f18, f17 #Slow that velocity by FloatSlowdown
fadds f19, f19, f18 #Add the slowed velocity to Link's position
#stfs f18, 0x0224 (r31) #Save new Velocity
stfs f19, 0x01FC (r31) #Save new Position

##Z-Axis##
lfs f18, 0x0228 (r31) #Load Velocity
lfs f19, 0x0200 (r31) #Load Position
fsubs f19, f19, f18 #Subtract the previously applied velocity from Link's position
fmuls f18, f18, f17 #Slow that velocity by FloatSlowdown
fadds f19, f19, f18 #Add the slowed velocity to Link's position
#stfs f18, 0x0228 (r31) #Save new Velocity
stfs f19, 0x0200 (r31) #Save new Position



lfs f0, 0x0220 (r31) #Vanilla