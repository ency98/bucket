<#
.SYNOPSIS
  Registers an Azure Stack HCI machine with Azure Arc (Arc Initialization).

.DESCRIPTION
  Run <Invoke-AzStackHciArcInitialization> to register machine in Azure Arc.
   in the Configuration section below.

.NOTES
  - EDIT THE CONFIGURATION BLOCK BELOW BEFORE RUNNING
	- Edit variables TenantId, SubscriptionId, ResourceGroup, ResourceGroup,
      Region, and Cloud as needed
  - Region must be the short name (no spaces, no caps), e.g. "eastus"
  - Cloud is usually "AzureCloud" unless you’re in a sovereign cloud
#>

# ----------------------------
# Configuration (EDIT THESE)
# ----------------------------
$Config = [ordered]@{
    TenantId       = ""
    SubscriptionId = ""
    ResourceGroup  = ""
    Region         = "eastus"
    Cloud          = "AzureCloud"   # AzureCloud | AzureUSGovernment | AzureChinaCloud | AzureGermanCloud
}

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# ----------------------------
# Color + output helpers
# ----------------------------
function Write-Info    { param([string]$Msg) Write-Host "[INFO ] $Msg" -ForegroundColor Cyan }
function Write-Ok      { param([string]$Msg) Write-Host "[ OK  ] $Msg" -ForegroundColor Green }
function Write-Warn    { param([string]$Msg) Write-Host "[WARN ] $Msg" -ForegroundColor Yellow }
function Write-Fail    { param([string]$Msg) Write-Host "[FAIL ] $Msg" -ForegroundColor Red }

function Show-Config {
    param(
        [string]$TenantId,
        [string]$SubscriptionId,
        [string]$ResourceGroup,
        [string]$Region,
        [string]$Cloud
    )

    Write-Host ""
    Write-Host "=========== Arc Registration Settings ===========" -ForegroundColor Magenta
    Write-Host ("Tenant ID      : {0}" -f $TenantId)
    Write-Host ("Subscription ID: {0}" -f $SubscriptionId)
    Write-Host ("Resource Group : {0}" -f $ResourceGroup)
    Write-Host ("Region         : {0}" -f $Region)
    Write-Host ("Cloud          : {0}" -f $Cloud)
    Write-Host "================================================" -ForegroundColor Magenta
    Write-Host ""
}

function Assert-NotBlank {
    param(
        [Parameter(Mandatory)][string]$Name,
        [Parameter(Mandatory)][string]$Value
    )

    if ([string]::IsNullOrWhiteSpace($Value)) {
        throw "Configuration '$Name' is blank. Please set it before running."
    }
}

function Assert-RegionFormat {
    param([string]$Region)

    if ($Region -notmatch '^[a-z0-9]+$') {
        throw "Region '$Region' looks invalid. Use the short region name (e.g. 'eastus') with no spaces/caps."
    }
}

# ----------------------------
# Validate config
# ----------------------------
try {
    Write-Info "Validating configuration..."

    Assert-NotBlank -Name "TenantId"       -Value $Config.TenantId
    Assert-NotBlank -Name "SubscriptionId" -Value $Config.SubscriptionId
    Assert-NotBlank -Name "ResourceGroup"  -Value $Config.ResourceGroup
    Assert-NotBlank -Name "Region"         -Value $Config.Region
    Assert-NotBlank -Name "Cloud"          -Value $Config.Cloud

    Assert-RegionFormat -Region $Config.Region

    Write-Ok "Configuration looks good."
    Show-Config -TenantId $Config.TenantId `
                -SubscriptionId $Config.SubscriptionId `
                -ResourceGroup $Config.ResourceGroup `
                -Region $Config.Region `
                -Cloud $Config.Cloud
}
catch {
    Write-Fail $_.Exception.Message
    throw
}

# ----------------------------
# Run Arc initialization
# ----------------------------
try {
    Write-Info "Starting Azure Arc initialization for Azure Stack HCI..."
    Write-Warn "If this is being copied, STOP and edit the configuration block first."

    Invoke-AzStackHciArcInitialization `
        -TenantId       $Config.TenantId `
        -SubscriptionID $Config.SubscriptionId `
        -ResourceGroup  $Config.ResourceGroup `
        -Region         $Config.Region `
        -Cloud          $Config.Cloud

    Write-Ok "Arc initialization completed."
}
catch {
    Write-Fail "Arc initialization failed."
    Write-Fail $_.Exception.Message
    throw
}