FROM ubuntu:latest


RUN apt-get update && apt-get -y install curl sendmail
RUN apt-get update && apt-get -y install coreutils

COPY script.sh /usr/local/bin/script.sh
RUN chmod +x /usr/local/bin/script.sh

CMD ["bash", "-c", "while true; do /usr/local/bin/script.sh; sleep 30; done"]