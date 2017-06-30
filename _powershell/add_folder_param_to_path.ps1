<#
    _Description:_

        Concatenate the current PATH environment value with a new folder one
        Wait some seconds before closing

    _Example:_

	# Add C:\Users\IEUser\Desktop\scripts\bin to PATH
        $ add_folder_param_to_path -folder /f C:\Users\IEUser\Desktop\scripts\bin

    _Author:_ Nicolas GIGOU
    _Date:_ 26th of June, 2017
    _Powershell version used:_ 2.0
#>

param (
    [string]$folder = "$(Split-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) -Parent)\bin"
)

Write-Host "`n$folder will be added to PATH"
Write-Host "`nCurrent PATH value"
Get-ChildItem env:Path

$NEW_PATH_VALUE = $Env:Path + ";" + $folder
Write-Host "The new value would be: `n$NEW_PATH_VALUE"
[Environment]::SetEnvironmentVariable("Path", $NEW_PATH_VALUE, "User")
Write-Host "Value changed. Start a new terminal to make it effective" -foregroundcolor green

Start-Sleep -s 15



