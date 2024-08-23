# Loading variables from .env file
$envFilePath = Join-Path $PSScriptRoot '.env'

Get-Content $envFilePath | ForEach-Object {
    if ($_ -match '^(.*)=(.*)$') {
        [System.Environment]::SetEnvironmentVariable($matches[1].Trim(), $matches[2].Trim())
    }
}

# Specify the path to the folder with video files
$folderPath = $env:FOLDER_PATH

# Directory with the youtube-upload utility
$yu = Join-Path $PSScriptRoot '\bin\youtube-upload'

# The path to the secrets
$secret = Join-Path $PSScriptRoot $env:API_KEY_FILE

# Get a list of all files in a folder with the specified extension (for example, mp4)
$files = Get-ChildItem -Path $folderPath -Filter *.mp4

# Go through each file in the folder
foreach ($file in $files) {
    # Get the file name without extension
    $title = [System.IO.Path]::GetFileNameWithoutExtension($file.Name)

    # Specify the full path to the file
    $filePath = $file.FullName

    # Execute the youtube-upload command with the necessary parameters
    python $yu `
        --client-secrets=$secret `
        --privacy=unlisted `
        --title="$title" "$filePath"

    # Add a delay between loads (for example, 5 seconds) if necessary
    Start-Sleep -Seconds 5
}