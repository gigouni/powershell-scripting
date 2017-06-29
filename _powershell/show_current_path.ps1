<#
    _Description:_

        Display the paht of the current Powershell script
        Wait three seconds before closing

    _Example:_

        C:\Users\user\Desktop\scripts\_powershell

    _Author:_ Nicolas GIGOU
    _Date:_ 26th of June, 2017
    _Powershell version used:_ 2.0
#>

$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
$SCRIPTS_FOLDER_PATH = Split-Path $PSScriptRoot -Parent
$PARENT_SCRIPTS_FOLDER_PATH = Split-Path $SCRIPTS_FOLDER_PATH -Parent

Write-Host "`nPath of the current Powershell script"
Write-Host $PSScriptRoot

Write-Host "`nParent folder of the current Powershell script"
Write-Host $SCRIPTS_FOLDER_PATH

Write-Host "`nParent folder of the parent folder of the current Powershell script"
Write-Host $PARENT_SCRIPTS_FOLDER_PATH

Start-Sleep -s 5