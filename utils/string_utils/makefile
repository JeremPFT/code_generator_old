include ../../makefile.common

dir = $(shell pwd)
module = $(shell basename $(shell pwd))
project = $(module).gpr

all: compil

compil::
	$(BUILD) -P $(project)

clean::
	$(CLEAN) -P $(project)

recompil: clean compil

tests_generate::
	$(TESTS_GENERATE) -P $(project)

tests_build:
	$(TESTS_BUILD)

tests_run: tests_build
	$(TESTS_RUN)

install:compil
	$(INSTALL) -P $(project)

uninstall::
	$(UNINSTALL) -P $(project)
