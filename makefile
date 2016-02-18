# ---------------------------------------------------------------------
# Link options and libraries
# ---------------------------------------------------------------------
# I moved the makefile to the root folder because my IDE wasn't detecting it
#
#
#

gccopt= gcc -O2 -funroll-loops
gccdeb= gcc -ggdb -Wall -pedantic
gppdeb = g++ $(CCDEB) 
#CCC = $(gccopt)
CCC = $(gccdeb)

CFLAGS=
LINUXLIBS= -lm 

LIBS= $(LINUXLIBS) 

CCCLNFLAGS = $(LIBS)

CCCFLAGS = 


all: bin/myopt

# generic rule to build object files
# $< refers to src/%.c (dependency)
# $@ refers to bin/%.o (rule)
# $* refers to %
bin/%.o: src/%.c
	@echo compiling $*.c with $(CCC) $(CCCFLAGS)
	@$(CCC) $(CCCFLAGS) -c $< -o $@


MYOPT = bin/myopt.o bin/myobasic.o bin/myoalgo.o bin/utilities.o

bin/myopt: $(MYOPT)
	$(CCC) $(CCCFLAGS) -o bin/myopt $(MYOPT) $(CCCLNFLAGS)

clean:
	rm bin/*

sweep:
	rm *~
	rm *#

