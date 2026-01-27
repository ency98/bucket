#! Startship prompt

#? Init starship without test
# Invoke-Expression (&starship init powershell)
#? Init starship with test
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

#! - - - - - !#
#! Custom Directory and File path variables

#? Define a base path to executables and scripts
$SupportPath = "$($HOME)\support"           #? Define base support path to $HOME\support (usually work computers)
# $SupportPath = 'C:\support'               #? Define base support path to C:\support
$ExecPath = "$($SupportPath)\bin"
$ScriptsPath = "$($SupportPath)\scripts"

#! - - - - - !#
#! Functions

#? RustormyOneLiner function to show weather info for Riyadh
function RustormyOneLiner {
    $ShowWeather = "$ExecPath\rustormy\rustormy.exe  -c 'Riyadh' --name --colors --lat '24.6815' --lon '46.6214' --provider 'om' --one-line"
    Invoke-Expression $ShowWeather
}

#? Welcome message
function PSWelcome {
    $CurrentDir = (Get-Location).Path
    Write-Host "Home Directory: $($HOME)" -ForegroundColor Blue
    Write-Host "Current Directory: $($CurrentDir)" -ForegroundColor Blue
    # Write-Host "Home Directory: $($HOME)" -ForegroundColor Green
    # Write-Host "Current Directory: $($CurrentDir)" -ForegroundColor Green
}
}

#* Find in full PSReadline history
function hist {
  $find = $args;
  Write-Host "Finding in full history using {`$_ -like `"*$find*`"}";
  Get-Content (Get-PSReadlineOption).HistorySavePath | ? {$_ -like "*$find*"} | Get-Unique | more
}

#! Aliases ###################################################################
#! - - - - - !#



function NewPSSession {
    #? Get remote from passed argument
    param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$RemoteHost
    )
    #? Promt for credentials
    $Credentials = (Get-Credential)
    #? Session details
    $Session = New-PSSession -ComputerName $RemoteHost -Credential $Credentials
    #? Enter session
    Enter-PSSession -Session $Session
}



#! - - - - - !#
#! Aliases
Set-Alias clear Clear-Host
Set-Alias psr NewPSSession
$FlushDNS = "Write-Output 'Flushing DNS Cache'; Clear-DnsClientCache; Start-Sleep .5; Write-Output 'DNS Cache Flushed'"
Set-Alias flushdns $FlushDNS
$GetIP = "Get-NetIPAddress -AddressFamily IPv4 | Format-Table IPAddress"
Set-Alias ip $GetIP
$GetIPS = "Get-NetIPAddress -AddressFamily IPv4 | Format-Table IPAddress, InterfaceAlias"
Set-Alias ips $GetIPS

#! RUN PROFILE - Active code below !#
#? Aliases for ls "Get-ChildItem"
Set-Alias l Get-ChildItem
Set-Alias ll l
Set-Alias lll l
#? Aliases to scripts
Set-Alias hx "$ExecPath\helix\hx.exe"
Set-Alias edit "$ExecPath\edit\edit.exe"
Set-Alias nano "$ExecPath\nano\nano.exe"
Set-Alias gping "$ExecPath\gping\gping.exe"
Set-Alias rclone "$ExecPath\rclone\rclone.exe"
Set-Alias "Explorer++" "$ExecPath\explorer-plusplus\Explorer++.exe"
Set-Alias "exp" "Explorer++"
Set-Alias New-Terminal "$ExecPath\terminal\WindowsTerminal.exe"
Set-Alias terminal New-Terminal
Set-Alias term New-Terminal
Set-Alias lazyssh "$ExecPath\lazyssh\lazyssh.exe"
Set-Alias rustormy "$ExecPath\rustormy\rustormy.exe"
Write-Host "Executable aliases: Created" -ForegroundColor Green
#? Aliases to scripts
# Set-Alias psr "$ScriptsPath\Enter-PSSession.ps1"
# Set-Alias flushdns "$ScriptsPath\flush-dns.ps1"
# Set-Alias ip "$ScriptsPath\ip.ps1"
# Set-Alias ips "$ScriptsPath\ips.ps1"
# Set-Alias notify "$ScriptsPath\notify.ps1"
# Set-Alias touch "$ScriptsPath\touch.ps1"
# Write-Host "Script aliases: Created" -ForegroundColor Green

#! RUN FUNCTIONS
#? Set aliases to executables in $ExecPath function
# SetExecAliases

#? Set aliases to scripts in $ScriptsPath function
# SetScriptAliases

#? Run Welcome message function
PSWelcome

#? RustormyOneLiner function to show weather info for Riyadh
# RustormyOneLiner


#! - - - - - !#

#! END PROFILE - Documentation, examples, and unused code below !#

#! - - - - - !#
#! PWSH Test Examples
#? Test if a file/directory exists, then do something
# if (Test-Path "$HOME\.local\bin\nano.exe") {
#     Write-Output "nano.exe is installed"
# }
#? Test if a file/directory exists, then do something, else do another
# if (Test-Path "$HOME\.local\bin\nano.exe") {
#     Write-Output "nano.exe is installed"
# } else {
#     Write-Output "nano.exe not found"
# }
#! - - - - - !#
#! Functions
# Print_to_Screen{
#     Write-Output "Hello World"
# }
#? Capture remaining arguments and set to a variable ($STRING)
# Print_to_Screen{
#     param(
#     [Parameter(ValueFromRemainingArguments = $true)]
#     [string[]]$String
#     )
#     Write-Output $String
# }
#! - - - - - !#
#? Set/unset variable
#? set
# $var = "value"
#? unset
# $var = $null
#? set to another command
# $Credentials = (Get-Credential)
# $SESSION = New-PSSession -ComputerName $RemoteHost -Credential $Credentials
#! - - - - - !#