FROM busybox:1

ARG k8sversion=v1.18.0

RUN wget https://storage.googleapis.com/kubernetes-release/release/$k8sversion/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /bin/kubectl	
EXPOSE 8001
ENTRYPOINT ["/bin/kubectl", "proxy"]