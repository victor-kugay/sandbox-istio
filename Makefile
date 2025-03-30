SHELL = /bin/bash

.PHONY: all
all: help

.PHONY: help
help:
	@echo "Makefile available targets:"
	@grep -h -E '^[a-zA-Z_/%-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  * \033[36m%-16s\033[0m %s\n", $$1, $$2}'

.PHONY: docker-up
docker-build: ## Build docker image using minikube
	minikube image build -t sandbox-istio:latest . --all

