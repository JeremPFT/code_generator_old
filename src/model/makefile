include ../../makefile.config

dir = $(shell pwd)
module = $(shell basename $(shell pwd))
project = gpr/$(module).gpr
harness-dir=../src/$(module)/tests/harness

all::
	gprbuild -p -P $(project)
# @echo "project_root $(project_root)"
# @echo "project_name $(project_name)"
# cd ../../ && $(MAKE)

clean::
	gprclean -P $(project)

tests_init::
	gnattest -P gpr/$(module) \
	--harness-dir=$(module)_harness project_loader.ads \
	--tests-dir=../src/$(module)/tests

tests_build:
	gprbuild -P ../../obj/$(module)_harness/test_driver.gpr

tests_exec: tests_build
	../../obj/$(module)_harness/test_runner
