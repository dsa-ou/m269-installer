# Upgrading

If we detect any major errors during the M269 presentation,
we might provide a new configuration file or a new version of the software.
In the latter case, you will have to upgrade one or two packages,
rather than re-install the whole software.

We will announce any required upgrades in the M269 news.
If we tell you to 'upgrade p1 and p2', where p1 and p2 are package names,
do as follows:

1. Open a new PowerShell (Windows) or terminal (Linux, macOS).
   Do *not* use an already opened PowerShell or terminal.
2. Enter `m269-25j` to activate the M269 software.
3. Enter `pip install --upgrade p1 p2`. For example,
   `pip install --upgrade allowed` will only reinstall the `allowed` package.
4. Close the PowerShell or terminal, or enter `nb` to start working in JupyterLab.

⇦ [Installing](install.md) | ⇧ [Home](README.md) | [Re-installing](reinstall.md) ⇨