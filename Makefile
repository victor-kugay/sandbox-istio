SHELL = /bin/bash

.PHONY: all
all: help

.PHONY: help
help:
	@echo "Makefile available targets:"
	@grep -h -E '^[a-zA-Z_/%-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  * \033[36m%-16s\033[0m %s\n", $$1, $$2}'

.PHONY: minikube-istio-enable
minikube-istio-enable: ## Enable istio addons
	minikube addons enable istio-provisioner
	minikube addons enable istio

.PHONY: minikube-docker-build
minikube-docker-build: ## Build docker image that are used by k8s deployment
	minikube image build -t sandbox-istio:latest . --all

.PHONY: minikube-docker-prune
minikube-docker-prune: ## Delete all images in minikube docker registry
	minikube ssh -- docker image prune -a -f

.PHONY: minikube-start
minikube-start: ## Start minikube containers
	minikube start --memory=8192mb --cpus=4

.PHONY: minikube-up
minikube-up: ## Update all
	kubectl apply -f ./deploy

.PHONY: minikube-destroy
minikube-destroy: ## Delete all
	kubectl delete -f ./deploy

.PHONY: minikube-restart
minikube-restart: ## Completely restart minikube
	minikube stop
	minikube delete
	minikube start --memory=8192mb --cpus=4

.PHONY: minikube-dashboard
minikube-dashboard: ## If it doesn't work restart minikube using minikube stop && minikube delete && minikube start
	minikube dashboard

.PHONY: minikube-tunnel
minikube-tunnel: ## Minikube opens tunnel on localhost. It works only with sudo
	minikube tunnels