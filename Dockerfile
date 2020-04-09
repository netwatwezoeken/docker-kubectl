FROM busybox
RUN wget https://storage.googleapis.com/kubernetes-release/release/stable.txt && \
    wget https://storage.googleapis.com/kubernetes-release/release/`cat stable.txt`/bin/linux/amd64/kubectl && \
	rm stable.txt && \
    chmod +x ./kubectl && \
    mv ./kubectl /bin/kubectl	
EXPOSE 8001
ENTRYPOINT ["/bin/kubectl", "proxy"]