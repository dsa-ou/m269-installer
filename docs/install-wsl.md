# Installing on WSL

I decided to create a new WSL instance, and opted for Ubuntu 24.04 as this comes with Python 3.12 as standard.

I ran into issues with the instructions again - step 2 has a second bullet point which I didn't think I needed to run as python 3.12 was installed, but I didn't have python3.12-venv installed and so when I came to run the m269-25j command later it failed. Can I suggest that this second bullet point is made into its own separate point instead, or that a check is added to the linux install script to check that this is installed?

I didn't get any warnings about networkx and pytype being incompatible as it mentions in step 7 - should I get any?

For anyone interested, here are the steps I took to get my new WSL distro up and running:

In a windows command prompt enter (the password set during install is needed when executing sudo commands later):

wsl --install -d Ubuntu-24.04

After the install is complete, in the wsl session apply any updates for the distro:

sudo apt update && sudo apt upgrade -y

I like to be able to use "python" rather than "python3" when starting python up, so I install a program to do this:

sudo apt install python-is-python3

At this point, follow the instructions to install the M269 software for linux - I use /mnt/c/OU/m269-25j as my home folder so it's easily accessed in Windows - remember to action the second bullet point of step 2 even though python 3.12 is already installed

Update the .bashrc file so that you can specify the browser you want to open in Windows when the jupyter labs software is run inside WSL - I use Edge:

pico ~/.bashrc

In the editor, scroll to the bottom and add:

export BROWSER='/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'

Save the change.

In the wsl session:

exit

Restart wsl and enter:

m269-25j

nb

This should open your defined browser in your home directory, with jupyter lab loaded.

If you get an error as the browser is trying to open a file reference instead of a web page then you can create ~/.jupyter/jupyter_lab_config.py and add the following line to it:

c.NotebookApp.use_redirect_file = False

It's a bit easier for 25j as the required version of python is part of one of the distros, so we don't have to any recompilation work (or find a repository with a working python version).

We thank our tutor Andy Connolly for supplying these instructions.