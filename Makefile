TARGET = carrot
CC = g++
PREF_BIN = ./bin

maHEADERS = program.h headers.h
OBJECTS = program.o

SOURCES = main.c
OBJ = $(PREF_BIN)/$(patsubst %.c,%.o, $(SOURCES))

all: $(PREF_BIN) $(TARGET)

$(PREF_BIN):
	mkdir -p $(PREF_BIN)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)
	
$(OBJ):
	$(CC) -c main.cpp -o bin/main.o


clean :
	rm -f -r $(PREF_BIN)
	
	
#rm -f -r $(BIN_DIR)
	
	
	


# SRC = $(wildcard *.c) # get all .c files
# OBJ = $(patsubst %.c, %.o, $(SRC)) # get all .c files, add .o
