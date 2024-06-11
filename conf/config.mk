#Directories used to build and install the pcas_example language glue. 
ifndef ETHERCATPROT
       ETHERCATPROT:=$(shell pwd | sed -E 's/(src|test).*//' )
       $(info ETHERCATPROT is not defined, using  $(ETHERCATPROT) )
endif

#Installation directory
INSTALL_DIR := ${ETHERCATPROT}/install

#External libraries dependencies, used during build
EXTERNAL_LIB := ${ETHERCATPROT}/ext

#Directory where distribution files are going to be stored
DISTRIBUTION_DIR := ${ETHERCATPROT}/dist
