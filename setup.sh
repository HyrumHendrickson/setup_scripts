#!/bin/bash

echo "==> Updating package index..."
sudo apt-get update -y

echo "==> Installing system dependencies..."
sudo apt-get install -y \
  wget \
  curl \
  gpg \
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
  build-essential

echo "==> Adding R repository and installing R..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/"
sudo apt-get update
sudo apt-get install -y r-base

echo "==> Installing R packages..."
Rscript -e "install.packages(c('IRkernel', 'reticulate', 'tidyverse', 'ggplot2', 'dplyr', 'knitr', 'rmarkdown'), repos='https://cloud.r-project.org')"

echo "==> Registering R kernel with Jupyter..."
Rscript -e "IRkernel::installspec(user = FALSE)"

echo "==> Installing Python packages..."
pip install --upgrade pip
pip install \
  jupyter \
  ipykernel \
  numpy \
  pandas \
  matplotlib \
  scipy \
  seaborn

echo "==> Installing Quarto CLI..."
wget https://quarto.org/download/latest/quarto-linux-amd64.deb -O /tmp/quarto.deb
sudo dpkg -i /tmp/quarto.deb
rm /tmp/quarto.deb

echo "==> Installing VS Code extensions..."
code --install-extension quarto.quarto
code --install-extension REditorSupport.r
code --install-extension ikuyadeu.r-lsp

echo "==> Validating Quarto installation..."
quarto check

echo "==> Setup complete. R, Python, Quarto, and all extensions are ready in your Codespace."
