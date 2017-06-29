<#
    _Description:_

        Delete the current JAVA_HOME environment variable value for a null one
        Check if this value exist before trying to unset it

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path env:JAVA_HOME) 
{ 
    Write-Host "JAVA_HOME is set"
    $Env:JAVA_HOME 
    [Environment]::SetEnvironmentVariable("JAVA_HOME",$null,"User")
    Write-Host "`nJAVA_HOME unset"
} 
Else 
{ 
    Write-Host "JAVA_HOME is not set. Nothing to do"
}
Write-Host "`n`nThis window will automatically be closed in some seconds"
Start-Sleep -s 5