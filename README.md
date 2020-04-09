# kubectl in a docker image

This image is intended to be used as sidecar for your app to access the kubernetes API.
Additionaly it can be used in a Jenkins (or any othe CI/CD setup) in order to interact with the kubernetes API.

### Base image
[busybox] (https://hub.docker.com/_/busybox)

### Installed tools
[kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux)


### Github Repo

https://github.com/joshendriks/kubectl


### Docker image tags

https://hub.docker.com/repository/docker/joshendriks/kubectl/tags

# Why we need it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment