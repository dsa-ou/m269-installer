Write-Host "Installing software for M269 24J..."

# This script works in one of two modes:
# - If no argument is given, this script must be in the M269 folder and
#   the other installation files are downloaded from GitHub.
# - If an argument is given, it's the M269 folder, and this script and the other
#   installation files are in the current folder.

# The first mode installs the latest software,
# for the current presentation or for testing the next presentation.
# The second mode is for installing the software for a past presentation,
# by first downloading the past installation files from GitHub.

$SITE = "https://dsa-ou.github.io/m269-installer"
$DOC = "See $SITE for details."
$FILES = "custom.css", "requirements.txt", "start.ps1"
$COURSE = "m269-24j"
$VENV = "$HOME\venvs\$COURSE"

# check that the given path is the M269 folder
function is-m269-folder {
    param($path)
    if (-not (Test-Path $path -PathType Container)) {
        $folder = $path
        $msg="doesn't exist or isn't a folder"
    }
    else {
        $folder = Convert-Path $path
        if (-not ((Get-Item $folder).Name -match "[Mm]269-24[Jj]")) {
            $msg="must be named m269-24j or M269-24J"
        }
        else
        {
            return
        }
    }
    Write-Host "$folder can't be your M269 folder: it $msg."; Write-Host $DOC
    exit
}

if ($args.Length -gt 1) {
    Write-Host "Usage: .\install.ps1 [path to M269 folder]"
    Write-Host "If no argument is given, this script must be in your M269 folder."
    Write-Host "If an argument is given, it must be the path to your M269 folder."
    Write-Host $DOC
    exit
} elseif ($args.Length -eq 0) {
    $FOLDER = pwd
    is-m269-folder $FOLDER
    Write-Host "Downloading and installing M269 files..."
    $GITHUB = "https://raw.githubusercontent.com/dsa-ou/m269-installer/main/"
    foreach ($file in $FILES) {
        Invoke-WebRequest -Uri ($GITHUB + $file) -OutFile $file
    }
    mkdir $HOME\.jupyter\custom -ErrorAction SilentlyContinue
    if (Test-Path $HOME\.jupyter\custom\custom.css) {
        Add-Content -Path $HOME\.jupyter\custom\custom.css -Value (Get-Content custom.css)
    } else {
        Copy-Item -Path custom.css -Destination $HOME\.jupyter\custom
    }
} else {
    is-m269-folder $args[0]
    $FOLDER = Convert-Path $args[0]
    foreach ($file in $FILES) {
        if (-not (Test-Path $file)) {
            Write-Host "File $file not found: please check that you're in the right folder."
            Write-Host $DOC
            exit
        }
    }
    Write-Host "Installing M269 files..."
    mkdir $HOME\.jupyter\custom -ErrorAction SilentlyContinue
    if (Test-Path $HOME\.jupyter\custom\custom.css) {
        Add-Content -Path $HOME\.jupyter\custom\custom.css -Value (Get-Content custom.css)
    } else {
        Copy-Item -Path custom.css -Destination $HOME\.jupyter\custom
    }
}

Write-Host "Creating Python environment $VENV... (this will take a bit)"
py -3.11 -m venv --prompt $COURSE $VENV
if (-not $?) {
    Write-Host "Error: failed to create the virtual environment."
    Write-Host "Check permissions and prerequisites, then try again."
    exit
}

Write-Host "Downloading and installing Python packages... (this will take long)"
. $VENV\Scripts\Activate.ps1
if (-not $?) {
    Write-Host "Error: failed to activate the environment."
    exit
}
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
deactivate

Write-Host "Adding shortcut commands to the PowerShell config file..."

$CONFIG_FILE = $Profile.CurrentUserCurrentHost
$ALIASES = @"
function m269-24j {
    cd "$FOLDER"
    & "$VENV\Scripts\Activate.ps1"
}
function nb {
    & "$VENV\Scripts\Activate.ps1"
    Start-process -NoNewWindow jupyter -ArgumentList "notebook"
}
function allowed {}
"@
# empty function 'disables' the function from 23J

# Create the config file if it doesn't exist and add the functions
if (-not (Test-Path -Path $CONFIG_FILE)) {
    # File doesn't exist, create it
    New-Item -Path $CONFIG_FILE -ItemType File -Force
}
Add-Content -Path $CONFIG_FILE -Value $ALIASES -NoNewline

Write-Host "Adding desktop shortcut..."

$Desktop = [System.Environment]::GetFolderPath('Desktop')
$ShortcutPath = Join-Path $Desktop "M269-start.lnk"
$TargetPath = "$FOLDER\start.ps1"

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = "powershell.exe"
$Shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$TargetPath`""
$Shortcut.Description = "Start the M269 software"

# set the icon for the shortcut (using the powershell icon)
$PowerShellExe = (Get-Command powershell.exe).Source
$Shortcut.IconLocation = "$PowerShellExe, 0"

$Shortcut.Save()

Write-Host "Software has been installed."
Write-Host "All done. Go to $SITE for further instructions."
