pwd=$(pwd)
cp "$pwd/8.4/"* "$pwd"
mv $pwd/Dockerfile.oracle $pwd/Dockerfile

docker buildx build . --output type=docker,name=elestio4test/mysql:8.4 | docker load