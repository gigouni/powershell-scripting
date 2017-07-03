<#
    _Description:_

        Check if Java is installed by checking the java.exe existence
        If true, stop the script
        If false, run the JRE exe

    _Author:_ Nicolas GIGOU
    _Date:_ 27th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$SCRIPTS_FOLDER_PATH = Split-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) -Parent
$JRE_PATH = "$SCRIPTS_FOLDER_PATH\bin\jre-8u131-windows-i586.exe"
$JAVA_EXE_PATH = "java.exe"
$JAVA_BIN_x86_PATH = "C:\Program Files\Java\jre1.8.0_131\bin\$JAVA_EXE_NAME"
$JAVA_BIN_x64_PATH = "C:\Program Files (x86)\Java\jre1.8.0_131\bin\$JAVA_EXE_NAME"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path $JAVA_EXE_x86_PATH -or Test-Path $JAVA_BIN_x64_PATH) 
{ 
    Write-Host "Java is already installed, we won't do it again" -foregroundcolor green
}
Else 
{ 
    If(Test-Path $JRE_PATH)
    {
        Write-Host "Java hasn't been found. Let's install it now" -foregroundcolor red
        Write-Host "Run $JRE_PATH"
        Invoke-Expression $JRE_PATH
    }
    Else
    {
        Write-Host "The JRE exe hasn't been found for the install. Please check path: $JRE_PATH" -foregroundcolor red
    }
}
Write-Host "`nThis window will automatically be closed in some seconds`n"
Start-Sleep -s 10