# Installing on Windows

> **Important:** If your M269 or Documents folders are on OneDrive, then
> right-click each folder and choose 'always keep on this device'.

> **Tip:** To avoid errors, instead of typing the commands below,
> select and copy them from this page and paste them into the PowerShell.

1. Open a PowerShell, *not* a Command Prompt.

2. Enter `py -0` and see if Python 3.14 is listed. If not, or
   if you get an error message like 'command not found':
   - Follow [these instructions](https://support.microsoft.com/en-us/windows/which-version-of-windows-operating-system-am-i-running-628bec99-476a-2c13-5296-9dd081cdd808)
     to check if you have 32-bit or 64-bit Windows.
   - Download and run the
     [32-bit installer](https://www.python.org/ftp/python/3.14.7/python-3.14.7.exe) or the
     [64-bit installer](https://www.python.org/ftp/python/3.14.7/python-3.14.7-amd64.exe).
   - Install Python for all users. Disable the pathname limit if you're given that option.

3. Enter `Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted`
   to allow the installation script to run.

4. Close the PowerShell and open a new one.

5. Enter `cd <M269 folder path>`, e.g. `cd ~/OU/m269-26j`,
   to go to your M269 folder. (`~` is a shorthand for your home folder.)

6. Enter `powershell -NoExit -Command "irm https://raw.githubusercontent.com/dsa-ou/m269-installer/main/install.ps1 | iex"`
   to download and run the installation script.

7. Close the PowerShell.

Check that you have these files in your M269 folder:

- `install.ps1`: the installation script
- `requirements.txt`: the list of M269 software
- `custom.css`: the style changes to Jupyter notebooks
- `start.ps1`: needed to use the software

> **Tip:** Do *not* remove these files, so that
> you can re-install the software, if needed.

In addition, there will be an `M269-start` shortcut in your desktop.

## Handling errors

If you get an error message about the `Command` parameter in step 6,
enter only the part within the double quotes, i.e. `irm ... | iex`.

If that still doesn't install the expected files, enter these two commands:

1. `Invoke-WebRequest -Uri https://raw.githubusercontent.com/dsa-ou/m269-installer/main/install.ps1 -OutFile install.ps1`
2. `.\install.ps1`

This will download and run the installer, showing what it's doing and why it's failing.
Check the M269 Technical Forum for any help on the error message you get.

⇧ [Home](README.md)  | [Using](use-shortcut.md) ⇨
