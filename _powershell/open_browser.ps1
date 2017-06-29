<#
    _Description:_

        Open IE11 on a specific URL (here for Google home page)

    _Author:_ Nicolas GIGOU
    _Date:_ 29th of June, 2017
    _Powershell version used:_ 2.0
#>

$IE=new-object -com internetexplorer.application
$IE.navigate2("http://www.google.com")
$IE.visible=$true