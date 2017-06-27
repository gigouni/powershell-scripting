<#
    _Description:_

        Check if Java is installed by getting the JAVA_HOME environment variable value
        If true, check if the Selenium has been downloaded then run it

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
$SELENIUM_JAR_PATH = "$PSScriptRoot\..\bin\selenium-server-standalone-3.4.0.jar"
$SELENIUM_HUB_PORT = "4444"
$SELENIUM_JAR_DL_URL = "http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
If (Test-Path $Env:JAVA_HOME) 
{ 
    Write-Host "Java is installed. `nGo for the selenium install if it's not already done" -foregroundcolor green
    If (Test-Path $SELENIUM_JAR_PATH) 
    { 
        Write-Host "Everything is OK for the Selenium hub. Gonna run it now"
        Invoke-Expression "java -jar $SELENIUM_JAR_PATH -port $SELENIUM_HUB_PORT -role hub"
    } 
    Else 
    { 
        Write-Host "The JAR hasn't been found. Please download it and move it here: $PSScriptRoot\..\bin" -foregroundcolor red
        Write-Host "Note: you can find it here: $SELENIUM_JAR_DL_URL"
    }
} 
Else 
{ 
    Write-Host "The JAVA_HOME env var hasn't been set. `nRun Java install script before this one" -foregroundcolor red 
}

Write-Host "`n`n"
Write-Host "This window will automatically be closed in some seconds"
Start-Sleep -s 10