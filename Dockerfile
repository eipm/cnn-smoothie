FROM python:3.6.8-stretch
#===============================#
# Docker Image Configuration	#
#===============================#
LABEL org.opencontainers.image.source='https://github.com/eipm/cnn-smoothie' \
    vendor='Englander Institute for Precision Medicine' \
    description='CNN Smoothie' \
    maintainer='als2076@med.cornell.edu' \
    base_image='python' \
    base_image_version='3.6.8-stretch'

ENV APP_NAME='cnn_smoothie' \
    TZ='US/Eastern' \
    CNN_SMOOTHIE_SRC_DIR='/cnn_smoothie/src/cnn_smoothie_src' \
    PREDICT_DIR='/cnn_smoothie/src/cnn_smoothie_src/slim'
ENV RESULT_DIR=${CNN_SMOOTHIE}/result \
    PROCESS_DIR=${CNN_SMOOTHIE}/process \
    PYTHONPATH=${PYTHONPATH}:${CNN_SMOOTHIE}:${PREDICT_DIR}

#===================================#
# Install Prerequisites         	#
#===================================#
COPY requirements.txt /${APP_NAME}/requirements.txt
RUN pip install -r /${APP_NAME}/requirements.txt
#===================================#
# Copy Files and set work directory	#
#===================================#
COPY src /${APP_NAME}/src/
WORKDIR /${APP_NAME}
#===================================#
# Startup							#
#===================================#
EXPOSE 80
VOLUME uploads
VOLUME output

HEALTHCHECK --interval=30s --timeout=30s --retries=3 \
    CMD curl -f -k http://0.0.0.0/api/healthcheck || exit 1

CMD python3 /${APP_NAME}/src/main.py