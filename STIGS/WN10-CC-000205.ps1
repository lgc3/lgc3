<#
.SYNOPSIS
    This PowerShell script configured the "AllowTelemetry" to the value 0, which is the lowerst possible data collection.

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/27/2025
    Last Modified   : 03/27/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000205

.TESTED ON
    Date(s) Tested  : 03/27/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000205.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$allowValue = 0
$regName = "AllowTelemetry"

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set AllowTelemetry to 0 (Security)  
Set-ItemProperty -Path $registryPath -Name $regName -Value $allowValue -Type DWord

#Verify Changes
Get-ItemProperty -Path $registryPath -Name $regName
