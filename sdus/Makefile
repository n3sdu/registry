### Setup
# yq executable
YQ ?= yq
# remove all files command
RMALL ?= $(if $(filter $(OS),Windows_NT),del /F/Q,rm -f)
VALIDATE ?= docker run --rm -it -v "$(pwd):/data:ro" -v "$(pwd)/../schema:/schema:ro" jonasprogrammer/json-schema-validator
VALIDATE_MAPPINGS ?= $(foreach file,$(wildcard ../schema/*.schema.json), -m "http://n3sdu.github.io/r/schema/$(notdir $(file))=$(file)")

### Definitions
yamlsdus := $(patsubst %.sdu.yaml,%.sdu.json,$(wildcard *.sdu.yaml))
sdus := $(sort $(wildcard *.sdu.json) $(yamlsdus))

### Actions
all: $(yamlsdus) check

clean:
	-$(RMALL) $(yamlsdus)

target-files:
	echo $(yamlsdus)

sdus:
	echo $(sdus)

check: $(yamlsdus)
	$(VALIDATE) $(VALIDATE_MAPPINGS) -s http://n3sdu.github.io/r/schema/sdu.schema.json $<

.PHONY: all clean target-files sdus

%.sdu.json: %.sdu.yaml
	$(YQ) -jP e . $< > $@
