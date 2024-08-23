# Загрузка переменных из .env файла
$envFilePath = Join-Path $PSScriptRoot '.env'

Get-Content $envFilePath | ForEach-Object {
    if ($_ -match '^(.*)=(.*)$') {
        [System.Environment]::SetEnvironmentVariable($matches[1].Trim(), $matches[2].Trim())
    }
}

# Укажите путь к папке с видеофайлами
$folderPath = $env:FOLDER_PATH

# Директория с утилитой youtube-upload
$yu = Join-Path $PSScriptRoot '\bin\youtube-upload'

# Путь до секрета
$secret = Join-Path $PSScriptRoot $env:API_KEY

# Debug
Write-Host $PSScriptRoot
Write-Host $folderPath
Write-Host $yu
Write-Host $secret