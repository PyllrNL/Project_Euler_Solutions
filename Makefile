OUTPUT := output/

ADA_LOC := -aIAda
ADA_PROBLEM := $(sort $(dir $(wildcard Ada/*/ )))
ADA_PROBLEM_LOC := $(patsubst %, -aI%, $(ADA_PROBLEM))
ADA_LOC += $(ADA_PROBLEM_LOC)

SRC_LUA := $(wildcard Lua/*.lua)
OBJ_LUA := $(patsubst %.lua, $(OUTPUT)%, $(SRC_LUA))

.PHONY: all build_ada clean check check_ada build_lua check_lua

all: $(OUTPUT) build_ada

$(OUTPUT):
	mkdir -p $(OUTPUT)
	mkdir -p $(OUTPUT)Ada
	mkdir -p $(OUTPUT)Lua

build_ada:
	gnatmake Ada/main.adb -d $(ADA_LOC) -D $(OUTPUT)Ada -o $(OUTPUT)Ada/euler

check: check_ada

check_ada:
	./output/Ada/euler

check_lua:
	lua Lua/main.lua

clean:
	rm -rf output/
