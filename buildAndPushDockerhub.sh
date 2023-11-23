# by Henry Chan
# this file is built on Mac M1 (ARM) and pushed to Dockerhub (AMD64)
# we are basing this off of Ubuntu because that's what GHA uses
# https://github.com/actions/runner-images/blob/main/images/ubuntu/Ubuntu2204-Readme.md
# we also need dcind to keep parity with Concourse
export PUSH_FLAG="--push"
export BUILD_FLAG="buildx build --platform linux/amd64"
export TAG=2.0.0
export IMAGE=opendoor/dcind-ubuntu
if [ "$#" -gt 0 ]
then
	PUSH_FLAG=""
	BUILD_FLAG="build"
	echo This is a local build for your Mac
fi
# docker login --username=$DOCKER_USERNAME --password=$DOCKER_PASSWORD
docker $BUILD_FLAG -t $IMAGE:$TAG . $PUSH_FLAG -f Dockerfile.ubuntu
echo Built $IMAGE:$TAG
