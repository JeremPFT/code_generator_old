dir = $(shell pwd)
module = $(shell basename $(shell pwd))
project = $(module).gpr

include makefile.common

# # tmp::
# # 	echo "project_root: $(project_root)"
# # 	echo "project_dir $(project_dir)"

# all::
# 	@echo project_path_list : $(project_path_list)
# 	@echo project_files_list : $(project_files_list)

# # @echo module : $(module)
# # @echo project_path_list : $(project_path_list)
# # @echo project_files_list : $(project_files_list)

all: compil run

# @echo
# @echo "=================================================="
# @echo "==           COMPILING: $(module)"
# @echo "=================================================="
# @echo
compil: compil_tag
	$(BUILD) $(project)
	@echo

run: compil
	@echo
	@echo "=================================================="
	@echo "==           RUNNING: $(module)"
	@echo "=================================================="
	@echo
	@./bin/output_project
	@echo

clean::
	@echo
	@echo "=================================================="
	@echo "==           CLEANING: $(module)"
	@echo "=================================================="
	@echo
	$(CLEAN) $(project)
	@echo

install:compil uninstall
	@echo
	@echo "=================================================="
	@echo "==           INSTALLING: $(module)"
	@echo "=================================================="
	@echo
	$(INSTALL) -P $(project)

uninstall::
	@echo
	@echo "=================================================="
	@echo "==           UNINSTALLING: $(module)"
	@echo "=================================================="
	@echo
	-$(UNINSTALL) -P $(project)
