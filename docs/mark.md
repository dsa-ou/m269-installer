# Marking

These instructions are only for M269 tutors.
They make it easier to mark the submitted TMAs.

## Windows
You can create additional desktop shortcuts,
each opening Jupyter in a different start folder,
e.g. the eTMA marking folders for each TMA.

1. Right click on the desktop. Select 'new shortcut'.

2. Type `powershell`. Hit 'Next' and then 'Finish':
   'powershell' gets automatically expanded to the full name of the program.

3. Right click on the new desktop icon. Select 'Properties'.

4. Modify the start-up folder to be your M269 folder.

5. Append `-file start.ps1 path/to/folder` to the target field,
   in order to start Jupyter in `path/to/folder`.
   If the path includes spaces, you must enclose it in quotes.
   The command should now read:
   `C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file start.ps1 path/to/folder`.

6. You can update the shortcut icon, if you wish.
   To get a Jupyter icon instead of a PowerShell icon, use
   `%USERPROFILE%\venvs\m269-24j\Lib\site-packages\nbclassic\static\base\images\favicon.ico`.

We thank M269 tutor Bob Moore for
creating the original version of `start.ps1` and of these shortcut instructions.

## Linux and macOS
To open the Jupyter dashboard in folder `path/to/folder`,
like the eTMA folder for a particular TMA:

1. Open a new terminal.
2. Enter `cd path/to/folder`.
3. Enter `nb`.
4. After marking the notebooks, go back to the web browser tab with
   the Jupyter dashboard, click on the 'Quit' button, then close the browser tab.
5. Close the terminal.

⇦ [Using](use.md) | ⇧ [Home](README.md) | [Re-installing](reinstall.md) ⇨