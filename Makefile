SHELL=/bin/bash

DESTDIR =
prefix	= /usr/local

exec_prefix = $(prefix)

bindir	= $(exec_prefix)/bin
sbindir	= $(exec_prefix)/sbin

all: | containers docker kubernetes oc

.PHONY: containers
containers:
	@cd $(CURDIR)/bin && \
	find alx_{containers,stack}_* -type f 2>/dev/null \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(bindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(bindir)/$$f"; \
	done;
	@cd $(CURDIR)/sbin && \
	find alx_{containers,stack}_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(sbindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(sbindir)/$$f"; \
	done;

.PHONY: docker
docker: | containers
	@cd $(CURDIR)/bin && \
	find alx_swarm_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(bindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(bindir)/$$f"; \
	done;
	@cd $(CURDIR)/sbin && \
	find alx_swarm_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(sbindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(sbindir)/$$f"; \
	done;

.PHONY: kubernetes
kubernetes: | containers
	@cd $(CURDIR)/bin && \
	find alx_kube_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(bindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(bindir)/$$f"; \
	done;
	@cd $(CURDIR)/sbin && \
	find alx_kube_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(sbindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(sbindir)/$$f"; \
	done;

.PHONY: oc
oc: | containers kubernetes
	@cd $(CURDIR)/bin && \
	find alx_oc_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(bindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(bindir)/$$f"; \
	done;
	@cd $(CURDIR)/sbin && \
	find alx_oc_* -type f \
	|while read -r f; do \
		echo "	INSTALL	$(DESTDIR)$(sbindir)/$$f"; \
		install -DT "$$f" "$(DESTDIR)$(sbindir)/$$f"; \
	done;
