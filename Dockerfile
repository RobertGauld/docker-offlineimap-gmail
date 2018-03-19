FROM ubuntu:16.04

LABEL maintainer="Robert Gauld <robert@robertgauld.co.uk>"

RUN apt-get update -y
RUN apt-get install -y offlineimap ca-certificates
RUN apt-get clean -y

COPY offlineimaprc-keep-syncing /root/offlineimaprc-keep-syncing
COPY offlineimaprc-one-shot /root/offlineimaprc-one-shot
COPY run.sh /root/run.sh
COPY one-shot.sh /root/one-shot.sh

ENTRYPOINT ["/root/run.sh"]
