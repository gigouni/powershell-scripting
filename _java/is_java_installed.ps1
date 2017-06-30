<#
    _Description:_

        Check if Java is installed by checking the java.exe existence

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$JAVA_BIN_PATH = "C:\Program Files\Java\jre1.8.0_131\bin"
$JAVA_EXE_PATH = "$JAVA_BIN_PATH\java.exe"

# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path $JAVA_EXE_PATH) 
{ 
    Write-Host "Java is installed!" -foregroundcolor green
} 
Else
{ 
    Write-Host "Java is NOT installed" -foregroundcolor red
    Write-Host "Try running the install_java script" 
}
Write-Host "`n`nThis window will automatically be closed in some seconds"
Start-Sleep -s 5