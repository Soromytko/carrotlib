PROJECT = carrot
CC = g++
LDFLAGS = -L/usr/X11R6/lib
LDFLAGS += -lX11

SRC_DIR := ./src
BIN_DIR := ./bin
OBJ_DIR := $(BIN_DIR)/obj
DEBUG_DIR := $(BIN_DIR)/debug
SRC_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
TARGET = $(DEBUG_DIR)/$(PROJECT).sh

all: $(BIN_DIR) $(OBJ_DIR) $(DEBUG_DIR) $(TARGET)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(DEBUG_DIR):
	mkdir -p $(DEBUG_DIR)

$(TARGET): $(OBJ_FILES)
	$(CC) $^ $(LDFLAGS) -o $@ 

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CC) -c $< -o $@

clean:
	rm -f -r $(BIN_DIR)

