<#
.SYNOPSIS

Vulnerability Discussion
    Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot 
    service disruptions, and analyze compromises that have occurred, as well as detect attacks
    Audit MPSSVC Rule-Level Policy Change determines whether the operating system generates audit events 
    when changes are made to policy rules for the Microsoft Protection Service (MPSSVC.exe).

This PowerShell script configure the system MPSSVC Rule-Level Policy change Failures

.NOTES
    Author          : Lauren Coste
    LinkedIn        : linkedin.com/in/lauren-coste
    GitHub          : github.com/lgc3
    Date Created    : 03/31/2025
    Last Modified   : 03/31/2025
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000580

.TESTED ON
    Date(s) Tested  : 03/31/2025
    Tested By       : Lauren Coste
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : 5.1.19041.5607

.USAGE
    PS C:\> .\STIG-ID-WN10-AU-000580.ps1 
#>

# Configure the correct Audit Policy
auditpol /set /subcategory:"MPSSVC Rule-Level Policy Change" /failure:enable


# Verify
Write-Host "Audit Policy Configuration:"
auditpol /get /subcategory:"MPSSVC Rule-Level Policy Change"
