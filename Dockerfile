FROM ubuntu:20.04
LABEL org.opencontainers.image.source https://github.com/khwilson/simple-r-image

RUN apt-get update && \
  apt-get install -y \
  dirmngr \
  gnupg \
  apt-transport-https \
  ca-certificates \
  libssl-dev \
  libcurl4-openssl-dev \
  libxml2-dev \
  software-properties-common && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
  add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/' && \
  apt-get update

RUN apt-get install -y r-base build-essential awscli

COPY requirements.R .
RUN Rscript --vanilla requirements.R
