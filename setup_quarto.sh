#!/bin/bash

# --- This script is meant to setup quarto documents for R and python in VS code ---

# basic update
sudo apt update

# install R
sudo apt install r-base

# install quarto
wget https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo dpkg -i quarto-linux-amd64.deb
rm quarto-linux-amd64.deb

# install R extension
code --install-extension ikuyadeu.r

# install quarto extension
code --install-extension quarto.quarto

# install python packages

# install R packages

# logic for optional R and python envorinments 