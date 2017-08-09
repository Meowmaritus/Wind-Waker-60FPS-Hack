#To be inserted at 80006410
##########################
##FPSHack_01_MAIN_UPDATE##
##########################

##### Set e3 to Base Addr #####
#We can mess with r3 because it gets loaded
#to the proper value in the vanilla instruction
#at the very end of this function (the one that we're replacing).
lis r3, 0x817F

##### Backup Registers #####
stw     r10, 0x10 (r3)  #SLOT 1
stw     r11, 0x14 (r3)  #SLOT 2
stw     r12, 0x18 (r3)  #SLOT 3
stw     r13, 0x1C (r3)  #SLOT 4
stfd    f10, 0x20 (r3)  #SLOT 5
#0x24 used by f10       #SLOT 6
stfd    f11, 0x28 (r3)  #SLOT 7
#0x2C used by f11       #SLOT 8


##### Backup Special Registers
mflr r10
stw     r10, 0x2C (r3)  #SLOT 9

mfctr r10
stw     r10, 0x30 (r3)  #SLOT 10



##### Load Useful Values #####
lis r10, 0x803F
ori r10, r10, 0x6854
lwz r10, 0 (r10) #Load WW frame counter

lwz r11, 0x0008 (r3) #Load FramerateFactor


##### Set: byte LowHzFuncsRunThisFrame(817F0000) #####
#r12 = r10(Framecounter) % r11(FramerateFactor)
divwu r12, r10, r11 #r12 = quotient
mullw r12, r12, r11 #r12 = quotient * divisor
subf r12, r12, r10 #r12 = remainder

li r13, 0 #LowHzFuncsRunThisFrame = 0 (default value)
cmpwi r12, 0 #Compare the modulo'd framecounter to 0
bne- 0x0008 #If != 0, skip straight to LowHzFuncsRunThisFrame storage, storing 0
li r13, 1 #If == 0, then store 1 for LowHzFuncsRunThisFrame
stw r13, 0 (r3) #Store LowHzFuncsRunThisFrame(817F0000)


##### Set: FloatSlowdown(817F0004) #####
lis r12, 0x4330
stw r12, 0x30 (r3) #Store 0x43300000 into upper
li r12, 0
stw r12, 0x34 (r3) #Store 0x00000000 into lower
lfd f11, 0x30 (r3) #Load 0x4330000000000000 into f11

lis r12, 0x4330
stw r12, 0x30 (r3) #Store 0x43300000 into upper
stw r11, 0x34 (r3) #Store FramerateFactor into lower
lfd f10, 0x30 (r3) #Load (0x4330000000000000 + FramerateFactor) into f10

fsub f10, f10, f11 #Magically make f10 = the float representation of FramerateFactor

lis r12, 0x3F80
stw r12, 0x30 (r3)
lfs f11, 0x30 (r3) #Load 1.0 into f11

fdivs f10, f11, f10 #f10 = (f11 / f10) = (1.0 / FramerateFactor)

stfs f10, 0x0004 (r3) #FINALLY, store FloatSlowdown!



##### Set: WW Tick Rate Value (804C8D44) #####
#Number of ticks in 1/30 of a second: 1350000, or 0x00149970
lis r12, 0x0014
ori r12, r12, 0x9970 #Load default tick rate into r12

##DEBUG (Uncomment one of the 2 below lines to force the framerate without changing the pacing)##
#lis r11, 1 #Force 30 FPS always
#lis r11, 2 #Force 60 FPS always
#########

divwu r11, r12, r11 #r11 = (r12 / r11) = (Default tick rate / FramerateFactor)

lis r12, 0x804C
ori r12, r12, 0x8D44 #Load the WW Tick Rate address

stw r11, 0x0000 (r12) #Store the custom tick where the normal one would normally be.

lwz r11, 0x0008 (r3) #Load FramerateFactor

# ############################################################################################### #
# Dangerous debug testing below that will probably crash your game if you uncomment this section: #
# ############################################################################################### #
# ##### Update: Misc (starting at 817F0050) #####
# 
# ##IsEventCut##
# lwz r12, 0x0050 (r3)
# cmplwi r12, 0
# beq- 0x0008
# addi r12, r12, -0x0001
# stw r12, 0x0050 (r3)
# #####
# 
# 
# ##### TEST STUFF #####
# 
# lwz r12, 0x000C (r3)
# 
# cmpwi r12, 0
# 
# beq- 0x0014 #If PTR->Link is still 0, don't call FPSHack_Test_UpdateLinkPositionSeparately
# 
# ##Call FPSHack_Test_UpdateLinkPositionSeparately
# lis r12, 0x817F
# ori r12, r12, 0x0054
# mtctr r12
# bctrl


##### Restore Register Backups #####
lwz r10, 0x10 (r3) #SLOT 1
lwz r11, 0x14 (r3) #SLOT 2
lwz r12, 0x18 (r3) #SLOT 3
lwz r13, 0x1C (r3) #SLOT 4
lfd f10, 0x20 (r3) #SLOT 5
#0x24 used by f10  #SLOT 6
lfd f11, 0x28 (r3) #SLOT 7
#0x2C used by f11  #SLOT 8


##### Restore Special Register Backups
lwz r10, 0x2C (r3) #SLOT 9
mtlr r10

lwz r10, 0x30 (r3) #SLOT 10
mtctr r10



##### Execute Vanilla Instruction And Exit #####
lwz r3, -0x788C (r13) #VANILLA
