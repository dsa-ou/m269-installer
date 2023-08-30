#!/bin/bash

# This script performs the uninstallation of the M269 course environment
# and will do the following:
# - Seeks user confirmation before proceeding.
# - Removes the virtual environment located at ~/venvs/m269-23j
# - Erases course-specific aliases from the shell config file.
# - Removes files from the M269 folder.
# - Optionally clears M269 styling from Jupyter's custom.css.

# Note: this script expects FOLDER and SHELL_CONFIG_FILE to be set during the
# installation process (inserted above line 14 with sed when install.sh is run).

YEAR=23
COURSE="m269-${YEAR}j"
VENV=~/venvs/$COURSE
CSS_FILE=~/.jupyter/custom/custom.css
SITE=https://dsa-ou.github.io/m269-installer
COURSE_PATTERN="[Mm]269-$YEAR[Jj]"

# Prompts user for confirmation.
# Args: message.
# Returns: 0 if 'yes', 1 if 'no'.
confirm() {
    bold="\033[1m"
    normal="\033[0m"
    local message="$1"
    echo -en "${bold}:: $message [y/N] ${normal}"
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

# Removes a virtual environment located at $VENV.
# Args: none.
# Returns: 1 if any check fails.
remove_venv() {
    if [[ -z "$VENV" ]] ||
       [[ ! -d "$VENV" ]] ||
       [[ ! -f "$VENV/bin/activate" ]] ||
       [[ ! -f "$VENV/pyvenv.cfg" ]]; then
        return 1
    fi
    echo "Removing the virtual environment..."
    rm -r "$VENV"
}

# Removes specified files from $FOLDER.
# Args: file names to remove.
# Outputs: success or warning messages.
remove_files() {
    for file in "$@"; do
        target="$FOLDER/$file"
        if [[ -f "$target" ]]; then
            echo "Removing $target..."
            rm "$target"
        else
            echo "Warning: failed to find $target..."
            echo "Skipping removal of $target..."
        fi
    done
}

# Removes specific aliases from $SHELL_CONFIG_FILE.
# Args: none.
# Returns: 1 if $SHELL_CONFIG_FILE doesn't exist.
remove_aliases() {
    local aliases=("alias nb" "alias allowed" "alias $COURSE")
    local nb="jupyter notebook &"
    if [[ -f "$SHELL_CONFIG_FILE" ]]; then
        echo "Removing shortcut commands from $SHELL_CONFIG_FILE..."
        cp "$SHELL_CONFIG_FILE" "$SHELL_CONFIG_FILE".backup
        for alias in "${aliases[@]}"; do
            # Delete lines that start with $alias and contain $COURSE_PATTERN or $nb in the rest
            sed_delete_command="/^$alias.*\(\($COURSE_PATTERN\)\|\($nb\)\)/d"
            sed "$sed_delete_command" "$SHELL_CONFIG_FILE" > "$SHELL_CONFIG_FILE.tmp"
            mv "$SHELL_CONFIG_FILE.tmp" "$SHELL_CONFIG_FILE"
        done
    else
        return 1
    fi
}

# Removes custom M269 styling from $CSS_FILE.
# Args: none.
# Returns: 1 if $CSS_FILE doesn't exist.
remove_styling() {
    local start_delim="\/\* Start of $COURSE_PATTERN notebook styling. \*\/"
    local end_delim="\/\* End of $COURSE_PATTERN notebook styling. \*\/"
    if [[ -f "$CSS_FILE" ]]; then
        echo "Removing M269 custom styling from $CSS_FILE..."
        cp "$CSS_FILE" "$CSS_FILE".backup
        sed "/$start_delim/,/$end_delim/d" "$CSS_FILE" > "$CSS_FILE.tmp"
        mv "$CSS_FILE.tmp" "$CSS_FILE"
    else
        return 1
    fi
}

# Main script
if [[ -z "$FOLDER" ]] || [[ -z "$SHELL_CONFIG_FILE" ]]; then
    echo "Error: critical variables have not been set during installation."
    exit 1
fi
echo "Warning: This script will make the following changes: "
echo "- Remove the virtual environment located at $VENV."
echo "- Remove the shortcut commands 'nb', 'allowed' and '$COURSE' from $SHELL_CONFIG_FILE"
echo "- Optionally removes M269 custom styling from $CSS_FILE"
echo "As a result, Jupyter notebooks will no longer be readable or executable unless another Jupyter environment exists."
if ! confirm "Proceed with uninstallation?"; then
    exit 0
fi
if ! remove_venv; then
    echo "Error: failed to remove the virtual environment."
    exit 1
fi
remove_files "allowed.py" "m269.json"
if ! remove_aliases; then
    echo "Warning: failed to find $SHELL_CONFIG_FILE..."
    echo "Skipping removal of aliases..."
fi
if confirm "Remove custom M269 styling from $CSS_FILE ?"; then
    if ! remove_styling; then
        echo "Warning: failed to find $CSS_FILE..."
        echo "Skipping removal of custom M269 styling from $CSS_FILE..."
    fi
fi
echo "All done. To reinstall please visit $SITE and follow the provided instructions."
