SCHEMAS_PATH ?= ./schema/
VALIDATE_MAPPINGS ?= $(foreach file,$(wildcard $(SCHEMAS_PATH)/*.schema.json), -m "http://n3contract.github.io/r/schema/$(notdir $(file))=$(abspath $(file))")
include build/Makefile.setup

export

all: schema contracts sdus

clean: clean-schema clean-contracts clean-sdus

check: check-contracts check-sdus

schema:
	$(MAKE) -C schema

clean-schema:
	$(MAKE) -C schema clean

contracts:
	$(MAKE) -C contracts

clean-contracts:
	$(MAKE) -C contracts clean

check-contracts:
	$(MAKE) -C contracts check

sdus:
	$(MAKE) -C sdus

clean-sdus:
	$(MAKE) -C sdus clean

check-sdus:
	$(MAKE) -C sdus check

.PHONY: all clean check schema clean-schema contracts clean-contracts check-contracts sdus clean-sdus check-sdus
