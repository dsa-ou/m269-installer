#!/bin/bash

BOLD="\033[1m"
NORMAL="\033[0m"

confirm() {
    local message="$1"
    echo -en "${BOLD}:: $message [y/N] ${NORMAL}"
    read -r response
    case "$response" in
        [yY])
            return 0  # true
            ;;
        *)
            return 1  # false
            ;;
    esac
}

# Confirm uninstallation
echo "Warning: After uninstallation, you will need a Jupyter environment to open and run your notebooks."
if ! confirm "Proceed with uninstallation?"; then
    exit 1
fi

# Assume variables VENV, COURSE, FOLDER, SHELL_CONFIG_FILE,
# will be in the M269 config file
if [ -e .m269rc ]; then
    source .m269rc
else
    echo "Failed to source the M269 configuration file "
    exit 1
fi
CSS_FILE=~/.jupyter/custom/custom.css
COURSE_YEAR="${COURSE:5:2}"

# Remove the virtual environment
remove_venv() {
    test -n "$VENV" || return 1
    test -d "$VENV" || return 1
    # Check for existence of typical virtual environment files
    test -f "$VENV/bin/activate" || return 1
    test -f "$VENV/pyvenv.cfg" || return 1
    echo "Removing the virtual environment..."
    rm -r "$VENV"
}
if confirm "Remove the $COURSE virtual environment?"; then
    remove_venv || echo "Warning: failed to remove the virtual environment."
fi

# Remove allowed.py and m269.json from M269 folder
if confirm "Remove allowed.py and m269.json from $FOLDER ?"; then
    for file in "allowed.py" "m269.json"; do
        target="$FOLDER/$file"
        if [ -e "$target" ]; then
            echo "Removing $file from $FOLDER..."
            rm "$target"
        else
            echo "Warning: $target does not exist."
        fi
    done
fi

# Remove aliases from the configuration file
if confirm "Remove shortcut commands from $SHELL_CONFIG_FILE ?"; then
    ALIASES=("alias nb" "alias allowed" "alias $COURSE")
    if [ -e $SHELL_CONFIG_FILE ]; then
        echo "Removing shortcut commands from $SHELL_CONFIG_FILE..."
        cp "$SHELL_CONFIG_FILE" "$SHELL_CONFIG_FILE".backup
        for alias in "${ALIASES[@]}"; do
            # Delete lines that start with $alias and contain current course "code"
            sed -i "/^$alias.*[Mm]269-$COURSE_YEAR[Jj]/d" "$SHELL_CONFIG_FILE"
        done
    fi
fi

# Remove lines from ~/.jupyter/custom/custom.css
if confirm "Remove M269 custom styling from $CSS_FILE ?"; then
    # Special characters need to be escaped for use in regex
    START_DELIM="\/\* Start of [Mm]269-$COURSE_YEAR[Jj] notebook styling. \*\/"
    END_DELIM="\/\* End of [Mm]269-$COURSE_YEAR[Jj] notebook styling. \*\/"
    if [ -e $CSS_FILE ]; then
        cp "$CSS_FILE" "$CSS_FILE".backup
        echo "Removing M269 custom styling from $CSS_FILE..."
        sed -i "/$START_DELIM/,/$END_DELIM/d" "$CSS_FILE"
    fi

fi

echo "The uninstallation process has now completed."
