<#
    _Description:_

        Check if Java is installed by getting the JAVA_HOME environment variable value

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path $Env:JAVA_HOME) 
{ 
    Write-Host "Java is installed!" -foregroundcolor green
    $Env:JAVA_HOME 
} 
Else
{ 
    Write-Host "Java is NOT installed" -foregroundcolor red
    Write-Host "Try running the install_java script" 
}
Write-Host "`n`nThis window will automatically be closed in some seconds"
Start-Sleep -s 5