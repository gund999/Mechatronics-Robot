#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../files/src/AD.c ../files/src/BOARD.c ../files/src/ES_CheckEvents.c ../files/src/ES_Framework.c ../files/src/ES_KeyboardInput.c ../files/src/ES_PostList.c ../files/src/ES_Queue.c ../files/src/ES_TattleTale.c ../files/src/ES_Timers.c ../files/src/IO_Ports.c ../files/src/LED.c ../files/src/RC_Servo.c ../files/src/pwm.c ../files/src/roach.c ../files/src/serial.c ../files/src/timers.c ../files/templates/TemplateEventChecker.c ../files/templates/TemplateFSM.c ../files/templates/TemplateService.c ../files/templates/TemplateSubHSM.c ../files/templates/FindGoalieSub.c ../files/src/EventChecker.c ../files/src/MotorDriver.c ../files/templates/HitSub.c ../files/src/FlywheelDriver.c ../files/src/ShootSub.c ../files/src/HSM.c ../files/templates/ES_Main.c ../files/src/AimSub.c ../files/src/GoHomeSub.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1358603075/AD.o ${OBJECTDIR}/_ext/1358603075/BOARD.o ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o ${OBJECTDIR}/_ext/1358603075/ES_Framework.o ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1358603075/ES_PostList.o ${OBJECTDIR}/_ext/1358603075/ES_Queue.o ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o ${OBJECTDIR}/_ext/1358603075/ES_Timers.o ${OBJECTDIR}/_ext/1358603075/IO_Ports.o ${OBJECTDIR}/_ext/1358603075/LED.o ${OBJECTDIR}/_ext/1358603075/RC_Servo.o ${OBJECTDIR}/_ext/1358603075/pwm.o ${OBJECTDIR}/_ext/1358603075/roach.o ${OBJECTDIR}/_ext/1358603075/serial.o ${OBJECTDIR}/_ext/1358603075/timers.o ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o ${OBJECTDIR}/_ext/2036589742/TemplateService.o ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o ${OBJECTDIR}/_ext/1358603075/EventChecker.o ${OBJECTDIR}/_ext/1358603075/MotorDriver.o ${OBJECTDIR}/_ext/2036589742/HitSub.o ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o ${OBJECTDIR}/_ext/1358603075/ShootSub.o ${OBJECTDIR}/_ext/1358603075/HSM.o ${OBJECTDIR}/_ext/2036589742/ES_Main.o ${OBJECTDIR}/_ext/1358603075/AimSub.o ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1358603075/AD.o.d ${OBJECTDIR}/_ext/1358603075/BOARD.o.d ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o.d ${OBJECTDIR}/_ext/1358603075/ES_Framework.o.d ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o.d ${OBJECTDIR}/_ext/1358603075/ES_PostList.o.d ${OBJECTDIR}/_ext/1358603075/ES_Queue.o.d ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o.d ${OBJECTDIR}/_ext/1358603075/ES_Timers.o.d ${OBJECTDIR}/_ext/1358603075/IO_Ports.o.d ${OBJECTDIR}/_ext/1358603075/LED.o.d ${OBJECTDIR}/_ext/1358603075/RC_Servo.o.d ${OBJECTDIR}/_ext/1358603075/pwm.o.d ${OBJECTDIR}/_ext/1358603075/roach.o.d ${OBJECTDIR}/_ext/1358603075/serial.o.d ${OBJECTDIR}/_ext/1358603075/timers.o.d ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o.d ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o.d ${OBJECTDIR}/_ext/2036589742/TemplateService.o.d ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o.d ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o.d ${OBJECTDIR}/_ext/1358603075/EventChecker.o.d ${OBJECTDIR}/_ext/1358603075/MotorDriver.o.d ${OBJECTDIR}/_ext/2036589742/HitSub.o.d ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o.d ${OBJECTDIR}/_ext/1358603075/ShootSub.o.d ${OBJECTDIR}/_ext/1358603075/HSM.o.d ${OBJECTDIR}/_ext/2036589742/ES_Main.o.d ${OBJECTDIR}/_ext/1358603075/AimSub.o.d ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1358603075/AD.o ${OBJECTDIR}/_ext/1358603075/BOARD.o ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o ${OBJECTDIR}/_ext/1358603075/ES_Framework.o ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o ${OBJECTDIR}/_ext/1358603075/ES_PostList.o ${OBJECTDIR}/_ext/1358603075/ES_Queue.o ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o ${OBJECTDIR}/_ext/1358603075/ES_Timers.o ${OBJECTDIR}/_ext/1358603075/IO_Ports.o ${OBJECTDIR}/_ext/1358603075/LED.o ${OBJECTDIR}/_ext/1358603075/RC_Servo.o ${OBJECTDIR}/_ext/1358603075/pwm.o ${OBJECTDIR}/_ext/1358603075/roach.o ${OBJECTDIR}/_ext/1358603075/serial.o ${OBJECTDIR}/_ext/1358603075/timers.o ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o ${OBJECTDIR}/_ext/2036589742/TemplateService.o ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o ${OBJECTDIR}/_ext/1358603075/EventChecker.o ${OBJECTDIR}/_ext/1358603075/MotorDriver.o ${OBJECTDIR}/_ext/2036589742/HitSub.o ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o ${OBJECTDIR}/_ext/1358603075/ShootSub.o ${OBJECTDIR}/_ext/1358603075/HSM.o ${OBJECTDIR}/_ext/2036589742/ES_Main.o ${OBJECTDIR}/_ext/1358603075/AimSub.o ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o

