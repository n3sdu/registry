include ../build/Makefile.setup

### Definitions
schemas = sdu.schema.json common.schema.json contract.schema.json \
          table.vis.schema.json 2pmap.vis.schema.json contract.vis.schema.json

### Actions
all: $(schemas)

clean:
	-$(RMALL) $(schemas)

target-files:
	echo $(schemas)

.PHONY: all clean target-files

%.schema.json: %.schema.yaml
	$(YQ) -jP e . $< > $@

