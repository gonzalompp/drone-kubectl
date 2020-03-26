FROM alpine:3.11

USER root

# ENTRY POINT
COPY entrypoint.sh .
COPY deployment.yml .

# CONFIG
# COPY config .
# RUN mkdir $HOME/.kube
# RUN cp config $HOME/.kube/config

# INSTALL CURL
RUN apk add curl

RUN chmod -R 777 ./entrypoint.sh

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.4/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

RUN ls -la $HOME

CMD ./entrypoint.sh
