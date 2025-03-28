<#
.SYNOPSIS

Vulnerability Discussion
    This policy controls whether a domain user can sign in using a convenience PIN to prevent enabling (Password Stuffer).

This PowerShell script configured the registry to disable PIN sign in.

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/28/2025
    Last Modified   : 03/28/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000370

.TESTED ON
    Date(s) Tested  : 03/28/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000370.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\Software\Policies\Microsoft\Windows\System"
$valueName = "AllowDomainPINLogon"
$valueData = 0

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

#Disable PIN sing-in
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify
Get-ItemProperty -Path $registryPath -Name $valueName
