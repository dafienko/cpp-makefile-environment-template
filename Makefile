CC = clang++
CFLAGS = -Wall -g

SOURCE_DIR = src
BUILD_DIR = build
EXECUTABLE = program

sources = $(wildcard $(SOURCE_DIR)/*.cpp)
$(info ${sources})
objects = $(patsubst %.cpp,%.o,$(patsubst $(SOURCE_DIR)%,$(BUILD_DIR)%,$(sources)))
$(info ${objects})

$(EXECUTABLE) : $(objects)
	$(CC) $(CFLAGS) -o $@ $^

$(objects) :
	$(CC) $(CFLAGS) -o $@ -c $(subst $(BUILD_DIR),$(SOURCE_DIR),$*).cpp

clean:
	rm $(EXECUTABLE) $(BUILD_DIR)/*