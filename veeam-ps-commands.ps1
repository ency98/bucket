<#
.SYNOPSIS
  Commonly used veeam commands
.DESCRIPTION
  Adding commands I use often with veeam. with 
  the intention of turing this into a utility 
  script (if I dont get lazy) for common tasks 
  so I can take PTO without getting calls. 
.WARNING
  DO NOT RUN THIS AS A SCRIPT AS IS.
  Currently just a collection of one liners 
  with no logic or safety rails.
.NOTES
  Version:        0.1
  Author:         encyapps@gmail.com
  Creation Date:  2025.11.03
  Purpose/Change: Initial script development
#>

# Stop all Veeam services
Get-Service Veeam* | Stop-Service -Force

# Start all Veeam services
Get-Service Veeam* | Start-Service -Force
