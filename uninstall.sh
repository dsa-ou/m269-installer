#!/bin/bash

# Confirm uninstallation
echo "Warning: After uninstallation, you will need a Jupyter environment to open and run your notebooks."
read -p "Proceed with uninstallation? [y/N] " response
case $response in
    [yY])
        ;;
    *)
        exit 1
        ;;
    esac

# Assume variables VENV, COURSE, FOLDER, SHELL_CONFIG_FILE,
# will be in the m269 config file
source .m269rc
if [[ $? -ne 0 ]]; then
    echo "Failed to source the configuration file "
    exit 1
fi

# Remove the virtual environment
echo "Removing the virtual environment..."
rm -rf "$VENV"

# Remove allowed.py and m269.json from current directory
echo "Removing allowed.py and m269.json from $FOLDER... "
rm -f $FOLDER/allowed.py $FOLDER/m269.json

# Remove aliases from the configuration file
echo "Removing shortcut commands from $SHELL_CONFIG_FILE..."

ALIASES=("alias nb" "alias allowed" "alias $COURSE")

cp "$SHELL_CONFIG_FILE" "$SHELL_CONFIG_FILE".backup
for alias in "${ALIASES[@]}"; do
    sed -i "/^$alias/d" "$SHELL_CONFIG_FILE"
done

# Remove lines from ~/.jupyter/custom/custom.css

# Special characters need to be escaped for use in regex
START_DELIM="\/\* Start of M269-23J notebook styling. \*\/"
END_DELIM="\/\* End of M269-23J notebook styling. \*\/"
CSS_FILE=~/.jupyter/custom/custom.css

cp "$CSS_FILE" "$CSS_FILE".backup
echo "Removing custom styling from $CSS_FILE ..."
sed -i "/$START_DELIM/,/$END_DELIM/d" "$CSS_FILE"
