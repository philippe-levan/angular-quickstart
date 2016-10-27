FROM node:6.7

RUN mkdir -p angular-quickstart
ADD angular-quickstart /

# install ssh and run through supervisor
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get -qq -y --no-install-recommends install \
	openssh-server \
	supervisor \
	&& \
	apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/run/sshd /var/log/supervisor

RUN npm install -g yarn

WORKDIR /angular-quickstart
EXPOSE 22

ADD docker/start.sh /root/start.sh
RUN chmod u+x /root/start.sh
CMD [ "/root/start.sh" ]
