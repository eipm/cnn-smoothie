# CNN_smoothie

The CNN_Smoothie pipeline presented here provides a novel framework that can be easily implemented for many different applications, including immunohistochemistry grading and detecting tumor subtypes and biomarkers. We revised the available Slim codes to fit the algorithms for running them on CPUs. For  additional information and reference, please check the pre-print describing the method here:

Deep Convolutional Neural Networks Enable Discrimination of Heterogeneous Digital Pathology Images

Pegah Khosravi, Ehsan Kazemi, Marcin Imielinski, Olivier Elemento, Iman Hajirasouliha
EBioMedicine (December 2017)

The link to the published journal version: [http://dx.doi.org/10.1016/j.ebiom.2017.12.026](http://dx.doi.org/10.1016/j.ebiom.2017.12.026)

The Readme file is divided into two parts:

1) for running the CNN_basic algorithm look at the Readme at CNN_basic file.

2) for running other architectures of CNN such as Inception and ResNet look at the Readme in the "scripts" directory.

[![Python 3.6](https://img.shields.io/badge/python-3.6-blue.svg)](https://www.python.org/downloads/release/python-360/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

![CNN Smoothie Logo](docs/images/logo.jpg)

## CNN Smoothie Requirements

- Docker. Get it from [here](https://www.docker.com/).
- `process` and `result` folders from ML training (Not included in this repository).

## Running CNN Smoothie using Docker

### Load Environment Variables

```bash
DOCKER_CONTAINER_NAME=cnn_smoothie
CNN_SMOOTHIE_PORT=3002
OUTPUT_DIR=/stork/data/cnn_smoothie/output/
UPLOAD_DIR=/stork/data/cnn_smoothie/uploads/
PROCESS_DIR=/stork/data/cnn_smoothie/process/
RESULT_DIR=/stork/data/cnn_smoothie/result/
CNN_SMOOTHIE_TAG=latest
```

OUTPUT_DIR=~/Documents/2.GitHub/eipm/cnn-smoothie/data/output/
UPLOAD_DIR=~/Documents/2.GitHub/eipm/cnn-smoothie/data/uploads/
PROCESS_DIR=~/Documents/2.GitHub/eipm/cnn-smoothie/data/process/
RESULT_DIR=~/Documents/2.GitHub/eipm/cnn-smoothie/data/result/

### Run Docker Container

```bash
docker run -d --name ${DOCKER_CONTAINER_NAME} \
--restart on-failure:5 \
-p ${CNN_SMOOTHIE_PORT}:80 \
-v ${OUTPUT_DIR}:/output \
-v ${UPLOAD_DIR}:/uploads \
-v ${PROCESS_DIR}:/cnn_smoothie/src/cnn_smoothie_src/process/:ro \
-v ${RESULT_DIR}:/cnn_smoothie/src/cnn_smoothie_src/result/:ro \
--env USERS_DICT="{ 'eipm': 'smoothie', 'pathologist': 'test' }" \
eipm/cnn-smoothie:${CNN_SMOOTHIE_TAG}
```

Where:

- **${DOCKER_CONTAINER_NAME}**: The CNN Smoothie docker container name.
- **${CNN_SMOOTHIE_PORT}**: The cnn_smoothie host port.
- **${OUTPUT_DIR}**: Where CNN Smoothie image classification logs will be written.
- **${UPLOAD_DIR}**: Where CNN Smoothie image will be saved.
- **${PROCESS_DIR}**: Required directory from ML training.
- **${RESULT_DIR}**: Required directory from ML training.
- **${USERS_DICT}**: The users credentials dictionary to authenticate.
- **${CNN_SMOOTHIE_TAG}**: The CNN Smoothie Version to deploy.