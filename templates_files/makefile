include makefile.config
include makefile.common

# tmp::
# 	echo "project_root: $(project_root)"
# 	echo "project_dir $(project_dir)"

all: compil

compil::
	@echo
	@echo "---------------------------"
	@echo "--  COMPILING DU PROJET  --"
	@echo "---------------------------"
	@echo
	$(BUILD) $(gpr_file) -gnatv
	@echo
	@echo "----------------------"
	@echo "--  COMPILING DONE  --"
	@echo "----------------------"
	@echo

run: compil
	@echo "-----------------------"
	@echo "--  RUNNING PROJECT  --"
	@echo "-----------------------"
	@echo
	@$(exec)
	@echo
	@echo "--------------------"
	@echo "--  RUNNING DONE  --"
	@echo "--------------------"

clean::
	@echo
	@echo "------------------------"
	@echo "--  CLEANING PROJECT  --"
	@echo "------------------------"
	@echo
	$(CLEAN) $(gpr_file)
	@echo
	@echo "---------------------"
	@echo "--  CLEANING DONE  --"
	@echo "---------------------"
	@echo
clean_all::
	@echo
	@echo "-----------------------------"
	@echo "--  REC. CLEANING PROJECT  --"
	@echo "-----------------------------"
	@echo
	$(CLEAN) -r $(gpr_file)
	@echo
	@echo "---------------------"
	@echo "--  CLEANING DONE  --"
	@echo "---------------------"
	@echo

# tests_generate::
# 	@echo
# 	@echo "----------------------"
# 	@echo "--  BUILDING TESTS  --"
# 	@echo "----------------------"
# 	@echo
# 	@echo $(sources)
# 	@echo "tests_dir: $(tests_dir)"
# 	@echo "harness_dir: $(harness_dir)"
# # echo "CMD" $(test)
# # $(TEST) -P $(project) $(sources)
# #	gnattest --tests-dir=$(tests_dir) --harness-dir=$(harness_dir)
# 	gnattest -Pgpr/code_generator_build.gpr
# 	@echo
# 	@echo "------------------"
# 	@echo "--  TESTS DONE  --"
# 	@echo "------------------"
# 	@echo

# tests::
# 	$(build-tests)
# 	$(run-tests)
