# CNN_smoothie

Source code for manuscript:

"***Deep Convolutional Neural Networks Enable Discrimination of Heterogeneous Digital Pathology Images***"

Pegah Khosravi, Ehsan Kazemi, Marcin Imielinski, Olivier Elemento, Iman Hajirasouliha
EBioMedicine (December 2017)

Published on [EBioMedicine](https://doi.org/10.1016/j.ebiom.2017.12.026), 2017/12/28:
https://doi.org/10.1016/j.ebiom.2017.12.026

[![DOI badge](https://zenodo.org/badge/doi/10.1016/j.ebiom.2017.12.026.svg)](https://doi.org/10.1016/j.ebiom.2017.12.026) ⬅️ read the manuscript here

![CNN Smoothie Logo](docs/images/logo.jpg)

[![Actions Status](https://github.com/eipm/cnn-smoothie/workflows/Docker/badge.svg)](https://github.com/eipm/cnn-smoothie/actions) [![Github](https://img.shields.io/badge/github-latest-green?style=flat&logo=github)](https://github.com/eipm/cnn-smoothie) [![EIPM Docker Hub](https://img.shields.io/badge/EIPM%20docker%20hub-latest-blue?style=flat&logo=docker)](https://hub.docker.com/repository/docker/eipm/cnn-smoothie) [![GitHub Container Registry](https://img.shields.io/badge/GitHub%20Container%20Registry-latest-blue?style=flat&logo=docker)](https://github.com/orgs/eipm/packages/container/package/cnn-smoothie) [![Python 3.6](https://img.shields.io/badge/python-3.6-blue.svg)](https://www.python.org/downloads/release/python-360/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

The CNN_Smoothie pipeline presented here provides a novel framework that can be easily implemented for many different applications, including immunohistochemistry grading and detecting tumor subtypes and biomarkers. We revised the available Slim codes to fit the algorithms for running them on CPUs. For  additional information and reference, please check the pre-print describing the method here:

The Readme file is divided into two parts:

1) for running the CNN_basic algorithm look at the Readme at CNN_basic file.

2) for running other architectures of CNN such as Inception and ResNet look at the Readme in the "scripts" directory.

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

### Run Docker Container

```bash
docker run -d --name ${DOCKER_CONTAINER_NAME} \
--restart on-failure:5 \
-p ${CNN_SMOOTHIE_PORT}:80 \
-v ${OUTPUT_DIR}:/output \
-v ${UPLOAD_DIR}:/uploads \
-v ${PROCESS_DIR}:/cnn_smoothie/src/cnn_smoothie_src/process/:ro \
-v ${RESULT_DIR}:/cnn_smoothie/src/cnn_smoothie_src/result/:ro \
--env USERS_DICT="{ 'user1': 'password1', 'user2': 'password2' }" \
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