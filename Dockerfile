# Copyright (c) 2019, NVIDIA Corporation. All rights reserved.
#
# This work is made available under the Nvidia Source Code License-NC.
# To view a copy of this license, visit
# https://nvlabs.github.io/stylegan2/license.html

FROM tensorflow/tensorflow:1.15.2-gpu-py3-jupyter

RUN pip install scipy==1.3.3
RUN pip install requests==2.22.0
RUN pip install Pillow==6.2.1

RUN mkdir -p /app
WORKDIR /app

RUN DEBIAN_FRONTEND=noninteractive \
apt-get update && apt-get install -y --no-install-recommends \
    wget \
&& rm -rf /var/lib/apt/lists/* && \
wget 'http://sourceforge.net/projects/libjpeg-turbo/files/2.0.4/libjpeg-turbo-official_2.0.4_amd64.deb/download' -O libjpeg-turbo_2.0.4_amd64.deb && \
dpkg -i libjpeg-turbo_2.0.4_amd64.deb && \
rm libjpeg-turbo_2.0.4_amd64.deb

COPY requirements.txt /app
RUN pip install -r requirements.txt

# COPY . /app
# ENTRYPOINT [ "python", "dataset-tools.py" ]