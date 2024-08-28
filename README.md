To install the M269 software, you need about 1 Gb of disk space and
a modern operating system: Linux, macOS 11 (Big Sur) or later, Windows 10 or 11.
**Note**: In these instructions, Unix refers to Linux or macOS.

You can have your M269 book and TMAs in a cloud folder, but you must
install Python 3.11 and the M269 software on each computer you use.

**Important**: You must open and close PowerShells and terminals as instructed below
for the software to be correctly installed and used.
Do _not_ use already opened PowerShells and terminals.

These instructions assume that you already have created your M269 folder and
have put the M269 book there, as instructed in the Resources tab of the M269 website.

If you need help with the following instructions, ask in the M269 Technical Forum.

## 1 Preparation

Before installing the M269 software, do the following:

1. Check if you have Python 3.11:
   - **Windows**: open a PowerShell, enter `py -0` and see if 3.11 is listed
   - **Unix**: open a terminal and enter `python3.11 -V`

   If 3.11 isn't listed or you get an error message like `command not found`,
   then go to the next step, otherwise go directly to step 4 (macOS) or 5 (Windows and Linux).

2. Install Python 3.11, even if you have a newer version.
   Do *not* uninstall any Python version you have.
   - **Windows**: Follow [these instructions](https://support.microsoft.com/en-us/windows/which-version-of-windows-operating-system-am-i-running-628bec99-476a-2c13-5296-9dd081cdd808)
     to check if you have 32-bit or 64-bit Windows. Then download and run the
     [32-bit installer](https://www.python.org/ftp/python/3.11.9/python-3.11.9.exe) or the
     [64-bit installer](https://www.python.org/ftp/python/3.11.9/python-3.11.9-amd64.exe).
     After installing, disable the pathname limit if you're given that option.
   - **macOS**: download and run the [installer](https://www.python.org/ftp/python/3.11.9/python-3.11.9-macos11.pkg)
   - **Linux**: enter `sudo apt install python3.11` or similar (search online for instructions for your Linux distribution).
     If you're using a Debian-based distribution like Ubuntu, you must additionally
     enter `sudo apt install python3.11-venv` or similar.

3. **macOS**: open a terminal, enter `xcode-select --install` and follow the instructions.
   If you get a message that the command line tools are already installed,
   then this step is completed.

4. Close any PowerShell (Windows) or terminal (Unix) you have opened,
   and proceed to the next section.

## 2 Installation

To avoid errors, we suggest that instead of typing the commands,
you select and copy them from this page and paste them into the command line.

1. Open a new PowerShell (Windows) or a new terminal (Unix).

2. Go to your M269 folder by entering `cd <M269 folder path>`, e.g. `cd ~/OU/m269-24j`.
   (In PowerShell and Unix, `~` is a shorthand for your home folder.)

3. Download the installation script:
   - **Windows**: `Invoke-WebRequest -Uri https://raw.githubusercontent.com/dsa-ou/m269-installer/main/install.ps1 -OutFile install.ps1`
   - **Unix**: `curl -LO https://github.com/dsa-ou/m269-installer/raw/main/install.sh`

4. Allow the installation script to run:
   - **Windows**: `Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser`
              and then select the `Y` (yes) option if you're given a choice
   - **Unix**: `chmod +x install.sh`

5. Run the installation script:
   - **Windows**: `.\install.ps1`
   - **Unix**: `./install.sh` and ignore a message about pytype and networkx being incompatible

6. Close the PowerShell or terminal you opened in step 1.

You will have the following files in your M269 folder:
- the installation script in `install.ps1` (Windows) or `install.sh` (Unix)
- script `start.ps1` (Windows only)
- the list of M269 software common to Windows and Unix in `requirements.txt`
- the style changes to Jupyter notebooks in `custom.css`

We recommend you do _not_ remove these files, so that you can re-install
the software, if needed. Now proceed to the next section.

## 3 Usage

On Windows, there are two ways of using the M269 notebooks, either from a terminal
or by creating a desktop shortcut. On Unix, use a terminal.

### 3.1 Desktop shortcut (Windows only)

The `start.ps1` script and these instructions are originally by M269 tutor Bob Moore.

1. Right click on the desktop. Select 'new shortcut'. Type `powershell`.
   Hit 'Next' and then 'Finish': 'powershell' gets automatically expanded to the full name of the program.

2. Right click on the new desktop icon and select 'Properties' to update the shortcut:

   1. Modify the start-up folder to be your M269 folder.
   2. Append `-file start.ps1` to the target field. It should now read:
      `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file start.ps1`.
   3. Optionally you can update the icon for the shortcut. To get a Jupyter icon
      instead of a PowerShell icon you can use
      `%USERPROFILE%\venvs\m269-23j\Lib\site-packages\nbclassic\static\base\images\favicon.ico`.

You should now be able to double click on the desktop shortcut to start Jupyter
in your M269 folder. First, a PowerShell window opens where Jupyter writes its log messages,
then your browser should open the Jupyter dashboard, listing the contents of your M269 folder.
If there’s a message about migrating to Notebook 7, click "don’t show anymore".
You can now continue reading Section 1.3 of the book to learn how to use Jupyter.

**Note for tutors:** You can create multiple shortcuts, each opening Jupyter in
a different start folder, e.g. the eTMA marking folder. Follow the same steps
as above for each shortcut, but in step 2.2, append also the intended start folder:
`-file start.ps1 path/to/folder`. If the path includes spaces, you must enclose it in quotes.

### 3.2 Terminal (Windows and Unix)

Every time you want to work on the M269 notebooks, you need to follow the next 5 steps.
However, the first time you are using Jupyter, after installing the software,
just do the first 3 steps and return to the book to learn how to use Jupyter.

1. Open a new PowerShell (Windows) or a new terminal (Unix).

2. Enter `m269-24j` to go to your M269 folder and activate the M269 software.
   The command line prompt becomes `(m269-24j) ...` to remind you that
   you're using the M269 software and not your default Python installation.

   **Important:** Never install software while the M269 software is active,
   as that may change the M269 software installation and break it.

3. Enter `nb` to start working with notebooks.
   After a little while, a web browser opens, with the Jupyter dashboard
   listing the contents of your M269 folder.
   If there’s a message about migrating to Notebook 7, click "don’t show anymore".
   (You can now continue reading Section 1.3 of the book.)

   **Note**: if you skipped step 2 by mistake,
   then entering `nb` will still activate the M269 software but
   Jupyter will start in your current folder rather than the M269 folder,
   and you won't see the M269 materials in the Jupyter dashboard.
   In that case, do step 4 to close the dashboard and then go back to step 2.

4. After finishing working on the notebooks, go back to the web browser tab with
   the Jupyter dashboard, click on the 'Quit' button, then close the browser tab.

5. Close the PowerShell or terminal you opened in step 1.

**Note to tutors:** To mark TMA notebooks, follow the steps above,
but in step 2, instead of entering `m269-24j`,
change to the eTMA marking folder with the `cd` command, and then
proceed with step 3 to start working in that folder.

**Note for macOS users**:
If steps 2 and 3 (the `m269-24j` and `nb` commands) are not working,
and you are using `bash`, enter in the terminal
 ```bash
 echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
 ```
Then close your terminal, open a new one, and try again steps 2 and 3.

## 4 Uninstalling

At the end of the M269 24J presentation, if you wish to remove the M269 software,
delete folder `~/venvs/m269-24j` and any desktop shortcuts you created on Windows.
If you also want to remove the `m269-24j` and `nb` commands:

1. Find out in which file they are defined.
   - **Windows**: open a PowerShell and enter `$Profile.CurrentUserCurrentHost` to obtain the file name
   - **Unix**: open a terminal and enter `echo $0` to obtain the shell you're using.
     If it's fish, then the commands are in file `~/.config/fish/config.fish`,
     otherwise they're in file `~/.shellrc`, where `shell` is the name of your shell.
     For example, if you're using bash, then it's file `~/.bashrc`.

2. Open the file in a text editor.

3. Search for the lines that define the `m269-24j` and `nb`
   functions (Windows) or aliases (Unix). Delete those lines.

4. Save the file and close the text editor.

If you want to remove the M269 styling of notebooks:

1. Open file `~/.jupyter/custom/custom.css` in a text editor.

2. Delete all lines from `/* Start of M269-24J ... */` to `/* End of M269-24J ... */`.

3. Save the file and close the editor.

## 5 Re-installing

If you haven't removed the installation files from your M269 folder,
you can re-install the software after uninstalling it,
e.g. to work again on your M269 notebooks. Do as follows:

1. Open a new PowerShell (Windows) or a new terminal (Unix).

2. Go to your M269 folder by entering `cd <M269 folder path>`, e.g. `cd ~/OU/m269-24j`.

3. Run the installation script with an extra space and period after the command, compared to step 5 in Section 2:
   - **Windows**: `.\install.ps1 .`
   - **Unix**: `./install.sh .`

4. Close the PowerShell or terminal you opened in step 1.

## Licence

The code and text in this repository are
Copyright © 2023–2024 by The Open University, UK.
The code is licensed under a [BSD-3-clause licence](LICENCE).
The text is licensed under a
[Creative Commons Attribution 4.0 International Licence](http://creativecommons.org/licenses/by/4.0).

The installation scripts were written with the help of GitHub Copilot.