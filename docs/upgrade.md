# Upgrading

If we detect any major errors during the M269 presentation,
we might provide a new configuration file or a new version of the software.
In the latter case, you will have to upgrade one or two packages,
rather than re-install the whole software.

We will announce any required upgrades in the M269 news.
If we tell you to 'upgrade p1, p2 and ...', where p1, p2, ... are package names,
do as follows:

1. If you have a browser page open with your Jupyter notebooks:
   - Save them.
   - Quit JupyterLab with File > Shut Down.
   - Close the browser page.
   - Close the PowerShell or terminal from which you started JupyterLab.
2. Open a new PowerShell (Windows) or terminal (Linux, macOS).
   Do *not* use an already opened PowerShell or terminal.
3. Enter `m269-25j` to activate the M269 software.
4. Enter `pip install --upgrade p1 p2 ...`. Use only spaces to separate package names.
   For example, `pip install --upgrade allowed` only upgrades the `allowed` package.
5. Close the PowerShell or terminal, or enter `nb` to start working in JupyterLab.

⇦ [Installing](install.md) | ⇧ [Home](README.md) | [Re-installing](reinstall.md) ⇨