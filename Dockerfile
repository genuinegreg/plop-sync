# install plop-sync

FROM genuinegreg/nodejs

RUN apt-get install curl -y

# Hack for initctl not being available in Ubuntu
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

# install docker
RUN sudo sh -c "curl https://get.docker.io/gpg | apt-key add -"
RUN sudo sh -c "echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
RUN apt-get update
RUN apt-get install lxc-docker -y

RUN apt-get autoremove curl -y
RUN apt-get clean


# add server and client sources
ADD client/dist     /plop-sync/client/dist 
ADD server/         /plop-sync/server/ 


WORKDIR /plop-sync/server/

CMD node app/server.js
