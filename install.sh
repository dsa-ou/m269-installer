#!/bin/bash

echo "Installing software for M269 25J..."

# This script works in one of two modes:
# - If no argument is given, this script must be in the M269 folder and
#   the other installation files are downloaded from GitHub.
# - If an argument is given, it's the M269 folder, and this script and the other
#   installation files are in the current folder.

# The first mode installs the latest software, for the current presentation.
# The second mode is for testing the next presentation or
# for installing a past presentation, after downloading its files from GitHub.

SITE=https://dsa-ou.github.io/m269-installer
DOC="See $SITE for details."
CSS=custom.css
REQS=requirements.txt
FILES="$CSS $REQS"
COURSE=m269-25j
VENV=~/venvs/$COURSE

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
    echo "Unable to add shortcut commands for shell $parent_shell."
    echo "Please make bash, zsh, csh, tcsh or fish your default shell."
    echo "Then open a new terminal and run this script again."
    exit 1
fi

# check that Python 3.12 is installed
if ! command -v python3.12 &> /dev/null
then
    echo "Python 3.12 not found: please install it." ; echo $DOC
    exit 1
fi

# check that the given path (which may have spaces) is the M269 folder
is_m269_folder () {
    if [[ ! -d $1 ]]    # single bracket would split path string on spaces
    then
        folder=$1
        msg="doesn't exist or isn't a folder"
    else
        folder=$(cd "$1"; pwd)
        if [[ $(basename "$folder") != [Mm]269-25[Jj] ]]
        then
            msg="must be named m269-25j or M269-25J"
        else
            return
        fi
    fi
    echo "$folder can't be your M269 folder: it $msg." ; echo $DOC
    exit 1
}

if [ $# -gt 1 ]
then
    echo "Usage: ./install.sh [path to M269 folder]"
    echo "If no argument is given, this script must be in your M269 folder."
    echo "If an argument is given, it must be the path to your M269 folder."
    echo $DOC
    exit 1
elif [ $# -eq 0 ]
then
    FOLDER=$(pwd)
    is_m269_folder "$FOLDER"
    echo "Downloading and installing M269 files..."
    for file in $FILES
        do
            curl -LO https://github.com/dsa-ou/m269-installer/raw/main/$file
        done
    mkdir -p ~/.jupyter/custom
    # don't overwrite existing CSS file
    if [ -f ~/.jupyter/custom/$CSS ]
    then
        cat $CSS >> ~/.jupyter/custom/$CSS
    else
        cp -a $CSS ~/.jupyter/custom
    fi
else
    is_m269_folder "$1"
    FOLDER=$(cd "$1"; pwd)
    for file in $FILES
    do
        if [ ! -f $file ]
        then
            echo "File $file not found: please check that you're in the right folder."
            echo $DOC
            exit 1
        fi
    done
    echo "Installing M269 files..."
    mkdir -p ~/.jupyter/custom
    if [ -f ~/.jupyter/custom/$CSS ]
    then
        cat $CSS >> ~/.jupyter/custom/$CSS
    else
        cp -a $CSS ~/.jupyter/custom
    fi
fi

echo "Creating Python environment $VENV... (this will take a bit)"
python3.12 -m venv --prompt $COURSE $VENV

echo "Downloading and installing Python packages... (this will take long)"
source $VENV/bin/activate                   # this script runs under bash
pip install --upgrade pip
# install pytype first to then upgrade networkx (for Section 17.6)
pip install pytype==2024.10.11               # install pytype only for Unix
pip install -r $REQS
deactivate
echo "Software has been installed."

echo "Adding shortcut commands to $shell's startup file..."

if [ $shell = "csh" ] || [ $shell = "tcsh" ]
then
    EXT=".csh"
else
    if [ $shell = "fish" ]
    then
        EXT=".fish"
    else
        EXT=""
    fi
fi
# if 23J's allowed alias exists, cancel it, otherwise don't show error message
ACTIVATE="source $VENV/bin/activate$EXT;unalias allowed 2> /dev/null"
M269="cd \"$FOLDER\";$ACTIVATE"
NB="$ACTIVATE;jupyter lab --custom-css &"

if [ $shell = "fish" ]
then
    FILE=~/.config/fish/config.fish
else
    FILE=~/.${shell}rc
fi

# Add a newline so that the alias doesn't concatenate with any previously existing text
echo >> $FILE

if [ $shell = "csh" ] || [ $shell = "tcsh" ]
then
    echo "alias $COURSE '$M269'" >> $FILE
    echo "alias nb '$NB'" >> $FILE
else
    echo "alias $COURSE='$M269'" >> $FILE
    echo "alias nb='$NB'" >> $FILE
fi

echo "All done. Go to $SITE for further instructions."