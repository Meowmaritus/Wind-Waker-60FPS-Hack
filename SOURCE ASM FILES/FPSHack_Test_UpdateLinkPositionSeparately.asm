#To be inserted at 817F0054
#############################################
##FPSHack_Test_UpdateLinkPositionSeparately##
#############################################

##### Begin Function
stwu    sp, -0x0060 (sp)

##### BACKUP VALUES
mfctr   r17
stw     r17, 0x0010 (r16) #Backup CTR to TEMP SLOT 1

mflr    r17
stw     r17, 0x0014 (r16) #Backup LR to TEMP SLOT 2


##### Load basic values
lis     r16, 0x817F #Load mod data base

lwz     r31, 0x000C (r16) #Load PTR->Link


#####Move position from source to destination:
#X
lfs     f0, 0x01F8 (r31)
stfs    f0, 0x0014 (sp)
#Y
lfs     f0, 0x01FC (r31)
stfs    f0, 0x0018 (sp)
#Z
lfs     f0, 0x0200 (r31)
stfs    f0, 0x001C (sp)

mr      r3, r31

#Init r30 for posMove:
mr      r30, r31
lis     r17, 0x006E
ori     r17, r17, 0xD580
sub     r30, r30, r17 #r30 = r31 - 0x6ED580

#####Run daPy_lk_c::posMove()
lis     r17, 0x8010
ori     r17, r17, 0x959C #Load address
mtctr   r17 #Move address to CTR
bctrl #Branch to CTR

#####Do what FPSHack_03_SlowAllLinkVelocity does

lfs     f17, 0x0004 (r16) #Load FloatSlowdown

#Velocity = (r31|0x0220), (r31|0x0224), (r31|0x0228)
#Position = (r31|0x01F8), (r31|0x01FC), (r31|0x0120)

##X-Axis##
lfs     f18, 0x0220 (r31) #Load Velocity
lfs     f19, 0x01F8 (r31) #Load Position
fsubs   f19, f19, f18 #Subtract the previously applied velocity from Link's position
fmuls   f18, f18, f17 #Slow that velocity by FloatSlowdown
fadds   f19, f19, f18 #Add the slowed velocity to Link's position
#stfs   f18, 0x0220 (r31) #Save new Velocity
stfs    f19, 0x01F8 (r31) #Save new Position

##Y-Axis##
lfs     f18, 0x0224 (r31) #Load Velocity
lfs     f19, 0x01FC (r31) #Load Position
fsubs   f19, f19, f18 #Subtract the previously applied velocity from Link's position
fmuls   f18, f18, f17 #Slow that velocity by FloatSlowdown
fadds   f19, f19, f18 #Add the slowed velocity to Link's position
#stfs   f18, 0x0224 (r31) #Save new Velocity
stfs    f19, 0x01FC (r31) #Save new Position

##Z-Axis##
lfs     f18, 0x0228 (r31) #Load Velocity
lfs     f19, 0x0200 (r31) #Load Position
fsubs   f19, f19, f18 #Subtract the previously applied velocity from Link's position
fmuls   f18, f18, f17 #Slow that velocity by FloatSlowdown
fadds   f19, f19, f18 #Add the slowed velocity to Link's position
#stfs   f18, 0x0228 (r31) #Save new Velocity
stfs    f19, 0x0200 (r31) #Save new Position


#####Save position and velocity values:

lfs     f0, 0x0220 (r31)
stfs    f0, 0x3694 (r31)
lfs     f0, 0x0224 (r31)
stfs    f0, 0x3698 (r31)
lfs     f0, 0x0228 (r31)
stfs    f0, 0x369C (r31)
lfs     f0, 0x01F8 (r31)
stfs    f0, 0x0008 (sp)
lfs     f0, 0x01FC (r31)
stfs    f0, 0x000C (sp)
lfs     f0, 0x0200 (r31)
stfs    f0, 0x0010 (sp)
lwz     r0, 0x0494 (r31)
rlwinm  r0, r0, 0, 27, 25
stw     r0, 0x0494 (r31)
addi    r3, r31, 1132
mr      r4, r30


#####Run dBgS_Acch::CrrPos(dBgS&)
lis     r17, 0x800A
ori     r17, r17, 0x3460 #Load address
mtctr   r17 #Move address to CTR
bctrl #Branch to CTR


##### RESTORE VALUE BACKUPS
lwz     r17, 0x0010 (r16) #Load TEMP SLOT 1
mtctr   r17 #RESTORE CTR BACKUP

lwz     r17, 0x0014 (r16) #Load TEMP SLOT 2
mtlr    r17 #RESTORE LR BACKUP


##### End function
addi    sp, sp, 96
blr