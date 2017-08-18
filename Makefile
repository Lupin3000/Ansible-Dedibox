ENV_DIR = .env
CURRENT_DIR := $(shell pwd)
INTERPRETER = $(CURRENT_DIR)/$(ENV_DIR)/bin/
PATH := ${PATH}:$(INTERPRETER)

help:
	@echo "Run make <target> with:"
	@echo " > env_create    : create virtualenv on folder $(ENV_DIR)"
	@echo " > env_deps      : install dependentcies"
	@echo " > env_del       : delete virtualenv"
	@echo " > validate      : execute Ansible validation"
	@echo " > list          : list all Ansible tasks"
	@echo " > prod_test     : run Ansible in dry mode"
	@echo " > prod_run      : run Ansible"

env_create:
	virtualenv $(ENV_DIR) && \
	. $(ENV_DIR)/bin/activate && \
	make env_deps

env_deps:
	$(ENV_DIR)/bin/pip install -r requirements.txt

env_del:
	rm -fr $(ENV_DIR)

validate:
	$(ENV_DIR)/bin/ansible-playbook playbook.yml -i inventory --syntax-check

list:
	$(ENV_DIR)/bin/ansible-playbook playbook.yml -i inventory --list-tasks

prod_test:
	$(ENV_DIR)/bin/ansible-playbook playbook.yml -i inventory -u lupin --key-file=~/.ssh/id_rsa --check

prod_run:
	$(ENV_DIR)/bin/ansible-playbook playbook.yml -i inventory -u lupin --key-file=~/.ssh/id_rsa
