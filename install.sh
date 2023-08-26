#!/bin/bash

echo "Installing software for M269 23J..."

# This script works in one of two modes:
# - If no argument is given, this script must be in the M269 folder and
#   the other installation files are downloaded from GitHub.
# - If an argument is given, it's the M269 folder, and this script and the other
#   installation files are in the current folder.

# The first mode installs the latest software,
# for the current presentation or for testing the next presentation.
# The second mode is for installing the software for a past presentation,
# by first downloading the past installation files from GitHub.

SITE=https://dsa-ou.github.io/m269-installer
DOC="See $SITE for details."
CSS=custom.css
REQS=requirements.txt
CHECK="allowed.py m269.json"
UNINSTALL=uninstall.sh
FILES="$CSS $REQS $CHECK $UNINSTALL"
COURSE=m269-23j
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

# check Python 3.10 is installed
if ! command -v python3.10 &> /dev/null
then
    echo "Python 3.10 not found: please install it." ; echo $DOC
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
        if [[ $(basename "$folder") != [Mm]269-23[Jj] ]]
        then
            msg="must be named m269-23j or M269-23J"
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
            # WARNING: CHANGE URL BACK TO MAIN BRANCH BEFORE MERGING!!!
            curl -LO https://github.com/dsa-ou/m269-installer/raw/14-create-uninstallation-scripts/$file
            if [ $? -ne 0 ]
            then
                echo "Failed to download $file"
                exit 1
            fi
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
    cp -a $CHECK $UNINSTALL "$FOLDER"
    if [ $? -ne 0 ]
    then
        echo "Failed to copy $CHECK and $UNINSTALL"
        exit 1
    fi
fi

echo "Creating Python environment $VENV... (this will take a bit)"
python3.10 -m venv --prompt $COURSE $VENV

echo "Downloading and installing Python packages... (this will take long)"
source $VENV/bin/activate                   # this script runs under bash
pip install --upgrade pip
pip install -r $REQS
pip install pytype==2023.4.27               # install pytype only for Unix
deactivate
echo "Software has been installed."

echo "Adding shortcut commands to $shell's startup file..."

M269="cd \"$FOLDER\";source $VENV/bin/activate"
NB="jupyter notebook &"
ALLOWED="python3.10 \"$FOLDER/allowed.py\" -c \"$FOLDER/m269.json\""

if [ $shell = "fish" ]
then
    SHELL_CONFIG_FILE=~/.config/fish/config.fish
else
    SHELL_CONFIG_FILE=~/.${shell}rc
fi

if [ $shell = "csh" ] || [ $shell = "tcsh" ]
then
    echo "alias $COURSE '$M269.csh'" >> $SHELL_CONFIG_FILE
    echo "alias nb '$NB'" >> $SHELL_CONFIG_FILE
    echo "alias allowed '$ALLOWED'" >> $SHELL_CONFIG_FILE
else
    if [ $shell = "fish" ]
    then
        echo "alias $COURSE='$M269.fish'" >> $SHELL_CONFIG_FILE
    else
        echo "alias $COURSE='$M269'" >> $SHELL_CONFIG_FILE
    fi
    echo "alias nb='$NB'" >> $SHELL_CONFIG_FILE
    echo "alias allowed='$ALLOWED'" >> $SHELL_CONFIG_FILE
fi

# Set variables in uninstall.sh
if [[ -f "$FOLDER/$UNINSTALL" ]]; then
    echo "Setting variables in uninstall.sh ..."
    # Insert FOLDER variable at line 14
    sed "14i\\
FOLDER=$FOLDER" "$FOLDER/$UNINSTALL" > "$FOLDER/$UNINSTALL.tmp"
    mv "$FOLDER/$UNINSTALL.tmp" "$FOLDER/$UNINSTALL"
    # Insert SHELL_CONFIG_FILE variable at line 15
    sed "15i\\
SHELL_CONFIG_FILE=$SHELL_CONFIG_FILE" "$FOLDER/$UNINSTALL" > "$FOLDER/$UNINSTALL.tmp"
    mv "$FOLDER/$UNINSTALL.tmp" "$FOLDER/$UNINSTALL"
    chmod +x "$FOLDER/$UNINSTALL"
else
    echo "Warning: $FOLDER/$UNINSTALL does not exist."
    echo "Unable to set variables in uninstall.sh..."
fi

echo "All done. Go to $SITE for further instructions."
