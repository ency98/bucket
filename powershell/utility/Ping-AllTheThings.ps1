<#
.SYNOPSIS
    Janky script to ping a list of hosts and report their status
.DESCRIPTION
    This script performs ping tests on a predefined list of hosts
    and reports whether each host is UP or DOWN, along with details
    for any hosts that are unreachable.
.WARNING
    This script is very much a work in progress.

    Ensure you have the necessary permissions to run Test-Connection
    and that the TargetHosts array is populated with hostnames or IP
    addresses appropriate to your system or environment.
.NOTES
  Version:        0.1
  Author:         encyapps@gmail.com
  Creation Date:  2026.01.17
  Purpose/Change: Initial script development
#>

#Variables

# Define the list of target hosts to ping
$TargetHosts = @(
    "127.0.0.1"
    "localhost"
    "8.8.8.8"
	"9.9.9.9"
	"1.1.1.1"
    "badhost.invalid"
)

# Functions

function ScriptBanner_Start {
    # Banner
    Clear-Host
    Write-Host ""
    Write-Host ("_________________________________________________________________") -ForegroundColor DarkMagenta
    Write-Host ""
    Write-Host (" Running an extensive ping scan. This could take some time. ") -ForegroundColor Magenta
    Write-Host ""
    Write-Host ("_________________________________________________________________") -ForegroundColor DarkMagenta
    Write-Host ""
    Write-Host "Testing $TotalHosts hosts:" -ForegroundColor DarkCyan
    Write-Host ""
}

function ScriptBanner_End {
    # Banner
    Write-Host ""
    Write-Host ("_________________________________________________") -ForegroundColor DarkMagenta
    Write-Host ""
    Write-Host ("Testing Complete.", "`n") -ForegroundColor Magenta

}


function Report_Header {
    # Header
    Write-Host ""
    Write-Host ("  Status    Host                        Details") -ForegroundColor DarkBlue
    Write-Host ("_________________________________________________") -ForegroundColor DarkBlue
}

# Countitems in TargetHosts and display
$TotalHosts = $TargetHosts.Count

#! Main Script Execution

#? Display start banner
ScriptBanner_Start

#? Initialize results array
$Results = foreach ($Target in $TargetHosts) {
    #^ Perform the ping test
    try {
        Write-Host ("Testing:   $Target") -ForegroundColor Yellow
        Test-Connection -ComputerName $Target -Count 1 -ErrorAction Stop | Out-Null

        [PSCustomObject]@{
            Host   = $Target
            Status = "UP"
            Reason = ""
        }
    }
    #^ Handle unreachable hosts
    catch {
        [PSCustomObject]@{
            Host   = $Target
            Status = "DOWN"
            Reason = $_.Exception.Message
        }
    }
}

Write-Host ""
Write-Host ("Processing Results.") -ForegroundColor DarkCyan
Start-Sleep -Seconds 0.8

#? Sort with UP first, then Host
$Results = $Results | Sort-Object @{Expression="Status"; Descending=$true}, Host
# Clear-Host

#? Colorized, host UP report
Report_Header

foreach ($Result in $Results) {
    if ($Result.Status -eq "UP") {
        Write-Host ("  ✔  UP    {0,-20} {1}" -f $Result.Host, "") -ForegroundColor Green
    }
}

# Colorized, host DOWN report
Report_Header

foreach ($Result in $Results) {
    if ($Result.Status -eq "DOWN") {

      Write-Host ("  ✖  DOWN    {0,-20} {1} — {2}" -f  $Result.Host, "`n",  "  $Result.Reason") -ForegroundColor Red

        # $String = $Result.Reason -replace " —   @{","  "
        # Write-Host ("  ✖  DOWN    {0,-20} {1} — {2}" -f  $Result.Host, "`n",  "  $Result.Reason") -ForegroundColor Red

        # $String = $Result.Reason -replace " —   @{Host=badhost.invalid; Status=DOWN; Reason=Testing connection to computer ","  "
        # Write-Host ("  ✖  DOWN    {0,-20} {1} — {2}" -f  $Result.Host, "`n",  "   $String") -ForegroundColor Red

        # $String = ("  ✖  DOWN    {0,-20} {1} — {2}" -f  $Result.Host, "`n",  "  $Result.Reason") -replace " —   @{","  "
        # Write-Host $String -ForegroundColor Red

    }
}

# Exit banner
ScriptBanner_End