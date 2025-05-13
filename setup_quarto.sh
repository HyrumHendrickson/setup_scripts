#!/bin/bash

# --- This script is meant to setup quarto documents for R, Python, and SQL in VS code ---
# --- to use; run -> curl xxxx ---

# basic update
sudo apt update -y

# install R
sudo apt install -y r-base

# install quarto
wget https://quarto.org/download/latest/quarto-linux-amd64.deb
sudo dpkg -i quarto-linux-amd64.deb
rm quarto-linux-amd64.deb

# install SQL
sudo apt install sqlite3

# install python extension
code --install-extension Microsoft.Python

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
Rscript -e "install.packages('renv', repos='https://cloud.r-project.org'); renv::init(bare = TRUE)"

# install python packages
pip install numpy pandas matplotlib seaborn scikit-learn scipy jupyter notebook plotly sqlite3 ipykernel

# install R packages
Rscript -e "renv::install(c('languageserver', 'pander', 'tidyverse', 'quarto', 'knitr', 'rmarkdown'))"

# dowload example files
# grabs a qmd
# grabs a juptyer notebook
# grabs a sqllite file
# grabs a csv
# grabs a json
