#!/bin/bash

# --- This script sets up Quarto documents for R, Python, and SQL in GitHub Codespaces ---
# --- To use: run -> curl <URL> | bash ---

# Basic system update
sudo apt update -y

# R dependencies and Pandoc
sudo apt install -y \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    pkg-config \
    pandoc

# Install latest R from CRAN (not Ubuntu default)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 'E298A3A825C0D65DFD57CBB651716619E084DAB9'
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/"
sudo apt-get update
sudo apt-get install --no-install-recommends r-base -y

# Install Quarto
wget https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo dpkg -i quarto-linux-amd64.deb
rm quarto-linux-amd64.deb

# Install SQLite
sudo apt install -y sqlite3

# VS Code extensions
code --install-extension ms-python.Python
code --install-extension REditorSupport.r
code --install-extension quarto.quarto
# You can add more extensions here as needed

# Install Python packages globally (use --user if permissions fail)
pip install --upgrade pip
pip install jupyter notebook ipykernel plotly seaborn scikit-learn numpy pandas matplotlib scipy

# Install R packages globally
Rscript -e "install.packages(c('languageserver', 'quarto', 'knitr', 'rmarkdown', 'reticulate', 'tidyverse', 'pander'), repos = 'https://cloud.r-project.org')"

# Confirm Python path seen by Reticulate
echo "Python path seen by R (reticulate): $(which python3)"
Rscript -e "library(reticulate); py_config()"

# (Optional) Download example files:
# curl -O https://example.com/example.qmd
# curl -O https://example.com/example.ipynb
# curl -O https://example.com/example.sqlite
# curl -O https://example.com/data.csv
# curl -O https://example.com/data.json
