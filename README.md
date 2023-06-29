Before you install the M269 software you must:

1. **Create your M269 folder**, which is where you put the M269 book and TMAs.
   The folder must be named `m269-23j` or `M269-23J` and
   can be anywhere on your disk, including a cloud drive.
2. **Install Python 3.10**. For macOS and Windows, download and run the corresponding
   [installer](https://www.python.org/downloads/release/python-31011/).
   For Linux, search online for instructions for your specific distribution.
   Typically, you will enter `sudo apt install python3.10` or similar in a terminal.

If you're unsure whether you already have Python 3.10, open a command prompt or
terminal and enter `python3.10 -V`. If you get an error message, you don't have it.

You don't need to uninstall your current Python version before installing 3.10.

If you're using multiple computers, you can keep your M269 folder in the cloud,
but you must repeat the installation in each computer.

## 1 Windows

_Instructions forthcoming..._

## 2 macOS and Linux

### 2.1 Installation

1. Open a terminal.
2. Go to your M269 folder by entering `cd path/to/your/folder`, e.g.
   ```bash
   cd ~/OU/m269-23j
   ```
3. Download the installation script by entering
   ```bash
   curl -LO https://github.com/dsa-ou/m269-installer/raw/main/install-m269.sh
   ```
   (You can copy and paste the command into the terminal instead of typing it.)
4. Run the installation script by entering
   ```bash
   ./install-m269.sh
   ```
5. Once the script has finished, remove it:
   ```bash
   rm install-m269.sh
   ```
6. Close the terminal.

### 2.2 Usage

1. Open a new terminal and enter
   ```bash
   m269-23j
   ```
   (It may be enough to type `m2`, TAB, ENTER.)
   This puts you in your M269 folder and activates the M269 software.
   The command line prompt becomes `(m269-23j) ...` to remind you that
   you're using the M269 software and not your default Python installation.

   **Important:** Never install software while the M269 software is active,
   as that may change the M269 software installation and break it.

2. Start working with notebooks by entering
   ```bash
   nb
   ```
   After a little while, a web browser opens, with the Jupyter dashboard,
   listing the contents of your M269 folder.
   (You can now continue reading Section 1.3 of the book.)

3. After finishing working on the notebooks, go back to the web browser tab with
   the Jupyter dashboard and click on the 'Quit' button, then close the browser tab.
4. Close the terminal.

## Licence

The code and text in this repository are
Copyright © 2023 by The Open University, UK.
The code is licensed under a [BSD-3-clause licence](LICENCE).
The text is licensed under a
[Creative Commons Attribution 4.0 International Licence](http://creativecommons.org/licenses/by/4.0).