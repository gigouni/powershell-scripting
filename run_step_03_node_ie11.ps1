<#
    _Description:_

        Check if Java is installed by checking the java.exe existence
        If true, check if the Selenium is present then run it

    _Author:_ Nicolas GIGOU
    _Date:_ 29th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$SCRIPTS_FOLDER_PATH = Split-Path $MyInvocation.MyCommand.Path -Parent

# Java
$JAVA_EXE_PATH = "java.exe"
$JAVA_BIN_x86_PATH = "C:\Program Files\Java\jre1.8.0_131\bin\$JAVA_EXE_NAME"
$JAVA_BIN_x64_PATH = "C:\Program Files (x86)\Java\jre1.8.0_131\bin\$JAVA_EXE_NAME"

# Selenium
$SELENIUM_JAR_PATH = "$SCRIPTS_FOLDER_PATH\bin\selenium-server-standalone-3.4.0.jar"
$SELENIUM_HUB_HOST = "http://localhost"
$SELENIUM_HUB_PORT = "4444"
$GRID_REGISTER_URL = "/grid/register"

# Selenium node - IE11
$IE_DRIVER_EXE_PATH = "IEDriverServer"
$IE_DRIVER_PORT = "5558"

# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path $JAVA_EXE_x86_PATH -or Test-Path $JAVA_BIN_x64_PATH) 
{
    Write-Host "Java is installed" -foregroundcolor green

    # Splite the command into several little ones to simplify the visibility of options and easily move the params order
    $cmd = "java"
    $opts = "-Dwebdriver=$IE_DRIVER_EXE_PATH "
    $opts += "-jar $SELENIUM_JAR_PATH "
    $opts += "-browser `"browserName=internet explorer,version=11,platform=WINDOWS`" "
    $opts += "-role node "
    $opts += "-hub $SELENIUM_HUB_HOST`:$SELENIUM_HUB_PORT$GRID_REGISTER_URL "
    $opts += "-port $IE_DRIVER_PORT "
    # $opts += "-debug "

    Write-Host "$cmd $opts"
    Invoke-Expression "$cmd $opts"
} 
Else 
{ 
    Write-Host "Java isn't installed yet. `nRun Java install script before this one" -foregroundcolor red
    Write-Host "Then, run the step_02 before this one"
}

Write-Host "`n`nThis window will automatically be closed in some seconds"
Start-Sleep -s 10
