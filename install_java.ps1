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
$JAVA_DL_URL = "http://javadl.oracle.com/webapps/download/AutoDL?BundleId=220313_d54c1d3a095b4ff2b6607d096fa80163"
# After the download but before renaming the file
$JAVA_EXE_NAME = "jre-8u131-windows-i586.exe"
$JAVA_EXE_PATH = "C:\Users\IEUser\Desktop\scripts\bin\$JAVA_EXE_NAME"
# After renaming the file to use the java command
$JAVA_ENV_NAME = "java.exe"
$JAVA_ENV_PATH = "C:\Users\IEUser\Desktop\scripts\bin\$JAVA_ENV_NAME"

# -----------------------------------------------------------------
#                               Java
# -----------------------------------------------------------------
function java_home_found
{
    Write-Host "Java is already installed, we won't do it again" -foregroundcolor green
}

function java_home_not_found
{
    Write-Host "Java hasn't been found. Let's download and install it now" -foregroundcolor red
    Start-Sleep -s 2
    
    # Download Java
    $start_time = Get-Date
    Write-Host "Start the download now..."
    Write-Host "Import the BitsTransfer module to download files... Please wait..." -foregroundcolor yellow
    import-module bitstransfer
    Write-Host "Module imported!" -foregroundcolor green
    Start-BitsTransfer -Source $JAVA_DL_URL -Destination $JAVA_EXE_PATH
    Write-Host "Download done. Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
    Rename-Item $JAVA_EXE_PATH $JAVA_ENV_PATH

    # Install
    C:\Users\IEUser\Desktop\scripts\bin\java.exe /s ADDLOCAL="ToolsFeature,SourceFeature,PublicjreFeature" INSTALLDIR=C:\Java\x86\jre-8u131-windows-i586 /INSTALLDIRPUBJRE=C:\Java\x86\jre-8u131-windows-i586
    Write-Host "Install done" -foregroundcolor green
    Write-Host "We'll set the JAVA_HOME environment variable now"
    [Environment]::SetEnvironmentVariable("JAVA_HOME", $JAVA_ENV_PATH, "User")
    Write-Host "Let's check it now. Is the JAVA_HOME set ?"
    Get-ChildItem Env:JAVA_HOME
}


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
Write-Host "`nCheck if Java is not already install`n"
if (Test-Path %JAVA_HOME%) { (java_home_found) } else { (java_home_not_found) }
Write-Host "`nThis window will automatically be closed in some seconds`n"
Start-Sleep -s 15