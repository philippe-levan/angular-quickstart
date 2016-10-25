FROM node:6.7

RUN mkdir -p angular-quickstart
ADD angular-quickstart /

# install ssh and run through supervisor
RUN apt-get update && apt-get install -y openssh-server supervisor
ADD docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/run/sshd /var/log/supervisor

WORKDIR /angular-quickstart
EXPOSE 22

ADD docker/start.sh /root/start.sh
RUN chmod u+x /root/start.sh
CMD [ "/root/start.sh" ]