# Source Files
SOURCEFILES=../files/src/AD.c ../files/src/BOARD.c ../files/src/ES_CheckEvents.c ../files/src/ES_Framework.c ../files/src/ES_KeyboardInput.c ../files/src/ES_PostList.c ../files/src/ES_Queue.c ../files/src/ES_TattleTale.c ../files/src/ES_Timers.c ../files/src/IO_Ports.c ../files/src/LED.c ../files/src/RC_Servo.c ../files/src/pwm.c ../files/src/roach.c ../files/src/serial.c ../files/src/timers.c ../files/templates/TemplateEventChecker.c ../files/templates/TemplateFSM.c ../files/templates/TemplateService.c ../files/templates/TemplateSubHSM.c ../files/templates/FindGoalieSub.c ../files/src/EventChecker.c ../files/src/MotorDriver.c ../files/templates/HitSub.c ../files/src/FlywheelDriver.c ../files/src/ShootSub.c ../files/src/HSM.c ../files/templates/ES_Main.c ../files/src/AimSub.c ../files/src/GoHomeSub.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX320F128L
MP_LINKER_FILE_OPTION=,--script="..\files\bootloader320.ld"
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1358603075/AD.o: ../files/src/AD.c  .generated_files/flags/default/5ee006ad240ed5a59898ac2d8a67dd6e79b038ed .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/AD.o.d" -o ${OBJECTDIR}/_ext/1358603075/AD.o ../files/src/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/BOARD.o: ../files/src/BOARD.c  .generated_files/flags/default/f701cf1ce6d9586ec93e40acf0cd17ecf12bb1d3 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/BOARD.o.d" -o ${OBJECTDIR}/_ext/1358603075/BOARD.o ../files/src/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o: ../files/src/ES_CheckEvents.c  .generated_files/flags/default/81520029ebae95dafa22a1ac5a939c9146d9b80 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o ../files/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_Framework.o: ../files/src/ES_Framework.c  .generated_files/flags/default/896a6b5718a834d581937b298364d17dcd6735cb .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_Framework.o ../files/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o: ../files/src/ES_KeyboardInput.c  .generated_files/flags/default/1815c5c47d59b53b84e97f1098662c4d759f2c4c .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o ../files/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_PostList.o: ../files/src/ES_PostList.c  .generated_files/flags/default/e9800fa184664c3fcfc8672eed0ecdc21029ad72 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_PostList.o ../files/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_Queue.o: ../files/src/ES_Queue.c  .generated_files/flags/default/1cdea05a60531abab359688ecb726e78372dc9a8 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_Queue.o ../files/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o: ../files/src/ES_TattleTale.c  .generated_files/flags/default/507b18704d5633a5f69e145ab043deb319f80a99 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o ../files/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_Timers.o: ../files/src/ES_Timers.c  .generated_files/flags/default/9ce8c3897ee04f177152929a7100f3afcd9293c2 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_Timers.o ../files/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/IO_Ports.o: ../files/src/IO_Ports.c  .generated_files/flags/default/2d65a39aed278ea1e05fef45362b1e29764483d3 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1358603075/IO_Ports.o ../files/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/LED.o: ../files/src/LED.c  .generated_files/flags/default/d28ff06ef541cd4f2a643e1a1dcdc50486294188 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/LED.o.d" -o ${OBJECTDIR}/_ext/1358603075/LED.o ../files/src/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/RC_Servo.o: ../files/src/RC_Servo.c  .generated_files/flags/default/201a90948455fc9f54b024fb49eb2e4e54b5dd96 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1358603075/RC_Servo.o ../files/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/pwm.o: ../files/src/pwm.c  .generated_files/flags/default/1c681847533ccc16600f7d20bd23a7c7222d717c .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/pwm.o.d" -o ${OBJECTDIR}/_ext/1358603075/pwm.o ../files/src/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/roach.o: ../files/src/roach.c  .generated_files/flags/default/88b10c7f8dc704de0c9ce085fbcc0f32fcb55840 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/roach.o.d" -o ${OBJECTDIR}/_ext/1358603075/roach.o ../files/src/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/serial.o: ../files/src/serial.c  .generated_files/flags/default/3f9f78b5bbbbc5322c36d9416c1e3ef346916e8c .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/serial.o.d" -o ${OBJECTDIR}/_ext/1358603075/serial.o ../files/src/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/timers.o: ../files/src/timers.c  .generated_files/flags/default/2f12e7960c93197e011bbf9085d970086933162 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/timers.o.d" -o ${OBJECTDIR}/_ext/1358603075/timers.o ../files/src/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o: ../files/templates/TemplateEventChecker.c  .generated_files/flags/default/69d09f221004530fb9ff7099b9b63dec0c88ae93 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o ../files/templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateFSM.o: ../files/templates/TemplateFSM.c  .generated_files/flags/default/d6a3a029779d4d22df7c51019c062ff80dada775 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateFSM.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o ../files/templates/TemplateFSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateService.o: ../files/templates/TemplateService.c  .generated_files/flags/default/45c4dba869cf3247d555e0089d65f619609bef0d .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateService.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateService.o ../files/templates/TemplateService.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o: ../files/templates/TemplateSubHSM.c  .generated_files/flags/default/64ea2ee051f004c8465b5ed6d5c65263b4e46fd .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o ../files/templates/TemplateSubHSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o: ../files/templates/FindGoalieSub.c  .generated_files/flags/default/3b4caa8da20d1e49b434f696b4417b13ab71b460 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o.d" -o ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o ../files/templates/FindGoalieSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/EventChecker.o: ../files/src/EventChecker.c  .generated_files/flags/default/272e613e1686c32671793ed32b6465fa3e2a8f03 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/EventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/EventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/EventChecker.o.d" -o ${OBJECTDIR}/_ext/1358603075/EventChecker.o ../files/src/EventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/MotorDriver.o: ../files/src/MotorDriver.c  .generated_files/flags/default/315b32fa3d44326907c0ff4fb9e618a25cb1dcb1 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/MotorDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/MotorDriver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/MotorDriver.o.d" -o ${OBJECTDIR}/_ext/1358603075/MotorDriver.o ../files/src/MotorDriver.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/HitSub.o: ../files/templates/HitSub.c  .generated_files/flags/default/4da3a6a64d9f2de5b955dc91714280e1240093a0 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/HitSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/HitSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/HitSub.o.d" -o ${OBJECTDIR}/_ext/2036589742/HitSub.o ../files/templates/HitSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o: ../files/src/FlywheelDriver.c  .generated_files/flags/default/9e0b09f42ac2c8a776e1d4880ee147a22cc57854 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o.d" -o ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o ../files/src/FlywheelDriver.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ShootSub.o: ../files/src/ShootSub.c  .generated_files/flags/default/4116bdcac205ada778bf09e4cf4e61144977903b .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ShootSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ShootSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ShootSub.o.d" -o ${OBJECTDIR}/_ext/1358603075/ShootSub.o ../files/src/ShootSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/HSM.o: ../files/src/HSM.c  .generated_files/flags/default/929aadda95414d3c1e5d2ed2dee24be538b39e25 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/HSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/HSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/HSM.o.d" -o ${OBJECTDIR}/_ext/1358603075/HSM.o ../files/src/HSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/ES_Main.o: ../files/templates/ES_Main.c  .generated_files/flags/default/aef47d6f1e7c36c2490441a728fce0977f4dc034 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/ES_Main.o.d" -o ${OBJECTDIR}/_ext/2036589742/ES_Main.o ../files/templates/ES_Main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/AimSub.o: ../files/src/AimSub.c  .generated_files/flags/default/aa5d7cb6c6c5d7ebba878960e4c8e9a863f35a08 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AimSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AimSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/AimSub.o.d" -o ${OBJECTDIR}/_ext/1358603075/AimSub.o ../files/src/AimSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/GoHomeSub.o: ../files/src/GoHomeSub.c  .generated_files/flags/default/50224512d876f75cb68254d40f6a9db6fc7a92e5 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/GoHomeSub.o.d" -o ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o ../files/src/GoHomeSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
else
${OBJECTDIR}/_ext/1358603075/AD.o: ../files/src/AD.c  .generated_files/flags/default/f0f85454dcd7903c219b1e2b722b948d28cad356 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/AD.o.d" -o ${OBJECTDIR}/_ext/1358603075/AD.o ../files/src/AD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/BOARD.o: ../files/src/BOARD.c  .generated_files/flags/default/22264a003f428fd380b594e912e15c2657b2dd85 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/BOARD.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/BOARD.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/BOARD.o.d" -o ${OBJECTDIR}/_ext/1358603075/BOARD.o ../files/src/BOARD.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o: ../files/src/ES_CheckEvents.c  .generated_files/flags/default/76c6ade93da226f732821b0ecf7096b45a46c0bb .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_CheckEvents.o ../files/src/ES_CheckEvents.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_Framework.o: ../files/src/ES_Framework.c  .generated_files/flags/default/75b03dfa1eba0cf57cc7070441406a016f9eec3d .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Framework.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Framework.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_Framework.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_Framework.o ../files/src/ES_Framework.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o: ../files/src/ES_KeyboardInput.c  .generated_files/flags/default/b13dbfa19748a85e7fc8e4e5864f20210d43054b .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_KeyboardInput.o ../files/src/ES_KeyboardInput.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_PostList.o: ../files/src/ES_PostList.c  .generated_files/flags/default/2dca42f79bf40f6a9d386ee82f755c5034d964b2 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_PostList.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_PostList.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_PostList.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_PostList.o ../files/src/ES_PostList.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_Queue.o: ../files/src/ES_Queue.c  .generated_files/flags/default/fe8d942634e0958f35315a82a10ba73b3fc85adb .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_Queue.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_Queue.o ../files/src/ES_Queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o: ../files/src/ES_TattleTale.c  .generated_files/flags/default/d9de43db3bcd98e51866524700877e42e705088d .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_TattleTale.o ../files/src/ES_TattleTale.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ES_Timers.o: ../files/src/ES_Timers.c  .generated_files/flags/default/d7123b5febc34568e504a2b3a5adb30761e97b6b .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ES_Timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ES_Timers.o.d" -o ${OBJECTDIR}/_ext/1358603075/ES_Timers.o ../files/src/ES_Timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/IO_Ports.o: ../files/src/IO_Ports.c  .generated_files/flags/default/5e66d259da89bc5a2cd92f6f6d40ea5842f80d96 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/IO_Ports.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/IO_Ports.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/IO_Ports.o.d" -o ${OBJECTDIR}/_ext/1358603075/IO_Ports.o ../files/src/IO_Ports.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/LED.o: ../files/src/LED.c  .generated_files/flags/default/6eb2444e3ad61c67dea70f6d20773f41f21ca893 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/LED.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/LED.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/LED.o.d" -o ${OBJECTDIR}/_ext/1358603075/LED.o ../files/src/LED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/RC_Servo.o: ../files/src/RC_Servo.c  .generated_files/flags/default/ca8ebfd481764de0cb76bcc4a8f949a656df7a80 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/RC_Servo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/RC_Servo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/RC_Servo.o.d" -o ${OBJECTDIR}/_ext/1358603075/RC_Servo.o ../files/src/RC_Servo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/pwm.o: ../files/src/pwm.c  .generated_files/flags/default/e771bcf93d3f9cdfa908cf6edfc27911648076b1 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/pwm.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/pwm.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/pwm.o.d" -o ${OBJECTDIR}/_ext/1358603075/pwm.o ../files/src/pwm.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/roach.o: ../files/src/roach.c  .generated_files/flags/default/83ee6a46a3813e4c04f85ba18e5fa134ccd9b593 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/roach.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/roach.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/roach.o.d" -o ${OBJECTDIR}/_ext/1358603075/roach.o ../files/src/roach.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/serial.o: ../files/src/serial.c  .generated_files/flags/default/b9c25e0917667544c14412c5f239b846b67a3df0 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/serial.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/serial.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/serial.o.d" -o ${OBJECTDIR}/_ext/1358603075/serial.o ../files/src/serial.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/timers.o: ../files/src/timers.c  .generated_files/flags/default/749cfa24385567ce45c0060183f825d5066be0e6 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/timers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/timers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/timers.o.d" -o ${OBJECTDIR}/_ext/1358603075/timers.o ../files/src/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o: ../files/templates/TemplateEventChecker.c  .generated_files/flags/default/a5aed8a7b4ac0a4ff05616865a74421da6948e6c .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateEventChecker.o ../files/templates/TemplateEventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateFSM.o: ../files/templates/TemplateFSM.c  .generated_files/flags/default/4baf4b6d0b386eacfea9f953f39f0d2d4d380a32 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateFSM.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateFSM.o ../files/templates/TemplateFSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateService.o: ../files/templates/TemplateService.c  .generated_files/flags/default/b5d2be3c5171ca29e794e35274d561550e0fd6eb .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateService.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateService.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateService.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateService.o ../files/templates/TemplateService.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o: ../files/templates/TemplateSubHSM.c  .generated_files/flags/default/9306253f3db1b7a4d779076bddd00499a8813e62 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o.d" -o ${OBJECTDIR}/_ext/2036589742/TemplateSubHSM.o ../files/templates/TemplateSubHSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o: ../files/templates/FindGoalieSub.c  .generated_files/flags/default/56eed694209af27d94c338cf0ea2fe7798b3ccf9 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o.d" -o ${OBJECTDIR}/_ext/2036589742/FindGoalieSub.o ../files/templates/FindGoalieSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/EventChecker.o: ../files/src/EventChecker.c  .generated_files/flags/default/da3f01b71074756b9cac576fb7c7909eb6ce33ad .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/EventChecker.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/EventChecker.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/EventChecker.o.d" -o ${OBJECTDIR}/_ext/1358603075/EventChecker.o ../files/src/EventChecker.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/MotorDriver.o: ../files/src/MotorDriver.c  .generated_files/flags/default/39359c675d70a0e4485385964cc549b97835e1ef .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/MotorDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/MotorDriver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/MotorDriver.o.d" -o ${OBJECTDIR}/_ext/1358603075/MotorDriver.o ../files/src/MotorDriver.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/HitSub.o: ../files/templates/HitSub.c  .generated_files/flags/default/a6f10ac72b008fa5ccc4cee97da9cc056068822c .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/HitSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/HitSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/HitSub.o.d" -o ${OBJECTDIR}/_ext/2036589742/HitSub.o ../files/templates/HitSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o: ../files/src/FlywheelDriver.c  .generated_files/flags/default/dac3723283498c5ccbcaa5f4336b97585b2121c2 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o.d" -o ${OBJECTDIR}/_ext/1358603075/FlywheelDriver.o ../files/src/FlywheelDriver.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/ShootSub.o: ../files/src/ShootSub.c  .generated_files/flags/default/ec83783ddb801fcebba791a83062744dbaaeacf3 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ShootSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/ShootSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/ShootSub.o.d" -o ${OBJECTDIR}/_ext/1358603075/ShootSub.o ../files/src/ShootSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/HSM.o: ../files/src/HSM.c  .generated_files/flags/default/6740551632a46a20384b39a469efdffc3a1923e7 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/HSM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/HSM.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/HSM.o.d" -o ${OBJECTDIR}/_ext/1358603075/HSM.o ../files/src/HSM.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/2036589742/ES_Main.o: ../files/templates/ES_Main.c  .generated_files/flags/default/88423a7ad522b626fe089f7a1b07900e443e36c6 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/2036589742" 
	@${RM} ${OBJECTDIR}/_ext/2036589742/ES_Main.o.d 
	@${RM} ${OBJECTDIR}/_ext/2036589742/ES_Main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/2036589742/ES_Main.o.d" -o ${OBJECTDIR}/_ext/2036589742/ES_Main.o ../files/templates/ES_Main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/AimSub.o: ../files/src/AimSub.c  .generated_files/flags/default/9af0976b6eab7960a460c929e852ef4212877e57 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AimSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/AimSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/AimSub.o.d" -o ${OBJECTDIR}/_ext/1358603075/AimSub.o ../files/src/AimSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
${OBJECTDIR}/_ext/1358603075/GoHomeSub.o: ../files/src/GoHomeSub.c  .generated_files/flags/default/ff84bb14b1a1816e98e327412b7e91462d2e6376 .generated_files/flags/default/25cf332145e109ecc94cb8c88ed46e464b66686
	@${MKDIR} "${OBJECTDIR}/_ext/1358603075" 
	@${RM} ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o.d 
	@${RM} ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -fno-common -I"../Files/srcs" -I"../Files/templates" -I"../Files/include" -I"." -MP -MMD -MF "${OBJECTDIR}/_ext/1358603075/GoHomeSub.o.d" -o ${OBJECTDIR}/_ext/1358603075/GoHomeSub.o ../files/src/GoHomeSub.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -mdfp="${DFP_DIR}"  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../files/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g -mdebugger -D__MPLAB_DEBUGGER_SIMULATOR=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../files/bootloader320.ld
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=1024,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -mdfp="${DFP_DIR}"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/SCHitters.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
