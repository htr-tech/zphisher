FROM alpine:latest
LABEL MAINTAINER="https://github.com/htr-tech/zphisher"
ADD . /zphisher
WORKDIR /zphisher/
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./zphisher.sh"
EXPOSE 8080