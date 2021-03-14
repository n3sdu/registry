include ../build/Makefile.setup

### Definitions
yamlsdus := $(patsubst %.sdu.yaml,%.sdu.json,$(wildcard *.sdu.yaml))
sdus := $(sort $(wildcard *.sdu.json) $(yamlsdus))

### Actions
all: $(yamlsdus)

clean:
	-$(RMALL) $(yamlsdus)

target-files:
	echo $(yamlsdus)

sdus:
	echo $(sdus)

check: $(yamlsdus)
	$(VALIDATE) $(VALIDATE_MAPPINGS) -s http://n3sdu.github.io/r/schema/sdu.schema.json $(sdus)

.PHONY: all clean target-files sdus

%.sdu.json: %.sdu.yaml
	$(YQ) -jP e . $< > $@
