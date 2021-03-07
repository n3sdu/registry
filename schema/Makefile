### Setup
# yq executable
YQ ?= yq
# remove all files command
RMALL ?= $(if $(filter $(OS),Windows_NT),del /F/Q,rm -f)

### Definitions
schemas = sdu.schema.json common.schema.json \
          table.vis.schema.json 2pmap.vis.schema.json

### Actions
all: $(schemas)

clean:
	-$(RMALL) $(schemas)

target-files:
	echo $(schemas)

.PHONY: all clean target-files

%.schema.json: %.schema.yaml
	$(YQ) -jP e . $< > $@

