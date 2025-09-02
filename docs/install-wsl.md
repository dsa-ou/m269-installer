# Installing WSL

[Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/about)
(WSL) allows Windows and Linux to be used at the same time on the same machine.
It also allows both operating systems to access each other's files.

We thank our tutor Andy Connolly for an initial version of these instructions
and for checking this final version.

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the PowerShell.

1. To allow your Windows machine to have Linux, do as follows:
   - Go to Control Panel > Programs > Programs and Features > Turn Windows features on or off.
   - Turn on "Virtual Machine Platform" and "Windows Subsystem for Linux".
   - Reboot the computer.
2. Open a PowerShell.
3. Enter `wsl --install -d Ubuntu-24.04` to install an Ubuntu Linux distribution with Python 3.12.
   WSL will ask you to create a Linux user account.
   The default username is the one for Windows. When asked to set a password,
   type it, press ENTER, and type it again. The password isn't shown on the screen.
4. Enter `sudo apt update && sudo apt upgrade -y` to upgrade the Linux software.
   The `sudo` command will ask you for the password.
5. Optional: If you prefer to use `python` rather than `python3` to start python,
   enter `sudo apt install python-is-python3`.
6. Close the PowerShell.

From now on, follow the Linux instructions, with two small changes:
when you're asked to open a terminal, open a PowerShell instead and enter `wsl`;
when you're asked to close a terminal, close the PowerShell.

Click now on the link below to install the M269 software on Linux.

⇧ [Home](README.md)  | [Installing on Linux](install-linux.md) ⇨