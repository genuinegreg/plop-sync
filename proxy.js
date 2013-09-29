#!/usr/bin/node

var httpProxy = require('http-proxy');

var options = {
  router: {
    'localhost/api/v1': '127.0.0.1:8080',
    'localhost/': '127.0.0.1:8080/'
  }
};

var proxyServer = httpProxy.createServer(
    require('connect-logger')(),
    options
    );

proxyServer.listen(1234);
