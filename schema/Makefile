### Setup
# yq executable
YQ ?= yq
# remove all files command
RMALL ?= $(if $(filter $(OS),Windows_NT),del /F/Q,rm -f)

### Definitions
schemas = sdu.schema.json

sdu_test_fail = $(wildcard test-fail/**/*.json)

### Actions
all: $(schemas)

clean:
	-$(RMALL) $(schemas)

target-files:
	echo $(schemas)

.PHONY: all check clean target-files

check: $(schemas)
	echo $(sdu_test_fail)

%.schema.json: %.schema.yaml
	$(YQ) -jP e . $< > $@

