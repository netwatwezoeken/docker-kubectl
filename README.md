# kubectl in a docker image

This image is intended to be used as sidecar for your app to access the kubernetes API.
Additionaly it can be used in a Jenkins (or any other CI/CD setup) in order to interact with the kubernetes API.

# Debug Image
This image image is based on scratch and doesn't contain a shell. There are however debug images which consist of kubectl along with a busybox shell to enter.

You can launch the debug image with a shell entrypoint:
```
docker run -it --entrypoint=/busybox/sh joshendriks/kubectl:debug
```

### Base image
scratch

[busybox](https://hub.docker.com/_/busybox) (debug images)

### Installed tools
[kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/#install-kubectl-on-linux)

### Github Repo

https://github.com/joshendriks/kubectl

### Docker image tags

https://hub.docker.com/repository/docker/joshendriks/kubectl/tags

# Automated build

Automated buid depends on Jenkins useing the kubernetes plugin that has a cluster named 'kubernetes' configured.
On the cluster the credential to dockerhub must be set. This can be done using the following command:
kubectl create secret docker-registry dockerhub -n <namespace> --docker-server=https://index.docker.io/v1/ --docker-username=<name> --docker-password=<password> --docker-email=<email>