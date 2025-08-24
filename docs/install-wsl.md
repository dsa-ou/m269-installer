# Installing WSL

[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about)
(WSL) allows Windows and Linux to be used at the same time on the same machine.
It also allows both operating systems to access each other's files.

We thank our tutor Andy Connolly for an initial version of these instructions
and for checking this final version.

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the PowerShell.

1. Open a PowerShell.
2. Enter `wsl --install -d Ubuntu-24.04` to install an Ubuntu Linux distribution with Python 3.12.
   During the process you will be asked to create an administrator password.
3. Restart your machine.
4. Open a PowerShell.
5. Enter `wsl` to start using Linux.
6. Enter `sudo apt update && sudo apt upgrade -y` to upgrade the Linux software.
   The `sudo` command will ask you for the administrator password.
7. Optional: If you prefer to use `python` rather than `python3` to start python,
   enter `sudo apt install python-is-python3`.
8. Close the PowerShell.

From now on, follow the Linux instructions, with two small changes:
when you're asked to open a terminal, open a PowerShell instead and enter `wsl`;
when you're asked to close a terminal, close the PowerShell.

Click now on the link below to install the M269 software on Linux.

⇧ [Home](README.md)  | [Installing on Linux](install-linux.md) ⇨