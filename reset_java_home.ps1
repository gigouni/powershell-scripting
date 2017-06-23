<#
    _Description:_

        Delete the current JAVA_HOME environment variable value for a null one
        Check if this value exist before trying to delete it

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                               Java
# -----------------------------------------------------------------
function java_home_exist
{
    Write-Host "JAVA_HOME is set: %JAVA_HOME%"
    [Environment]::SetEnvironmentVariable("JAVA_HOME",$null,"User")
    Write-Host "JAVA_HOME unset"
}

function java_home_dont_exist
{
    Write-Host "JAVA_HOME is not set. Nothing to do"
}


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
Write-Host "`n`n"
if (Test-Path %JAVA_HOME%) { (installed) } else { (not_installed) }
Write-Host "`n`n"
Write-Host "This window will automatically be closed in some seconds"
Start-Sleep -s 5