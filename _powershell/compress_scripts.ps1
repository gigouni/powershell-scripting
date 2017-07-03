<#

    _Description:_

        Archive all the scripts in a ZIP file

    _Author:_ Nicolas GIGOU
    _Date:_ 28th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$SCRIPTS_FOLDER_PATH = Split-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) -Parent
$PARENT_SCRIPTS_FOLDER_PATH = Split-Path $SCRIPTS_FOLDER_PATH -Parent
$DESTINATION = "$PARENT_SCRIPTS_FOLDER_PATH\scripts.zip"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If(Test-path $DESTINATION) {
    Write-Host "$DESTINATION already exists, it will remove it to update its content"
    Remove-item $DESTINATION
}

Write-Host "Compressing..."

Add-Type -assembly "system.io.compression.filesystem"
[io.compression.zipfile]::CreateFromDirectory($SCRIPTS_FOLDER_PATH, $DESTINATION)

Write-Host "Folder compressed successfully!" -foregroundcolor green

Start-Sleep -s 3
