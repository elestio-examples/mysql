pwd=$(pwd)

cp $pdw/8.0/* $pdw
mv $pwd/Dockerfile.debian $pwd/Dockerfile

docker buildx build . --output type=docker,name=elestio4test/mysql:latest | docker load