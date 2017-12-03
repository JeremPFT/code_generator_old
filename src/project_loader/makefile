include ../../makefile.config

dir = $(shell pwd)
module = $(shell basename $(shell pwd))
harness-dir=../src/$(module)/tests/harness

all::
	@echo "project_root $(project_root)"
	@echo "project_name $(project_name)"
	cd ../../ && $(MAKE)

clean::
	cd ../../ && $(MAKE) clean

clean_all::
	cd ../../ && $(MAKE) clean_all

tests_init::
	gnattest -P gpr/$(module) \
	--harness-dir=../src/$(module)/tests/harness project_loader.ads \
	--tests-dir=../src/$(module)/tests

tests_run: tests_build
	./tests/harness/test_runner

tests_build:
	gprbuild -P tests/harness/test_driver.gpr
