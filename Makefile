SHELL=/bin/bash

DESTDIR =
prefix	= /usr/local

exec_prefix = $(prefix)

bindir		= $(exec_prefix)/bin
sbindir		= $(exec_prefix)/sbin
libexecdir	= $(exec_prefix)/libexec
libexecdir_	= $(libexecdir)/alx/containers

all: | common swarm kubernetes openshift

.PHONY: common
common:
	@cd $(CURDIR)/bin && \
	find alx_stack_* -type f 2>/dev/null \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(bindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(bindir)/$$f"; \
	done;
	@cd $(CURDIR)/sbin && \
	find alx_stack_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(sbindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(sbindir)/$$f"; \
	done;
	@cd $(CURDIR)/libexec && \
	find $@/ -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;

.PHONY: swarm
swarm: | common
	@cd $(CURDIR)/libexec && \
	find $@/ -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;

.PHONY: kubernetes
kubernetes: | common
	@cd $(CURDIR)/libexec && \
	find $@/ -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;

.PHONY: openshift
openshift: | common kubernetes
	@cd $(CURDIR)/libexec && \
	find $@/ -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;
