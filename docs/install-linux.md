# Installing on Linux

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the terminal.

**WSL:** Remember that opening a terminal means to open a PowerShell and enter `wsl`.

1. Open a new terminal. Do _not_ use an already opened terminal.

2. Enter `python3.12 -V` to check if you have Python 3.12.
   If you get an error message like 'command not found':
   - Enter `sudo apt install python3.12` or similar.
     (Search online for instructions for your Linux distribution.)

3. If you're using a Debian-based distribution like Ubuntu,
   enter `sudo apt install python3.12-venv` or similar.

4. If you installed Python in step 2, close the terminal and open a new one.

5. Enter `cd <M269 folder path>`, e.g. `cd ~/OU/m269-25j`,
   to go to your M269 folder. (`~` is a shorthand for your home folder.)
   - **WSL:** If your M269 folder is e.g. on `C:\OU\m269-25j` then
      you must enter `cd /mnt/c/OU/m269-25`.

6. Enter `curl -LO https://github.com/dsa-ou/m269-installer/raw/main/install.sh`
   to download the installation script.

7. Enter `chmod +x install.sh` to allow the installation script to run.

8. Enter `./install.sh` to run the installation script.

9. Close the terminal.

You will have these files in your M269 folder:
- `install.sh`: the installation script
- `requirements.txt`: the list of M269 software
- `custom.css`: the style changes to Jupyter notebooks

> **Tip:** Do _not_ remove these files, so that
> you can re-install the software, if needed.

⇧ [Home](README.md)  | [Using](use.md) ⇨