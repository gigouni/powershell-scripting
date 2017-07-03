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
$JAVA_EXE_PATH = "java.exe"
$JAVA_BIN_x86_PATH = "C:\Program Files\Java\jre1.8.0_131\bin\$JAVA_EXE_NAME"
$JAVA_BIN_x64_PATH = "C:\Program Files (x86)\Java\jre1.8.0_131\bin\$JAVA_EXE_NAME"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path $JAVA_EXE_x86_PATH -or Test-Path $JAVA_BIN_x64_PATH) 
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