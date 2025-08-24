# Installing on WSL

[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about)
(WSL) allows Windows and Linux to be used at the same time on the same machine.
It also allows both operating systems to access each other's files.

We thank our tutor Andy Connolly for an initial version of these instructions
and for checking this final version.

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the PowerShell.

## Installing WSL


1. Open a Command Prompt.
2. Enter `wsl --install -d Ubuntu-24.04` to install an Ubuntu Linux distribution with Python 3.12.
   During the process you will be asked to create an administrator password.
3. Restart your machine.
4. Open a PowerShell.
5. Enter `wsl` to start using Linux.
6. Enter `sudo apt update && sudo apt upgrade -y` to upgrade the Linux software.
   The `sudo` command will ask you for the administrator password.
7. Enter `sudo apt install python3.12-venv` to install additional Python 3.12 software.
8. Optional: If you prefer to use `python` rather than `python3` to start python,
   enter `sudo apt install python-is-python3`.
9. Close the PowerShell.

## Installing the M269 Software

1. Open a new PowerShell.
2. Enter `wsl`.
3. Enter `cd <M269 folder path>` to go to your M269 folder on the Windows file system.
   For example, if your M269 folder is `C:\OU\m269-25j` then you must now enter
   `cd /mnt/c/OU/m269-25j`.
4. Enter `curl -LO https://github.com/dsa-ou/m269-installer/raw/main/install.sh`
   to download the installation script.
5. Enter `chmod +x install.sh` to allow the installation script to run.
6. Enter `./install.sh` to run the installation script.
7. Close the PowerShell.

You will have these files in your M269 folder:
- `install.sh`: the installation script
- `requirements.txt`: the list of M269 software
- `custom.css`: the style changes to Jupyter notebooks

> **Tip:** Do _not_ remove these files, so that
> you can re-install the software, if needed.


⇧ [Home](README.md)  | [Using](use.md) ⇨