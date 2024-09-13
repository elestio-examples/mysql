pwd=$(pwd)
cp "$pwd/innovation/"* "$pwd"
mv $pwd/Dockerfile.oracle $pwd/Dockerfile

docker buildx build . --output type=docker,name=elestio4test/mysql:9.0 | docker load