The M269 software requires a Unix-based environment.
If you use Linux or macOS, go directly to Section 2 below.
If you use Windows, you must install Linux first. The next section explains how.

At the moment, these instructions haven't been tested on Windows.
Please report any problems in the M269 Technical Forum.

## 1 Linux for Windows users

The Windows Subsystem for Linux (WSL) allows you to
use Windows and Linux (a flavour of Unix for personal computers)
at the same time, without complicated setups.
Full instructions are on Microsoft's
[WSL site](https://learn.microsoft.com/en-us/windows/wsl/install).
The following simplified instructions are based on a session report
kindly provided by our tutor Andy Connolly.

1. Make sure that
   - you have at least 3Gb free on your disk
   - you are running Windows 10 (version 2004 or higher) or Windows 11.
2. Open a command prompt in administrator mode and enter `wsl --install`.
   This installs Ubuntu (a particular Linux distribution) and
   restarts your computer at the end.
3. Open a command prompt and enter `wsl`.
   This asks you to create a user name and password.
   The password must be typed twice and doesn't appear on the screen.
4. Once logged in, enter `sudo apt update && sudo apt upgrade`. This asks you
   for your password and then updates your Ubuntu system to the latest version.
5. Enter `logout`. Keep the command prompt open.

You have now installed WSL. In future, every time you want to use WSL,
open a command prompt (or use an existing one), and enter `wsl` to login.
Once you want to stop using WSL, enter `logout`.

WSL and Windows use separate file systems, so you will have two home folders,
one on WSL and one of Windows. The file systems are mutually accessible:
Windows file or folder `C:\Users\me\...` can be accessed as
`/mnt/c/Users/me/...` from WSL, and
WSL file or folder `~/...` can be accessed as `\\wsl$\Ubuntu\home\...` from Windows.

Since WSL is a particular variant of Unix (namely Ubuntu Linux),
it follows the Unix conventions: `~` is the abbreviation for your home folder;
file and folder paths use slashes instead of backslashes.

## 2 Installing the M269 software

1. Decide where you want to have your M269 materials, e.g. `~/OU/M269-23J`.
   This will be your M269 folder. (Step 5 below will create it for you.)
   We recommend the folder name includes `23J`.
2. Click on the 'Download .zip' button above.
   Unzip the downloaded archive, typically by double-clicking on it.
   (Your web browser may have unzipped it automatically.)
   You will have a folder named `dsa-ou-m269-installer-fe96298` or similar.
3. Open a terminal.
   (On Windows: Enter `wsl` in the command prompt you kept open. You're now in WSL.)
4. Go to the extracted folder. Depending on where your downloads folder is,
   and what the name of the extracted folder is, you need to enter something like
   `cd ~/Downloads/dsa-ou-m269-installer-fe96298` or on WSL
   `cd /mnt/c/Users/yourname/Downloads/dsa-ou-m269-installer-fe96298`.
5. Enter `./install-m269.sh <M269 folder>`, e.g. `./install-m269.sh ~/OU/M269-23J`.

If the script stops with a message asking you to install Python 3.10:

- On most Linux systems, including WSL: enter `sudo apt install python3.10`.
- On macOS: [download the installer](https://www.python.org/ftp/python/3.10.11/python-3.10.11-macos11.pkg)
  and run it.

You don't need to uninstall your current Python version before installing 3.10.

After installing Python 3.10, close your terminal
(on WSL: enter `logout` but don't close the command prompt),
and restart from step 3.
Restarting with a new terminal or WSL login will ensure your system
knows where Python 3.10 is installed.

6. After the installation script finishes successfully,
   delete the `dsa-ou-m269-installer-...` folder.

## 3 Using the M269 software

When you want to start working on M269:

1. Open a terminal or command prompt, or use an already opened one.
2. On Windows only: enter `wsl` to start WSL.
3. Enter `m269-23j`.

The last command puts you in the M269 folder and activates the M269 software.
The command line prompt becomes `(m269-23j) ...` to remind you that
you're using the M269 software and not your default Python installation.

Once the M269 software is active, you can enter `nb` to open
the M269 cover notebook, from which you can access all other notebooks.
After finishing working on the notebooks, close them in the browser,
and press Ctrl-c twice in the terminal to stop executing the `nb` command.

Obviously, the `nb` command only works after you install the M269 book
(available in the Resources tab of the M269 site) in your M269 folder.

When you are done working on M269:

1. Enter `deactivate`. This stops using the M269 software.
   The command line prompt no longer starts with `(m269-23j)`.
2. If you're using WSL, enter `logout`.
3. You may close the terminal or command prompt, if you wish.

**Important:** Never install software while the M269 software is active,
as that may change the M269 software installation and break it.

## Licence

The code and text in this repository are
Copyright © 2023 by The Open University, UK.
The code is licensed under a [BSD-3-clause licence](LICENCE).
The text is licensed under a
[Creative Commons Attribution 4.0 International Licence](http://creativecommons.org/licenses/by/4.0).