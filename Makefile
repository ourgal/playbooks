FILES := $(basename $(wildcard playbooks/*.yml))
TARGETS := $(FILES:playbooks/%=%)

.PHONY: all ${TARGETS}
all: ${TARGETS}

build: windows

${TARGETS}:
	ansible-lint playbooks/$@.yml
	ansible-playbook playbooks/$@.yml
