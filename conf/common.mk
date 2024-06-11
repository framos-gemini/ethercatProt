#Some common definitions for Making targets are here

#Include the configuration
-include conf/config.mk

# Compiler is always gcc for now
CXX := g++

RM := rm -rf

MKDIRHIER  := mkdir -p

LN := ln -s

CP := cp -f

CPDIR := cp -r

MAKE := make

MOVE := mv

OS := Linux
MKLIB = $(CXX) -shared -fPIC

#Giapi Install directories
ETHERCATPROT_INCLUDE_BASE := $(INSTALL_DIR)/include
ETHERCATPROT_INCLUDE_DIR := $(ETHERCATPROT_INCLUDE_BASE)/ethercatprot
ETHERCATPROT_LIB_DIR := $(INSTALL_DIR)/lib

#Log4cxx stuff
PCAS_BASE := $(EXTERNAL_LIB)/pcas
PCAS_INCLUDE := $(PCAS_BASE)/include
PCAS_LIB := $(PCAS_BASE)/lib/linux-x86_64
$(info PCAS_LIB = $(ETHERCATPROT) )

EPICS_BASE := $(EXTERNAL_LIB)/epics-base
EPICS_INCLUDE := $(EPICS_BASE)/include
EPICS_INCLUDE_OS := $(EPICS_BASE)/include/os/Linux
EPICS_INCLUDE_PV := $(EPICS_BASE)/include/pv
EPICS_INCLUDE_compiler := $(EPICS_BASE)/include/compiler/gcc

EPICS_LIB := $(EPICS_BASE)/lib/linux-x86_64

#Name to be used for the ETHERCATPROT distribution package
DIST_PACKAGE_NAME := ethercatprot-dist

#Temporary directory to make distribution
TMP_DIST_DIR := /tmp/$(DIST_PACKAGE_NAME)

# Rule for building objects
%.o: %.cpp
	@echo 'Building file: $<'
	@echo 'Invoking $(OS) C++ Compiler'
	$(CXX) $(INC_DIRS) -g -O0 -Wall -fPIC -c -Wno-deprecated -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '
