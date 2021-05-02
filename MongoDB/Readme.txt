Tutorial to install MongoDB on Docker:
https://docs.mongodb.com/manual/tutorial/install-mongodb-enterprise-with-docker/

# Define a variable MONGODB Version and download the script for docker entrypoint and Dockerfile
export MONGODB_VERSION=4.0
curl -O --remote-name-all https://raw.githubusercontent.com/docker-library/mongo/master/$MONGODB_VERSION/{Dockerfile,docker-entrypoint.sh}

# Then define a variable name and set the permission for sh file then build the image
# Or build the DOcker container 
export DOCKER_USERNAME=username
chmod 755 ./docker-entrypoint.sh
docker build --build-arg MONGO_PACKAGE=mongodb-enterprise --build-arg MONGO_REPO=repo.mongodb.com -t $DOCKER_USERNAME/mongo-enterprise:$MONGODB_VERSION .

# Test the image using the mongod locally in a Docker container and chek the version
docker run --name mymongo -itd $DOCKER_USERNAME/mongo-enterprise:$MONGODB_VERSION
docker exec -it mymongo /usr/bin/mongo --eval "db.version()"

# Run the container in detached mode, or in background and mapping the container ports with host ports so we can access the database from a host level applciation if we want to. The ports used were taken from the MongoDB documentation.
docker run --name mymongo -itd -p 27017-27019:27017-27019 thaophungduc/mongo-enterprise

# Run inside container with bash command:
docker exec -it mymongo bash 

# launch the mongoDB shell client 
mongo 

# access all functionality in MongoDB such as check what database exist 
show dbs 

# create a new database , we can use a multi-step process, the first being to define the database we wish to use:
use thepolyglotdeveloper 

# We're using the databaes thepolyglotdeveloper but it doesn't exist until we start creating collectiosn and data to create a collection with data, we can do something like this:
db.people.save({firstname:"Nic",lastname:"Raboy"})
db.people.save({firstname:"Maria",lastname:"Raboy"})

# Find name by using query for data using like this.
db.people.find({ firstname: "Nic" })
db.people.find({ lastname: "Raboy" })

docker exec -it mymongo /usr/bin/mongo --eval "db.version();"\
use thepolyglotdeveloper;\
db.people.find({ firstname: "Nic" });\
db.people.find({ lastname: "Raboy" })"

docker exec -it mymongo /usr/bin/mongo --eval ";use thepolyglotdeveloper;"
\
use thepolyglotdeveloper;\
db.people.find({ firstname: "Nic" });\
db.people.find({ lastname: "Raboy" })"