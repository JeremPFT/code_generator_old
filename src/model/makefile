dir = $(shell pwd)
module = $(shell basename $(shell pwd))
project = $(module).gpr

include ../../makefile.common

all: compil

compil::
	$(BUILD) -P $(project)

clean::
	$(CLEAN) -P $(project)

recompil: clean compil

list +=
list += model-element.ads
list += model-comment.ads
tests_generate::
	$(TESTS_GENERATE) -P $(project) $(list)

tests_build:
	$(TESTS_BUILD)

tests_run: tests_build
	$(TESTS_RUN)

install:compil
	$(INSTALL) -P $(project)

uninstall::
	$(UNINSTALL) -P $(project)
