#!/bin/bash

echo "==> Updating system packages..."
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
  quarto \
  r-base

echo "==> Installing Python and packages..."
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

echo "==> Installing R packages..."
Rscript -e "install.packages(c('IRkernel', 'reticulate', 'tidyverse', 'ggplot2', 'dplyr', 'knitr', 'rmarkdown'), repos='https://cloud.r-project.org')"

echo "==> Registering R kernel with Jupyter..."
Rscript -e "IRkernel::installspec(user = FALSE)"

echo "==> Installing VS Code extensions for Quarto and R..."
code --install-extension quarto.quarto
code --install-extension REditorSupport.r
code --install-extension Ikuyadeu.r

echo "==> Validating Quarto installation..."
quarto check

echo "==> Setup complete. Quarto, R, Python, and VS Code extensions are ready in your Codespace."
