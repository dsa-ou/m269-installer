# Using the software

Every time you want to work on the M269 notebooks, you need to follow the next 5 steps.
However, the first time you are using Jupyter, after installing the software,
just do the first 3 steps and return to the book to learn how to use Jupyter.

1. Open a new PowerShell (Windows) or a new terminal (Linux and macOS).
   Do _not_ use an already opened PowerShell or terminal.

2. Enter `m269-24j` to go to your M269 folder and activate the M269 software.
   The command line prompt becomes `(m269-24j) ...` to remind you that
   you're using the M269 software and not your default Python installation.

3. Enter `nb` to start working with notebooks.
   After a little while, a web browser opens, with the Jupyter dashboard
   listing the contents of your M269 folder.
   If there’s a message about migrating to Notebook 7, click "don’t show anymore".
   (You can now continue reading Section 1.3 of the book.)

4. After finishing working on the notebooks, go back to the web browser tab with
   the Jupyter dashboard, click on the 'Quit' button, then close the browser tab.

5. Close the PowerShell or terminal you opened in step 1.

## Important notes

Never install software while the M269 software is active,
i.e. after step 2 and before step 5,
as that may change the M269 software installation and break it.

If you forgot to type `m269-24j`(i.e. skipped step 2 by mistake),
then entering `nb` (step 3) will still activate the M269 software but
Jupyter will start in your current folder rather than the M269 folder,
and you won't see the M269 materials in the Jupyter dashboard.
When this happens, do step 4 to close the dashboard and then go back to step 2.

**macOS**: If steps 2 and 3 (the `m269-24j` and `nb` commands) don't work,
and you are using `bash`, enter in the terminal
 ```bash
 echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
 ```
Then close the terminal, and start again from step 1.

⇧ [Home](README.md) | [Uninstalling](uninstall.md) ⇨