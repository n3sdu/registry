YQ ?= yq

all: sdu.schema.json
.PHONY: all

%.schema.json: %.schema.yaml
	$(YQ) -jP r $< > $@

