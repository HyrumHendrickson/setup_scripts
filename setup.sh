#!/bin/bash

# --- This script is meant to setup quarto documents for R, Python, and SQL in Github Codespace ---
# --- to use; run -> curl xxxx ---

# basic update
sudo apt update -y

# R dependancies
sudo apt install -y \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    pkg-config \
    pandoc

# install R
# needs to install latest R version, Ubuntu doesn't have the right default
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 'E298A3A825C0D65DFD57CBB651716619E084DAB9' && sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/" && sudo apt-get update && sudo apt-get install --no-install-recommends r-base -y


# install quarto
wget https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo dpkg -i quarto-linux-amd64.deb
rm quarto-linux-amd64.deb

# install SQL
sudo apt install sqlite3

# install python extension
code --install-extension ms-python.Python

# install R extension
code --install-extension REditorSupport.r

# install quarto extension
code --install-extension quarto.quarto

# install SQL extension

# install jupyter extension

# install misc data extensions

# setup python venv
python3 -m venv .venv
source ".venv/bin/activate"

# setup r env
USER_LIB="$HOME/R/library"
mkdir -p "$USER_LIB"
Rscript -e "install.packages('renv', lib = '$USER_LIB', repos = 'https://cran.r-project.org', type = 'source')"
Rscript -e "library(renv, lib.loc = '$USER_LIB'); renv::init(bare = TRUE)"

# install python packages
# seaborn scikit-learn numpy pandas matplotlib scipy sqlite3
pip install jupyter notebook ipykernel plotly

# install R packages
# tidyverse and pander are reccomended as well
Rscript -e "renv::install(c('languageserver', 'quarto', 'knitr', 'rmarkdown', 'reticulate'), lib = '$USER_LIB', repos = 'https://cloud.r-project.org')"
export RETICULATE_PYTHON="$(pwd)/.venv/bin/python"

# dowload example files
# grabs a qmd
# grabs a juptyer notebook
# grabs a sqllite file
# grabs a csv
# grabs a json
