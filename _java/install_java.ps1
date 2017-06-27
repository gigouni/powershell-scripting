<#
    _Description:_

        Check if the JAVA_HOME environment variable exists
        If true, stop the script
        If false, download and set the value of JAVA_HOME with the path to java.exe

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
$JRE_PATH = "$PSScriptRoot\..\bin\jre-8u131-windows-i586.exe"
$JAVA_BIN_PATH = "C:\Program Files\Java\jre1.8.0_131\bin"
$JAVA_EXE_PATH = "$JAVA_BIN_PATH\java.exe"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path $JAVA_EXE_PATH) 
{ 
    Write-Host "Java is already installed, we won't do it again" -foregroundcolor green
}
Else 
{ 
    If(Test-Path $JRE_PATH)
    {
        Write-Host "Java hasn't been found. Let's install it now" -foregroundcolor red
        # Run the install exe
        Write-Host "Run $JRE_PATH"
        Invoke-Expression $JRE_PATH
        # Not mandatory but make it easier to check the Java install
        [Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_BIN_PATH, "User")
    }
    Else
    {
        Write-Host "The JRE exe hasn't been found for the install. Please check path: $JRE_PATH" -foregroundcolor red
    }
}
Write-Host "`nThis window will automatically be closed in some seconds`n"
Start-Sleep -s 15