These instructions explain how to install the software needed
for working with the M269 Jupyter notebooks.
If you need help, ask in the M269 Technical Forum.

# Installing and changing the software

For each desktop and laptop you want to use for M269:

- You can keep any existing Python and Jupyter installations,
  e.g. Anaconda or from a previous M269 presentation, because
  the M269 software will be installed separately and will be activated only when needed.
- Make sure you have about 1 Gb disk space and a recent version of your operating system.
- Make sure you have created your M269 folder and have put the M269 book there,
  as instructed in the Resources tab of the M269 website.
- If you want to have Linux on your Windows machine, first [install WSL](install-wsl.md).
- To **install** the M269 software for the first time, follow the instructions for
  [Linux](install-linux.md), [macOS](install-mac.md) or [Windows](install-windows.md).
- To **upgrade** the software on any operating system, follow [these instructions](upgrade.md).
- To **remove** the software on any operating system, follow [these instructions](uninstall.md).
- To **re-install** the software on any operating system, follow [these instructions](reinstall.md).

## Using the software

On **Windows**, the installation creates a desktop shortcut named `M269-start`.
When you double click this shortcut, a PowerShell window opens where Jupyter writes its log messages.
Then your browser opens JupyterLab, listing the contents of your M269 folder.
You can now open the M269 book: double-click subfolder `notebooks`, then file `M269.ipynb`.

On **Windows 11**, when launching JupyterLab for the first time,
you may be asked to 'select an app to open this HTML file'.
If that happens, choose your favourite browser and click 'always'.

On **Linux** and **macOS**, you must [use the software from the terminal](use.md).
This option is also available to Windows users who prefer the command line.

If you're an M269 tutor, see how to [mark notebooks](mark.md).

## Licence

The code and text in this repository are
Copyright © 2023–2025 by The Open University, UK.
The code is licensed under a
[BSD-3-clause licence](https://github.com/dsa-ou/m269-installer/blob/main/LICENCE).
The text is licensed under a
[Creative Commons Attribution 4.0 International Licence](http://creativecommons.org/licenses/by/4.0).

The installation scripts were written with the help of GitHub Copilot.