# Define the compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c11

# Define the directories
SRC_DIR = .
CLASSIFICATION_DIR = classification
PREPROCESSING_DIR = preprocessing

# Define the source files and the object files
SRCS = $(SRC_DIR)/main.c \
       $(CLASSIFICATION_DIR)/decision_tree_classifier.c \
       $(PREPROCESSING_DIR)/extraction.c \
       $(PREPROCESSING_DIR)/hash_encoding.c
OBJS = $(SRCS:%.c=$(SRC_DIR)/%.o)

# Define the output executable
TARGET = main

# Default target
all: $(TARGET)

# Rule to build the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $(OBJS)

# Rule to build object files
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -I$(CLASSIFICATION_DIR) -I$(PREPROCESSING_DIR) -c $< -o $@

$(CLASSIFICATION_DIR)/%.o: $(CLASSIFICATION_DIR)/%.c
	$(CC) $(CFLAGS) -I$(CLASSIFICATION_DIR) -I$(PREPROCESSING_DIR) -c $< -o $@

$(PREPROCESSING_DIR)/%.o: $(PREPROCESSING_DIR)/%.c
	$(CC) $(CFLAGS) -I$(CLASSIFICATION_DIR) -I$(PREPROCESSING_DIR) -c $< -o $@

# Clean rule
clean:
	rm -f $(TARGET) $(OBJS)

# Phony targets
.PHONY: all clean