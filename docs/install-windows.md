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
     [32-bit installer](https://www.python.org/ftp/python/3.14.6/python-3.14.6.exe) or the
     [64-bit installer](https://www.python.org/ftp/python/3.14.6/python-3.14.6-amd64.exe).
   - After installing, disable the pathname limit if you're given that option.

3. If you installed Python in step 2, close the PowerShell and open a new one.

4. Enter `cd <M269 folder path>`, e.g. `cd ~/OU/m269-26j`,
   to go to your M269 folder. (`~` is a shorthand for your home folder.)

5. Enter `irm https://raw.githubusercontent.com/dsa-ou/m269-installer/main/install.ps1 | iex`
   to download and run installation script.
   
8. Close the PowerShell.

You will have these files in your M269 folder:
- `requirements.txt`: the list of M269 software
- `custom.css`: the style changes to Jupyter notebooks

> **Tip:** Do _not_ remove these files, so that
> you can re-install the software, if needed.

You will also have file `start.ps1`, which is needed to use the software.

⇧ [Home](README.md)  | [Using](use-shortcut.md) ⇨
