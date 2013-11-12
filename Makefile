# build client and server
build: client server

# update submodules and build client and server
all: git build

# update submodules
git:
	git submodule update

# build client
client: forcelook
	echo "Build client"
	make -C client

# build server
server: forcelook
	echo "Build server"
	make -C server

docker-btsync:
	docker build -t genuinegreg/plop-btsync docker-btsync


# clean server and client
clean:
	make -C client clean
	make -C server clean

forcelook:
	true