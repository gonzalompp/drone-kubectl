FROM alpine:3.11

USER root

# ENTRY POINT
COPY entrypoint.sh .
RUN chmod -R 777 ./entrypoint.sh

# INSTALL KUBECTL
RUN apk add curl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.4/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

# RUN ENTRYPOINT
CMD ./entrypoint.sh
