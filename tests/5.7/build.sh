pwd=$(pwd)
cp "$pwd/5.7/"* "$pwd"
mv $pwd/Dockerfile.oracle $pwd/Dockerfile

docker buildx build . --output type=docker,name=elestio4test/mysql:latest | docker load