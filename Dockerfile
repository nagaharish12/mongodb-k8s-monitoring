FROM ubuntu:18.04

RUN apt-get -qqy update \
 && apt-get -qqy upgrade \
 && apt-get -qqy install curl \
 && apt-get -qqy install logrotate \
 && apt-get -qqy install libsasl2-2 \
 && apt-get -qqy install sudo \
 && curl -OL https://cloud.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager_13.20.2.9015-1_arm64.ubuntu1604.deb \
 && sudo dpkg -i mongodb-mms-automation-agent-manager_13.0.1.8241-1_amd64.ubuntu1604.deb \
 && rm -rf mongodb-mms-automation-agent-manager_13.0.1.8241-1_amd64.ubuntu1604.deb \
 && apt-get -qqy autoremove \
 && apt-get -qqy clean \
 && rm -rf /var/lib/apt/*

CMD ["/opt/mongodb-mms-automation/bin/mongodb-mms-automation-agent", "-h"]
