include ../../makefile.config

dir = $(shell pwd)
module = $(shell basename $(shell pwd))
project = gpr/$(module).gpr
harness-dir=../src/$(module)/tests/harness

# tests_ads :=
# tests_ads := model-element.ads
# tests_ads := model-element.ads

all: compil

compil::
	gprbuild -p -P $(project)

clean::
	gprclean -P $(project)

recompil: clean compil

tests_init::
	gnattest -P gpr/$(module) \
	--harness-dir=$(module)_harness $(tests_ads) \
	--tests-dir=../src/$(module)/tests

tests_build:
	gprbuild -P ../../obj/$(module)_harness/test_driver.gpr

tests_exec: tests_build
	../../obj/$(module)_harness/test_runner
