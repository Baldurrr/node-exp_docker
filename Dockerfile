# Tag - ptero
FROM alpine:latest
LABEL maintainer='Baldurr'
RUN apk add --no-cache bash curl jq wget tar && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 9100
CMD ["/bin/bash", "/entrypoint.sh"]
