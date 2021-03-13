### Setup
# yq executable
YQ ?= yq
# remove all files command
RMALL ?= $(if $(filter $(OS),Windows_NT),del /F/Q,rm -f)


### Definitions
yamlsdus := $(patsubst %.sdu.yaml,%.sdu.json,$(wildcard *.sdu.yaml))

### Actions
all: $(yamlsdus)

clean:
	-$(RMALL) $(yamlsdus)

target-files:
	echo $(yamlsdus)

.PHONY: all clean target-files

%.sdu.json: %.sdu.yaml
	$(YQ) -jP e . $< > $@
