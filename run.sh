#!/bin/bash

if [[ ! -z  `which nvidia-docker`  ]]
then
    DOCKER_CMD=nvidia-docker
elif [[ ! -z  `which docker`  ]]
then
    echo "WARNING: nvidia-docker not found. Nvidia drivers may not work." >&2
    DOCKER_CMD=docker
else
     echo "ERROR: docker or nvidia-docker not found. Aborting." >&2
    exit 1
fi

# ${DOCKER_CMD} run -ti --net=host --privileged -e DISPLAY=${DISPLAY} --rm --name ${DIRECTORY} ${DIRECTORY}

${DOCKER_CMD} run -ti --net=host --privileged -v $(pwd):/home/mnist_test/ --rm --name mnist_tensorboard mnist_test
