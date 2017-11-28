include ../../makefile.config

dir = $(shell pwd)
module = $(shell basename $(shell pwd))
sources +=
sources += model-element.ads
sources += model-named_element.ads
sources += model-comment.ads

project_files_path = ../../gpr
project_files_path += ../*/gpr

# model-parameter.ads
# model-subprogram.ads \
# model-type_def.ads
# model-package_def.ads \
# model-enum_def.ads \
# model-enum_value.ads \
# model-field.ads \
# model-interface_def.ads \
# model-array_def.ads \
# model-class_def.ads \
# model-comment.ads \


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
