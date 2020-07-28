FROM debian:10
LABEL MAINTAINER="Equinockx moisestapia741@gmail.com"

WORKDIR /home/

COPY . /home/


RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server && \
    apt-get install -y curl && \
    apt-get install --no-install-recommends -y php && \
    apt-get install -y unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*