#!/bin/bash

# This script installs the M269 software.

COURSE=m269-23j
echo "Installing software for $COURSE..."

if [ $# -ne 1 ]
then
    echo "Usage: ./install-m269.sh <path to M269 folder>"
    echo "You must provide the path to the folder where your M269 materials will be."
    echo "For examples and details, see https://dsa-ou.github.io/virtual-env."
    exit 1
fi

FOLDER=$1
VENV_NAME=venv
VENV=$FOLDER/$VENV_NAME
REQS=requirements.txt

# find out under which shell this script is running
parent_shell=$(ps -o command $PPID)

if [[ $parent_shell == *bash* ]]
then
    shell=bash
elif [[ $parent_shell == *zsh* ]]
then
    shell=zsh
elif [[ $parent_shell == *-csh* ]]
then
    shell=tcsh
elif [[ $parent_shell == *-sh* ]]
then
    shell=csh
elif [[ $parent_shell == *fish* ]]
then
    shell=fish
else
    echo "Unknown shell: $parent_shell"
    exit 1
fi

# check Python 3.10 is installed
if ! command -v python3.10 &> /dev/null
then
    echo "Python 3.10 not found: please install it."
    exit 1
fi

# check that the software package list exists
if [ ! -f $REQS ]
then
    echo "File $REQS not found: please check this is the right folder."
    exit 1
fi

echo "Creating environment $VENV... (this will take a bit)"
python3.10 -m venv --prompt $COURSE $VENV

echo "Downloading and installing packages... (this will take long)"
source $VENV/bin/activate                   # this script runs under bash
pip install --upgrade pip
pip install -r $REQS
deactivate

echo "Installing other files..."
mkdir -p ~/.jupyter/custom
cp -a custom.css ~/.jupyter/custom
cp -a allowed.py m269.json $FOLDER

echo "Adding shortcut commands to the shell's startup file..."
if [ $shell = "fish" ]
then
    FILE=~/.config/fish/config.fish
else
    FILE=~/.${shell}rc
fi
# change to the M269 folder and activate the environment
M269="cd $FOLDER;source $VENV_NAME/bin/activate"
# open the notebooks of the latest book release
# 'command ls' avoids an alias ls=... being used
NB="jupyter notebook \$(command ls -d $FOLDER/book-r*|tail -1)/notebooks/M269.ipynb"
# run the 'allowed' tool
ALLOWED="python3.10 $FOLDER/allowed.py -c $FOLDER/m269.json"

if [ $shell = "csh" ] || [ $shell = "tcsh" ]
then
    echo "alias $COURSE '$M269.csh'" >> $FILE
    echo "alias nb '$NB'" >> $FILE
    echo "alias allowed '$ALLOWED'" >> $FILE
else
    if [ $shell = "fish" ]
    then
        echo "alias $COURSE='$M269.fish'" >> $FILE
    else
        echo "alias $COURSE='$M269'" >> $FILE
    fi
    echo "alias nb='$NB'" >> $FILE
    echo "alias allowed='$ALLOWED'" >> $FILE
fi

echo "Software installed."
echo "Go back to https://dsa-ou.github.io/m269-installer for further instructions."