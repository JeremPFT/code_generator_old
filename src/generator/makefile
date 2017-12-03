include ../../makefile.config

dir = $(shell pwd)
module = $(shell basename $(shell pwd))

all::
	@echo "project_root $(project_root)"
	@echo "project_name $(project_name)"
	cd ../../ && $(MAKE)

clean::
	cd ../../ && $(MAKE) clean

clean_all::
	cd ../../ && $(MAKE) clean_all
