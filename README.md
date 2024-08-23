# YouTube Upload

This repository provides a PowerShell script for uploading videos to YouTube using the YouTube API v3.
The script is designed for easy command-line interaction and can be configured to use environment variables for sensitive data like API keys.

## Features

- Upload videos to YouTube directly from the command line.
- Supports video metadata such as title, description, tags, and privacy settings.
- Automatically splits large videos for uploading.

## Requirements

- PowerShell 7.0 or higher
- YouTube Data API v3 credentials

## Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/dszubov/youtube-upload.git
    cd youtube-upload
    ```

2. Configure your `.env` file with the required environment variables:
    ```
    FOLDER_PATH=C:\path\to\your\videos
    API_KEY=youtube-upload-credentials.json
    ```

3. Run the script:
    ```powershell
    .\youtube-upload.ps1
    ```

## Usage

The script uploads all `.mp4` files from the specified folder to YouTube using the metadata defined in the script. Ensure that you have your `client_secrets.json` and credentials configured as per Google’s documentation.

## Contributing

Feel free to submit issues or pull requests if you have improvements or feature requests.
