<#
    _Description:_

        Display data of the current Powershell version
        Wait three seconds before closing

    _Example:_

        Name                           Value
        ----                           -----
        CLRVersion                     2.0.50727.8669
        BuildVersion                   6.1.7601.17514
        PSVersion                      2.0
        WSManStackVersion              2.0
        PSCompatibleVersions           {1.0, 2.0}
        SerializationVersion           1.1.0.1
        PSRemotingProtocolVersion      2.1

    _Author:_ Nicolas GIGOU
    _Date:_ 23th of June, 2017
    _Powershell version used:_ 2.0
#>

$PSVersionTable
Start-Sleep -s 5