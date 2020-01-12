

CC = gcc
FC = gfortran

LIB = libfSys.so


C_SOURCES = cmkdir.c cstrlen.c cmv.c cchmod.c crm.c
F_SOURCES = mkdir.f90 mv.f90 chmod.f90 rm.f90
F_UTILS = strlen.f90 fsystem.f90 
F_END = fshell.f90

F_SOURCES := $(F_UTILS) $(F_SOURCES) $(F_END)

C_OBJECTS = $(patsubst %.c, %.o, $(C_SOURCES))
F_OBJECTS = $(patsubst %.f90, %.o, $(F_SOURCES)) 
F_MODS = $(patsubst %.f90, %.mod, $(F_SOURCES))  

FC_FLAGS = -fPIC -shared
CC_FLAGS = -fPIC -shared

.PHONY: all clean

all: $(LIB)
	
%.o : %.c
	$(CC) $(CFLAGS) $(INCLUDE) $(CC_FLAGS) -c $< 
	
%.o : %.f90
	$(FC) $(FFLAGS) $(INCLUDE) $(FC_FLAGS) -c $<
	
%.f90 : %.c
	@true
	
%.mod : %.o
	@true

$(LIB): $(F_OBJECTS) $(C_OBJECTS)
	$(FC) $(FFLAGS) $(FC_FLAGS) $(LIB_FLAGS) $(INCLUDE) $(LDFLAGS) $(LIBS) -o $@ $(F_OBJECTS) $(C_OBJECTS)

clean:
	-@rm -rf *.o *.mod *.a *.so *.smod

