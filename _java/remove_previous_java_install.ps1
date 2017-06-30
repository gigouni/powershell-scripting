<#
    _Description:_

        Delete the previously downloaded files and reset the JAVA_HOME environment variable at the same time

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                            Constants
# -----------------------------------------------------------------
$JAVA_FOLDER_PATH = Split-Path $MyInvocation.MyCommand.Path -Parent
$SCRIPTS_FOLDER_PATH = Split-Path $JAVA_FOLDER_PATH -Parent
$JRE_PATH = "$SCRIPTS_FOLDER_PATH\bin\jre-8u131-windows-i586.exe"
$PS_RESET_JAVA_HOME = "$JAVA_FOLDER_PATH\reset_java_home.ps1"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------

# JRE
If (Test-Path $JRE_PATH) 
{ 
    Write-Host "JRE path exists" 
    Remove-Item $JRE_PATH
    Write-Host "`nJRE file removed" -foregroundcolor green
}
Else 
{
    Write-Host "JRE path doesn't exist"
}

# Reset script
If (Test-Path $PS_RESET_JAVA_HOME) 
{ 
   Write-Host "Run the reset_java_home.ps1 script...`n"
    Invoke-Expression "$PS_RESET_JAVA_HOME"
}
Else 
{
    Write-Host "reset_java_home.ps1 path doesn't exist"
}

Start-Sleep -s 5