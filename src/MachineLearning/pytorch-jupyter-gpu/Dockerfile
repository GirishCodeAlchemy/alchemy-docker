FROM nvcr.io/nvidia/pytorch:24.07-py3 as baseImage

ENV DEBIAN_FRONTEND=noninteractive
ENV PATH="${PATH}:/opt/hpcx/ompi/bin"
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/opt/hpcx/ompi/lib"

RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    cmake \
    git \
    unzip \
    pkg-config \
    libopencv-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libgtk2.0-dev \
    libatlas-base-dev \
    gfortran \
    webp

WORKDIR /environment
COPY requirements.txt /environment/
COPY test-env.ipynb /environment/
RUN pip install -U -r /environment/requirements.txt
EXPOSE 8888
ENTRYPOINT ["jupyter", "notebook", "--no-browser","--ip=0.0.0.0","--NotebookApp.token=''","--NotebookApp.password=''"]
