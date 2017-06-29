<#
    _Description:_

        Check if Java is installed by getting the JAVA_HOME environment variable value
        If true, check if the Selenium is present then run it

    _Author:_ Nicolas GIGOU
    _Date:_ 29th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$SCRIPTS_FOLDER_PATH = Split-Path $MyInvocation.MyCommand.Path -Parent
$SELENIUM_JAR_PATH = "$SCRIPTS_FOLDER_PATH\bin\selenium-server-standalone-3.4.0.jar"
$SELENIUM_HUB_URL = "http://localhost"
$SELENIUM_HUB_PORT = "4444"
$SELENIUM_GRID_CONSOLE_URL = "/grid/console"
$SELENIUM_JAR_DL_URL = "http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar"
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
$JRE_PATH = "$SCRIPTS_FOLDER_PATH\bin\jre-8u131-windows-i586.exe"
$JAVA_BIN_PATH = "C:\Program Files\Java\jre1.8.0_131\bin"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path env:JAVA_HOME) 
{
    Write-Host "Java is installed" -foregroundcolor green
} 
Else 
{ 
    Write-Host "The JAVA_HOME env var hasn't been set yet" -foregroundcolor red
    Write-Host "Running Java install script..."

    If(Test-Path $JRE_PATH)
    {
        # Run the install exe
        Write-Host "Run $JRE_PATH"
	# Let the user see what's happening
	Start-Sleep -s 2
        Invoke-Expression $JRE_PATH
        # Not mandatory but make it easier to check the Java install
        [Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_BIN_PATH, "User")
	Write-Host "JAVA_HOME value has been set"
    }
    Else
    {
        Write-Host "The JRE exe hasn't been found for the install. Please check path: $JRE_PATH" -foregroundcolor red
	Write-Host "Please download it and move it to the bin folder before run this script"
	# Clean exit
	exit
    }
}

Write-Host "`n`nThis window will automatically be closed in some seconds. The Java installation will process in another frame"
Start-Sleep -s 10