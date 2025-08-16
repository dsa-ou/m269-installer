# Installing on macOS

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the terminal.

1. Open a terminal.

2. Enter `python3.11 -V` to check if you have Python 3.11.
   If you get an error message like 'command not found':
   - Download and run the Python 3.11 [installer](https://www.python.org/ftp/python/3.11.9/python-3.11.9-macos11.pkg).

3. If you installed Python in step 2, close the terminal and open a new one.

4. Enter `xcode-select --install` and follow the instructions.
   If you get a message that the command line tools are already installed,
   then this step is done.

5. Enter `cd <M269 folder path>`, e.g. `cd ~/OU/m269-24j`,
   to go to your M269 folder. (`~` is a shorthand for your home folder.)

6. Enter `curl -LO https://github.com/dsa-ou/m269-installer/raw/main/install.sh`
   to download the installation script.

7. Enter `chmod +x install.sh` to allow the installation script to run.

8. Enter `./install.sh` to run the installation script.
   Ignore a message about pytype and networkx being incompatible.

9. Close the terminal.

You will have these files in your M269 folder:
- `install.sh`: the installation script
- `requirements.txt`: the list of M269 software
- `custom.css`: the style changes to Jupyter notebooks

> **Tip:** Do _not_ remove these files, so that
> you can re-install the software, if needed.

Now proceed to the instructions on how to [use the software](usage.md).