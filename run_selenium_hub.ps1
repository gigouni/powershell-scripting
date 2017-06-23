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
$SELENIUM_JAR_DL_URL = "http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar"
$SELENIUM_JAR_PATH = "C:\Users\IEUser\Desktop\selenium-server-standalone-3.4.0.jar"
$SELENIUM_HUB_PORT = "4444"


# -----------------------------------------------------------------
#                         Selenium Hub
# -----------------------------------------------------------------
function check_selenium_hub
{
    if (Test-Path %SELENIUM_JAR_PATH%) { (selenium_hub_found) } else { (selenium_hub_not_found) }
}

function run_jar
{
    Write-Host "Everything is OK for the Selenium hub. Gonna run it now"
    java -jar %SELENIUM_JAR_PATH% -port %SELENIUM_HUB_PORT% -role hub
}

function selenium_hub_found
{
    Write-Host "The Selenium hub is already downloaded, we're not gonna do it again" -foregroundcolor green
    run_jar
}

function selenium_hub_not_found
{
    Write-Host "Import the BitsTransfer module to download files... Please wait..." -foregroundcolor yellow
    import-module bitstransfer
    Write-Host "Module imported!" -foregroundcolor green
    Write-Host "Download the Selenium server JAR..." 
    Start-BitsTransfer -Source $SELENIUM_JAR_DL_URL -Destination $SELENIUM_JAR_PATH
    Write-Host "Download completed" -foregroundcolor green
    run_jar
}


# -----------------------------------------------------------------
#                               Java
# -----------------------------------------------------------------
function java_found
{
    Write-Host "Java is installed. `nGo for the selenium install if it's not already done" -foregroundcolor green
    check_selenium_hub
}

function java_not_found
{
    Write-Host "The JAVA_HOME env var hasn't been set. `nRun Java install script before this one" -foregroundcolor red
}


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
Write-Host "`n`n"
if (Test-Path %JAVA_HOME%) { (java_found) } else { (java_not_found) }
Write-Host "`n`n"
Write-Host "This window will automatically be closed in some seconds"
Start-Sleep -s 5