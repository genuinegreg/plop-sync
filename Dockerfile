# install plop-sync

FROM genuinegreg/nodejs

ADD btsync-saas-client/dist /btsync-saas-client/dist 
ADD btsync-saas-server/ /btsync-saas-server/ 


WORKDIR /btsync-saas-server/

CMD node app/server.js
