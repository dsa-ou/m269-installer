#!/bin/bash

echo "Installing software for M269 23J..."

if [ $# -ne 1 ]
then
    echo "Usage: ./install-m269.sh <path to M269 folder>"
    echo "You must provide the path to the folder where your M269 materials are."
    echo "For examples and details, see https://dsa-ou.github.io/m269-installer."
    exit 1
fi
if [ ! -d $1 ]
then
    echo "$1 doesn't exist or isn't a folder."
    echo "Please create your M269 folder and put the book's files there."
    exit 1
fi
if [ ! -d $1/book-r1 ]
then
    echo "Folder $1 doesn't have subfolder book-r1."
    echo "Please download and expand the book's zip archive into your M269 folder."
    exit 1
fi

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

FOLDER=$1
VENV_NAME=venv
VENV=$FOLDER/$VENV_NAME
REQS=requirements.txt
COURSE=m269-23j

# check that the software package list exists
if [ ! -f $REQS ]
then
    echo "File $REQS not found: please check that you're in the right folder."
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

M269="cd $FOLDER;source $VENV_NAME/bin/activate"
NB="jupyter notebook $FOLDER&"
ALLOWED="python3.10 $FOLDER/allowed.py -c $FOLDER/m269.json"

if [ $shell = "fish" ]
then
    FILE=~/.config/fish/config.fish
else
    FILE=~/.${shell}rc
fi

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