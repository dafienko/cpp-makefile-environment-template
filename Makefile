CFLAGS = -Wall -g

SOURCE_DIR = src
BUILD_DIR = build

ifeq ($(OS),Windows_NT)
    CC = g++
	cleanCommand = del /Q
	pathSlash = $(subst /,\,/)
	EXECUTABLE = program.exe
else
    CC = clang++
	cleanCommand = rm
	pathSlash = /
	EXECUTABLE = program
endif

sources = $(wildcard $(SOURCE_DIR)/*.cpp)
$(info ${sources})
objects = $(patsubst %.cpp,%.o,$(patsubst $(SOURCE_DIR)%,$(BUILD_DIR)%,$(sources)))
$(info ${objects})

$(EXECUTABLE) : $(objects)
	$(CC) $(CFLAGS) -o $@ $^

$(objects) : build
	$(CC) $(CFLAGS) -o $@ -c $(subst $(BUILD_DIR),$(SOURCE_DIR),$*).cpp

build: 
	mkdir $(BUILD_DIR)

clean:
	$(cleanCommand) $(subst /,$(pathSlash),$(BUILD_DIR)/*)
	$(cleanCommand) $(EXECUTABLE)