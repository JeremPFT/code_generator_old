sources +=
# sources += model-array_def.ads
# sources += model-class_def.ads
# sources += model-comment.ads
# sources += model-element.ads
sources += model-array_def-test.ads
# sources += model-enum_def.ads
# sources += model-enum_value.ads
# sources += model-field.ads
# sources += model-interface_def.ads
# sources += model-named_element.ads
# sources += model-package_def.ads
# sources += model-parameter.ads
# sources += model-subprogram.ads
# sources += model-type_def.ads


tests_dir = _tests
tests_harness_dir = _tests_harness

tests: tests_generate tests_build
	./$(tests_harness_dir)/test_runner

tests_generate::
	gnattest -Ptests.gpr $(sources) --tests-dir=../$(tests_dir) --harness-dir=../$(tests_harness_dir)

tests_build::
	gprbuild -P $(tests_harness_dir)/test_driver.gpr
