OUTPUT := output/

ADA_LOC := -aIAda
ADA_PROBLEM := $(sort $(dir $(wildcard Ada/*/ )))
ADA_PROBLEM_LOC := $(patsubst %, -aI%, $(ADA_PROBLEM))
ADA_LOC += $(ADA_PROBLEM_LOC)

SRC_LUA := $(wildcard Lua/*.lua)
OBJ_LUA := $(patsubst %.lua, $(OUTPUT)%, $(SRC_LUA))

.PHONY: all build_ada build_lua clean

all: $(OUTPUT) build_ada build_lua
	@echo $(OBJ_LUA)

$(OUTPUT):
	mkdir -p $(OUTPUT)
	mkdir -p $(OUTPUT)Ada
	mkdir -p $(OUTPUT)Lua

build_lua:
	gnatmake Ada/main.adb -d $(ADA_LOC) -D $(OUTPUT)Ada -o $(OUTPUT)Ada/euler
	@echo $(ADA_PROBLEM_LOC)

$(OUTPUT)%: %.lua
	@echo =======================================================
	luac -o $@ $<
	@echo =======================================================
	@echo ""

clean:
	rm -rf output/
