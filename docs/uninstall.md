# Uninstalling

To remove the M269 software:

1. Delete folder `~/venvs/m269-24j`.

2. **Windows**: delete any desktop shortcuts you created.

3. Find out which file defines commands `m269-24j` and `nb`:
   - **Windows**: open a PowerShell and enter `$Profile.CurrentUserCurrentHost` to obtain the file name
   - **Linux** and **macOS**: open a terminal and enter `echo $0` to obtain the shell you're using.
     If it's fish, then the commands are in file `~/.config/fish/config.fish`,
     otherwise they're in file `~/.shellrc`, where `shell` is the name of your shell.
     For example, if you're using bash, then it's file `~/.bashrc`.

4. Open the file in a text editor.

5. Search for the lines that define `m269-24j` and `nb`. Delete those lines.

6. Save the file and close the text editor.

If you also want to remove the M269 styling of notebooks:

1. Open file `~/.jupyter/custom/custom.css` in a text editor.

2. Delete all lines from `/* Start of M269-24J ... */` to `/* End of M269-24J ... */`.

3. Save the file and close the editor.

⇦ [Using](use.md) | ⇧ [Home](README.md) | [Re-installing](reinstall.md) ⇨