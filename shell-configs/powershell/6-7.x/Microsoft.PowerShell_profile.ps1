#! Startship prompt

#? Init starship without test
# Invoke-Expression (&starship init powershell)
#? Init starship with test
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
}

#! Files and Paths ###################################################################

#! Custom Directory and File path variables

#* Dotfiles path
# $DotFilesRootPath = "C:\support"              #? Root dotfiles path on shared machines
$DotFilesRootPath = "$($HOME)\support"          #? Define base dotfiles path to $HOME\.config (usually for work computers)

#^ Define a dotfiles base path to executables and scripts
$SupportPath = "$($DotFilesRootPath)"           #? Define base support path to $HOME\support (usually work computers)
$ExecPath = "$($SupportPath)\bin"
$ScriptsPath = "$($SupportPath)\scripts"

#! Functions ###################################################################

#? Fix for not being able to run unsigned scripts.

#! Functions

#* RustormyOneLiner function to show weather info for Riyadh
function RustormyOneLiner {
    $ShowWeather = "$ExecPath\rustormy\rustormy.exe  -c 'Riyadh' --name --colors --lat '24.6815' --lon '46.6214' --provider 'om' --one-line"
    Invoke-Expression $ShowWeather
}

#* Welcome message
function PSWelcome {
    $CurrentDir = (Get-Location).Path
    Write-Host "Home Directory: $($HOME)" -ForegroundColor Blue
    Write-Host "Current Directory: $($CurrentDir)" -ForegroundColor Blue
    # Write-Host "Home Directory: $($HOME)" -ForegroundColor Green
    # Write-Host "Current Directory: $($CurrentDir)" -ForegroundColor Green
}

#* Flush DNS Cache
function flushdns_func
{
    Write-Output "Flushing DNS Cach"
    Clear-DnsClientCache
    Start-Sleep .5
    Write-Output "DNS Cache Flushed"
}

#* Start and enter a new PS Session
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

#* Get IP Address information
function GetIPSForIPAlias {
    $RunCommand = "Get-NetIPAddress -AddressFamily IPv4 | Format-Table IPAddress, InterfaceAlias"
    Invoke-Expression $RunCommand
}

#* Get IP Address and interface information
function GetIPSForIPSAlias {
    $RunCommand = "Get-NetIPAddress -AddressFamily IPv4 | Format-Table IPAddress, InterfaceAlias"
    Invoke-Expression $RunCommand
}

#* Find in full PSReadline history
function hist {
  $find = $args;
  Write-Host "Finding in full history using {`$_ -like `"*$find*`"}";
  Get-Content (Get-PSReadlineOption).HistorySavePath | ? {$_ -like "*$find*"} | Get-Unique | more
}

#! Aliases ###################################################################

#! Aliases

#* add linux vsrsion of cls, can not be used in powershell v5
# Set-Alias clear Clear-Host

#* Aliases for ls "Get-ChildItem"
Set-Alias l Get-ChildItem
Set-Alias ll l
Set-Alias lll l

#* Git
# Set-Alias gclone "git clone"
# Set-Alias gstat "git status"
# Set-Alias gadd "git add"
# Set-Alias gcom "git commit"
# Set-Alias gpush "git push"
# Set-Alias gpull "git pull"

#! Aliases to functions above

#? Fix for not being able to run unsigned scripts.

#* Display weather info for Riyadh
Set-Alias weather RustormyOneLiner
Set-Alias outside RustormyOneLiner

#* Start and enter a new PS Session
Set-Alias psr NewPSSession

#* Flush DNS Cache
Set-Alias flushdns flushdns_func

#* Get IP Address information
Set-Alias ip GetIPSForIPAlias
Set-Alias ips GetIPSForIPSAlias

#! Aliases to executables in $ExecPath

#* Aliases to scripts in $ExecPath without testing

#^ Editors
Set-Alias hx "$ExecPath\helix\hx.exe"
Set-Alias edit "$ExecPath\edit\edit.exe"
Set-Alias nano "$ExecPath\nano\nano.exe"

#^ Utilities
Set-Alias gping "$ExecPath\gping\gping.exe"
Set-Alias rclone "$ExecPath\rclone\rclone.exe"
Set-Alias "Explorer++" "$ExecPath\explorer-plusplus\Explorer++.exe"
Set-Alias "exp" "Explorer++"

#^ Terminals
Set-Alias New-Terminal "$ExecPath\terminal\WindowsTerminal.exe"
Set-Alias terminal New-Terminal
Set-Alias term New-Terminal

#^ git tools
Set-Alias tea "$ExecPath\tea\tea.exe"

#^ Quality of life tools
Set-Alias lazyssh "$ExecPath\lazyssh\lazyssh.exe"
Set-Alias rustormy "$ExecPath\rustormy\rustormy.exe"

# Write-Host "Executable aliases: Created" -ForegroundColor Green

#! Aliases to scripts in $ScriptsPath

#? Without signing most aliases to scripts will not work across machines.
#? See "#! Aliases to functions above" "#! Functions" sections above for a limited fix.

#* Aliases to scripts in $ScriptsPath without testing
# Set-Alias psr "$ScriptsPath\Enter-PSSession.ps1"
# Set-Alias flushdns "$ScriptsPath\flush-dns.ps1"
# Set-Alias ip "$ScriptsPath\ip.ps1"
# Set-Alias ips "$ScriptsPath\ips.ps1"
# Set-Alias notify "$ScriptsPath\notify.ps1"
# Set-Alias touch "$ScriptsPath\touch.ps1"
# Write-Host "Script aliases: Created" -ForegroundColor Green

#! RUN FUNCTIONS ###################################################################

#* Set aliases to executables in $ExecPath function
# SetExecAliases

#* Set aliases to scripts in $ScriptsPath function
# SetScriptAliases

#* Run Welcome message function
PSWelcome

#* RustormyOneLiner function to show weather info for Riyadh
# RustormyOneLiner

#! END PROFILE ###################################################################

#? Documentation, examples, and unused code below !#

#! PWSH Test Examples

#* Tests

#^ Test if a file/directory exists, then do something
# if (Test-Path "$HOME\.local\bin\nano.exe") {
#     Write-Output "nano.exe is installed"
# }

#^ Test if a file/directory exists, then do something, else do another
# if (Test-Path "$HOME\.local\bin\nano.exe") {
#     Write-Output "nano.exe is installed"
# } else {
#     Write-Output "nano.exe not found"
# }

#^ Test last exit code of previous command
# if ($LASTEXITCODE -eq 0) {
#     Write-Host "Successfully closed and relaunched Microsoft Edge"
# } else {
#     Write-Host "Failed to close and relaunch Microsoft Edge"
# }

#* Functions

#^ Simple function
# Print_to_Screen{
#     Write-Output "Hello World"
# }

#^ Capture remaining arguments and set to a variable ($STRING)
# Print_to_Screen{
#     param(
#     [Parameter(ValueFromRemainingArguments = $true)]
#     [string[]]$String
#     )
#     Write-Output $String
# }

#* Set/unset variable

#^ set variable
# $var = "value"

#^ unset variable
# $var = $null

#^ set to another command
# $Credentials = (Get-Credential)
# $SESSION = New-PSSession -ComputerName $RemoteHost -Credential $Credentials
