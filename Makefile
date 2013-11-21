
GIT_REV=`git describe`

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

docker-btsync: forcelook
	docker build -t genuinegreg/plop-btsync docker-btsync
	# FIXME: git rev runing in plop-sync repo and not un plop-sync-docker-btsync
	docker tag genuinegreg/plop-btsync genuinegreg/plop-btsync\:$(GIT_REV)


# clean server and client
clean:
	make -C client clean
	make -C server clean

forcelook:
	true