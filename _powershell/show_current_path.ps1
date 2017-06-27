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

Write-Host "`nPath of the current Powershell script"
Write-Host $PSScriptRoot

Start-Sleep -s 15