#Requires -Version 7

using namespace System.IO
using namespace System.Net.Sockets

function Get-TOCData {
    $programs = [Ordered]@{
        "Retail:   " = "wow"
        "MoP:      " = "wow_classic"
        "Classic:  " = "wow_classic_era"
    }

    foreach ($label in $programs.Keys) {
        $program = $($programs.$label)

        $versions = Invoke-WebRequest -Uri "https://us.version.battle.net/v2/products/${program}/versions"
        $version = Read-Version -Versions $versions
        $toc = (Convert-VersionToTOC -Version $version) ?? "[ERROR] Could not read from Battle.net"

        Write-Host "${label} ${toc}"
    }
}

function Read-Version {
    param (
        [String]$Versions
    )

    if ([String]::IsNullOrWhiteSpace($Versions)) {
        return $null
    }

    $lines = $Versions.Split("`n")
    foreach ($line in $lines) {
        if ($line.StartsWith("us|")) {
            $tokens = $line.Split("|")
            return $tokens[5]
        }
    }

    return $null
}

function Convert-VersionToTOC {
    param (
        [String]$Version
    )

    if ([String]::IsNullOrWhiteSpace($Version)) {
        return $null
    }

    $tokens = $Version.Split(".")
    $major = [int]::Parse($tokens[0])
    $minor = [int]::Parse($tokens[1])
    $rev = [int]::Parse($tokens[2])

    return [String]::Format("{0:D}{1:D2}{2:D2}", $major, $minor, $rev)
}

Get-TOCData
