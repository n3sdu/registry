include ../build/Makefile.setup

### Definitions
yamlcontracts := $(patsubst %.contract.yaml,%.contract.json,$(wildcard *.contract.yaml))
contracts := $(sort $(wildcard *.contract.json) $(yamlcontracts))

### Actions
all: $(yamlcontracts)

clean:
	-$(RMALL) $(yamlcontracts)

target-files:
	echo $(yamlcontracts)

contracts:
	echo $(contracts)

check: $(yamlcontracts)
	$(VALIDATE) $(VALIDATE_MAPPINGS) -s http://n3contract.github.io/r/schema/contract.schema.json $(contracts)

.PHONY: all clean target-files contracts

%.contract.json: %.contract.yaml
	$(YQ) -jP e . $< > $@
