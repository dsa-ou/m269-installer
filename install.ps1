Write-Host "Installing software for M269 23J..."

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
$FILES = "custom.css", "allowed.py", "m269.json", "requirements.txt"
$COURSE = "m269-23j"
$VENV = "$HOME\venvs\$COURSE"

# check that the given path is the M269 folder
function is-m269-folder {
    param($path)
    if (-not (Test-Path $path -PathType Container)) {
        $msg="doesn't exist or isn't a folder"
    }
    elseif (-not ($path -match "[Mm]269-23[Jj]$")) {
        $msg="must be named m269-23j or M269-23J"
    }
    else
    {
        return
    }
    Write-Host "$path can't be your M269 folder: it $msg."; Write-Host $DOC
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
        Remove-Item custom.css
    } else {
        Move-Item -Path custom.css -Destination $HOME\.jupyter\custom
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
    Copy-Item -Path allowed.py -Destination $FOLDER -Force
    Copy-Item -Path m269.json -Destination $FOLDER -Force
}

Write-Host "Creating Python environment $VENV... (this will take a bit)"
py -3.10 -m venv --prompt $COURSE $VENV

Write-Host "Downloading and installing Python packages... (this will take long)"
. $VENV\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
deactivate
if ($args.Length -eq 0) {
    Remove-Item requirements.txt
}

Write-Host "Adding shortcut commands to the PowerShell config file..."

$CONFIG_FILE = $Profile.CurrentUserCurrentHost
$ESC = "```""
$ALIASES = @"
function m269-23j {
    cd '$FOLDER'
    $VENV\Scripts\Activate.ps1
}
function nb {
    Start-process -NoNewWindow jupyter -ArgumentList "notebook"
}
function allowed {
    param(
        [string]`$FilePath
    )

    python $ESC$FOLDER\allowed.py$ESC -c $ESC$FOLDER\m269.json$ESC `$FilePath
}
"@

# Create the config file if it doesn't exist and add the functions
if (-not (Test-Path -Path $CONFIG_FILE)) {
    # File doesn't exist, create it
    New-Item -Path $CONFIG_FILE -ItemType File -Force
}
Add-Content -Path $CONFIG_FILE -Value $ALIASES -NoNewline

Write-Host "Software has been installed."
Write-Host "All done. Go to $SITE for further instructions."
