OUTPUT := output/

SRC_ADA := $(wildcard Ada/*.adb)
OBJ_ADA := $(patsubst %.adb, $(OUTPUT)% , $(SRC_ADA))

.PHONY: all build_ada clean

all: $(OUTPUT) build_ada
	@echo $(SRC_ADA)
	@echo $(OBJ_ADA)

$(OUTPUT):
	mkdir -p $(OUTPUT)
	mkdir -p $(OUTPUT)Ada

build_ada: $(OBJ_ADA)
	rm -rf *.ali *.o

$(OUTPUT)%: %.adb
	gnatmake -o $@ $<

clean:
	rm -rf output/
