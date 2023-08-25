## 1 Preparation
To install the M269 software, you need about 1 Gb of disk space and
a modern operating system: Linux, macOS 11 (Big Sur) or later, Windows 10 or 11.
**Note**: In these instructions, Unix refers to Linux or macOs.

You can have your M269 book and TMAs in a cloud folder, but you must
install Python 3.10 and the M269 software on each computer you use.
Before installing the M269 software, do the following:

1. Create your M269 folder, which is where you put the M269 book and TMAs.
   The folder must be named `m269-23j` or `M269-23J` and
   can be anywhere on your disk, including a cloud drive.
   (You probably already did this step before you downloaded the M269 book.)

2. Windows only: Follow [these instructions](https://support.microsoft.com/en-us/windows/which-version-of-windows-operating-system-am-i-running-628bec99-476a-2c13-5296-9dd081cdd808)
   to check if you have 32-bit or 64-bit Windows.

3. Check if you have Python 3.10:
   - Windows: open a PowerShell, enter `py -0` and see if 3.10 is listed
   - Unix: open a terminal and enter `python3.10 -V`

   If 3.10 isn't listed or you get an error message like `command not found`,
   then you don't have Python 3.10.

4. If you don't have Python 3.10, install it, even if you have a newer version.
   Do *not* uninstall any Python version you have.
   - Windows: download and run the
     [32-bit installer](https://www.python.org/ftp/python/3.10.11/python-3.10.11.exe) or the
     [64-bit installer](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe).
     After installing, disable the pathname limit if you're given that option.
   - macOS: download and run the [installer](https://www.python.org/ftp/python/3.10.11/python-3.10.11-macos11.pkg)
   - Linux: enter `sudo apt install python3.10` or similar (search online for instructions for your Linux distribution)

5. macOS only: open a terminal, enter `xcode-select --install` and follow the instructions.
   If you get a message that the command line tools are already installed,
   then this step is completed.

## 2 Installation

To avoid errors, we suggest that instead of typing the commands,
you select and copy them from this page and paste them into the command line.

1. Open a PowerShell (Windows) or a terminal (Unix).
2. Go to your M269 folder by entering `cd <M269 folder path>`, e.g. `cd ~/OU/m269-23j`.
   (In PowerShell and Unix, `~` is a shorthand for your home folder.)
3. Download the installation script:
   - Windows: `Invoke-WebRequest -Uri https://raw.githubusercontent.com/dsa-ou/m269-installer/main/install.ps1 -OutFile install.ps1`
   - Unix: `curl -LO https://github.com/dsa-ou/m269-installer/raw/main/install.sh`
4. Allow the installation script to run:
   - Windows: `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser`
              and then select the `Y` (yes) option if you're given a choice
   - Unix: `chmod +x install.sh`
5. Run the installation script:
   - Windows: `.\install.ps1`
   - Unix: `./install.sh`
6. Close the terminal.

You will have the following files in your M269 folder:
- the installation script in `install.ps1` or `install.sh`
- the list of M269 software in `requirements.txt`
- the style changes to Jupyter notebooks in `custom.css`
- the code checker (see Section 4 below) in `allowed.py` and `m269.json`

We recommend you do _not_ remove these files, so that you can re-install
the software, if needed.

## 3 Usage

To work on the M269 notebooks, follow these steps.
You can press Tab to complete commands and pathnames.

1. Open a new PowerShell (Windows) or a new terminal (Unix).

2. Enter `m269-23j` to go to your M269 folder and activate the M269 software.
   The command line prompt becomes `(m269-23j) ...` to remind you that
   you're using the M269 software and not your default Python installation.

   **Important:** Never install software while the M269 software is active,
   as that may change the M269 software installation and break it.

3. Enter `nb` to start working with notebooks.
   After a little while, a web browser opens, with the _notebook dashboard_,
   listing the contents of your M269 folder.
   If there’s a message about migrating to Notebook 7, click "don’t show anymore".
   (You can now continue reading Section 1.3 of the book.)

4. After finishing working on the notebooks, go back to the web browser tab with
   the dashboard, click on the 'Quit' button, then close the browser tab.

5. Close the PowerShell (Windows) or terminal (Unix).

## 4 Checking your code

This section is for M269 students only. Instructions for tutors will be given separately.

Before submitting your TMAs, you should check that your code doesn't use
Python constructs not taught in M269.
The following instructions assume that your M269 folder has subfolders
`TMA01`, `TMA02` and `TMA03` and that you have your TMA notebook open in a browser tab.

### 4.1 In the VCE
If you're using the virtual computing environment (VCE) on the OU's Open Computing Lab:

1. Open a terminal as explained in Section 1.3 of the book.
2. Enter _one_ of the following, depending on which TMA you're checking:
   - `allowed -m -u 10 TMA01/23J_TMA01.ipynb`
   - `allowed -m -u 20 TMA02/23J_TMA02.ipynb`
   - `allowed -m TMA03/23J_TMA03.ipynb`

   If you get a list of disallowed constructs (with the code cells they occur in):

3. Click on the browser tab with your TMA notebook.
4. Edit your code to remove the disallowed constructs and save the notebook.
5. Go back to the terminal.
6. Press arrow-up and ENTER to repeat the checking command.
7. Go back to step 3 if there are still disallowed constructs in your code.

### 4.1 In Unix
The `nb` command runs Jupyter in the background,
which means that you can still use the same terminal for other commands.

1. Go back to the terminal in which you entered `m269-23j` and `nb`.
2. Proceed from step 2 of the VCE instructions.

### 4.2 In Windows
The `nb` command runs Jupyter in the background,
which means that you can still use the same PowerShell for other commands.

1. Go back to the PowerShell in which you entered `m269-23j` and `nb`.
3. Enter _one_ of the following, depending on which TMA you're checking:
   - `allowed -u 10 TMA01/23J_TMA01.ipynb`
   - `allowed -u 20 TMA02/23J_TMA02.ipynb`
   - `allowed TMA03/23J_TMA03.ipynb`
4. If disallowed constructs are listed, proceed from step 3 of the VCE instructions.

In Windows, the checker won't detect if you're calling a disallowed method on a list
or some other object. (You may have noticed that the `-m` flag isn't used in Windows.)
To check your code as thoroughly as Unix users:

1. Create a zip archive of your TMA folder.
2. Upload it to the VCE and unzip it there. See Section 1.3 of the book for details.
3. In the VCE dashboard, navigate to your TMA notebook and open it.
4. Continue with the VCE instructions above.

## 5 Uninstalling

At the end of the M269 23J presentation, if you wish to remove the M269 software,
delete folder `~/venvs/m269-23j`.
If you also want to remove the `m269-23j`, `nb` and `allowed` commands:

1. Find out in which file they are defined.
   - Windows: open a PowerShell and enter `$Profile.CurrentUserCurrentHost` to obtain the file name
   - Unix: open a terminal and enter `echo $0` to obtain the shell you're using.
     If it's fish, then the commands are in file `~/.config/fish/config.fish`,
     otherwise they're in file `~/.shellrc`, where `shell` is the name of your shell.
     For example, if you're using bash, then it's file `~/.bashrc`.
2. Open the file in a text editor.
3. Search for the lines that define the `m269-23j`, `nb` and `allowed`
   functions (Windows) or aliases (Unix). Delete those lines.
4. Save the file and close the text editor.

If you want to remove the M269 styling of notebooks:

1. Open file `~/.jupyter/custom/custom.css` in a text editor.
2. Delete all lines from the comment marking the start of M269-23J styling up to the comment ending it.
3. Save the file and close the editor.

## 6 Re-installing

If you haven't removed the installation files from your M269 folder,
you can re-install the software after uninstalling it,
e.g. to work again on your M269 notebooks. Do as follows:

1. Open a PowerShell (Windows) or a terminal (Unix).
2. Go to your M269 folder by entering `cd <M269 folder path>`, e.g. `cd ~/OU/m269-23j`.
3. Run the installation script with `.\install.ps1 .` (Windows) or `./install.sh .` (Unix).
   Note the extra space and period after the command, compared to step 5 in Section 2.
   (During re-installation, ignore messages saying that a file can't be copied onto itself.)
4. Close the terminal.

## Licence

The code and text in this repository are
Copyright © 2023 by The Open University, UK.
The code is licensed under a [BSD-3-clause licence](LICENCE).
The text is licensed under a
[Creative Commons Attribution 4.0 International Licence](http://creativecommons.org/licenses/by/4.0).

The installation scripts were written with the help of GitHub Copilot.