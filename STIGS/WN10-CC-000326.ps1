<#
.SYNOPSIS

Vulnerability Discussion
    Maintaining an audit trail of system activity logs can help identify 
    configuration errors, troubleshoot service disruptions, and analyze 
    compromises that have occurred, as well as detect attacks.

This PowerShell script enables powershell script block logging on windows 10.

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/31/2025
    Last Modified   : 03/31/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000326

.TESTED ON
    Date(s) Tested  : 03/31/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-CC-000326.ps1 
#>

# Set the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$valueName = "EnableScriptBlockLogging"
$valueData = 1

# Create the key path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

#Prioritize ECC Curves
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -Type DWord

# Verify
Get-ItemProperty -Path $registryPath -Name $valueName
