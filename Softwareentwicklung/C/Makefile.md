# Makefile

Kompiliervorgänge sind mit jeder Code-Änderung notwendig. Um nicht jedesmal die gesamte Tool-Kette eintippen zu müssen, kann ein Makefile erstellt werden in welchem die einzelnen Schritte abgelegt werden können:

```
#
# Makefile f. func
#
#.....................................................
help:
	@echo "make all    ... compile and link all"
	@echo "make lib    ... create library"
	@echo "make clean  ... delete binaries"
	@echo "make run    ... run myProg.exe"


# 1. Objekt-Dateien angeben
#.....................................................
OBJ = func.o main.o


# 2. wenn .c oder .h geändert wurden -> neu übersetzen
#.....................................................
#	in diesem Bespiel wird also folg. gemacht:
#		gcc -c func.c
#		gcc -c main.c
%.o: %.c %.h
	gcc -c $<
	

# 3. myProg.exe erzeugen
#.....................................................
all: $(OBJ)
	gcc -o myProg.exe $(OBJ)
	
		

#.....................................................
clean:
	del *.a
	del *.o
	del *.exe

#.....................................................
run:
	./myProg.exe
	

# library erstellen
#.....................................................	
lib:
	gcc -c func.c
	ar r func.a func.o
	gcc main.c -L . func.a -o myProg.exe

```

Einrückungen müssen ein Tabulator sein. Für jeden Aufrufparameter gibt's einen eigenen Bereich (all, clean, lib, run).

Nun kann in der Kommandozeile `make` ausgeführt werden hier mit den Parametern clean, lib, func und run (in Windows muss evtl. mingw32-make.exe ausgefürt werden). make wird automatisch mit dem Makefile im aktuellen Verzeichnis ausgeführt.

Beispiel:

```
# C-Compiler und Flags (auch mit Pfad)
CC = gcc
CFLAGS  = -Wall

# C++-Compiler und Flags (auch mit Pfad)
CXX = g++
CXXFLAGS  = -Wall

# Linker Flags
LDFLAGS = 

# Ermitteln der zu kompilierenden Sourcen: alle *.c* Dateien
#.....................................................
SRCS := $(wildcard *.c *.cpp)
OBJS := $(patsubst %.cpp,%.o,$(SRCS))
OBJS := $(patsubst %.c,%.o,$(OBJS))

# *.o Erzeugen
#  Vorbedingung: cpp-Files *.cpp
#.....................................................
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# out(.exe) Erzeugen
#  Vorbedingung: Object-Files *.o
#.....................................................
all: $(OBJS)
	$(CXX) -o out $(OBJS) $(LDFLAGS)

# Löschen von Build-Dateien
#.....................................................
clean:
	del *.a
	del *.o
	del *.exe
	del out
```

--- 

- [CMake](CMake.md)