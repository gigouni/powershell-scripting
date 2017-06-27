<#
    _Description:_

        Check if the upgrade to Powershell ^4.5 is possible
        If true, download and install it

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

Get-WmiObject -Class Win32_OperatingSystem | Format-Table Caption, ServicePackMajorVersion -AutoSize
$can_upgrade = (Get-ItemProperty -Path 'HKLM:\Software\Microsoft\NET Framework Setup\NDP\v4\Full' -ErrorAction SilentlyContinue).Version -like '4.5*'

If( $can_upgrade )
{
    Write-Host "Upgrade done." -foregroundcolor green
    $PSVersionTable
}
Else
{
    Write-Host "The upgrade is impossible. The Service Pack 1 isn't available.`n" -foregroundcolor red
}