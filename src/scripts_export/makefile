include ../../makefile.config

dir = $(shell pwd)
module = $(shell basename $(shell pwd))
sources +=

project_files_path = ../../gpr
project_files_path += ../*/gpr

all::
	@echo "project_root $(project_root)"
	@echo "project_name $(project_name)"
	cd ../../ && $(MAKE)

clean::
	cd ../../ && $(MAKE) clean

clean_all::
	cd ../../ && $(MAKE) clean_all

tests_generate::
	cd ../../tests && ln -s ../src/*/*ad[sb] .

	# tests_dir=tests
	# harness_dir=tests_harness
	# gnattest -Pgpr/tests_model.gpr --tests-dir=tests --harness-dir=tests_harness


# cd ../../ && $(MAKE) tests_generate \
#    sources="$(sources)" \
# gnattest --tests-dir=tests --harness-dir=tests_harness -P ../../prj_gpr/code_generator_build.gpr $(sources)

tests::
	gprbuild -aP ../*/gpr gpr/tests.gpr
