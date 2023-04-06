PROJECT = carrot
CC = g++
SOURCES = main.cpp
PREF_BIN = ./bin
PREF_OBJ = $(PREF_BIN)/obj
PREF_DEBUG = $(PREF_BIN)/debug

OBJ = $(PREF_OBJ)/$(patsubst %.cpp,%.o, $(SOURCES))
TARGET = $(PREF_DEBUG)/$(PROJECT).sh

all: $(PREF_BIN) $(PREF_OBJ) $(PREF_DEBUG) $(TARGET)

$(PREF_BIN):
	mkdir -p $(PREF_BIN)

$(PREF_OBJ):
	mkdir -p $(PREF_OBJ)

$(PREF_DEBUG):
	mkdir -p $(PREF_DEBUG)

$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $(TARGET)

$(OBJ): $(SOURCES)
	$(CC) -c $< -o $@

clean:
	rm -f -r $(PREF_BIN)
	
	


# SRC = $(wildcard *.c) # get all .c files
# OBJ = $(patsubst %.c, %.o, $(SRC)) # get all .c files, add .o
