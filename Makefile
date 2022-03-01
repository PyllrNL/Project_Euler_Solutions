OUTPUT := output/

SRC_ADA := $(wildcard Ada/*.adb)
OBJ_ADA := $(patsubst %.adb, $(OUTPUT)% , $(SRC_ADA))

SRC_LUA := $(wildcard Lua/*.lua)
OBJ_LUA := $(patsubst %.lua, $(OUTPUT)%, $(SRC_LUA))

.PHONY: all build_ada build_lua clean

all: $(OUTPUT) build_ada build_lua
	@echo $(OBJ_LUA)

$(OUTPUT):
	mkdir -p $(OUTPUT)
	mkdir -p $(OUTPUT)Ada
	mkdir -p $(OUTPUT)Lua

build_ada: $(OBJ_ADA)
	rm -rf *.ali *.o

build_lua: $(OBJ_LUA)

$(OUTPUT)%: %.adb
	gnatmake -o $@ $<

$(OUTPUT)%: %.lua
	luac -o $@ $<

clean:
	rm -rf output/
