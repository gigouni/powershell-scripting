<#
    _Description:_

        Check if Java is installed by getting the JAVA_HOME environment variable value

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

# -----------------------------------------------------------------
#                               Java
# -----------------------------------------------------------------
function installed
{
    Write-Host "Java is installed: %JAVA_HOME%" -foregroundcolor green
}

function not_installed
{
    Write-Host "Java is NOT installed" -foregroundcolor red
    Write-Host "Try running the install_java script"
}


# -----------------------------------------------------------------
#                             Script
# -----------------------------------------------------------------
Write-Host "`n`n"
if (Test-Path %JAVA_HOME%) { (installed) } else { (not_installed) }
Write-Host "`n`n"
Write-Host "This window will automatically be closed in some seconds"
Start-Sleep -s 5