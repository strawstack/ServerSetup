# Container image that runs your code
FROM alpine:3.10

RUN apk add openssh
RUN rc-update add sshd
RUN /etc/init.d/sshd start

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh
COPY init.sh /init.sh
COPY deploy.sh /deploy.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
