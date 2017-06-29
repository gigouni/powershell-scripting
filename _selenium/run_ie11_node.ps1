<#
    _Description:_

        Check if the Selenium is running by pinging the hub port
        If true, run IE as a hub's node

    _Author:_ Nicolas GIGOU
    _Date:_ 29th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                        File constants
# -----------------------------------------------------------------
$SCRIPTS_FOLDER_PATH = Split-Path (Split-Path $MyInvocation.MyCommand.Path -Parent) -Parent
$SELENIUM_JAR_PATH = "$SCRIPTS_FOLDER_PATH\bin\selenium-server-standalone-3.4.0.jar"
$SELENIUM_HUB_HOST = "http://localhost"
$SELENIUM_HUB_PORT = "4444"
$IE_DRIVER_EXE_PATH = "$SCRIPTS_FOLDER_PATH\bin\IEDriverServer.exe"
$IE_DRIVER_PORT = "5558"
$GRID_REGISTER_URL = "/grid/register"


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
Write-Host "Java is installed" -foregroundcolor green
Write-Host "Let's try to run the Selenium hub now..."

Try {
    
    <#
        # If you also want to check if the Selenium hub is currently running
        If (Test-Port -computer $SELENIUM_HUB_HOST -port $SELENIUM_HUB_PORT) 
        { 
            Write-Host "The Selenium hub is running on the $SELENIUM_HUB_PORT port" -foregroundcolor green
        } 
        Else 
        { 
            Write-Host "The Selenium hub isn't running on the $SELENIUM_HUB_PORT port. Correct it before running this script" -foregroundcolor red
        }
    #>

    # Splite the command into several little ones to simplify the visibility of options and easily move the params order
    $cmd = "java"
    $opts = "-Dwebdriver.ie.driver=$IE_DRIVER_EXE_PATH "
    $opts += "-browser `"browserName=internet explorer,version=11,platform=WINDOWS,maxInstances=10`" "
    $opts += "-jar $SELENIUM_JAR_PATH "
    $opts += "-role webdriver "
    $opts += "-hub $SELENIUM_HUB_HOST`:$SELENIUM_HUB_PORT$GRID_REGISTER_URL "
    $opts += "-port $IE_DRIVER_PORT "
    # Enable it if necessary    
    # $opts += "-debug "
    Invoke-Expression "$cmd $opts"

}
Catch
{
    $ErrorMessage = $_.Exception.Message
    $FailedItem = $_.Exception.ItemName
    Write-Log "Failed while running the script:`nError: $ErrorMessage`nItem: $FailedItem"
    Break
}

Write-Host "`n`nThis window will automatically be closed in some seconds"
Start-Sleep -s 20