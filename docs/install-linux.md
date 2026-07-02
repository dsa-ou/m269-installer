# Installing on Linux

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the terminal.

**WSL:** Remember that opening a terminal means to open a PowerShell and enter `wsl`.

1. Open a new terminal. Do _not_ use an already opened terminal.

2. Enter `python3.14 -V` to check if you have Python 3.14.
   If you get an error message like 'command not found':
   - Enter `sudo apt install python3.14` or similar.
     (Search online for instructions for your Linux distribution.)

3. If you're using a Debian-based distribution like Ubuntu,
   enter `sudo apt install python3.14-venv` or similar.

4. If you installed Python in step 2, close the terminal and open a new one.

5. Enter `cd <M269 folder path>`, e.g. `cd ~/OU/m269-26j`,
   to go to your M269 folder. (`~` is a shorthand for your home folder.)
   - **WSL:** If your M269 folder is e.g. on `C:\OU\m269-26j` then
      you must enter `cd /mnt/c/OU/m269-26j`.

6. Enter `curl -LsSf https://github.com/dsa-ou/m269-installer/raw/main/install.sh | bash`
   to download and run the installation script.

7.  **WSL**: For JupyterLab to open correctly, enter these commands in the terminal.
   - `echo -e "\nexport BROWSER='/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'" >> ~/.bashrc`
   - `echo "c.NotebookApp.use_redirect_file = False " >> ~/.jupyter/jupyter_lab_config.py`

8. Close the terminal.

You will have these files in your M269 folder:
- `install.sh`: the installation script
- `requirements.txt`: the list of M269 software
- `custom.css`: the style changes to Jupyter notebooks

> **Tip:** Do _not_ remove these files, so that
> you can re-install the software, if needed.

⇧ [Home](README.md)  | [Using](use-terminal.md) ⇨
