dir = $(shell pwd)
module = $(shell basename $(shell pwd))
project = $(module).gpr

include ../../makefile.common

all:
	make -C ../..
	./bin/output_project

run::
	./bin/output_project

compil:
	make -C ../model
	make -C ../project_loader
	make -C ../project_output
	$(BUILD) -P $(project)
	@echo updating xref...
	@export LD_LIBRARY_PATH=/usr/gnat/lib/gps:$LD_LIBRARY_PATH && \
	gnatinspect -P $(project) --command="shell echo xref updated"
	@echo

clean::
	@echo
	@echo "========================================"
	@echo "==           CLEANING"
	@echo "========================================"
	$(CLEAN) -P $(project)

recompil: clean compil

tests::
	@echo
	@echo tests_generate
	@echo tests_build
	@echo tests_run

list +=
list += model-element.ads
list += model-comment.ads
tests_generate: compil
	@echo
	@echo "========================================"
	@echo "==          TESTS GENERATION"
	@echo "========================================"
	$(TESTS_GENERATE) -P $(project) $(list)

tests_build:
	@echo
	@echo "========================================"
	@echo "==          TESTS COMPILATION"
	@echo "========================================"
	$(TESTS_BUILD)

tests_run: compil tests_build
	@echo
	@echo "========================================"
	@echo "==          RUNINNG TESTS"
	@echo "========================================"
	$(TESTS_RUN)

install:compil uninstall
	$(INSTALL) -P $(project)

uninstall::
	-$(UNINSTALL) -P $(project)
