SHELL=/bin/bash

DESTDIR =
prefix	= /usr/local

exec_prefix = $(prefix)

bindir		= $(exec_prefix)/bin
sbindir		= $(exec_prefix)/sbin
libexecdir	= $(exec_prefix)/libexec
libexecdir_	= $(libexec)/alx/containers

all: | containers docker kubernetes oc

.PHONY: containers
containers:
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
	find alx_{containers,stack}_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;

.PHONY: docker
docker: | containers
	@cd $(CURDIR)/libexec && \
	find alx_swarm_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;

.PHONY: kubernetes
kubernetes: | containers
	@cd $(CURDIR)/libexec && \
	find alx_kube_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;

.PHONY: oc
oc: | containers kubernetes
	@cd $(CURDIR)/libexec && \
	find alx_oc_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(libexecdir_)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(libexecdir_)/$$f"; \
	done;
