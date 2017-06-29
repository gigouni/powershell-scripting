<#
    _Description:_

        Display the installed Java version

    _Example:_

        java version "1.8.0_131"
        Java(TM) SE Runtime Environment (build 1.8.0_131-b11)
        Java HotSpot(TM) Client VM (build 25.131-b11, mixed mode)

    _Author:_ Nicolas GIGOU
    _Date:_ 27th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path env:JAVA_HOME) 
{
    Invoke-Expression "java -version"
} 
Else
{ 
    Write-Host "Java is NOT installed" -foregroundcolor red
    Write-Host "Try running the install_java script" 
}
Write-Host "`n`nThis window will automatically be closed in some seconds"
Start-Sleep -s 5