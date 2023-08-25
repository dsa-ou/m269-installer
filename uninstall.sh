#!/bin/bash

# This script performs the uninstallation of the M269 course environment
# and will do the following:
# - Seeks user confirmation before proceeding.
# - Deletes the M269 virtual environment.
# - Erases course-specific aliases from the shell config file.
# - Removes files related to `allowed` from the M269 folder.
# - Optionally clears M269 styling from Jupyter's custom.css.

# Note: this script expects FOLDER and SHELL_CONFIG_FILE to be set during the
# installation process (inserted with sed via install.sh).

COURSE=m269-23j
VENV=~/venvs/$COURSE
CSS_FILE=~/.jupyter/custom/custom.css
YEAR=23
SITE=https://dsa-ou.github.io/m269-installer

# Check FOLDER and SHELL_CONFIG_FILE have been set i.e inserted via install.sh
if [[ -z "$FOLDER" ]] || [[ -z "$SHELL_CONFIG_FILE" ]]; then
    echo "Error: critical variables have not been set"
    exit 1
fi

BOLD="\033[1m"
NORMAL="\033[0m"
confirm() {
    local message="$1"
    echo -en "${BOLD}:: $message [y/N] ${NORMAL}"
    read -r response
    case "$response" in
        [yY])
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

# Confirm uninstallation
echo "Warning: This script will make the following changes: "
echo " - Remove the virtual environment in $VENV."
echo " - Remove the aliases 'nb', 'allowed' and '$COURSE' from $SHELL_CONFIG_FILE"
echo " - Optionally removes M269 custom styling from $CSS_FILE"
echo "As a result, Jupyter notebooks will no longer be readable or executable unless another Jupyter environment exists."
if ! confirm "Proceed with uninstallation?"; then
    exit 0
fi

# Verify and remove the virtual environment.
remove_venv() {
    test -n "$VENV" || return 1
    test -d "$VENV" || return 1
    # Check for existence of typical virtual environment files
    test -f "$VENV/bin/activate" || return 1
    test -f "$VENV/pyvenv.cfg" || return 1
    echo "Removing the virtual environment..."
    rm -r "$VENV"
}
remove_venv || { echo "Error: failed to remove the virtual environment."; exit 1; }

# Remove allowed.py and m269.json from M269 folder
for file in "allowed.py" "m269.json"; do
    target="$FOLDER/$file"
    if [[ -f "$target" ]]; then
        echo "Removing $file from $FOLDER..."
        rm "$target"
    else
        echo "Warning: $target does not exist."
    fi
done

ALIASES=("alias nb" "alias allowed" "alias $COURSE")
NB="jupyter notebook &"
COURSE_PATTERN="[Mm]269-$YEAR[Jj]"

# Remove aliases from the configuration file
if [[ -f "$SHELL_CONFIG_FILE" ]]; then
    echo "Removing shortcut commands from $SHELL_CONFIG_FILE..."
    cp "$SHELL_CONFIG_FILE" "$SHELL_CONFIG_FILE".backup
    for alias in "${ALIASES[@]}"; do
        # Pattern is: Start with $alias, and contains $COURSE_PATTERN or $NB in rest of line.
        alias_pattern="/^$alias.*\(\($COURSE_PATTERN\)\|\($NB\)\)/d"
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sed -i "$alias_pattern" "$SHELL_CONFIG_FILE"
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i "" "$alias_pattern" "$SHELL_CONFIG_FILE"
        else
            echo "Warning: unknown OS or OSTYPE environment variable has been changed."
            echo "skipping removal of shortcut commands..."
        fi
    done
else
    echo "Warning: $SHELL_CONFIG_FILE does not exist."
fi

# Optionally Remove custom M269 styling
if confirm "Remove M269 custom styling from $CSS_FILE ?"; then
    START_DELIM="\/\* Start of $COURSE_PATTERN notebook styling. \*\/"
    END_DELIM="\/\* End of $COURSE_PATTERN notebook styling. \*\/"
    if [[ -f "$CSS_FILE" ]]; then
        cp "$CSS_FILE" "$CSS_FILE".backup
        echo "Removing M269 custom styling from $CSS_FILE..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sed -i "/$START_DELIM/,/$END_DELIM/d" "$CSS_FILE"
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i "" "/$START_DELIM/,/$END_DELIM/d" "$CSS_FILE"
        else
            echo "Warning: unknown OS or the OSTYPE environment variable has been changed."
            echo "skipping removal of custom styling..."
        fi
    else
        echo "Warning: $CSS_FILE does not exist."
    fi
fi

echo "All done. To reinstall please visit $SITE and follow the provided instructions."
