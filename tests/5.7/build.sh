pwd=$(pwd)

cp $pdw/5.7/* $pdw
mv $pwd/Dockerfile.debian $pwd/Dockerfile

docker buildx build . --output type=docker,name=elestio4test/mysql:latest | docker load