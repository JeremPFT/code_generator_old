export GPR_PROJECT_PATH_FILE=/home/jeremy/workspace/ada/code_generator/projects_list.txt

project = $(shell basename $(shell pwd))
gpr_file = gpr/$(project).gpr

all::
	gprbuild -p $(gpr_file)

clean::
	gprclean $(gpr_file)
