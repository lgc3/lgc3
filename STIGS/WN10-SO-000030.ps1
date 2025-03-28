<#
.SYNOPSIS

Vulnerability Discussion
    Maintaining an audit trail of system activity logs can 
    help identify configuration errors, troubleshoot service 
    disruptions, and analyze compromises that have occurred, 
    as well as detect attacks. Audit logs are necessary to 
    provide a trail of evidence in case the system or network
    is compromised. Collecting this data is essential for 
    analyzing the security of information assets and detecting 
    signs of suspicious and unexpected behavior. This setting 
    allows administrators to enable more precise auditing 
    capabilities.

This PowerShell script enables Audit policy usage of subcategories.

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/28/2025
    Last Modified   : 03/28/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000030

.TESTED ON
    Date(s) Tested  : 03/28/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-SO-000030.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\"
$valueName = "SCENoApplyLegacyAuditPolicy"
$valueData = 1

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

#Enable Audit policy 
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify
Get-ItemProperty -Path $registryPath -Name $valueName
