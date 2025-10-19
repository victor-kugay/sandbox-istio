## Key Features

## Environment

* Minikube v1.35.0
* Mac M1, 32GB RAM
* Docker 24.0.2
* OS/Arch darwin/arm64

## Getting started

1. Install minikube

> **_NOTE:_** Read this manual
> [https://kubernetes.io/ru/docs/tasks/tools/install-minikube/](https://kubernetes.io/ru/docs/tasks/tools/install-minikube/)

2. Run minikube

```bash
$ make minikube-start
```

> **_NOTE:_** Read this manual
> [https://istio.io/latest/docs/setup/platform-setup/minikube/](https://istio.io/latest/docs/setup/platform-setup/minikube/)

> **_NOTE:_** If you have already installed minikube, you should stop it and continue with specified resources
> [https://stackoverflow.com/questions/72147700/deleting-minikube-cluster-so-i-can-create-a-larger-cluster-with-more-cpus](https://stackoverflow.com/questions/72147700/deleting-minikube-cluster-so-i-can-create-a-larger-cluster-with-more-cpus)

3. Run minikube dashboard

```bash
$ make minikube-dashboard
```

> **_NOTE:_** Should be opened on: 
> [http://127.0.0.1:59934/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy](http://127.0.0.1:59934/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy)

> **_NOTE:_** If it doesn't work try stop, delete and restart minikube
> [https://stackoverflow.com/questions/46893109/minikube-dashboard-not-working](https://stackoverflow.com/questions/46893109/minikube-dashboard-not-working)

4. Enable istio addons

```bash
$ make minikube-istio-enable
```

> **_NOTE:_** Read this manual
> [https://minikube.sigs.k8s.io/docs/handbook/addons/istio/](https://minikube.sigs.k8s.io/docs/handbook/addons/istio/)

5. Build docker image

```bash
$ make minikube-docker-build
```

> **_NOTE:_** Read answers
> [https://stackoverflow.com/questions/42564058/how-can-i-use-local-docker-images-with-minikube](https://stackoverflow.com/questions/42564058/how-can-i-use-local-docker-images-with-minikube)


> **_NOTE:_** It's possible to prune docker images `$ make minikube-docker-prune`

6. Deploy kubernetes components

```bash
$ make minikube-up
```





