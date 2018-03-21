FROM ubuntu:16.04

LABEL maintainer="Robert Gauld <robert@robertgauld.co.uk>"

RUN apt-get update -y
RUN apt-get install -y offlineimap ca-certificates
RUN apt-get clean -y

COPY offlineimaprc /root/offlineimaprc
COPY run.sh /root/run.sh

CMD /root/run.sh
