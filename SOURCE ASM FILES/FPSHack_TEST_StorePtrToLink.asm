#To be inserted at 80121870
###############################
##FPSHack_TEST_StorePtrToLink##
###############################

lis r17, 0x817F

stw r3, 0x000C (r17) #Save to PTR->Link

stwu sp, -0x0060 (sp) #Vanilla