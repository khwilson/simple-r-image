#!/bin/bash

sudo apt-get install -y \
  dirmngr \
  gnupg \
  apt-transport-https \
  ca-certificates \
  software-properties-common

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9
sudo add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/'

sudo apt-get install -y r-base

R --version

sudo apt-get install -y build-essential

Rscript --vanilla 'install.packages("devtools", repos = "https://cloud.r-project.org")'