# Rule for building objects

-include ../../conf/config.mk
-include ../../conf/common.mk

INC_DIRS= -I../../ -I../ -I$(EPICS_INCLUDE) -I$(PCAS_INCLUDE) -I$(EPICS_INCLUDE_OS) -I$(EPICS_INCLUDE_PV) -I$(EPICS_INCLUDE_compiler)

LIB_DIRS= -L../../ -L$(EPICS_LIB) -L$(PCAS_LIB) 

LIBS= -lCom -lca -lpvData -lpvAccess -lpvAccessCA -lpvDatabase -lgdd -lcas

LD_LIBRARY_PATH := ../../:$(EPICS_LIB):$(PCAS_LIB)

all: exPV

exPV: exChannel.o exAsyncPV.o exScalarPV.o exVectorPV.o exPV.o exServer.o main.o
	$(CXX) $(LIB_DIRS) -o excas $?  $(LIBS) 

%.o: %.cc
	@echo 'Building file: $<'
	@echo 'Invoking $(OS) C++ Compiler'
	$(CXX) $(INC_DIRS) -g -O0 -Wall -fPIC -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

clean:
	-$(RM) *.o *.d exPV
