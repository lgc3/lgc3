<#
.SYNOPSIS

Vulnerability Discussion
    Some features may communicate with the vendor, sending system information 
    or downloading data or components for the feature. Turning off this 
    capability will prevent potentially sensitive information from being 
    sent outside the enterprise and uncontrolled updates to the system.
    This setting will prevent the Program Inventory from collecting data 
    about a system and sending the information to Microsoft.

This PowerShell script disable inventory Collector

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/28/2025
    Last Modified   : 03/28/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000175

.TESTED ON
    Date(s) Tested  : 03/28/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000175.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppCompat\"
$valueName = "DisableInventory"
$valueData = 1

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

#Disable Inventory Collector
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify
Get-ItemProperty -Path $registryPath -Name $valueName
