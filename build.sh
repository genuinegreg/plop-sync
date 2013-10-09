#!/bin/bash


git submodule init
git submodule update

echo "Build docker images"
cd dockerfile
./build.sh

cd ../

echo "Build plop-sync btsync image"
docker build -t genuinegreg/plop-btsync docker-btsync


cd client
npm install
bower install
grunt

cd ../server
npm install

cd ..

echo "DONE !"