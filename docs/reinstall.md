## Re-installing

If you haven't removed the installation files from your M269 folder,
you can re-install the software, even after uninstalling it.

1. Open a new PowerShell (Windows) or terminal (Linux and macOS).
   Do _not_ use an already opened PowerShell or terminal.

2. Enter `cd <M269 folder path>`, e.g. `cd ~/OU/m269-26j`, to go to your M269 folder.

3. Enter `irm
   https://raw.githubusercontent.com/dsa-ou/m269-installer/main/install.ps1 |
iex` (Windows) or `curl -LsSf
https://github.com/dsa-ou/m269-installer/raw/main/install.sh | bash` (Linux,
macOS) to run the installation script. 

4. Close the PowerShell or terminal.

⇦ [Uninstalling](uninstall.md) | ⇧ [Home](README.md) | [Using](use.md) ⇨
