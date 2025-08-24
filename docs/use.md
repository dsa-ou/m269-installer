# Using the software

Every time you want to work on the M269 notebooks, you need to follow the next 5 steps.

1. Open a new PowerShell (Windows) or terminal (Linux and macOS).
   Do _not_ use an already opened PowerShell or terminal.

2. Enter `m269-25j` to go to your M269 folder and activate the M269 software.
   The command line prompt becomes `(m269-25j) ...` to remind you that
   you're using the M269 software and not your default Python installation.

3. Enter `nb` to start working with notebooks.
   After a little while, a web browser opens, with JupyterLab
   listing the contents of your M269 folder.
   You can now open the M269 book: double-click subfolder `notebooks`, then file `M269.ipynb`.

4. After finishing working on the notebooks, click on File > Shut Down
   and then close the browser tab.

5. Close the PowerShell or terminal you opened in step 1.

## Important notes

Never install third-party software while the M269 software is active,
i.e. after step 2 and before step 5,
as that may change the M269 software installation and break it.
It is however possible to [upgrade](upgrade.md) the M269 software between steps 2 and 3.

If you forgot to type `m269-25j`(i.e. skipped step 2 by mistake),
then entering `nb` (step 3) will still activate the M269 software but
Jupyter will start in your current folder rather than the M269 folder,
and you won't see the M269 materials in JupyterLab.
When this happens, do step 4 to close JupyterLab and then go back to step 2.

**Windows 11**: If you're asked to select an app to open HTML files when
you open JupyterLab for the first time, select your usual browser and click 'always'.

**macOS**: If steps 2 and 3 (the `m269-25j` and `nb` commands) don't work,
and you are using `bash`, enter in the terminal
 ```bash
 echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
 ```
Then close the terminal, and start again from step 1.

**macOS:** If you use Safari, do as follows when opening JupyterLab for the first time.

1. Choose the menu option Settings > Settings Editor.
2. In the settings search box, type 'windowing' without the quote marks.
3. In the settings pane that appears, change the windowing mode to defer.
   The change is automatically saved.
4. Close the settings editor pane.

⇦ [Upgrading](upgrade.md) | ⇧ [Home](README.md) | [Uninstalling](uninstall.md) ⇨