These instructions explain how to install the software needed
for working with the M269 Jupyter notebooks.
If you need help, ask in the M269 Technical Forum.

# Installing, removing and re-installing the software

For each desktop and laptop you want to use for M269:

- You can keep any existing Python and Jupyter installations, e.g. Anaconda,
  because the M269 software will be installed separately and will be activated
  only when needed.
- Make sure you have about 1 Gb disk space and a recent version of your operating system.
- Make sure you have created your M269 folder and have put the M269 book there,
  as instructed in the Resources tab of the M269 website.
- To **install** the software for the first time, follow the instructions for
  [Linux](install-linux.md), [macOS](install-mac.md) or [Windows](install-windows.md).
- To **remove** the software on any operating system, follow [these instructions](uninstall.md).
- To **re-install** the software on any operating system, follow [these instructions](reinstall.md).

## Using the software

On **Windows**, the installation creates a desktop shortcut named `M269-start`.
When you double click this shortcut, a PowerShell window opens where Jupyter writes its log messages.
Then your browser opens the Jupyter dashboard, listing the contents of your M269 folder.
If there’s a message about migrating to Notebook 7, click "don’t show anymore".
You can now continue reading Section 1.3 of the book to learn how to use Jupyter.

On **Linux** and **macOS**, you must [use the software from the terminal](use.md).
This option is also available to Windows users who prefer the command line.

### Notes for tutors

You can create additional shortcuts, each opening Jupyter in
a different start folder, e.g. the eTMA marking folder, by following these instructions:

1. Right click on the desktop. Select 'new shortcut'. Type `powershell`.
   Hit 'Next' and then 'Finish': 'powershell' gets automatically expanded to the full name of the program.

2. Right click on the new desktop icon and select 'Properties' to update the shortcut:

   1. Modify the start-up folder to be your M269 folder.
   2. Append `-file start.ps1 path/to/folder` to the target field
      (if the path includes spaces, you must enclose it in quotes). It should now read:
      `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file start.ps1 path/to/folder`.
   3. Optionally you can update the icon for the shortcut. To get a Jupyter icon
      instead of a PowerShell icon you can use
      `%USERPROFILE%\venvs\m269-24j\Lib\site-packages\nbclassic\static\base\images\favicon.ico`.

We thank M269 tutor Bob Moore for creating the original version of `start.ps1`
and of these shortcut instructions.

To mark TMA notebooks, follow the steps above,
but in step 2, instead of entering `m269-24j`,
change to the eTMA marking folder with the `cd` command, and then
proceed with step 3 to start working in that folder.

## Licence

The code and text in this repository are
Copyright © 2023–2025 by The Open University, UK.
The code is licensed under a [BSD-3-clause licence](LICENCE).
The text is licensed under a
[Creative Commons Attribution 4.0 International Licence](http://creativecommons.org/licenses/by/4.0).

The installation scripts were written with the help of GitHub Copilot.