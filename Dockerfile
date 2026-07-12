FROM alpine:latest
LABEL MAINTAINER="https://github.com/whydohumanssuck/zen"
WORKDIR /zen/
ADD . /zen
RUN apk add --no-cache bash ncurses curl unzip wget php 
CMD "./zen.sh"
