# Installing on Linux

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the terminal.

1. Open a terminal.

2. Enter `python3.12 -V` to check if you have Python 3.12.
   If you get an error message like 'command not found':
   - Enter `sudo apt install python3.12` or similar.
     (Search online for instructions for your Linux distribution.)
   - If you're using a Debian-based distribution like Ubuntu,
   enter _in addition_ `sudo apt install python3.12-venv` or similar.

3. If you installed Python in step 2, close the terminal and open a new one.

4. Enter `cd <M269 folder path>`, e.g. `cd ~/OU/m269-25j`,
   to go to your M269 folder. (`~` is a shorthand for your home folder.)

5. Enter `curl -LO https://github.com/dsa-ou/m269-installer/raw/main/install.sh`
   to download the installation script.

6. Enter `chmod +x install.sh` to allow the installation script to run.

7. Enter `./install.sh` to run the installation script.

8. Close the terminal.

You will have these files in your M269 folder:
- `install.sh`: the installation script
- `requirements.txt`: the list of M269 software
- `custom.css`: the style changes to Jupyter notebooks

> **Tip:** Do _not_ remove these files, so that
> you can re-install the software, if needed.

⇧ [Home](README.md)  | [Using](use.md) ⇨