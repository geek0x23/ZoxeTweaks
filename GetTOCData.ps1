#Requires -Version 7

using namespace System.IO
using namespace System.Net.Sockets

function Get-TOCData {
    $programs = [Ordered]@{
        "Retail:   " = "wow"
        "Cataclysm:" = "wow_classic"
        "Classic:  " = "wow_classic_era"
    }

    foreach ($label in $programs.Keys) {
        $program = $($programs.$label)

        $client = [TcpClient]::new()
        $client.Connect("us.version.battle.net", 1119)

        $stream = $client.GetStream()
        $reader = [StreamReader]::new($stream)
        $writer = [StreamWriter]::new($stream)

        $writer.WriteLine("v1/products/${program}/versions")
        $writer.Flush()

        $version = Read-Version -Reader $reader
        $toc = (Convert-VersionToTOC -Version $version) ?? "[ERROR] Could not read from Battle.net"

        Write-Host "${label} ${toc}"

        $reader.Close()
        $writer.Close()
        $stream.Close()
        $client.Close()
    }
}

function Read-Version {
    param (
        [StreamReader]$Reader
    )

    while ($Reader.EndOfStream -eq $false) {
        $line = $Reader.ReadLine()

        if ($line.StartsWith("us|")) {
            $Reader.DiscardBufferedData()
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
