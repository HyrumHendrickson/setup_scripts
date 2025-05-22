#!/bin/bash

echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get install -y \
  wget \
  curl \
  software-properties-common \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libharfbuzz-dev \
  libfribidi-dev \
  libpng-dev \
  libtiff5-dev \
  libjpeg-dev \
  pandoc \
  quarto

echo "Installing R..."
sudo apt-get install -y r-base

echo "Installing Python packages..."
pip install --upgrade pip
pip install \
  jupyter \
  ipykernel \
  numpy \
  pandas \
  matplotlib \
  scipy \
  seaborn \
  quarto

echo "Installing R packages..."
Rscript -e "install.packages(c('reticulate', 'tidyverse', 'ggplot2', 'dplyr', 'knitr', 'rmarkdown'), repos='https://cloud.r-project.org')"

echo "Registering R kernel with Jupyter..."
Rscript -e "IRkernel::installspec()"

echo "Validating Quarto installation..."
quarto check

echo "Environment setup complete. You can now render Quarto documents with R and Python."
